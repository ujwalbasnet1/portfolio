import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

Size screenSize(BuildContext context) => MediaQuery.of(context).size;
double screenWidth(BuildContext context, [double percent = 1]) =>
    screenSize(context).width * percent;
double screenHeight(BuildContext context, [double percent = 1]) =>
    screenSize(context).height * percent;

// ------- colors -------
const Color kcPrimaryColor = Color(0xFFFAA534);
const Color kctBlackColor = Color(0xFF242E48);
