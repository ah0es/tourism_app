import 'package:flutter/material.dart';
import 'package:tourism_app/core/component/buttons/custom_text_button.dart';
import 'package:tourism_app/core/component/custom_text_form_field.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/core/utils/navigate.dart';
import 'package:tourism_app/features/authentication/forgot_password/presentation/forget_password_view.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, spreadRadius: 2)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Center(child: Text('Login Account', style: Theme.of(context).textTheme.headlineMedium)),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            labelStringText: 'Email',
            outPadding: EdgeInsets.zero,
            controller: TextEditingController(),
            hintText: 'Enter your Email',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            labelStringText: 'Password',
            outPadding: EdgeInsets.zero,
            controller: TextEditingController(),
            password: true,
            hintText: 'Enter your password',
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                context.navigateToPage(ForgetPasswordView());
              },
              child: Text('Forget Password?', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primaryColor))),
          SizedBox(
            height: 20,
          ),
          CustomTextButton(
            borderRadius: 12,
            child: Text('Login', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
            onPress: () {},
          ),
          Spacer()
        ],
      ),
    );
  }
}
