import 'package:flutter/material.dart';
import './new_transaction.dart';
import '../Widgets/transaction_list.dart';
import '../models/transaction.dart';
//import '../Widgets/user_transactions.dart';
import '/main.dart';

class  UserTransactions extends StatefulWidget{

  @override
 // Widget build(BuildContext context){
_UserTransactionsState createState() => _UserTransactionsState();

  }


  class _UserTransactionsState extends State<UserTransactions>{
  @override

  final Function addNewTransaction;

  _UserTransactionsState({this.addNewTransaction});

    Widget build(BuildContext context)
  {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction),
       // TransactionList(_userTransaction),
      ],
    );
  }
  }