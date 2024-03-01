import 'package:flutter/material.dart';
import 'package:maxapp/screen/auth/SignUp_screen.dart';
import 'package:maxapp/screen/auth/login_screen.dart';
import 'package:maxapp/screen/home_screen/home_screen.dart';
import 'package:maxapp/screen/splash_screen/splash_services.dart';
import 'package:maxapp/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _textController;
  Splashservices splashservices=Splashservices();

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateHome();
    splashservices.isLogin(context);
  }


  void _initAnimations() {
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _textController.forward();
  }
  _navigateHome() async {
    print('Waiting for 3 seconds...');
    await Future.delayed(const Duration(milliseconds: 5000), () {
      print('Navigating to login screen...');
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splash),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(

                    scale: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                      height: 150,
                      width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(12),


                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("IBM",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Colors.white
                            ),),

                            Text("Calculater",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white
                            ),),
                          ],
                        ),
                      ),

                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(12),


                          ),
                          child: Center(
                            child: Text("Wheather",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              SlideTransition(
                position: Tween<Offset>(

                  begin: const Offset(-1, 0),
                  end: const Offset(0, 1),
                ).animate(_textController),
                child:  Center(
                  child: Text(
                    'Welcome To MaxApp ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}