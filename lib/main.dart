import 'dart:io';

import 'package:ecommerce_ux/ui/screens/payment_details_screen.dart';
import 'package:ecommerce_ux/ui/screens/payment_method_screen.dart';
import 'package:ecommerce_ux/ui/screens/payment_successful_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xff050060),
          ),
        ),
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontWeight: FontWeight.bold),
            ),
            fixedSize:
                MaterialStateProperty.all<Size>(const Size.fromWidth(160)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xff34495E),
            ),
          ),
        ),
      ),
      title: "Payment Flow",
      initialRoute: '/',
      routes: {
        '/': (context) => PaymentMethodScreen(),
        '/payment_details': (context) => PaymentDetailsScreen(),
        '/payment_successful': (context) => PaymentSuccessfulScreen(),
      },
    );
  }
}
