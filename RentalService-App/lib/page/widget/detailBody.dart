import 'package:untitled7/utils/colors.dart';
import 'package:untitled7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/page/widget/storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detailDoctorCard.dart';
import 'doctorInfo.dart';
import 'doctorLocation.dart';

class DetailBody extends StatelessWidget {
  final String name;
  final String number;
  final String address;

  const DetailBody({
    Key? key,required this.name, required this.number, required this.address
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Container(
      padding: const EdgeInsets.all(20),

      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailDoctorCard(name:name),
          const SizedBox(
            height: 15,
          ),

        Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: new FlatButton(
                    onPressed: () => launch("tel://"+number),
                    child: new Icon(Icons.call,
                        color: Colors.blue[500], size: 50),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    "전화하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: new FlatButton(
                    onPressed: () => launch("https://map.kakao.com/"),
                    child: new Icon(Icons.place,
                        color: Colors.blue[500], size: 50),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    "지도 검색",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
          Text(
            "전화번호 : " + number,
            style: TextStyle(
              color: Color(MyColors.purple01),
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
         Text(
            address,
            style: TextStyle(
              color: Color(MyColors.purple01),
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),

          DoctorInfo(number:number),

          const SizedBox(
            height: 5,
          ),

          Center(
            child: Text(
              '매장 가격 사진',
              style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold )

            ),
          ),

          const SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: storage.downloadURL(number, 1),
              builder:  (BuildContext context,
                  AsyncSnapshot<String> snapshot){
                if(snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData){
                  return Container(
                    height: 250,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting || snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return Container();
              }
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}