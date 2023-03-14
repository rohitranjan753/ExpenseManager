import 'package:expensemanager/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> trasnsaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.55, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Pant', amount: 50.88, date: DateTime.now()),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: [
            Card(
              elevation: 10,
              child: Container(
                child: Text('chart'),
                width: 100,
              ),
            ),
            Column(

              children: trasnsaction.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepPurple
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,horizontal: 15
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 10,
                            color: Colors.red,
                          )
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.title,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(tx.date.toString(),style: TextStyle(
                            color: Colors.grey,
                          ),),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
