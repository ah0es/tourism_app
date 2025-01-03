import 'package:flutter/material.dart';
import 'package:tourism_app/core/component/buttons/custom_text_button.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/features/authentication/signup/widgets/user_register_data.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          UserRegisterData(),
          Positioned(
            bottom: 10,
            child: CustomTextButton(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              borderRadius: 12,
              child: Text('Sign Up', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
