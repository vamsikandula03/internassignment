import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:interntask2/models/task.dart';
import "package:interntask2/pages/alloffers.dart";
List<Task>alloffers=[

];
List<Offertask>allofferstasks=[];
List<Offertask>trending=[

];
List<Widget> pages=[
  Alloffers(),
  Container(
    color: Colors.white,
    child: Center(child: Text("not added"),),),
  Container(
    color: Colors.white,
    child: Center(child: Text("not added"),),), Container(
    color: Colors.white,
    child: Center(child: Text("not added"),),),
];
List<offerevent> offerdetails=[];
class offerevent{
  String eventid;
  String title;
  String description;
  String payout;
  bool iscompleted;
  int payoutamt;
  String payoutcurr;
  offerevent({required this.eventid,required this.title,required this.description,required this.payout,required this.payoutamt,required this.iscompleted,required this.payoutcurr});
  @override
  String toString() {
    return 'offerevent{eventid: $eventid, title: $title, description: $description, payout: $payout, iscompleted: $iscompleted, payoutamt: $payoutamt, payoutcurr: $payoutcurr}';
  }
}
class Offertask {
  String taskid;
  String title;
  String thumbnail;
  String shortdesc;
  String payout;
  String ctalong;
  String tyle;
  String totallead;
  String isTrending;
  String earned;
  String status;
  String iscompleted;
  String payoutamt;
  String payoutcurr;
  String ctaaction;
  String apprating;
  String color;

  Offertask({
    required this.taskid,
    required this.title,
    required this.thumbnail,
    required this.shortdesc,
    required this.payout,
    required this.ctalong,
    required this.tyle,
    required this.totallead,
    required this.isTrending,
    required this.earned,
    required this.status,
    required this.iscompleted,
    required this.payoutamt,
    required this.payoutcurr,
    required this.ctaaction,
    required this.apprating,
    required this.color,
  });
}

class Event extends StatelessWidget {
  String title;
  String description;
  String payout;
  bool iscompleted;
  int payoutamt;
  String payoutcurr;
  Event({required this.title,required this.description,required this.payout,required this.payoutamt,required this.iscompleted,required this.payoutcurr});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all( color: iscompleted?Colors.green.shade700:Colors.orange.shade400),
        borderRadius: iscompleted?BorderRadius.circular(50):BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
      color: iscompleted?Colors.green:Colors.orange,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: iscompleted?Colors.green:Colors.orange)
      ),
                  child: Icon(iscompleted?Icons.check:Icons.close,color:Colors.white,)),
              Text(title,style: TextStyle(decoration: iscompleted?TextDecoration.lineThrough:TextDecoration.none,fontSize: 15),),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: iscompleted?Colors.green:Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: iscompleted?Colors.green:Colors.orange)
                ),
                child: Row(
                  children: [
                    // Text(payoutcurr,style: TextStyle(color: Colors.white),),
                    Text(payout,style: TextStyle(color: Colors.white),),
                  ],
                ),
              )

            ],
          ),
          if(iscompleted==false)
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                 description,
              ),
            ),

        ],
      ),
    );
  }
}



