import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxapp/screen/auth/SignUp_screen.dart';
import 'package:maxapp/screen/home_screen/home_screen.dart';
import 'package:maxapp/widgets/custom_button.dart';
import 'package:maxapp/widgets/custom_input_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // Import ModalProgressHUD

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD( // Wrap your widget tree with ModalProgressHUD
        inAsyncCall: isLoading,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputText(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Email",
                  labelText: "Enter email",
                ),
                SizedBox(height: 30),
                InputText(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Password",
                  labelText: "Enter password",
                ),
                SizedBox(height: 100),
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Transform.scale(
                      scale: value,
                      child: CustomButton(
                        color: Colors.amber.shade900,
                        text: "Login",
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            login();
                          }
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Transform.scale(
                      scale: value,
                      child: CustomButton(
                        color: Colors.blue,
                        text: "Register",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SingUpScreen()),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
