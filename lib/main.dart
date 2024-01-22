import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interntask2/models/task.dart';
import 'package:interntask2/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dataupdated = false;

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString(
          'asserts/dummy_details.json');
      final data = await json.decode(response);
      for (var item in data){
        offerevent offer=offerevent(eventid: item["eventId"], title: item["title"], description: item["description"], payout: item["payout"], payoutamt: item["payout_amt"], iscompleted: item["isCompleted"], payoutcurr: item["payout_currency"]);
        offerdetails.add(offer);

      }
      print(offerdetails);
      final String jsonData=await rootBundle.loadString("asserts/dummy_tasks.json");
      List<dynamic> jsonList = json.decode(jsonData);
      // Create a list of tasks using the offertask class
       allofferstasks = jsonList.map((jsonTask) => Offertask(
        taskid: jsonTask['taskId'],
        title: jsonTask['title'],
        thumbnail: jsonTask['thumbnail'],
        shortdesc: jsonTask['shortDesc'],
        payout: jsonTask['payout'],
        ctalong: jsonTask['ctaLong'],
        tyle: jsonTask['type'],
        totallead: jsonTask['total_lead'],
        isTrending: jsonTask['isTrending'].toString(),
        earned: jsonTask['earned'],
        status: jsonTask['status'],
        iscompleted: jsonTask['isCompleted'],
        payoutamt: jsonTask['payout_amt'].toString(),
        payoutcurr: jsonTask['payout_currency'],
        ctaaction: jsonTask['ctaAction'],
        apprating: jsonTask['custom_data']['app_rating'],
        color: jsonTask['custom_data']['dominant_color'],
      )).toList();
      for(var task in allofferstasks){
        if(task.isTrending=="true"){
          trending.add(task);
        }
      }
      // Print the list of tasks
      print(allofferstasks);
      print(trending);
      setState(() {
        dataupdated = true;
      });
    }catch(e){
      print(e);
    }
  }
@override
void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: dataupdated
            ? HomeScreen()
            : Scaffold(
                body: Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ));
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pagenumber = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double bottom = height * 0.92;
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: height * 0.1,
                  width: width,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.align_horizontal_left,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Hey Vamsi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.wallet,
                                    color: Colors
                                        .white, // Set the color of the icon to white
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  // Set the color of the container to blue
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.blue),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("\u20b9"),
                              SizedBox(
                                width: 5,
                              ),
                              Text("452"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: bottom,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(0);
                                  setState(() {});
                                },
                                child: pagetitle(
                                    title: "All offers",
                                    color: pagenumber == 0
                                        ? Colors.blue
                                        : Colors.white)),
                            GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(1);
                                  setState(() {});
                                },
                                child: pagetitle(
                                    title: "Gifts",
                                    color: pagenumber == 1
                                        ? Colors.blue
                                        : Colors.white)),
                            GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(2);
                                  setState(() {});
                                },
                                child: pagetitle(
                                    title: "Upcoming",
                                    color: pagenumber == 2
                                        ? Colors.blue
                                        : Colors.white)),
                            GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(4);
                                  setState(() {});
                                },
                                child: pagetitle(
                                    title: "My offers",
                                    color: pagenumber == 3
                                        ? Colors.blue
                                        : Colors.white)),
                          ],
                        ),
                      ),
                      Container(
                        height: bottom * 0.9,
                        child: PageView(
                          physics: BouncingScrollPhysics(),
                          children: pages,
                          scrollDirection: Axis.horizontal,
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              pagenumber = index;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
