class UnboardingContent{
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents=[
  UnboardingContent(description: 'Pick your food from our menu\n       More than 35 times',
      image:"assets/images/screen.jpeg" ,
      title:'Select from our Best Menu' ),
  UnboardingContent(description:"You can pay cash on delivery and\n     Card payment is available",
      image:"assets/images/screen2.jpeg" ,
      title:"Easy and Safe online payment"),
  UnboardingContent(description: "Deliver your food at your\n        Doorsteps",
      image: "assets/images/screen3.jpeg",
      title: "Quick and Safe delivery")
];
