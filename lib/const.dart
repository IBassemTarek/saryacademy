import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kHeaderColor = Color(0xF7AA30);
const Color kbackgroundColor = Color(0x041056);
const Color kbackgroundColor2 = Color(0x00B2FF);
const Color kGradColor1 = Color(0x671D89);
const Color kGradColor2 = Color(0x101856);
const Color kText1Color = Color(0x1C9CD8);
const Color kText2Color = Color(0x004A99);
const Color kText3Color = Color(0x7C7C7B);
const Color kText4Color = Color(0x0070E9);
const Color kGreyColor = Color(0xC4C4C4);
const Color kIconColor = Color(0xDB9835);
const Color kGoodColor = Color(0x49C929);
const Color kWorkingColor = Color(0x0083CC);
const Color kNotApplicableColor = Color(0xCC0000);

const int mood =0;

const List<String> napsList = [
  "10:30 Am",
  "........  Am"
];

const List<String> activitiesList = [
  "bla bla bla bla bla bla bla bla bla",
  "bla bla bla bla bla bla bla bla bla"
];

const List<String> mealsList = [
  "Breakfast",
  "Lunch"
];

const List<String> fluidList = [
  "Liquid",
  "Bottle"
];

const List<bool> napsCheck = [
  true,
  false
];

 const List<IconData> moods =[
      Icons.sentiment_satisfied_alt,
      Icons.sentiment_dissatisfied,
      Icons.sentiment_neutral,
    ];

const List<String> restroom = [
  "Potty",
  "Toilet"
]; 

  BoxDecoration roundedContainer({double radius,Color color}) {
  return BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(radius) ),
                    color: color,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
  }


  ThemeData textData() {
    return ThemeData(
        textTheme: 
          TextTheme(
            headline1: TextStyle(
              fontFamily: "arialRounded",
              fontSize: 24,
              color: kText1Color,
            ),
            subtitle1: TextStyle(
              fontFamily: "arialBold",
              fontSize: 17,
              color: kText1Color,
            ),
            bodyText1: TextStyle(
              fontFamily: "arial",
              fontSize: 18,
              color: kText1Color,
            ),
            subtitle2: GoogleFonts.almarai(
            textStyle:TextStyle(              
              fontSize: 24,
              color: kText2Color,
              fontWeight: FontWeight.bold)
            ,),
          ),
        backgroundColor: Colors.white
    );
  }