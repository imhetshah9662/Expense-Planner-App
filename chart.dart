import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../Widgets/chart_bar.dart';

class Chart extends StatelessWidget
{
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);


  //add a new method for to list genrete a chart 7
  @override
  List<Map<String, Object>> get groupedtransactionsValues{
    return List.generate(7,(index) {
      final weekDay = DateTime.now().subtract(Duration(days:index));
      double totalsum = 0.00;
      for(var i=0;i<recentTransactions.length;i++)
        {
          if(recentTransactions[i].date.day == weekDay.day && recentTransactions[i].date.month == weekDay.month && recentTransactions[i].date.year == weekDay.year){
            totalsum += recentTransactions[i].amount;
          }
        }
      print(DateFormat.E().format(weekDay).substring(0,1));
      print(totalsum);
      return {'day': DateFormat.E().format(weekDay),'amount': totalsum };
    }).reversed.toList();
  }

  double get totalSpending{
               //in this use fold method allows use to change everything
      return groupedtransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }




  @override
  Widget build(BuildContext context){
  print(groupedtransactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
      padding: EdgeInsets.all(10),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedtransactionsValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              data['day'],
              data['amount'],
              totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending,
            ),
          );
        }).toList()
      ),
    ),
    );
  }
}
