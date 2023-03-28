import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';

class CardConversor extends StatelessWidget {
  CardConversor({@required this.inputCurrency, @required this.selectedCurrency, @required this.value});

  final String inputCurrency;
  final String selectedCurrency;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $inputCurrency = ${value.toStringAsFixed(2)} $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}