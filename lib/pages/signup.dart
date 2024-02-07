import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../service/database.dart';
import '../service/shared_pref.dart';
import '../widgets/widget_support.dart';
import 'bottomnav.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String email="",password="", name="";

  TextEditingController namecontroller=new TextEditingController();

  TextEditingController passwordcontroller=new TextEditingController();

  TextEditingController mailcontroller=new TextEditingController();

  final _formkey=GlobalKey<FormState>();

  registration()async{
    if(password!=null){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Registered Succesfully",
              style: TextStyle(fontSize: 20.0),
            )));
        String Id= randomAlphaNumeric(10);
        Map<String, dynamic>addUserInfo={
          "Name":namecontroller.text,
          "Email":mailcontroller.text,
          "Wallet":"0",
          "Id": Id,
        };
        await DatabaseMethods().addUserDetails(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(namecontroller.text);
        await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
        await SharedPreferenceHelper().saveUserWallet("0");
        await SharedPreferenceHelper().saveUserId(Id);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      }on FirebaseException catch(e){
        if(e.code=='weak password you bleady'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text("Password provided is too weak",style: TextStyle(fontSize:18.0 ),)));

        }
        else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Account already exisits",
              style: TextStyle(fontSize: 10.0),),));
        }
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
              height: MediaQuery.of(context).size.height/2.5 ,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[
                        Colors.redAccent,
                        Colors.redAccent,
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
              margin: EdgeInsets.only(top: 40.0,left: 32.0,right: 20.0),
              child: Column(
                children: [
                  // Center(child: Image.asset("assets/images/logo.png",width: MediaQuery.of(context).size.width/2.8,fit: BoxFit.cover,)),
                  SizedBox(height: 120.0,),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.7,
                      decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(height: 30.0,),
                            Text("SignUp",
                              style: AppWidget.boldTextFeildStyle(),
                            ),
                            TextFormField(
                              controller: namecontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return'Please enter Name' ;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: AppWidget.BoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.person_outlined)),
                            ),
                            SizedBox(height: 30.0,
                            ),
                            TextFormField(
                              controller: mailcontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return'Please enter E-mail' ;
                                }
                                return null;
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppWidget.BoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(height: 30.0,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return'Please enter Password' ;
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: AppWidget.BoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.password_outlined)),
                            ),
                            SizedBox(height: 50.0,),
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
                            //         "SIGNUP",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 18.0,
                            //             fontFamily: 'Poppins1',
                            //             fontWeight: FontWeight.bold),
                            //       )),
                            // ),
                            GestureDetector(
                              onTap: ()async{
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    email=mailcontroller.text;
                                    name=namecontroller.text;
                                    password=passwordcontroller.text;
                                  });
                                }
                                registration();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFe74b1a),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Center(
                                      child: Text("SIGN UP",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins1',
                                            fontWeight: FontWeight.bold),)),
                                ),
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