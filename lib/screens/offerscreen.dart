import 'package:flutter/material.dart';
import 'package:interntask2/data.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({Key? key,required this.index}) : super(key: key);
  int index;
  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offer details"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(allofferstasks[widget.index].thumbnail),
                            )
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(allofferstasks[widget.index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),softWrap: true,),
                            Text(allofferstasks[widget.index].shortdesc),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text("Steps"),
                      Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        child: ListView.builder(
                            itemCount: offerdetails.length,
                            itemBuilder: (context,index)=>Event(title: offerdetails[index].title, description: offerdetails[index].description, payout: offerdetails[index].payout, payoutamt: offerdetails[index].payoutamt, iscompleted: offerdetails[index].iscompleted, payoutcurr: offerdetails[index].payoutcurr)
                      )
                      )
                    ],
                  ),
                ),
              ],),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 40),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("Get \u20b9364",style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
