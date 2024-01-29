import 'package:flutter/material.dart';

import '../widgets/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(child: Text("Wallet",style: AppWidget.HeadlineTextFeildStyle(),)))),
            SizedBox(height: 30.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Image.asset("assets/images/wallet.jpeg",height: 100,width: 100,fit: BoxFit.cover,
                  ),
                  SizedBox(height: 40,width: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your wallet",style: AppWidget.Style(),),
                      SizedBox(height: 5.0,),
                      Text("\$"+"100",style: AppWidget.BoldStyle(),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Add money",style: AppWidget.BoldStyle(),),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("\$"+"100",style: AppWidget.BoldTextFeildStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("\$"+"500",style: AppWidget.BoldTextFeildStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("\$"+"1000",style: AppWidget.BoldTextFeildStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("\$"+"2000",style: AppWidget.BoldTextFeildStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 12.0,),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.green,borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: Text("Add money",style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: "Poppins",fontWeight: FontWeight.bold),
              ),),
            )
          ],
        ),
      ),
    );
  }
}