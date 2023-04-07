import 'package:untitled7/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
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
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '매장/지역으로 검색하세요',
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
              cursorColor: Colors.indigoAccent,
            ),
          ),
        ],
      ),
    );
  }
}
