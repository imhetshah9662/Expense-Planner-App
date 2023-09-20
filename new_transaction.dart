import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    style : ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.brown)),
                    child : Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: () => _submitData(),
              // print(titleController.text);
              // print(amountController.text);
              //addTx(titleController.text,double.parse(amountController.text));   // because amount is double

              style: ButtonStyle(foregroundColor :
              MaterialStateProperty.all(Colors.grey)),

            ),
          ],
        ),
      ),
    );
  }
}
/*
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';


class NewTransaction extends StatefulWidget {
  final VoidCallback addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}
class _NewTransactionState extends State<NewTransaction>{
 // final VoidCallback addTx;
  DateTime _selectedDate;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
 // NewTransaction(this.addTx);
  void SubmitData(String val)
  {
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate == null)
      {
        return;
      }
    widget.addTx(enteredTitle,enteredAmount,_selectedDate);
    Navigator.of(context).pop();

    void presentDatePicker() {
      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((pickedDate){
        if(pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context){

    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText : 'Title'),
                  controller : titleController,
                  onSubmitted: (_) => SubmitData,
                ),
                TextField(
                  decoration: InputDecoration(labelText : 'Amount'),
                  controller: amountController,
                  keyboardType:TextInputType.number,
                  onSubmitted: (_) => SubmitData,
                ),
                Container(
                  height: 70,
                    child: Row(
                  children: <Widget>[
                    Text(_selectedDate == null ?'No Date Chosen' : DateFormat.yMd().format(_selectedDate)),
                    TextButton(
                          style : ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.brown)),
                          child : Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                          onPressed: presentDatePicker(),
                    ),

                  ]
                ),
                ),
                ElevatedButton(
                  child: Text('Add Transaction'),
                  onPressed: () => SubmitData,
                   // print(titleController.text);
                   // print(amountController.text);
                    //addTx(titleController.text,double.parse(amountController.text));   // because amount is double

                  style: ButtonStyle(foregroundColor :
                  MaterialStateProperty.all(Colors.grey)),

                ),
              ]

      ),
    )
    );
  }
}

 */