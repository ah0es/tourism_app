import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/responsive_text.dart';
import 'package:tourism_app/features/authentication/widgets/custom_button.dart';
import 'package:tourism_app/features/authentication/widgets/custom_text.dart';
import 'package:tourism_app/features/authentication/widgets/custom_textfield.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPasswordView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    // Password visibility state
    bool _isPasswordVisible = false;

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
                text: 'Create Password',
                color: const Color(0xff25161A),
                fontSize: getResponsiveFontSize(context,
                    fontSize: 24), // Responsive font size
              ),
              SizedBox(height: verticalSpacing),
              CustomText(
                text: 'Create your new Password to Login',
                fontSize: getResponsiveFontSize(context, fontSize: 16),
              ),
              SizedBox(height: verticalSpacing * 2),

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

              Row(
                children: [
                  CustomText(
                    text: 'Confirm Password',
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
              // Reset Password Button
              CustomButton(
                text: 'Submit',
                backgroundColor: const Color(0xff46A0DB),
                color: Colors.white,
                height: buttonHeight,
                onPressed: () {
                  print('Submited');
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
