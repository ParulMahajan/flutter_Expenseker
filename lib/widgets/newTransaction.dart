//import 'dart:ffi';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTxn;

  NewTransaction(this.addNewTxn);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _addNewTrxnFunct() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) return;
    widget.addNewTxn(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //  elevation: 5,
      child: Container(
        //     color: Colors.cyanAccent,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              autofocus: false,
              maxLength: 10,
              onSubmitted: (_) => _addNewTrxnFunct(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              maxLength: 10,
              autofocus: false,
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => _addNewTrxnFunct(),
            ),
            FlatButton(
              onPressed: _addNewTrxnFunct,
              child: Text('Add Transaction'),
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
