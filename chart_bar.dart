import 'package:flutter/material.dart';
class ChartBar extends StatelessWidget{
  final String Label;
  final double SpendingAmount;
  final double SpendingpctofTotal;

  ChartBar(this.Label,this.SpendingAmount,this.SpendingpctofTotal);
  @override
  Widget build(BuildContext context){
    //return //LayoutBuilder(
       // builder: (ctx,constraints)){
      return Column(
      children: <Widget>[
        Container(
    height: 20,
        child: FittedBox(
        child: Text('\$${SpendingAmount.toStringAsFixed(0)}'),
        ),
      ),
       SizedBox(height: 4,),

         Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1.0),
              //color: Color.FromRGBO(220,220,220,1),
                color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              ),
              ),
              FractionallySizedBox(
                heightFactor: SpendingpctofTotal,
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),),

                ),
              ),
            ],
          ),
          ),
          SizedBox(height: 4,),
    Text(Label),

      ],

    );

  }
}