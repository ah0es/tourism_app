import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/responsive_text.dart';
import 'package:tourism_app/features/authentication/login/login_view.dart';
import 'package:tourism_app/features/authentication/signup/views/signup_view.dart';
import 'package:tourism_app/features/authentication/widgets/custom_button.dart';
import 'package:tourism_app/core/component/custom_text.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {

    // Screen width and height
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Padding and spacing based on screen width
    final horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final buttonHeight = screenHeight * 0.08; // 8% of screen height
    final verticalSpacing = screenHeight * 0.02; // 2% of screen height

    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: 'Login or Create an account',
              color: const Color(0xff46A0DB),
              fontSize: getResponsiveFontSize(context, fontSize: 20), // Responsive font size
            ),
            SizedBox(height: verticalSpacing),
            CustomText(
              text: 'Login or create an account to receive',
              fontSize: getResponsiveFontSize(context, fontSize: 16),
            ),
            CustomText(
              text: 'rewards and save your details for a',
              fontSize: getResponsiveFontSize(context, fontSize: 16),
            ),
            CustomText(
              text: 'faster checkout experience',
              fontSize: getResponsiveFontSize(context, fontSize: 16),
            ),
            SizedBox(height: verticalSpacing * 2.5), // Adjust spacing dynamically
            CustomButton(
              text: 'Create an account',
              backgroundColor: const Color(0xff46A0DB),
              color: const Color(0xffffffff),
              height: buttonHeight,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupView()));
                print('Create an account pressed');
              },
            ),
            SizedBox(height: verticalSpacing),
            CustomButton(
              text: 'Log in',
              height: buttonHeight, 
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginView()));
                print('Login pressed');
              },
            ),
            SizedBox(height: verticalSpacing * 2.5),
            Center(
              child: GestureDetector(
                onTap: () {
                  print("Guest tapped");
                },
                child: Text(
                  "Guest",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontSize: getResponsiveFontSize(context, fontSize: 17),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
