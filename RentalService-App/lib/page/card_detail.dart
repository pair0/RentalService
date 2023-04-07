import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled7/utils/colors.dart';
import 'package:untitled7/page/widget/detailBody.dart';
import 'package:untitled7/page/widget/storage_service.dart';

class Card_Detail extends StatefulWidget {
  final String name;
  final String number;
  final String address;

  const Card_Detail({
    Key? key,required this.name, required this.number, required this.address
  }) : super(key: key);

  @override
  _Card_Detail createState() => _Card_Detail();
}

class _Card_Detail extends State<Card_Detail> {

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text('매장 상세정보'),
              backgroundColor: Colors.grey,
              expandedHeight: 200,
              flexibleSpace: FutureBuilder(
                  future: storage.downloadURL(widget.number, 0),
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
              )
            ),
            SliverToBoxAdapter(
              child: DetailBody(name: widget.name, number: widget.number, address: widget.address),
            )
          ],
        ),
      );
  }
}


