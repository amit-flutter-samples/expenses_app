

import '../models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.mediaQuery,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final MediaQueryData mediaQuery;
  final Function deleteTransaction;

  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                    child: Text(
                        '\$${transaction.amount.toStringAsFixed(2)}'))),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date),
          ),
          trailing: mediaQuery.size.width > 400 ?
          FlatButton.icon(
              textColor: Theme.of(context).errorColor,
              onPressed: () => deleteTransaction(transaction.id),
              icon: Icon(Icons.delete),
              label: Text('Delete')
          ) :
          IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () =>
                deleteTransaction(transaction.id),
          ),
        ),
      ),
    );
  }
}