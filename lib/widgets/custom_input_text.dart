import 'package:flutter/material.dart';
import 'package:maxapp/screen/theme/app_colors.dart';
class InputText extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;


  final Widget? suffixIcon;
  const InputText({super.key,  this.controller, required this.hintText,   required this.labelText, this.suffixIcon, this.keyboardType, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText.toString(),style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),),
          SizedBox(height: 5,),
          TextFormField(

            keyboardType: keyboardType,
            validator: validator,


            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16

            ),
            controller: controller ,
            decoration: InputDecoration(

              contentPadding: EdgeInsets.all(12),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              fillColor: AppColors.yellow,
              suffixIcon: suffixIcon ,
              filled: true,
              border:  OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),

            ),




          ),

        ],
      ),
    );
  }
}
