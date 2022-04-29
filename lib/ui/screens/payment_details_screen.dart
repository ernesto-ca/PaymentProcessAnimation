import 'package:ecommerce_ux/ui/screens/payment_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentDetailsScreen extends StatefulWidget {
  PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  String cardNumber = "";
  String expiryDate = "";
  String cvvCode = "";
  var _saveCard = false;

  late FocusNode cardNumberFocus;
  late FocusNode expiryDateFocus;
  late FocusNode cvvCodeFocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
          child: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Payment Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1A1A1A),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.mapLocationDot,
                      color: Color(0xff34495E),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff34495E),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      FontAwesomeIcons.creditCard,
                      color: Color(0xff34495E),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/check1.png"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    "assets/card_persons.png",
                    height: 125,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enter your credit card details",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Form
                TextFormField(
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  decoration: CardInputDecoration("Card Holder Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is obligatory";
                    }
                  },
                  onSaved: (value) {
                    name = value!;
                  },
                  onEditingComplete: () => requestFocus(cardNumberFocus),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  decoration: CardInputDecoration("Card Number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is obligatory";
                    }
                  },
                  onSaved: (value) {
                    cardNumber = value!;
                  },
                  inputFormatters: [
                    MaskTextInputFormatter(
                        mask: 'xxxx-xxxx-xxxx-xxxx',
                        filter: {"x": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy)
                  ],
                  keyboardType: TextInputType.number,
                  focusNode: cardNumberFocus,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => requestFocus(expiryDateFocus),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: CardInputDecoration("Expiry Date"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is obligatory";
                          }
                        },
                        onSaved: (value) {
                          expiryDate = value!;
                        },
                        focusNode: expiryDateFocus,
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: '##/##',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy)
                        ],
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => requestFocus(cvvCodeFocus),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: CardInputDecoration("CVV"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is obligatory";
                          }
                        },
                        onSaved: (value) {
                          cvvCode = value!;
                        },
                        focusNode: cvvCodeFocus,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => setState(() {
                    _saveCard = !_saveCard;
                  }),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          value: this._saveCard,
                          onChanged: (value) {
                            setState(() {
                              this._saveCard = value!;
                            });
                          }),
                      const Expanded(
                          child: Text("Save this card for future payments?"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => showSuccessful(context),
                    child: const Text("Confirm Payment"),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.cardNumberFocus = FocusNode();
    this.expiryDateFocus = FocusNode();
    this.cvvCodeFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    this.cardNumberFocus.dispose();
    this.expiryDateFocus.dispose();
    this.cvvCodeFocus.dispose();
  }

  requestFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  showSuccessful(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      MyArguments arguments = MyArguments(
          name: this.name,
          cardNumber: this.cardNumber,
          expiryDate: this.expiryDate,
          cvvCode: this.cvvCode,
          saveCard: this._saveCard);
      // Erase back navigation, the user will can´t go back to this screen
      Navigator.pushNamedAndRemoveUntil(context, "/payment_successful",
          ModalRoute.withName("/payment_successful"),
          arguments: arguments);
    }
  }
}

class CardInputDecoration extends InputDecoration {
  final String myLabelText;

  CardInputDecoration(this.myLabelText)
      : super(
            fillColor: const Color(0xfff5f5f5),
            filled: true,
            hintText: myLabelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.all(10));
}
