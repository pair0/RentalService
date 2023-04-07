import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/tabs/tab/mypageTab.dart';
import 'find_password.dart';
import 'signup.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;
  final Stream<QuerySnapshot> users =
  FirebaseFirestore.instance.collection('users').snapshots();

  String userEmail = '';
  String userPassword = '';
  bool _isObscure = true;

  Future<UserCredential> signInWithKaKao() async {
    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': "710b65d3335de348a5a0b9795fec4ada",
      'response_mode': 'form_post',
      'redirect_uri':
      'https://fir-daffy-approval.glitch.me/callbacks/kakao/sign_in',
      // 'scope': 'account_email profile',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;

    // print(body["code"]);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': "710b65d3335de348a5a0b9795fec4ada",
      'redirect_uri':
      'https://fir-daffy-approval.glitch.me/callbacks/kakao/sign_in',
      'code': body["code"],
    });

    var responseTokens = await http.post(Uri.parse(tokenUrl.toString()));

    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        Uri.parse("https://fir-daffy-approval.glitch.me/callbacks/kakao/token"),
        body: {"accessToken": bodys['access_token']});

    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // 그림자
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text("로그인"),
          ),
          body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            color: Colors.blueGrey,
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    hintText: "이메일 주소 입력",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF263238),
                                        fontWeight: FontWeight.w600),
                                    errorStyle:
                                    TextStyle(fontWeight: FontWeight.w600),
                                    fillColor: Color(0xFF546E7A),
                                    filled: true,
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) return '이메일을 입력해주세요';
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      hintText: "비밀번호 입력",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF263238),
                                          fontWeight: FontWeight.w600),
                                      errorStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      fillColor: Color(0xFF546E7A),
                                      filled: true,
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey,
                                          ))),
                                  validator: (value) {
                                    if (value!.isEmpty) return '비밀번호를 입력해주세요';
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final newUser = await _authentication
                                    .signInWithEmailAndPassword(
                                  email: userEmail,
                                  password: userPassword,
                                );
                                if (newUser.user != null) {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return MypageTab();
                                    }),
                                  );
                                }
                              } catch (e) {
                                print(e);
                                print(userEmail);
                                print(userPassword);
                                print('?');
                              }
                            }
                          },
                          color: Color(0xFF263238),
                          child: Text('로그인',
                              style:
                              TextStyle(color: Colors.white, fontSize: 16)),
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                "회원가입",
                                style: TextStyle(
                                    color: Color(0xFF263238),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '            |            ',
                              style: TextStyle(
                                  color: Color(0xFF263238),
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FindPassword()));
                                },
                                child: Text(
                                  "비밀번호 재설정",
                                  style: TextStyle(
                                      color: Color(0xFF263238),
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        divider(),
                        SizedBox(
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: (){Navigator.pop(context);
                                      signInWithKaKao();},
                            child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.yellow),
                            child: Row(
                            children: [
                            Expanded(
                            flex: 1,
                            child: Container(
                            alignment: Alignment.centerRight,
                            child: ImageIcon(
                            AssetImage('assets/kakao.png'))),
                            ),
                            Expanded(
                            flex: 7,
                            child: Container(
                            alignment: Alignment.center,
                            child: Text('카카오톡으로 로그인',
                            style: TextStyle(

                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  getDocs() async {
                    bool _check = true;
                    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
                    for (int i = 0; i < querySnapshot.docs.length; i++) {
                      if(querySnapshot.docs[i]['email'] == FirebaseAuth.instance.currentUser!.email) {
                        _check = false;
                        break;
                      }
                    }
                    if(_check){
                      CollectionReference users = FirebaseFirestore.instance.collection('users');
                      users.add({'name': "${FirebaseAuth.instance.currentUser!.displayName}", 'email': "${FirebaseAuth.instance.currentUser!.email}"});
                    }
                  }
                  getDocs();
                  Navigator.pop(context);
                  return MypageTab();
                }
              }
          )
      ),
    );
  }
}

divider() {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              thickness: 1,
              color: Colors.white60,
            ),
          ),
        ),
        Text(' 또는 다른 서비스 계정으로 로그인 ',
            style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              thickness: 1,
              color: Colors.white60,
            ),
          ),
        ),
      ],
    ),
  );
}