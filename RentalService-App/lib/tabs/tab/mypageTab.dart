import 'package:untitled7/utils/colors.dart';
import 'package:untitled7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled7/tabs/widget/signin.dart';
import 'package:untitled7/tabs/widget/announcment.dart';


class MypageTab extends StatefulWidget {
  const MypageTab({Key? key}) : super(key: key);

  @override
  State<MypageTab> createState() => _MypageTabState();
}

class _MypageTabState extends State<MypageTab> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      if(!snapshot.hasData)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return SignIn();
                            })
                        );
                      }
                    },
                    child: Container(
                      color: Colors.white,
                      height: 95,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(25),
                                child: Image.asset("assets/user.png"),
                              )
                          ),

                          !snapshot.hasData ?
                          Expanded(
                              flex: 8,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text("로그인 또는 회원가입 >", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                    Text("회원가입하고 편하게 이용하세요 !", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12),),
                                  ],
                                ),
                              )
                          ) :

                          Expanded(
                              flex: 8,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text("${snapshot.data.displayName}" + "님 환영합니다", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),

                  _heading("스키/보드 정보"),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.newspaper),
                          title: Text("스키-보드 컨텐츠 / 뉴스", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        ListTile(
                          leading: ImageIcon(AssetImage('assets/skiing.png')),
                          title: Text("스키장 정보", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18,),

                  _heading("관심 매장"),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.timer),
                          title: Text("최근 본 매장", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        ListTile(
                          leading: Icon(Icons.favorite),
                          title: Text("즐겨 찾는 매장", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18,),

                  _heading("이벤트"),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.person_add),
                          title: Text("친구 초대하기", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        ListTile(
                          leading: ImageIcon(AssetImage('assets/coupon.png')),
                          title: Text("쿠폰북", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18,),

                  _heading("고객센터 및 설정"),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return Anncmnt();
                                })
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.announcement),
                            title: Text("공지사항", style: TextStyle(fontWeight: FontWeight.w600),),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.question_answer),
                          title: Text("자주 묻는 질문", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        ListTile(
                          leading: Icon(Icons.support_agent),
                          title: Text("1:1 문의하기", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text("알림 내역 및 설정", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ),

                  snapshot.hasData ? MaterialButton(
                    color: Colors.grey,
                    minWidth: double.maxFinite,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text("로그아웃", style: TextStyle(fontWeight: FontWeight.w600,),),
                  ) : SizedBox(height: 0,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _heading(String heading){
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }


  Widget _footerContent(String text){
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          width: MediaQuery.of(context).size.width,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}

