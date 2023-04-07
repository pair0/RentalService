import 'package:untitled7/tabs/widget/scheduleCard.dart';
import 'package:untitled7/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/tabs/tab/scheduleTab.dart' as schedule;
import 'package:url_launcher/url_launcher.dart';

class SkiResort extends StatelessWidget {
  final void Function() onPressedScheduleCard;
  const SkiResort({Key? key, required this.onPressedScheduleCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    launch("https://www.high1.com/ski/index.do");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/하이원.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 하이원  ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.sonohotelsresorts.com/daemyung.vp.skiworld.index.ds/dmparse.dm");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/비발디.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 비발디  ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("http://www.konjiamresort.co.kr/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/곤지암.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 곤지암  ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.bearstown.com");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/베어스타운.png'),
                          radius: 30.0,
                        ),
                        Text(
                          "베어스타운 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.wellihillipark.com/sub3/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/웰리힐리.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 웰리힐리 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.jisanresort.co.kr/index.asp");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/지산포레스트.png'),
                          radius: 30.0,
                        ),
                        Text(
                          "지산포레스트",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("http://phoenixhnr.co.kr/pyeongchang/index");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/휘닉스.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 휘닉스  ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                )
              ]
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    launch("https://www.alpensia.com/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/알펜시아.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 알펜시아 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.pineresort.com/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/양지파인.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 양지파인 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("http://elysian.co.kr/gangchon/ski/ski_Introduction.asp");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/엘리시안.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 엘리시안 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.oakvalley.co.kr/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/오크밸리.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 오크밸리 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("http://www.edenvalley.co.kr/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/에덴밸리.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 에덴밸리 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("https://www.o2resort.com/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/오투스키.png'),
                          radius: 30.0,
                        ),
                        Text(
                          " 오투스키 ",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    launch("http://www.mdysresort.com/");
                  },
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/무주덕유산.png'),
                          radius: 30.0,
                        ),
                        Text(
                          "무주 덕유산",
                          style: TextStyle(fontSize:12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ]
                  ),
                )
              ]
          )
        ]
    );
  }
}