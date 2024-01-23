import 'package:flutter/material.dart';
import 'package:interntask2/data.dart';
import 'package:interntask2/screens/offerscreen.dart';
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
class Task extends StatelessWidget {
  int index;
  String imageurl;
  String title;
  String buttontext;
  String userscount;
  Task({required this.index,required this.imageurl,required this.title,required this.buttontext,required this.userscount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:HexColor(allofferstasks[index].color),width: 3.0)
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 10,),
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(imageurl)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: GestureDetector(
                          onTap: (){
                            if(index==0){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferScreen(index:index)));}
                          },
                          child: Text(buttontext,
                            overflow: TextOverflow.visible,)),
                    ),
                  ],
                ),
              ],
            ),
            // Text(userscount)
          ],
        ),
      ),
    );
  }
}
class Task2 extends StatelessWidget {
  String imageurl;
  String title;
  String promtext;
  String users;
  Task2({required this.imageurl,required this.title,required this.promtext,required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: 100,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.only(left: 10),
            color: Colors.brown.withOpacity(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text(title,style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text(promtext,style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageurl)),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
class pagetitle extends StatelessWidget {
  String title;
  Color color;
  pagetitle({required this.title,required this.color}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(title,style: TextStyle(color: Colors.black),),
    );
  }
}
// class Task3 extends StatelessWidget {
//   String imageurl;
//   String title;
//   String buttontext;
//   String userscount;
//   Task3({required this.imageurl,required this.title,required this.buttontext,required this.userscount});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(child: Container(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               SizedBox(width: 10,),
//               Center(
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(image: NetworkImage(imageurl)),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10,),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(title,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(),
//                     ),
//                     child: GestureDetector(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferScreen()));
//                         },
//                         child: Text(buttontext,
//                           overflow: TextOverflow.visible,)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // Text(userscount)
//         ],
//       ) ,
//     ));
//   }
// }

