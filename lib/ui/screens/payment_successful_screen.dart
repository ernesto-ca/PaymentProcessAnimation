import 'package:flutter/material.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.43,
            decoration: const BoxDecoration(
                color: Color(0xFF34495E),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
            child: Center(
              child: Image.asset(
                "assets/woman.png",
                height: size.height * 0.29,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.083,
          ),
          Image.asset(
            "assets/done.png",
            height: size.height * 0.086,
          ),
          SizedBox(
            height: size.height * 0.083,
          ),
          Text(
            "Thank you for Buying!",
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: size.height * 0.029,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Your order will be shipped in 2-4 international days!",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: size.height * 0.019,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => {},
        child: const Text("NEXT"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MyArguments {
  String name = "";
  String cardNumber = "";
  String expiryDate = "";
  String cvvCode = "";
  var saveCard = false;

  MyArguments(
      {required this.name,
      required this.cardNumber,
      required this.cvvCode,
      required this.expiryDate,
      required this.saveCard});
}
