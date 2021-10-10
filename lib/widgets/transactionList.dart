import 'package:flutter/material.dart';
import '../models/Transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // doubli.infinity
      // child: SingleChildScrollView(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.white,
            //    elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // for Amount
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: 160,
                  //      alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 6,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  //    padding: EdgeInsets.all(5),
                  child: Text(
                      '\$${transactionList[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )

                      // fontStyle: FontStyle.italic),
                      ),
                ),
                // For title and date
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Column(
                    //    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionList[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        //txn.time.toString(),
                        //  txn.time.toString().split('.').first,
                        DateFormat.yMMMEd().format(transactionList[index].time),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: transactionList.length,
      ),
    );
    //     ),
  }
}
