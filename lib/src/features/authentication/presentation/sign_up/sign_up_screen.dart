import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          const Spacer(
            flex: 10,
          ),
          const Expanded(
            flex: 35,
            child: CircleAvatar(
              backgroundColor: AppColors.black,
              child: Icon(
                Icons.image,
                color: AppColors.white,
                size: Sizes.p48,
              ),
            ),
          ),
          const Spacer(flex: 10),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          gapH16,
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Username',
            ),
          ),
          gapH16,
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email address',
            ),
          ),
          gapH16,
          const TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              // TODO: Change icon depending on wehther obscureText is true or false
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
          ),
          const Spacer(flex: 15),
          CustomOutlinedButton(
            title: 'Sign up',
            // TODO: implement signUp logic
            onPressed: () => debugPrint('Click on sign up'),
          ),
          const Spacer(flex: 15),
          TextWithLink(
            text: 'Already have an account? ',
            linkText: 'Sign in',
            onTap: () => context.goNamed(AppRoute.signIn.name),
          ),
          const Spacer(flex: 5)
        ],
      ),
    );
  }
}
