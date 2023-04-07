import 'package:untitled7/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/page/cloud_firestore.dart';

class SearchInputButton extends StatelessWidget {

  SearchInputButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CloudFirestoreSearch()

                  ),

                );
              },
              child: Row(
                children: [
                  Text(
                    '매장/지역으로 검색하세요',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(MyColors.purple01),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
