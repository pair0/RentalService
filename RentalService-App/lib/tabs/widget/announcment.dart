import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class Anncmnt extends StatefulWidget {
  const Anncmnt({Key? key}) : super(key: key);

  @override
  _AnncmntState createState() => _AnncmntState();
}

class _AnncmntState extends State<Anncmnt> {
  final Stream<QuerySnapshot> announcement =
  FirebaseFirestore.instance.collection('announcement').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // elevation: 0, // 그림자
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text("공지사항", style: TextStyle(color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5,),
              Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: announcement,
                  builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                      // if(snapshot.hasError){
                      //   return Text('Something went wrong');
                      // }
                      // if(snapshot.connectionState == ConnectionState.waiting) {
                      //   return Text('Loading');
                      // }
                      final data = snapshot.requireData;
                      return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              GestureDetector(
                                child: ListTile(
                                  title: Text("${data.docs[index]['title']}", style: TextStyle(fontWeight: FontWeight.w600),),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Detail(content : data.docs[index]['content']);
                                    }),
                                  );
                                },
                              ),
                              Divider()
                            ],
                          );
                        }
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
