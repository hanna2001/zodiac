import 'package:flutter/material.dart';
import 'package:zodiacsing/user.dart';

class ResultPage extends StatefulWidget {
  final User user;

  ResultPage({this.user});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xFF0E174A), Colors.black],
              radius: 1,
            ),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('images/stars.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hey " + widget.user.name + ",",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image(
                  image: AssetImage('images/' + widget.user.sign + '_icon.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.user.sign,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              Text(
                signs[widget.user.sign].date,
                style: TextStyle(fontSize: 12, color: Colors.white30),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height / 5,
                child: Image.asset("images/" + widget.user.sign + ".png"),
              ),
              Text(
                signs[widget.user.sign].details[0],
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Animal : ' + signs[widget.user.sign].details[1],
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Birthstone : ' + signs[widget.user.sign].details[2],
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white60,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
