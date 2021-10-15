import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/newTransaction.dart';
import 'package:intl/intl.dart';
import './widgets/TransactionList.dart';
import '../models/Transaction.dart';

import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                //color: Colors.green,
                //  fontWeight: FontWeight.bold,
              ),
              toolbarTextStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20,
              )
              // textTheme: ThemeData.light().textTheme.copyWith(
              //       headline6: TextStyle(
              //         fontFamily: 'Quicksand',
              //         fontSize: 40,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactionList = [
    // Transaction(id: '1', title: 'food', amount: 20.20, time: DateTime.now()),
    // Transaction(
    //     id: '2', title: 'clothes', amount: 500.20, time: DateTime.now()),
  ];

  void _addTransaction(String txnTitle, double txnAmount) {
    final newTxn = Transaction(
      id: DateTime.now().toString(),
      title: txnTitle,
      amount: txnAmount,
      time: DateTime.now(),
    );

    setState(() {
      _transactionList.add(newTxn);
    });
  }

  void _startCreateNewTxn(BuildContext bcontext) {
    showModalBottomSheet(
      context: bcontext,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  List<Transaction> get lastWeekTransactions {
    return _transactionList.where((txn) {
      return txn.time.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  toolbarTextStyle:  ,
        title: Text('Expenseker'),
        titleTextStyle: AppBarTheme.of(context).titleTextStyle,
        actions: [
          IconButton(
            onPressed: () => {_startCreateNewTxn(context)},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   //  color: Colors.green.shade100,
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   width: double.infinity,
            //   child: Card(
            //     color: Colors.white,
            //  shadowColor: Colors.redAccent,
            Chart(lastWeekTransactions),
            //          ),
            //       ),
            //    UserTransaction(),
            TransactionList(_transactionList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {_startCreateNewTxn(context)}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
