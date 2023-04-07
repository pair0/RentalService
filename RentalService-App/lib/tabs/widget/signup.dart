import 'package:untitled7/tabs/widget/back_to_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;

  String userEmail = '';
  String userPassword = '';
  bool _isObscure = true;

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
          title: Text("회원가입", style: TextStyle(color: Colors.white),),
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
                          helperText: '로그인, 비밀번호 찾기에 사용되니 정확한 이메일을 입력해 주세요.',
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
                      TextFormField(
                        style: TextStyle(color: Colors.white,),
                        onSaved: (value){
                          userPassword = value!;
                        },
                        onChanged: (value){
                          userPassword = value;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFC1A09))),
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFC1A09))),
                            hintText: "비밀번호 설정",
                            hintStyle: TextStyle(color: Color(0xFF263238), fontWeight: FontWeight.w600),
                            errorStyle: TextStyle(fontWeight: FontWeight.w600),
                            errorMaxLines: 2,
                            helperText: '비밀번호는 8~20자 이내로 영문 대소문자, 숫자, 특수문자 중 3가지 이상 혼용하여 입력해 주세요.',
                            helperMaxLines: 2,
                            helperStyle: TextStyle(color: Color(0xFF263238), fontWeight: FontWeight.w600),
                            fillColor: Color(0xFF546E7A),
                            filled: true,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: (){ setState(() { _isObscure = !_isObscure; }); },
                                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey,)
                            )
                        ),
                        validator: (value){
                          // 최소 8 자 및 최대 20 자, 하나 이상의 대소문자, 숫자, 특수 문자
                          RegExp regex = new RegExp(r'''^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$''');
                          if(value!.isEmpty) return '비밀번호를 입력해주세요';
                          else if(!regex.hasMatch(value)){
                            return '특수문자, 대소문자, 숫자 포함 8자 이상 20자 이내로 입력하세요.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 30),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async{ // 다음 과정이 진행되어야 하므로
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    try{
                      final newUser = await _authentication.createUserWithEmailAndPassword(
                          email: userEmail, password: userPassword);
                      if(newUser.user != null){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return BackToLogin();
                          }),
                        );
                      }
                    }catch(e){
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('Please check your email and password'),
                          )
                      );
                    }
                  }
                },
                color:  Color(0xFF263238),
                child: Text('회원가입',
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



