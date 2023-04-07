import 'package:untitled7/tabs/widget/signin.dart';
import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  const BackToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("회원가입 성공",),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: null,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){return SignIn();}));
          },
          icon: Icon(Icons.arrow_back, size: 20, color: Colors.white,),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          minWidth: double.maxFinite,
          height: 50,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){return SignIn();}));
          },
          color:  Color(0xFF263238),
          child: Text("로그인 하러 가기", style: TextStyle(color: Colors.white, fontSize: 16,)),
        ),
      ),
    );
  }
}
