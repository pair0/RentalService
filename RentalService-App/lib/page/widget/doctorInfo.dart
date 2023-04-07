import 'package:flutter/material.dart';
import 'numberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorInfo extends StatelessWidget {
  final String number;
  const DoctorInfo({
    Key? key, required this.number
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                    .collection("USER_allow")
                    .where("store_number", isEqualTo: number)
                    .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("loading"),
                    ),
                  );
                }
                else {
                  return Container(
                      child: (snapshot.connectionState ==
                          ConnectionState.waiting)
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot? data = snapshot.data!.docs[index];
                          return Container(
                            padding: EdgeInsets.only(top: 15,
                                left: 15,
                                right: 15),
                            child: Row(
                              children: [
                                NumberCard(
                                  label: '4시간 이용료',
                                  value: "의류 : " + data['price_info.p_info1'] +
                                      "\n장비 : " + data['price_info.p_info2'] +
                                      "\n모두 : " + data['price_info.p_info3'],
                                ),
                                SizedBox(width: 15),
                                NumberCard(
                                  label: '8시간 이용료',
                                  value: "의류 : " + data['price_info.p_info4'] +
                                      "\n장비 : " + data['price_info.p_info5'] +
                                      "\n모두 : " + data['price_info.p_info6'],
                                ),
                              ],
                            ),


                          );
                        },
                      )
                  );
                }
              }
          ),
        ),


      ],
    );
  }
}