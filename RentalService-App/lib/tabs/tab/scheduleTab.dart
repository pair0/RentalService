import 'dart:async';

import 'package:http/http.dart';
import 'package:untitled7/utils/colors.dart';
import 'package:untitled7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/tabs/widget/searchInput_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled7/page/card_detail.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled7/utils/colors.dart';


class ScheduleTab extends StatefulWidget {

  final String store_id;
  final String lat;
  final String long;


  const ScheduleTab({
    Key? key,required this.store_id, required this.lat, required this.long
  }) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> with AutomaticKeepAliveClientMixin {

  WebViewController? _controller;
  bool clicked = false;
  List list=["name", "name", "name", "name"];

  void getlocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    Position position =
        await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        print(position.latitude);
        print(position.longitude * -1);
    if (_controller != null) {
      _controller!.runJavascriptReturningResult(
      'window.gotolocation("${position.latitude},${position.longitude}")');
    }
  }
  void gotolocation(latitude, longitude) async{
    print(latitude);
    print(longitude);
    if (_controller != null) {
      _controller!.runJavascriptReturningResult(
          'window.gotolocation("${latitude},${longitude}")');
    }
  }

  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            WebView(//웹뷰 및 통신
              initialUrl: 'https://cstone-3dc2f.web.app/',
              //initialUrl: 'http://192.168.35.231:3000/',
              javascriptMode: JavascriptMode.unrestricted,

              onWebViewCreated: (WebViewController webviewController) {
                _controller = webviewController;

                Timer(Duration(milliseconds: 500), () {
                  if (_controller != null) {
                    _controller!.runJavascriptReturningResult(
                        'window.fromFlutter("${widget.store_id},${widget.lat},${widget.long}")');
                  }
                });
              },
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: 'jams',
                    onMessageReceived: (JavascriptMessage result) {
                      setState(() {
                        if(result.message=="false"|| result.message==null){
                          clicked = false;
                        }
                        else {
                          clicked = true;
                          list = result.message.split(",");
                        }
                      });
                    })
              ]),
            ),
            Positioned(// 검색 버튼
              top: 30,
              child: Container(
                child: SearchInputButton(),
                width: 350,
                height: 50,
              ),
            ),Positioned(// 검색 버튼
              bottom: 10,
              left: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( primary: Color(MyColors.bg)),
                onPressed: () {
                  getlocation();
                },
                child: Icon(Icons.my_location, color: Colors.grey)
                //Text("현위치", style: TextStyle(color : Color(MyColors.purple01),)),
              )
            ),
            Positioned(// 검색 버튼
                bottom: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom( primary: Color(MyColors.bg)),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.grey[300],
                          child:  Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[

                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('비발디'),
                                        onPressed: () {
                                          gotolocation(37.649157, 127.686948);
                                        }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('하이원'),
                                          onPressed: () {
                                            gotolocation(37.208466, 128.829591);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text(
                                          '용평',
                                        ),
                                          onPressed: () {
                                            gotolocation(37.639984, 128.677333);
                                          }
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('곤지암'),
                                          onPressed: () {
                                            gotolocation(37.335944, 127.294889);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('휘닉스'),
                                          onPressed: () {
                                            gotolocation(37.581409, 128.325604);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('지산'),
                                          onPressed: () {
                                            gotolocation(37.218373, 127.342751);
                                          }
                                      )
                                    ],
                                  ),Row(
                                    mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('베어스'),
                                          onPressed: () {
                                            gotolocation(37.797075, 127.248787);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('오크밸리'),
                                          onPressed: () {
                                            gotolocation(37.403965, 127.809803);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('무주'),
                                          onPressed: () {
                                            gotolocation(35.891650, 127.740974);
                                          }
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('엘리시안'),
                                          onPressed: () {
                                            gotolocation(37.823482, 127.588563);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('웰리힐리'),
                                          onPressed: () {
                                            gotolocation(37.490399, 128.249271);
                                          }
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Color(MyColors.purple02),
                                        ),
                                        child: const Text('에덴벨리'),
                                          onPressed: () {
                                            gotolocation(37.823482, 127.588563);
                                          }
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            ),
                        );
                      },
                    );
                  },
                  child: Text("스키장 목록", style: TextStyle(color : Color(MyColors.purple01),)),
                )
            ),
            Visibility( //마커 클릭시 카드 생성
              visible: clicked,
              child:Positioned(
                bottom: 10,
                child: Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Card_Detail(name:list[0], number: list[2],address: list[1])
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4.0,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                              crossAxisAlignment : CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(list[0],
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(list[1],
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,)),

                                SizedBox(
                                  height: 10,
                                ),
                                Text(list[2],
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,)),
                                SizedBox(
                                  height: 20,
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ),
                  width: 350,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
