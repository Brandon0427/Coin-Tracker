import 'package:bitcoin_ticker/services/networking.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';

const apiKey = '7D90B47D-A4DC-44AC-B855-7D3D938BA71D';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CurrencyModel{
  Future<dynamic> getBTCValue(String selectedCurrency) async{
    String tempCrypto = kcryptoList[0];
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/$tempCrypto/$selectedCurrency?apikey=$apiKey');
    print('$coinAPIURL/$tempCrypto/$selectedCurrency?apikey=$apiKey');
    var cryptoData = await networkHelper.getData();
    return cryptoData;
  }

  Future<dynamic> getETHValue(String selectedCurrency) async{
    String tempCrypto = kcryptoList[1];
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/$tempCrypto/$selectedCurrency?apikey=$apiKey');
    print('$coinAPIURL/$tempCrypto/$selectedCurrency?apikey=$apiKey');
    var cryptoData = await networkHelper.getData();
    return cryptoData;
  }

  Future<dynamic> getLTCValue(String selectedCurrency) async{
    String tempCrypto = kcryptoList[2];
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/$tempCrypto/$selectedCurrency?apikey=$apiKey');
    print('$coinAPIURL/$tempCrypto/$selectedCurrency?apikey=$apiKey');
    var cryptoData = await networkHelper.getData();
    return cryptoData;
  }
}

//https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=7D90B47D-A4DC-44AC-B855-7D3D938BA71D