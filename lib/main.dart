import 'package:expensemanager/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final List<Transaction> trasnsaction = [
    Transaction(id: 't1',title: 'New Shoes',amount: 69.55, date: DateTime.now()),
    Transaction(id: 't2',title: 'New Pant',amount: 50.88, date: DateTime.now()),
  ];
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 10,
            child: Container(child: Text('chart'),
            width: 100,),
          ),
          Card(
            child: Text('List of tx'),
          ),
        ],
      ),
    );
  }
}
