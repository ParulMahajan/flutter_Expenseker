import 'package:flutter/material.dart';

import '../models/Transaction.dart';
import 'package:intl/intl.dart';
import './ChartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> weeklyTransaction;

  Chart(this.weeklyTransaction);

  List<Map<String, Object>> get groupWeeklyTransactions {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;

        for (var i = 0; i < weeklyTransaction.length; i++) {
          if (weeklyTransaction[i].time.day == weekDay.day &&
              weeklyTransaction[i].time.month == weekDay.month &&
              weeklyTransaction[i].time.year == weekDay.year) {
            totalSum += weeklyTransaction[i].amount;
          }
        }

        return {
          "Day": DateFormat.E().format(weekDay).substring(0, 1),
          "Amount": totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupWeeklyTransactions.fold(0.0, (sum, data) {
      return sum + data['Amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupWeeklyTransactions.map((data) {
            //          return Text(' ${data['Day']} : ${data['Amount']}');
            return Flexible(
              fit: FlexFit
                  .tight, // Can use Expanded widget as well for this, for tight
              flex: 1, // to show the amount of area  like 2 +2 area
              child: ChartBar(
                  data['Day'],
                  data['Amount'],
                  totalSpending == 0
                      ? 0
                      : (data['Amount'] as double) / totalSpending),
            );
          }).toList(),

          // Column(
          //   children: ,
          // )
        ),
      ),
    );
  }
}
