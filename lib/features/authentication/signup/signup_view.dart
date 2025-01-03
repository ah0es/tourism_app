import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
              onPress: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Enter the OTP code',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 24),
                        PinCodeTextField(
                          appContext: context,
                          length: 4,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 60,
                            fieldWidth: 60,
                            activeColor: AppColors.primaryColor,
                            inactiveColor: AppColors.primaryColor.withOpacity(0.5),
                            selectedColor: AppColors.primaryColor,
                            activeFillColor: Colors.transparent,
                            selectedFillColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          //  controller: otpController,
                          onCompleted: (otp) {
                            // setState(() {
                            //   currentOtp = otp;
                            // });
                          },
                          onChanged: (value) {
                            // setState(() {
                            //   currentOtp = value;
                            // });
                          },
                        ),
                        SizedBox(height: 40),
                        CustomTextButton(
                          borderRadius: 12,
                          child: Text(
                            'Verify',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                          ),
                          onPress: () {
                            Navigator.pop(context);
                            // context.navigateToPage(HomeView());
                          },
                        ),
                      ],
                    ),
                  ),
                );
                // context.navigateToPage(OtpView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
