import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          // errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(

            button: TextStyle(color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(

            ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount,
      DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import './Widgets/new_transaction.dart';
import './Widgets/user_transactions.dart';
import '../models/transaction.dart';
import './Widgets/chart.dart';
import './Widgets/transaction_list.dart';


void main()
{
  runApp(MyApp());
}
//void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        //this is theme for transaction data
        textTheme: ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(
                fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 18)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(fontFamily: 'OpenSans',fontSize: 20,)),
        )
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePagestate createState() => _MyHomePagestate();
}


class _MyHomePagestate extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'newbag', amount: 60.45, date: DateTime.now()) ,
    Transaction(id: 't2', title: 'bottle', amount: 10.75, date: DateTime.now()) ,
  ];
  bool _showChart = false;
  List<Transaction> get _recenTransactions{
    return _userTransaction.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
  }
  }
  void _addNewTransaction(String txtitle,double txamount,DateTime chosenDate) {
    final newTx = Transaction(id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: chosenDate,
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }
  void _deleteTransaction(String id){
  setState((){
    _userTransaction.removeWhere((tx) {
      return tx.id == id;
    });
  });
  }

    void _startAddNewTransaction(BuildContext ctx){
      showModalBottomSheet(context: ctx,builder:(_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      });
    //final List<Transaction> transaction = [
    //  Transaction(id: 't1', title: 'newbag', amount: 60.45, date: DateTime.now()) ,
    //  Transaction(id: 't2', title: 'bottle', amount: 10.75, date: DateTime.now()) ,    // in this transaction called file taransactio.dart and date time now means that date
    //];
    //String titleInput;
    //String amountInput;
   // final titleController = TextEditingController();
  //  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Personal Expenses',style: TextStyle(fontFamily: 'OpenSans'),),),
            // backgroundColor: Colors.grey,
             //use a theme for a appbar and default button


             // IconButton(icon: Icon(Icons.add),),
                  //       onPressed: () {},),//Appbar
      body: SingleChildScrollView(
      child: Column(
        //mainAxisAlignment : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
         Row(
      mainAxisAlignment : MainAxisAlignment.center,
      children: <Widget>[Switch(value: _showChart, onChanged: (val){
            setState((){
              _showChart : val;
            });
      })
          ],
      ),
         // Container(
           // width : double.infinity,
           // child: Card(
                //   color: Colors.blue,
                //   child: Text('CHART!'),
                //   elevation: 5,
                     //   ),

        //  ),
          _showChart ? Container(
          height: (MediaQuery.of(context).size.height)  //-appBar.preferedSize.height - MediaQuery.of(context).padding.top) * 0.3
          child : Chart(_recentTransactions),
    )
       : Container(
         height: MediaQuery.of(context).size.height,
         child: TransactionList(_userTransaction,_deleteTransaction),
    ),
        ],
      ),

    ),
    //for add button to transaction
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,           //for location of button
    floatingActionButton: FloatingActionButton(
                              child: Icon(Icons.add),
                              onPressed: () => _startAddNewTransaction(context),
    ),
    ),
    );
  }

}

 */