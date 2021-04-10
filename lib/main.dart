import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  _payment(printValue) async {
    await InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-J9BZm-sXBGRVpNACuEzB-Q');
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails result) async {
          backend(result, printValue);
          try {
            InAppPayments.completeCardEntry(onCardEntryComplete: () => {});
          } catch (ex) {
            InAppPayments.showCardNonceProcessingError(ex.messsage);
          }
        },
        onCardEntryCancel: () => {});
  }

  Future<void> backend(result, price) async {}

  @override
  Widget build(BuildContext context) {
    int price = 10;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price.toString(),
                style: TextStyle(fontSize: 60),
              ),
              RaisedButton(
                child: Text('Pay this \$ $price'),
                onPressed: () {
                  _payment(price);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
