import 'package:bitcoin_ticker/services/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/services/reusableCard.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = '-';
  int i = 0;
  double rate0 = 0.00;
  double rate1 = 0.00;
  double rate2 = 0.00;
  CurrencyModel currencyModel = CurrencyModel();
  var cryptoData;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in kcurrenciesList) {
      var newItem = DropdownMenuItem(
        //Despliega la opcion
        child: Text(currency),
        //Valor que sera obtenido si se selecciona esa opcion
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      //Starting value of the Widget
      //Es necesario implementar una variable que actualice el texto de la opcion elegida.
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) async{
        selectedCurrency = value;
        cryptoData = await currencyModel.getBTCValue(selectedCurrency);
        updateUI(cryptoData);
        print ('BTC $cryptoData');
        cryptoData = await currencyModel.getETHValue(selectedCurrency);
        updateUI(cryptoData);
        print ('ETH $cryptoData');
        cryptoData = await currencyModel.getLTCValue(selectedCurrency);
        updateUI(cryptoData);
        print ('LTC $cryptoData');
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in kcurrenciesList) {
      var newItem = Text(
        currency,
        style: TextStyle(
          color: Colors.white,
        ),
      );
      pickerItems.add(newItem);
    }

    return CupertinoPicker(
      //height of the options inside the picker
      itemExtent: 32,
      //what should happen when the user scrolls through that wheel
      onSelectedItemChanged: (selectedIndex) async {
        selectedCurrency = kcurrenciesList[selectedIndex];
        cryptoData = await currencyModel.getBTCValue(selectedCurrency);
        updateUI(cryptoData);
        print ('BTC $cryptoData');
        cryptoData = await currencyModel.getETHValue(selectedCurrency);
        updateUI(cryptoData);
        print ('ETH $cryptoData');
        cryptoData = await currencyModel.getLTCValue(selectedCurrency);
        updateUI(cryptoData);
        print ('LTC $cryptoData');
      },
      //opciones
      children: pickerItems,
    );
  }

  void updateUI(dynamic cryptoData){
    //Esto se mete dentro de set state para hacer la actualizacion de datos del estado
    setState(() {
      //Reliza lo siguiente si no puede obtener la ubicacion
      if (cryptoData == null){
        rate0 = 0.00;
        rate1 = 0.00;
        rate2 = 0.00;
        return;
      }
      switch (i) {
        case 0:
          rate0 = cryptoData['rate'];
          print(rate0);
          i ++;
        break;
        case 1:
          rate1 = cryptoData['rate'];
          print(rate1);
          i ++;
        break;
        case 2:
          rate2 = cryptoData['rate'];
          print(rate2);
          i = 0;
          break;
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardConversor(inputCurrency: kcryptoList[0], selectedCurrency: selectedCurrency, value: rate0),
              CardConversor(inputCurrency: kcryptoList[1], selectedCurrency: selectedCurrency, value: rate1),
              CardConversor(inputCurrency: kcryptoList[2], selectedCurrency: selectedCurrency, value: rate2),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}