import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/responsive_text.dart';
import 'package:tourism_app/features/authentication/create_new_passwrd/views/create_new_password_view.dart';
import 'package:tourism_app/features/authentication/widgets/custom_button.dart';
import 'package:tourism_app/features/authentication/widgets/custom_text.dart';
import 'package:tourism_app/features/authentication/widgets/custom_textfield.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    // Screen width and height for responsive design
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Padding and spacing based on screen width and height
    final horizontalPadding = screenWidth * 0.04;
    final verticalSpacing = screenHeight * 0.02;
    final buttonHeight = screenHeight * 0.08;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFDFDFD),
        appBar: AppBar(
          backgroundColor: const Color(0xffFDFDFD),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              // Title
              CustomText(
                text: 'Forgot Password',
                color: const Color(0xff25161A),
                fontSize: getResponsiveFontSize(context,
                    fontSize: 24), // Responsive font size
              ),
              SizedBox(height: verticalSpacing),
              CustomText(
                text: 'Please enter your email account to ',
                fontSize: getResponsiveFontSize(context, fontSize: 16),
              ),
              CustomText(
                text: 'reset your password',
                fontSize: getResponsiveFontSize(context, fontSize: 16),
              ),
              SizedBox(height: verticalSpacing * 2),

              // Email Field Label
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

              // Email Textfield
              CustomTextfield(
                hintText: 'Email@.com',
                controller: emailController,
              ),
              SizedBox(height: verticalSpacing * 2),

              // Reset Password Button
              CustomButton(
                text: 'Reset Password',
                backgroundColor: const Color(0xff46A0DB),
                color: Colors.white,
                height: buttonHeight,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateNewPasswordView()));

                  print('Reset Password');
                },
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
