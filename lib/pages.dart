import 'package:flutter/material.dart';
import 'package:soomato/fruitsalad.dart';
import 'package:soomato/pages/details.dart';
import 'package:soomato/widgets/widget_support.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 20.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello,",
                  style: AppWidget.boldTextFeildStyle()
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.shopping_cart,color: Colors.white,),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("Delicious Food",
                style: AppWidget.HeadlineTextFeildStyle()
            ),
            Text("Discover Great Foods",
                style: AppWidget.LightTextFeildStyle()),
            SizedBox(height:10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/icee.jpeg",height: 60, width: 70,fit: BoxFit.cover,),
                ),
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/pizzaa.jpeg",height: 60, width: 70,fit: BoxFit.cover,),
                ),
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/Hamburger.jpeg",height: 60, width: 70,fit: BoxFit.cover,),
                ),
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/saladss.jpeg",height: 60, width: 70,fit: BoxFit.cover,),
                ),
              ),
            ],),
            SizedBox(height: 20.0,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                        Saladtile(imageurl: "assets/images/salad.jpeg", title: "Fruit salad", subtitle: "Fresh and healthy", price: 25, ontap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details(),));
                        },),
                          SizedBox(width: 10,height: 10,),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/salad.jpeg",height: 150,width: 150,fit: BoxFit.cover,),
                                  Text("Mix veg Salads",
                                    style: AppWidget.boldTextFeildStyle(),),
                                  Text("Fresh & Healthy",
                                    style: AppWidget.LightTextFeildStyle(),),
                                  SizedBox(height: 5.0,),
                                  Text("\$25",style: AppWidget.BoldTextFeildStyle(),)
                                ],),
                            ),
                          ),
                          SizedBox(width: 10,height: 10,),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/salad.jpeg",height: 150,width: 150,fit: BoxFit.cover,),
                                  Text("Veg Salads",
                                    style: AppWidget.boldTextFeildStyle(),),
                                  Text("Fresh & Healthy",
                                    style: AppWidget.LightTextFeildStyle(),),
                                  SizedBox(height: 5.0,),
                                  Text("\$25",style: AppWidget.BoldTextFeildStyle(),)
                                ],),
                            ),
                          ),
                      ],

                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                // Image.asset(
                                //   "assets/images/salad.jpeg",
                                //   height: 100,
                                //   width: 100,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                  height:100,
                                  width:100,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.greenAccent,image: DecorationImage(image: AssetImage("assets/images/salad.jpeg",),fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 10.0,),
                                Column(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Mediterrance Chickpea Salad with extra veggies",style: AppWidget.extFeildStyle() ,)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Honey goot cheese",style: AppWidget.LightTextFeildStyle() ,)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("\$28",style: AppWidget.BoldTextFeildStyle(),)),
                                  ],)
                              ],)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Image.asset(
                                  "assets/images/salad.jpeg",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10.0,),
                                Column(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Mediterrance Chickpea Salad with extra veggies",style: AppWidget.extFeildStyle() ,)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Honey goot cheese",style: AppWidget.LightTextFeildStyle() ,)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("\$28",style: AppWidget.BoldTextFeildStyle(),)),
                                  ],)
                              ],)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Image.asset(
                                  "assets/images/salad.jpeg",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10.0,),
                                Column(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Mediterrance Chickpea Salad with extra veggies",style: AppWidget.extFeildStyle() ,)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Honey goot cheese",style: AppWidget.LightTextFeildStyle() ,)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("\$28",style: AppWidget.BoldTextFeildStyle(),)),
                                  ],)
                              ],)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
