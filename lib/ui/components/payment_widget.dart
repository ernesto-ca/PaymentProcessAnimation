import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PaymentMethod { CREDIT_CARD, BANK, PAYPAL, BITCOIN }

typedef PaymentCallback = Function(PaymentMethod value);

class PaymentMethodWidget extends StatelessWidget {
  Widget icon;
  String title;
  String subtitle;
  PaymentMethod value;
  PaymentMethod selectedValue;
  PaymentCallback paymentCallback;

  PaymentMethodWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.selectedValue,
    required this.paymentCallback,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.036),
      child: InkWell(
        // enable taps
        onTap: _onTap,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.017, right: size.height * 0.017),
              child: getWidgetState(size),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  size.height * 0.029,
                  size.height * 0.014,
                  size.height * 0.014,
                  size.height * 0.014,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    icon,
                    Padding(
                      padding: EdgeInsets.only(left: size.height * 0.020),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                color: const Color(0xff1A1A1A),
                                fontSize: size.height * 0.020,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.0089,
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                                color: const Color(0xff6C738A),
                                fontSize: size.height * 0.018),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // check if it was selected
  Widget getWidgetState(Size size) {
    if (value == selectedValue) {
      return Icon(
        FontAwesomeIcons.solidCircleCheck,
        color: Colors.green,
        size: size.height * 0.030,
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: size.height * 0.0001),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: Colors.grey, width: size.height * 0.00029)),
        height: size.height * 0.029,
        width: size.height * 0.029,
      );
    }
  }

  void _onTap() {
    this.paymentCallback(this.value);
  }
}
