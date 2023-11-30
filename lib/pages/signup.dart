import 'package:flutter/material.dart';

import '../widgets/widget_support.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5 ,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[
                        Color(0xffec4824),Color(0xFFe74b1a),
                      ])),
            ),
            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))
              ),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/logo.png",width: MediaQuery.of(context).size.width/2.8,fit: BoxFit.cover,)),
                  SizedBox(height: 50.0,),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0),
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/1.7,
                      decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0,),
                          Text("SignUp",
                            style: AppWidget.boldTextFeildStyle(),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: AppWidget.BoldTextFeildStyle(),
                                prefixIcon: Icon(Icons.person_outlined)),
                          ),
                          SizedBox(height: 30.0,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: AppWidget.BoldTextFeildStyle(),
                                prefixIcon: Icon(Icons.email_outlined)),
                          ),
                          SizedBox(height: 30.0,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppWidget.BoldTextFeildStyle(),
                                prefixIcon: Icon(Icons.password_outlined)),
                          ),
                          SizedBox(height: 50.0,),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: 200,
                              decoration: BoxDecoration(color: Color(0xFFe74b1a),borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize: 18.0,fontFamily: 'Poppins1',fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          SizedBox(height: 15.0,),
                          // GestureDetector(
                          //   onTap: (){
                          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                          //   },
                          //     child: Text("Already have an account? Log In",style: AppWidget.FeildStyle(),))
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",style: AppWidget.FeildStyle(),),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                              }, child: Text("LogIn",style: AppWidget.FeildStyle(),))
                            ],
                          )
                        ],
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

