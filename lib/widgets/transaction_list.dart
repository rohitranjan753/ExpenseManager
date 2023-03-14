import 'package:expensemanager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                child: Text(
                  '\$${tx.amount}',
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
                    tx.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
