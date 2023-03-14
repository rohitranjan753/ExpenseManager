import 'package:expensemanager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx,index) {
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    '\$${transaction[index].amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple),
                  ),
                  margin:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 10,
                        color: Colors.red,
                      )),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      transaction[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
