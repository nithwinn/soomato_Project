import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {

  TextEditingController mailcontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70.0,),
            Container(
              alignment: Alignment.topCenter,
              child: Text("Password Recoverey",
                style:
                TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(height: 10.0,),
            Text(
              "Enter Your mail",
              style:
              TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),),
            Expanded(child: Form(child: Padding(padding: EdgeInsets.only(left: 10.0),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70,width: 2.0),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextFormField(
                      controller: mailcontroller,
                      validator: (value){
                        if(value==null|| value.isEmpty){
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.person,color: Colors.white70,
                            size: 30.0,
                          ),border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    margin:EdgeInsets.only(left: 60.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Send Email",style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )))
          ],
        ),
      ),
    );
  }
}