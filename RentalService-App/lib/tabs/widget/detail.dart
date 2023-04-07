import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String content;

  const Detail({Key? key, required this.content}) : super(key: key);

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로축 가운데 정렬
            children: [
              Text(content, style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
      )
    );
  }
}
