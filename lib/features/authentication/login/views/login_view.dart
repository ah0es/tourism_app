import 'package:flutter/material.dart';
import 'package:tourism_app/core/themes/colors.dart';

import 'package:tourism_app/core/utils/responsive_text.dart';
import 'package:tourism_app/features/Profile/presentation/widgets/profile_body.dart';
import 'package:tourism_app/features/authentication/forgot_password/views/forgot_password.dart';
import 'package:tourism_app/features/authentication/signup/views/signup_view.dart';
import 'package:tourism_app/features/authentication/widgets/custom_button.dart';
import 'package:tourism_app/core/component/custom_text.dart';
import 'package:tourism_app/features/authentication/widgets/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<LoginView> {
  // Controllers for text fields

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Password visibility state
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Screen width and height
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Padding and spacing based on screen width
    final horizontalPadding = screenWidth * 0.04;
    final verticalSpacing = screenHeight * 0.02;
    final buttonHeight = screenHeight * 0.08;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFDFDFD),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Log In',
                      color: const Color(0xff25161A),
                      fontSize: getResponsiveFontSize(context, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing),
                // Email Field
                Row(
                  children: [
                    CustomText(
                      text: 'Email',
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      color: const Color(0xff25161A),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing),
                CustomTextfield(
                  hintText: 'Email@.com',
                  controller: emailController,
                ),
                SizedBox(height: verticalSpacing),
                // Password Field
                Row(
                  children: [
                    CustomText(
                      text: 'Password',
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      color: const Color(0xff25161A),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing),
                
                CustomTextfield(
                  hintText: 'Password',
                  obscureText: !_isPasswordVisible,
                  controller: passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xff9B9496),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordView()));
                      },
                      child: CustomText(
                        text: 'Forgot Password?',
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing * 2),
                // Sign Up Button
                CustomButton(
                  text: 'Log In',
                  backgroundColor: AppColors.babyblue,
                  color: Colors.white,
                  height: buttonHeight,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileBody()),
                    );
                  },
                ),
                SizedBox(height: verticalSpacing * 2),
                // Divider with 'Or' Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: const Color(0xff9B9496),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomText(
                        text: 'Or',
                        fontSize: getResponsiveFontSize(context, fontSize: 20),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff25161A),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: const Color(0xff9B9496),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing * 1.5),
                // Social Media Login Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/google-icon-logo-svgrepo-com 1.png'),
                    Image.asset('assets/images/facebook-3-logo-svgrepo-com 1.png'),
                  ],
                ),
                SizedBox(height: verticalSpacing * 2),
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account? ",
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      color: const Color(0xff000000),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupView()));
                      },
                      child: CustomText(
                        text: 'Sign Up',
                        fontSize: getResponsiveFontSize(context, fontSize: 16),
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
