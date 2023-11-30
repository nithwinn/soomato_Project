

import 'package:flutter/material.dart';
import 'package:soomato/widgets/widget_support.dart';
class Saladtile extends StatelessWidget {
  final String imageurl;
  final String title;
  final String subtitle;
  final double price;
  final Function ontap;
  const Saladtile({super.key,
    required this.imageurl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(5),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(onTap:ontap(),
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage(image: AssetImage("assets/images/salad.jpeg"),fit: BoxFit.cover,),
                  ),
                ),
                // Image.asset("assets/images/salad.jpeg",height: 150,width: 150,fit: BoxFit.cover,),
                Text(title,
                  style: AppWidget.boldTextFeildStyle(),),
                Text(subtitle,
                  style: AppWidget.LightTextFeildStyle(),),
                SizedBox(height: 5.0,),
                Text("₹${price.toString()}",style: AppWidget.BoldTextFeildStyle(),)
              ],),
          ),
        ),
      ),
    );
  }
}
