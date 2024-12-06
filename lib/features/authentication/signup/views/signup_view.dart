import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/responsive_text.dart';
import 'package:tourism_app/features/authentication/login/views/login_view.dart';
import 'package:tourism_app/features/authentication/widgets/custom_button.dart';
import 'package:tourism_app/features/authentication/widgets/custom_text.dart';
import 'package:tourism_app/features/authentication/widgets/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignupView> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
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
                      text: 'Sign Up',
                      color: const Color(0xff25161A),
                      fontSize: getResponsiveFontSize(context, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing),
                // Name Field
                Row(
                  children: [
                    CustomText(
                      text: 'Name',
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      color: const Color(0xff25161A),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing),
                CustomTextfield(
                  hintText: 'User Name',
                  controller: nameController,
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
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff9B9496),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: verticalSpacing * 2),
                // Sign Up Button
                CustomButton(
                  text: 'Sign up',
                  backgroundColor: const Color(0xff46A0DB),
                  color: Colors.white,
                  height: buttonHeight,
                  onPressed: () {
                    print('Sign up pressed');
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
                    GestureDetector(
                      onTap: () {
                        print("Google Login tapped");
                        // Add Google login logic here
                      },
                      child: Image.asset(
                        'assets/images/google-icon-logo-svgrepo-com 1.png', // Path to your Google icon
                        height: screenHeight * 0.08, // You can adjust the size
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Facebook Login tapped");
                        // Add Facebook login logic here
                      },
                      child: Image.asset(
                        'assets/images/facebook-3-logo-svgrepo-com 1.png', // Path to your Facebook icon
                        height:
                            screenHeight * 0.08, // Adjust the size as needed
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpacing * 2),
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Already have an account? ',
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      color: const Color(0xff000000),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginView()));
                      },
                      child: CustomText(
                        text: 'Log In',
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
