
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxapp/screen/bmi/input_screen.dart';
import 'package:maxapp/screen/wheather/screens/loading_screen.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../wheather/screens/location_screen.dart';
import 'components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController=PageController();
  final List<String> pageImages=[
    "assets/22.jpg",
    "assets/33.jpg",
    "assets/66.png",

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 543,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: pageImages.length,
                  controller: pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 393,


                      decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage(pageImages[index]),
                            fit: BoxFit.cover,
                          )
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SmoothPageIndicator(

                                axisDirection: Axis.horizontal,

                                controller: pageController,
                                count:  pageImages.length,
                                effect:  WormEffect(
                                  activeDotColor: Colors.blue,
                                  dotHeight: 14,
                                  dotWidth: 14,
                                  dotColor: Colors.grey,
                                ),
                                onDotClicked: (index){

                                }
                            ),
                          )
                        ],
                      ),
                    );
                  },

                )
            ),
            SizedBox(
              height: 20,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween
                ,
                children: [
                InkWell(
                  onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>InputScreen()));
                  },
                    child: IconBox(text1: "IBM",text2: "Calculator",)),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoadingScreen()));
                    },
                      child: IconBox(text1: "Wheather",text2: "Find",))
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
