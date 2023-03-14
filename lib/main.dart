import 'package:expensemanager/models/transaction.dart';
import 'package:expensemanager/widgets/chart.dart';
import 'package:expensemanager/widgets/new_transaction.dart';
import 'package:expensemanager/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        errorColor: Theme.of(context).errorColor,
        primarySwatch: Colors.cyan,
        accentColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTrasaction = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 69.55, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New Pant', amount: 50.88, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions{
    return _userTrasaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days:7),),);
    }).toList();
  }

  void _addNewTransaction(String title, double amount,DateTime chosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTrasaction.add(newTx);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTrasaction.removeWhere((tx){
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(onTap: (){
      },
          behavior: HitTestBehavior.opaque,
      child: NewTransaction(_addNewTransaction));
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: [
          IconButton(
            onPressed: ()=> _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            Expanded(child: TransactionList(_userTrasaction,_deleteTransaction)),
            // Container(
            //   width: double.infinity,
            //   child: Card(
            //     color: Colors.tealAccent,
            //     elevation: 2,
            //     child: Text('chart',style: TextStyle(fontSize: 30),),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
            ()=> _startAddNewTransaction(context);
      },
      child: Icon(Icons.add),),
    );
  }
}
