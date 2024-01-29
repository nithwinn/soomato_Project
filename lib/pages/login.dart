import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soomato/pages.dart';
import 'package:soomato/pages/details.dart';
import 'package:soomato/pages/profile.dart';
import 'package:soomato/pages/signup.dart';
import 'package:soomato/widgets/widget_support.dart';

import 'bottomnav.dart';
import 'forgetpassword.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email="",password="";

  final _formkey=GlobalKey<FormState>();

  TextEditingController useremailcontroller= new TextEditingController();
  TextEditingController userpasswordcontroller= new TextEditingController();

  userLogin()async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
    if(e.code=="user not found"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No user found for that email",
        style: TextStyle(fontSize: 18.0,color: Colors.black),
      )));
    }else if(e.code=='Wrong Password'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong password Provided by user",
        style: TextStyle(fontSize: 18.0,color: Colors.black),
      )));
    }
  }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.redAccent,
                    Colors.redAccent,
                  ])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0,left: 32.0,right: 20.0),
              child: Column(
                children: [
                  // Center(
                  //     child: Image.asset(
                  //   "assets/images/logo.png",
                  //   width: MediaQuery.of(context).size.width / 2.8,
                  //   fit: BoxFit.cover,
                  // )),
                  SizedBox(
                    height: 120.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 1.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "LogIn",
                              style: AppWidget.boldTextFeildStyle(),
                            ),
                            TextFormField(
                              controller: useremailcontroller,
                              validator: (value){
                               if(value==null||value.isEmpty){
                                 return 'Please enter email';
                               }
                               return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppWidget.BoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: userpasswordcontroller,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: AppWidget.BoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.password_outlined)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>forgetpassword()));
                              },
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forget Password?",
                                    style: AppWidget.FeildStyle(),
                                  ),
                              ),
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            GestureDetector(
                              onTap: (){
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    email=useremailcontroller.text;
                                    password=userpasswordcontroller.text;
                                  });
                                }
                                userLogin() ;
                              },
                              child: Material(
                                elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(color: Color(0xFFe74b1a),borderRadius: BorderRadius.circular(20.0)),
                                  child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins1',
                                            fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 200,
                            //   height: 50,
                            //   child: ElevatedButton(
                            //       style: ButtonStyle(
                            //         backgroundColor: MaterialStatePropertyAll(
                            //           Colors.redAccent,
                            //         ),
                            //       ),
                            //       onPressed: () {
                            //         Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (context) => BottomNav(),
                            //         ));
                            //       },
                            //       child: Text(
                            //         "LOGIN",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 18.0,
                            //             fontFamily: 'Poppins1',
                            //             fontWeight: FontWeight.bold),
                            //       )),
                            // ),
                            SizedBox(
                              height: 15.0,
                            ),
                            // GestureDetector(
                            //   onTap: (){
                            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                            //   },
                            //     child: Text("Dont have an account? SignUp",style: AppWidget.FeildStyle(),))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont have an account",
                                  style: AppWidget.FeildStyle(),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                    child: Text(
                                      "SignUp",
                                      style: AppWidget.FeildStyle(),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
