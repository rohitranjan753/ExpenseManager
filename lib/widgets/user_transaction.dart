import 'package:expensemanager/models/transaction.dart';
import 'package:expensemanager/widgets/new_transaction.dart';
import 'package:expensemanager/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTrasaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.55, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Pant', amount: 50.88, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    
    setState(() {
      _userTrasaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTrasaction),
      ],
    );
  }
}
