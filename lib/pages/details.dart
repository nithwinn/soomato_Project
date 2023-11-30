import 'package:flutter/material.dart';
import 'package:soomato/widgets/widget_support.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
        margin: EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           GestureDetector(
             onTap:(){
               Navigator.pop(context);
             },
               child: Icon(Icons.arrow_back,color: Colors.black,)),
            Image.asset(
              "assets/images/salad.jpeg",
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/3,
              fit: BoxFit.fill,),
            SizedBox(height: 15.0,),

            Row(
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Mediterrance ",
                      style: AppWidget.extFeildStyle()
                  ),
                  Text(
                      " Chickpea Salad ",
                      style: AppWidget.BoldTextFeildStyle()
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  if(a>1) {
                    --a;
                  }
                  setState(() {

                  });
                },
                child: Container(
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child:
                  Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
                SizedBox(
                  width: 20.0,),
                Text(a.toString(),
                  style: AppWidget.boldTextFeildStyle(),
                ),
                SizedBox(
                  width: 20.0,),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child:
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
            ),
            SizedBox(height: 5.0,),
            Text("It consists of whole cooked chickpeas, lemon juice, garlic, tahini, salt, olive oil, and cumin. Chickpea salad has been eaten in the Levant since at least the time or the Amorite kings, with Zimri-Lim being known in particular for lavish banquets at which the dish was one of the delicacies.",
              style: AppWidget.FeildStyle(),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Text("Delivery Time",
                  style: AppWidget.boldTextFeildStyle(),
                ),
                Icon(Icons.alarm,color: Colors.black,)
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Total Price",style: AppWidget.boldTextFeildStyle(),),
                  Text("\$28",style: AppWidget.extFeildStyle(),),
                ],

                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Text("Add to cart",style: TextStyle(color: Colors.white),),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.shopping_cart,color: Colors.white),
                      )
                    ],
                  ),
                )
              ],),
            ),
          ],
        ),
      )),
    );
  }
}
