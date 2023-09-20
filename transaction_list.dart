import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',

          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: Image.asset(
                'assets/image/img.png',
                fit: BoxFit.cover,
              )),
        ],
      )
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                transactions[index].title,

              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme
                    .of(context)
                    .errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  //@override
final List<Transaction> transactions;
final VoidCallback deleteTx;
//constructor
  TransactionList(this.transactions,this.deleteTx);


  @override
  Widget build(BuildContext context){


    return SingleChildScrollView(
        child: Container(
               height: 300,
      child: transactions.isEmpty ? Column(
      children: <Widget> [
        Text('No Transaction added yet',
        style: Theme.of(context).textTheme.titleLarge,
      ),
       SizedBox(height:20,),
       Container(
         height: 200,
      child:
       Image.asset('assets/image/img.png')),
        ListView.builder(
        itemBuilder:  (ctx,index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  //for styling a container we add a margin width color decorationpadding
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15,),
                  decoration: BoxDecoration(border: Border.all(color: Theme
                      .of(context)
                      .primaryColor, width: 3,)),
                  padding: EdgeInsets.all(10),
                  child: Text('\$${transactions[index].amount.toStringAsFixed(
                      2)}',
                      //tx.amount.toString(),for simple   //tx ni jagya ae transactions[index] karvathi index wise leshe
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amber,
                      )

                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent),
                    ),
                    Text(
                      DateFormat().format(transactions[index].date.toString()),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            // trailing:
            //  floatingActionButton: FloatingActionButton(
            //  child: Icon(Icons.delete),
            //    onPressed: () => deleteTx(transaction[index].id,
          );
        },
          itemCount:transactions.length,

    ),

    ],

    ),
    ),
    );


//child: Column(
    //children : transactions.map((tx)   // transaction is not a widgets.this is a simple class object

    //  }).toList()

  }


}

 */