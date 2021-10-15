import 'package:flutter/material.dart';
import '../models/Transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // doubli.infinity
      // child: SingleChildScrollView(
      child: transactionList.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transaction Found',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/Parul M.JPG',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                              '\$${transactionList[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactionList[index].title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactionList[index].time)),
                  ),
                );

                // return Card(
                //   color: Colors.white,
                //   //    elevation: 2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // for Amount
                //       Container(
                //         alignment: Alignment.centerLeft,
                //         margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                //         width: 160,
                //         //      alignment: Alignment.center,
                //         // decoration: BoxDecoration(
                //         //   border: Border.all(
                //         //     width: 6,
                //         //     color: Colors.white,
                //         //   ),
                //         // ),
                //         //    padding: EdgeInsets.all(5),
                //         child: Text(
                //           '\$${transactionList[index].amount.toStringAsFixed(2)}',
                //           // style: TextStyle(
                //           //   color: Theme.of(context).primaryColor,
                //           //   fontSize: 18,
                //           //   fontWeight: FontWeight.bold,
                //           // )
                //           style: AppBarTheme.of(context).toolbarTextStyle,

                //           // fontStyle: FontStyle.italic),
                //         ),
                //       ),
                //       // For title and date
                //       Container(
                //         alignment: Alignment.centerRight,
                //         margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                //         child: Column(
                //           //    crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               transactionList[index].title,
                //               style: AppBarTheme.of(context).toolbarTextStyle,
                //               // style: TextStyle(
                //               //   fontSize: 20,
                //               //   fontWeight: FontWeight.bold,
                //               //   color: Theme.of(context).primaryColor,
                //               // ),
                //             ),
                //             Container(
                //               margin: EdgeInsets.symmetric(vertical: 10),
                //               child: Text(
                //                 //txn.time.toString(),
                //                 //  txn.time.toString().split('.').first,
                //                 DateFormat.yMMMEd()
                //                     .format(transactionList[index].time),
                //                 style: Theme.of(context).textTheme.headline6,
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactionList.length,
            ),
    );
    //     ),
  }
}
