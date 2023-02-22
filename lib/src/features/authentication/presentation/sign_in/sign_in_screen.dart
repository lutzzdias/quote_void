import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_icon_button.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/password_field.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fix screen slight resize on keyboard appearance
    // TODO: Add custom icons for the buttons
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 15,
          ),
          SizedBox(
            height: 132,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          gapH12,
          const Text(
            'Quote Void',
            textAlign: TextAlign.center,
            style: AppTextStyle.title,
          ),
          const Spacer(
            flex: 25,
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email address or username',
            ),
          ),
          gapH16,
          const PasswordField(),
          gapH12,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.pushNamed(AppRoute.forgotPassword.name),
              child: const Text(
                'Forgot password?',
                style: AppTextStyle.link,
              ),
            ),
          ),
          const Spacer(
            flex: 20,
          ),
          CustomOutlinedButton(
            title: 'Sign in',
            // TODO: Implement signIn logic
            onPressed: () => debugPrint('Click on sign in'),
          ),
          gapH12,
          const Text(
            'Or',
            style: AppTextStyle.bodyTranslucent,
            textAlign: TextAlign.center,
          ),
          gapH12,
          CustomOutlinedIconButton(
            title: 'Google',
            icon: Icons.android,
            // TODO: implement google login logic
            onPressed: () => debugPrint('Click on google'),
          ),
          gapH16,
          CustomOutlinedIconButton(
            title: 'Apple ID',
            icon: Icons.apple,
            // TODO: implement apple id login logic
            onPressed: () => debugPrint('Click on apple ID'),
          ),
          const Spacer(
            flex: 35,
          ),
          TextWithLink(
            text: 'Don\'t have an account? ',
            linkText: 'Sign up',
            onTap: () => context.goNamed(AppRoute.signUp.name),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
