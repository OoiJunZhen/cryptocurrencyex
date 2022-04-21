// ignore_for_file: file_names, prefer_typing_uninitialized_variables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

// ignore: camel_case_types
class currencyExPage extends StatelessWidget {
  const currencyExPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CryptoCurrencyEx'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // ignore: sized_box_for_whitespace
            Container(
                height: 110,
                child: Center(
                  child: Image.asset('assets/images/cryptocurrencyEx.png'),
                )),
            // ignore: avoid_unnecessary_containers, prefer_const_constructors
            Container(child: CurrencyExScreen()),
          ]),
        ),
      ),
    );
  }
}

class CurrencyExScreen extends StatefulWidget {
  const CurrencyExScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyExScreen> createState() => _CurrencyExScreen();
}

class _CurrencyExScreen extends State<CurrencyExScreen> {
  var desc = "Please choose the currency";
  var name, unit, type;
  var value;
  var currency = "btc";
  TextEditingController toCurrencyEditingController = TextEditingController();
  List<String> currencyList = [
    "btc",
    "eth",
    "ltc",
    "bch",
    "bnb",
    "eos",
    "xrp",
    "xlm",
    "link",
    "dot",
    "yfi",
    "usd",
    "aed",
    "ars",
    "aud",
    "bdt",
    "bhd",
    "bmd",
    "brl",
    "cad",
    "chf",
    "clp",
    "cny",
    "czk",
    "dkk",
    "eur",
    "gbp",
    "hkd",
    "huf",
    "idr",
    "ils",
    "inr",
    "jpy",
    "krw",
    "kwd",
    "lkr",
    "mmk",
    "mxn",
    "myr",
    "ngn",
    "nok",
    "nzd",
    "php",
    "pkr",
    "pln",
    "rub",
    "sar",
    "sek",
    "sgd",
    "thb",
    "try",
    "twd",
    "uah",
    "vef",
    "vnd",
    "zar",
    "xdr",
    "xag",
    "xau",
    "bits",
    "sats",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "CryptoCurrency ExChange Calculator",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const Text(
            "Please choose the currency that you want to convert:",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          DropdownButton(
            itemHeight: 60,
            value: currency,
            onChanged: (newValue) {
              setState(() {
                currency = newValue.toString();
              });
            },
            items: currencyList.map((currency) {
              return DropdownMenuItem(
                child: Text(
                  currency,
                ),
                value: currency,
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: _currencyCalc, child: const Text("Convert")),
          const SizedBox(height: 10),
          Text(
            desc,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Future<void> _currencyCalc() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Progress"), title: const Text("Converting..."));
    progressDialog.show();

    var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsedData = json.decode(jsonData);
      name = parsedData['rates'][currency]['name'];
      unit = parsedData['rates'][currency]['unit'];
      value = parsedData['rates'][currency]['value'];
      type = parsedData['rates'][currency]['type'];
      setState(() {
        desc =
            "1 BitCoin: \n Name of currency: $name\n Unit of currency: $unit\n Value of currency: $value\n Type of currency: $type";
      });
      progressDialog.dismiss();
    }
  }
}
