import 'package:flutter/material.dart';
import './newTransaction.dart';
import './TransactionList.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //   NewTransaction(_addTransaction),
        //    TransactionList(_transactionList),
      ],
    );
  }
}
