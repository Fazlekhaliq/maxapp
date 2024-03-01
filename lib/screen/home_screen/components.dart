
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class IconBox extends StatelessWidget {

  final String text1;
  final String? text2;

  const IconBox({super.key, required this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
          Text(text1,style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Colors.white
          ),),

          Text(text2.toString(),style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white
          ),),
        ],
      ),
    );
  }
}
