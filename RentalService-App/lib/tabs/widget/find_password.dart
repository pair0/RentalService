import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FindPassword extends StatelessWidget {
  FindPassword({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;

  String userEmail = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // 그림자
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: 20, color: Colors.white,),
          ),
          centerTitle: true,
          title: Text("비밀번호 재설정", style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Form(
                key: _formKey,
                child: Container(
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white,),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSaved: (value){
                          userEmail = value!;
                        },
                        onChanged: (value){
                          userEmail = value;
                        },

                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFC1A09))),
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFC1A09))),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintText: "abcdef@example.com",
                          hintStyle: TextStyle(color: Color(0xFF263238), fontWeight: FontWeight.w500),
                          helperText: '이메일을 입력해 주세요.',
                          helperMaxLines: 2,
                          helperStyle: TextStyle(color: Color(0xFF263238), fontWeight: FontWeight.w600),
                          errorStyle: TextStyle(fontWeight: FontWeight.w600),
                          fillColor: Color(0xFF546E7A),
                          filled: true,
                          border: InputBorder.none,
                        ),
                        validator: (value){
                          if(value!.isEmpty) return '이메일을 입력해주세요';
                          else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)){
                            return ("잘못된 이메일 형식입니다.");
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    try{
                      await _authentication.sendPasswordResetEmail(email: userEmail);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('이메일이 발송되었습니다.'),
                          )
                      );
                    }catch(e){
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('가입하신 이메일을 확인해주세요.'),
                          )
                      );
                    }
                  }
                },

                color:  Color(0xFF263238),
                child: Text('비밀번호 찾기',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                textColor: Colors.white,
              ),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
