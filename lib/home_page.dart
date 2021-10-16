import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zodiacsing/result_page.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:zodiacsing/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationController2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController.forward();
    });
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animationController2.forward();

    _animationController2.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController2.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController2.forward();
    });
    _animationController2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  DateTime today = DateTime.now();
  String name = "";
  DateTime datePicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6,
              horizontal: MediaQuery.of(context).size.width / 8),
          decoration: BoxDecoration(
            // gradient: RadialGradient(colors: [Color(0xFF0E174A), Colors.black], radius: 1),
            color: Colors.black,
            image: DecorationImage(
              // fit: BoxFit.fill,
              image: AssetImage('images/stars.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Opacity(
                  opacity: _animationController2.value,
                  child: Container(
                    child: Image.asset('images/shiningstar.png'),
                  ),
                ),
              ),
              Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 19),
                            onChanged: (val) {
                              name = val;
                            },
                            textCapitalization: TextCapitalization.words,
                            cursorColor: Colors.white24,
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Enter your name here",
                                hintStyle: TextStyle(color: Colors.white30)),
                          ),
                        ),
                        DatePickerWidget(
                          onChange: (DateTime newDate, _) {
                            datePicked = newDate;
                            print(datePicked);
                          },
                          firstDate: DateTime(1960, 1, 1),
                          lastDate: DateTime(2022, 1, 1),
                          initialDate: DateTime.now(),
                          dateFormat: "dd-MMMM-yyyy",
                          pickerTheme: DateTimePickerTheme(
                            backgroundColor: Colors.transparent,
                            itemTextStyle:
                                TextStyle(color: Colors.blueGrey, fontSize: 19),
                            dividerColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                            color: Colors.white.withOpacity(0.2),
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.white.withOpacity(0.2),
                            width: 1.0,
                          )),
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        Color(0xFFffffff).withOpacity(0.2),
                        Color(0xFFFFFFFF).withOpacity(0.05),
                      ], stops: [
                        0.1,
                        1,
                      ]),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print(datePicked);
                  if (name != '') {
                    User user = User(
                        date: datePicked.day,
                        month: datePicked.month,
                        name: name);
                    user.findZodiac();
                    print(user.sign);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  user: user,
                                )));
                  } else {
                    final snackBar =
                        SnackBar(content: Text("Please enter your name"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  "Check your Sign 👉🏻",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: null,
        child: Opacity(
          opacity: _animationController.value,
          child: Container(
            child: Image.asset('images/shiningstar.png'),
          ),
        ),
      ),
    );
  }
}
