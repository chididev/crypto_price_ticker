import 'package:flutter/material.dart';
import 'package:crypto_price_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCurrency = 'USD';

  Widget androidPicker() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem<String>(
        value: currency,
        child: Text(currency),
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      iconEnabledColor: Colors.white,
      dropdownColor: Colors.blue,
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value;
          },
        );
      },
    );
  }

  Widget iosPicker() {
    List<Text> cupertinoItem = [];
    for (String currency in currenciesList) {
      cupertinoItem.add(
        Text(
          currency,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.blue,
      useMagnifier: true,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: cupertinoItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cryptocurrency Price Checker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      title: const Center(
                        child: Text(
                          'Bitcoin = \$12,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      tileColor: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      title: const Center(
                        child: Text(
                          'Ethereum = \$12,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      tileColor: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      title: const Center(
                        child: Text(
                          'Litecoin = \$12,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      tileColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              height: 150,
              color: Colors.blue,
              padding: const EdgeInsets.only(bottom: 30.0),
              alignment: FractionalOffset.bottomCenter,
              child: Platform.isIOS ? iosPicker() : androidPicker(),
            ),
          )
        ],
      ),
    );
  }
}
