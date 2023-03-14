import 'package:expensemanager/models/transaction.dart';
import 'package:expensemanager/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final today = DateTime.now();
      final weekDayNumber = today.weekday;
      final weekDay = today.subtract(Duration(days: weekDayNumber - index - 1));
      // final weekDay = DateTime.now().subtract(
      //   Duration(days: 6 - index),
      // );
      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, data) {
      return sum + (data['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'] as dynamic, data['amount'] as double,
                  totalSpending == 0.0 ? 0.0 :
                  (data['amount'] as double) / totalSpending),
            );
            // return Text('${data['day']} : ${data['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
