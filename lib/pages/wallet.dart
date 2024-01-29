import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:soomato/widgets/app_constant.dart';
import '../widgets/widget_support.dart';
import 'package:http/http.dart' as http;



class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  Map<String, dynamic>?paymentIntent;
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
                  color: Color(0xFF008080),borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: Text("Add money",style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: "Poppins",fontWeight: FontWeight.bold),
              ),),
            )
          ],
        ),
      ),
    );
  }

     Future<void>makePayment(String amount)async{
    try{
      paymentIntent=await createPaymentIntent(amount,'INR');
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Adnan'
      )).then((value){});

    displayPaymentSheet(amount);
    }catch(e,s){
      print('exception: $e$s');
       }
    }
    displayPaymentSheet(String amount)async{
try {
  await Stripe.instance.presentPaymentSheet().then((value) async {
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          content: Column(children: [
            Row(children: [
              Icon(Icons.check_circle, color: Colors.green,),
              Text("Payment Sucessfull")
            ],)
          ],),
        ));
    paymentIntent = null;
  }).onError((error, stackTrace) {
    print('Error is :--->$error $stackTrace');
  });
}on StripeException catch(e){
  print('Error is : --->$e');
  showDialog(context: context, builder: (_)=> const AlertDialog(
    content: Text("Cancelled"),
  ));
}catch(e){
  print('$e');
}
    }
    createPaymentIntent(String amount,String currency)async{
    try{
      Map<String,dynamic> body= {
        'amount': calculateAmount(amount),
        'currency':currency,
        'payment_method_type[]':'card',
      };

      var response= await http.post(
        Uri.parse('http://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':'Bearer $secretKey',
          'Content-Type':'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print('Payment Intent Body->>>${response.body.toString()}');
      return jsonDecode(response.body);

    }catch(err){
      print('err charging user:${err.toString()}');
    }
    }
    calculateAmount(String amount){
    final calculateAmount=(int.parse(amount)*100);

    return calculateAmount.toString();
    }
  }