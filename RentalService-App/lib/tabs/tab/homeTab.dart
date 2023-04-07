import 'package:untitled7/tabs/widget/appointmentCard.dart';
import 'package:untitled7/tabs/widget/advertise.dart';
import 'package:untitled7/tabs/widget/ski_resort.dart';
import 'package:untitled7/tabs/widget/searchInput_button.dart';
import 'package:url_launcher/url_launcher.dart'; // 패키지

import 'package:untitled7/tabs/widget/userIntro.dart';
import 'package:untitled7/utils/colors.dart';
import 'package:untitled7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widget/detail.dart';

class HomeTab extends StatelessWidget {
  final void Function() onPressedScheduleCard;
  final Stream<QuerySnapshot> announcement =
      FirebaseFirestore.instance.collection('announcement').snapshots();

  HomeTab({
    Key? key,
    required this.onPressedScheduleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: const UserIntro(),
                width: 1.7976931348623157e+308,
                height: 30.0,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: AppointmentCard(onTap: onPressedScheduleCard),
                width: 1.7976931348623157e+308,
                height: 140.0,
              ),
              const ListTile(
                leading: ImageIcon(AssetImage('assets/skiing.png')),
                title: Text(
                  "전국 스키",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child:
                      SkiResort(onPressedScheduleCard: onPressedScheduleCard)),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color(0xFFe9e7e7),
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 1.7976931348623157e+308,
                height: 7.0,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Advertise(),
                width: 1.7976931348623157e+308,
                height: 160.0,
              ),
              const ListTile(
                title: Text(
                  "최근 이용 매장",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text(
                  "공지사항",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ]),
      ),
    );
  }
}
