import 'package:flutter/material.dart';
import 'package:interntask2/models/task.dart';
import 'package:interntask2/data.dart';
class Alloffers extends StatelessWidget {
  const Alloffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double bottom=height*0.9;
    return  Container(
      height: bottom,
      width: width,
      padding: EdgeInsets.only(top: height*0.01,left: 20,right: 10),
      decoration: BoxDecoration(
          color: Colors.white,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.local_fire_department_outlined,color: Colors.orange,),
              SizedBox(width: 5,),

              Text("TRENDING OFFERS"),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height:bottom*0.275,
            width: width,
            child: trending.length==0?Center(child: Text("No Trending offers :( ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),)):ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>
                    Task2(imageurl: trending[index].thumbnail, title: trending[index].title, promtext: trending[index].ctalong, users: trending[index].totallead)
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.align_horizontal_left,color: Colors.blue,),
              SizedBox(width: 5,),
              Text("ALL OFFERS"),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
                itemCount: allofferstasks.length,
                itemBuilder: (context,index)=>Task(index:index,imageurl: allofferstasks[index].thumbnail, title: allofferstasks[index].title, buttontext: allofferstasks[index].ctalong, userscount: allofferstasks[index].totallead)),
          )
        ],
      ),
    );
  }
}
