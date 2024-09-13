library leo_utils;

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

Pattern email_regex = r'^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$';
Pattern mp_reqex =
    r'^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$';

methode() {}

mois(str) {
  var n = int.parse(str);
  switch (n) {
    case 1:
      return "Janvier";

    case 2:
      return "Fevrier";

    case 3:
      return "Mars";

    case 4:
      return "Avril";

    case 5:
      return "Mai";

    case 6:
      return "Juin";

    case 7:
      return "Juillet";

    case 8:
      return "Août";

    case 9:
      return "Septembre";

    case 10:
      return "Octobre";

    case 11:
      return "Novembre";

    case 12:
      return "Décembre";

    default:
      return "";
  }
}

moisAng(str) {
  var n = int.parse(str);
  switch (n) {
    case 1:
      return "January";

    case 2:
      return "February";

    case 3:
      return "March";

    case 4:
      return "April";

    case 5:
      return "May";

    case 6:
      return "June";

    case 7:
      return "July";

    case 8:
      return "August";

    case 9:
      return "September";

    case 10:
      return "October";

    case 11:
      return "November";

    case 12:
      return "December";

    default:
      return "";
  }
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //Pattern pattern2 =r'^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$';

  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return false;
  }
  return true;
}

bool validateMp(String value) {
  String pattern = r'^(?=.*[0-9])(?=.*[a-z]).{8,}$';
  //  Pattern pattern =  r'^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$';

  // Pattern pattern2 = r'^.*(?=.*[a-zA-Z])(?=.*[0-9]).{7}[a-zA-Z0-9!@#$%]+$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return false;
  }

  return true;
}

bool validatenom(String value) {
  // Pattern pattern =  r'^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$';

  String pattern2 = r'^[a-zA-Zéèëàêâüöäù ]{3,}$';
  RegExp regex = RegExp(pattern2);
  if (!regex.hasMatch(value)) {
    return false;
  }
  return true;
}

monchip({text, color, textcolor, align = Alignment.center}) {
  return Container(
    height: 25.0,
    width: 25,

    padding: EdgeInsets.only(left: 2.0, right: 2.0),
    //margin: EdgeInsets.only(bottom:10.0,left: 10.0),

    alignment: align,

    child: Text(
      text,
      style: TextStyle(color: textcolor),
    ),
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}

padding(String t, double ec) {
  if (t == "a") {
    return new Padding(padding: EdgeInsets.all(ec));
  }

  if (t == "t") {
    return new Padding(padding: EdgeInsets.only(top: ec));
  }
  if (t == "b") {
    return new Padding(padding: EdgeInsets.only(bottom: ec));
  }

  if (t == "l") {
    return new Padding(padding: EdgeInsets.only(left: ec));
  }

  if (t == "r") {
    return new Padding(padding: EdgeInsets.only(right: ec));
  }
}

String get dateJour {
  //renvoyer la date sous format anglais pour les base de données MYSQL

  // format annee-mm-jour
  var currentdate = new DateTime.now();
  var l = currentdate.month + 1;

  var months = ("0" + (currentdate.month).toString());
  var month = months.substring(months.length - 2);
  var dates = ("0" + currentdate.day.toString());
  var date = dates.substring(dates.length - 2);

  var jour = currentdate.year.toString() + '-' + month + '-' + date;

  return jour;
}

String get myhour {
  var currentdate = new DateTime.now();

  var heure = currentdate.hour.toString() +
      ":" +
      currentdate.minute.toString() +
      ":" +
      currentdate.second.toString();

  return heure;
}

lang(context) {
  return Localizations.localeOf(context) == Locale("fr") ? true : false;
}

dateformate3($date, context) {
  if ($date.length != 0) {
    var ch1 = $date;
    var m = ch1.substring(5, 7);
    var moi = mois(m);
    var moiAng = moisAng(m);

    return ch1.substring(8) +
        " ${lang(context) ? moi : moiAng} " +
        ch1.substring(0, 4);
  } else {
    return "";
  }
}

dateformate($date, context) {
  var ch1 = $date;
  var m = ch1.substring(5, 7);
  var moi = mois(m);
  var moiAng = moisAng(m);

  if (lang(context)) {
    return jour($date) +
        " " +
        ch1.substring(8) +
        " " +
        moi +
        " " +
        ch1.substring(0, 4);
  } else {
    return jourAng($date) +
        " " +
        ch1.substring(8) +
        " " +
        moiAng +
        " " +
        ch1.substring(0, 4);
  }
}

datemoi($date, context) {
  var ch1 = $date;
  var m = ch1.substring(5, 7);
  var moi = mois(m);
  var moiAng = moisAng(m);
  return lang(context)
      ? ch1.substring(8) + " " + moi
      : ch1.substring(8) + " " + moiAng;
}

dateformate2($date) {
  var ch1 = $date;
  var m = ch1.substring(5, 7);

  return ch1.substring(8) + " -" + m + " -" + ch1.substring(0, 4);
}

jour(String jour) {
  var d = DateTime.parse(jour);
  List<String> weekday = ["", "", "", "", "", "", "", ""];
  weekday[1] = "Lundi";
  weekday[2] = "Mardi";
  weekday[3] = "Mercredi";
  weekday[4] = "Jeudi";
  weekday[5] = "Vendredi";
  weekday[6] = "Samedi";
  weekday[7] = "Dimanche";

  var n = weekday[d.weekday];

  return n;
}

jourAng(String jour) {
  var d = DateTime.parse(jour);
  List<String> weekday = ["", "", "", "", "", "", "", ""];
  weekday[1] = "Monday";
  weekday[2] = "Tuesday";
  weekday[3] = "Wednesday";
  weekday[4] = "Thursday";
  weekday[5] = "Friday";
  weekday[6] = "Saturday";
  weekday[7] = "Sunday";

  var n = weekday[d.weekday];

  return n;
}

heureformate($heur) {
  return $heur.substring(0, 5);
}

// retirer les accents
String removeDiacritics(String str) {
  var withDia =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var withoutDia =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }

  return str;
}

relativeDate(date, heure, context) {
  var mot = "";
  var dat1 = DateTime.parse(date);
  var dat2 = DateTime.now();
  var yesterday = DateTime.now().subtract(Duration(days: 1));
  String date1 = DateFormat('yyyy-MM-dd').format(dat1);
  String date2 = DateFormat('yyyy-MM-dd').format(dat2);
  String hier = DateFormat('yyyy-MM-dd').format(yesterday);

  if (dat1.year != dat2.year) {
    //mot=date

    // pas la meme anne on affiche la date complete

    mot = dateformate2(date);
  } else {
    if (date1 == date2) {
      mot = heureformate(heure);
    } else if (date1 == hier) {
      // hier

      mot = lang(context) ? "Hier" : "Yesterday";
    } else {
      mot = datemoi(date, context);
    }
  }

  return mot;
}

pushafter(context, page, {modal = false, required Function f}) {
  return Navigator.push(
    context,
    MaterialPageRoute(fullscreenDialog: modal, builder: (context) => page),
  ).then(f());
}

push(context, page, {modal = false}) {
  return Navigator.push(
    context,
    MaterialPageRoute(fullscreenDialog: modal, builder: (context) => page),
  );
}

push2(nav, page, {modal = false}) {
  return nav.push(
    MaterialPageRoute(fullscreenDialog: modal, builder: (context) => page),
  );
}

pushR(context, page) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
