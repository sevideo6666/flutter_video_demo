import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_video_demo/video_info.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) => {
              setState(() {
                info = json.decode(value);
              })
            });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  List<Widget> _getListData() {
    List<Widget> list = [];
    for (var i = 0; i < 4; i++) {
      list.add(Row(
        children: [
          Container(
            // color: Colors.redAccent.withOpacity(0.3),
            padding: const EdgeInsets.only(bottom: 10),
            width: (MediaQuery.of(context).size.width - 90) / 2,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(
                    info[i]["img"],
                  ),
                  scale: 0.1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(5, 5),
                    color: Colors.grey.withOpacity(0.1)),
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(-5, -5),
                    color: Colors.grey.withOpacity(0.1))
              ],
            ),
            child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  info[i]['title'],
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  "Your Video",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                const Text(
                  "Details",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width, //取得裝置數據寬
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.indigo.withOpacity(0.8),
                    Colors.indigoAccent.withOpacity(0.7),
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(5, 10),
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next workout",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Legs Toning",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "and Glutes Workout",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.indigo,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/bg.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: Colors.grey.withOpacity(0.3)),
                          BoxShadow(
                              //top shadow
                              blurRadius: 40,
                              offset: Offset(-1, -5),
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                  ),
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 200, bottom: 100),
                      decoration: BoxDecoration(
                        // color: Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/people.png"),
                          // fit: BoxFit.fill
                        ),
                      )),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    // color: Colors.redAccent.withOpacity(0.3),
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      children: [
                        const Text(
                          "You are doning great",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                                text: "Keep it up\n",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                children: [
                                  TextSpan(text: "stick to your plan")
                                ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of fouces",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
                    maxWidth: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: _getListData(),
                    )))
          ],
        ),
      ),
    );
  }
}
