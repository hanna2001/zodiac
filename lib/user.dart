class User {
  String name;
  int month;
  int date;
  String sign;

  User({this.name, this.date, this.month});

  void findZodiac() {
    if (month == 1) if (date < 20)
      sign = "CAPRICORN";
    else
      sign = "AQUARIUS";
    else if (month == 2) {
      if (date < 19)
        sign = "AQUARIUS";
      else
        sign = "PISCES";
    } else if (month == 3) {
      if (date < 21)
        sign = "PISCES";
      else
        sign = "ARIES";
    } else if (month == 4) {
      if (date < 20)
        sign = "ARIES";
      else
        sign = "TAURUS";
    } else if (month == 5) {
      if (date < 21)
        sign = "TAURUS";
      else
        sign = "GEMINI";
    } else if (month == 6) {
      if (date < 21)
        sign = "GEMINI";
      else
        sign = "CANCER";
    } else if (month == 7) {
      if (date < 23)
        sign = "CANCER";
      else
        sign = "LEO";
    } else if (month == 8) {
      if (date < 23)
        sign = "LEO";
      else
        sign = "VIRGO";
    } else if (month == 9) {
      if (date < 23)
        sign = "VIRGO";
      else
        sign = "LIBRA";
    } else if (month == 10) {
      if (date < 23)
        sign = "LIBRA";
      else
        sign = "SCORPIO";
    } else if (month == 11) {
      if (date < 22)
        sign = "SCORPIO";
      else
        sign = "SAGITTARIUS";
    } else if (month == 12) if (date < 22)
      sign = "SAGITTARIUS";
    else
      sign = "CAPRICORN";
  }
}

class ZodiacSign {
  String date;
  List<String> details;
  ZodiacSign({this.date, this.details});
}

Map<String, ZodiacSign> signs = {
  "CAPRICORN": new ZodiacSign(
    date: 'December 22-January 19',
    details: ['You are the truest friend 👩🏽‍🤝‍👩🏼', 'Goat ', 'Garnet'],
  ),
  "AQUARIUS": new ZodiacSign(
    date: 'January 20-February 18',
    details: ['You are the mom friend 👩‍👧', 'Owl', 'Amethyst'],
  ),
  "PISCES": new ZodiacSign(
    date: 'February 19-March 20',
    details: ['You have an open heart 🤍', 'Fish', 'Aquamarine'],
  ),
  "ARIES": new ZodiacSign(
    date: 'March 21-April 19',
    details: ['You are best in music 🎵', 'Sheep', 'Diamond'],
  ),
  "TAURUS": new ZodiacSign(
    date: 'April 20-May 20',
    details: ['You never gives up ✨', 'Bull', 'Emerald'],
  ),
  "GEMINI": new ZodiacSign(
    date: 'May 21-June 20',
    details: ['You are super sweet 💖', 'Deer', 'Pearl'],
  ),
  "CANCER": new ZodiacSign(
    date: 'June 21-July 22',
    details: ['Tou have the purest intentions 🤹🏻‍♀️', 'Crab', 'Ruby'],
  ),
  "LEO": new ZodiacSign(
    date: 'July 23-August 22',
    details: ['You are so innocent 💝', 'Lion', 'Peridot'],
  ),
  "VIRGO": new ZodiacSign(
    date: 'August 23-September 22',
    details: ['You are so enthusiastic 🎉', 'Bear', 'Sapphire'],
  ),
  "LIBRA": new ZodiacSign(
    date: 'September 23-October 22',
    details: ['You have the prettiest eyes 👀', 'Gray Wolf', 'Opal'],
  ),
  "SCORPIO": new ZodiacSign(
    date: 'October 23-November 21',
    details: ['Your are the most loyal lover 💘', 'African Elephant', 'Topaz'],
  ),
  "SAGITTARIUS": new ZodiacSign(
    date: 'November 22-December 21',
    details: ['You will listen all night 🙇🏻‍♂️', 'Red Panda', 'Tanzanite'],
  ),
};
