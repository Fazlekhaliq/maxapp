import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ResultScreen extends StatefulWidget {
  final String text;
  final String result;
  final String details;

  const ResultScreen({Key? key, required this.text, required this.result, required this.details}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Your Results",
            style: TextStyle(
              color: whiteColor,
              fontSize: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 450 * _animation.value,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: inActiveCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            widget.details,
                            style: TextStyle(
                              color: Colors.red.shade500,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            widget.result,
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 80,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.text,
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/result12.png"),
                            ),
                          )
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
