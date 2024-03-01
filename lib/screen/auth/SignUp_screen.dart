import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxapp/widgets/custom_button.dart';
import 'package:maxapp/widgets/custom_input_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // Corrected import statement

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key); // Corrected syntax for key

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  void signUp() async { // Corrected to make signUp method asynchronous
    setState(() {
      isLoading = true;
    });

    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString());
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: CircularProgressIndicator(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputText(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter email";
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
                      return "enter password";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Password",
                  labelText: "Enter password",
                ),
                SizedBox(height: 100),
                CustomButton(
                    color: Colors.amber.shade900,
                    text: "SignUp",
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        signUp();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
