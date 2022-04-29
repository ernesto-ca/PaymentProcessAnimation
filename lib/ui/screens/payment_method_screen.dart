import 'package:ecommerce_ux/ui/components/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  var paymentSelected = PaymentMethod.CREDIT_CARD;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: size.height * 0.029,
            right: size.height * 0.029,
            top: size.height * 0.029),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Payment Method",
              style: TextStyle(
                fontSize: size.height * 0.036,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1A1A1A),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Select one of the payment methods",
              style: TextStyle(
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff6C738A)),
            ),
            SizedBox(
              height: size.height * 0.029,
            ),
            PaymentMethodWidget(
              title: "Credit Card",
              subtitle: "Pay with MasterCard or Visa",
              icon: const Icon(
                FontAwesomeIcons.creditCard,
                color: Colors.orange,
              ),
              value: PaymentMethod.CREDIT_CARD,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
            PaymentMethodWidget(
              title: "Internet Banking",
              icon: const Icon(
                FontAwesomeIcons.moneyBillTransfer,
                color: Colors.blue,
              ),
              subtitle: "Pay from your banck account",
              value: PaymentMethod.BANK,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
            PaymentMethodWidget(
              title: "Paypal",
              icon: const Icon(
                FontAwesomeIcons.paypal,
                color: Colors.indigo,
              ),
              subtitle: "Pay fast and secure with your paypal account",
              value: PaymentMethod.PAYPAL,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
            PaymentMethodWidget(
              title: "Bitcoin Wallet",
              icon: const Icon(
                FontAwesomeIcons.bitcoin,
                color: Colors.black,
              ),
              subtitle: "Send the amount in our Bitcoin wallet",
              value: PaymentMethod.BITCOIN,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => _showDetails(context),
        child: const Text("NEXT"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _onPaymentChange(PaymentMethod value) {
    setState(() {
      this.paymentSelected = value;
    });
  }

  _showDetails(BuildContext context) {
    Navigator.pushNamed(context, "/payment_details");
  }
}
