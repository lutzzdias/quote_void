import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fix screen slight resize on keyboard appearance
    // TODO: Modularize this screen
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 15,
          ),
          AspectRatio(
            aspectRatio: 3,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
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
          const TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
          ),
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
          SizedBox(
            height: Sizes.p48,
            child: OutlinedButton(
              onPressed: () {},
              style: AppButtons.outlinedButtonStyle,
              child: const Text(
                'Sign In',
                style: AppTextStyle.titleSmall,
              ),
            ),
          ),
          gapH12,
          const Text(
            'Or',
            style: AppTextStyle.bodyTranslucent,
            textAlign: TextAlign.center,
          ),
          gapH12,
          SizedBox(
            height: Sizes.p48,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text(
                'Google',
                style: AppTextStyle.subtitle,
              ),
              style: AppButtons.whiteOutlinedButtonStyle,
            ),
          ),
          gapH16,
          SizedBox(
            height: Sizes.p48,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text(
                'Apple ID',
                style: AppTextStyle.subtitle,
              ),
              style: AppButtons.whiteOutlinedButtonStyle,
            ),
          ),
          const Spacer(
            flex: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account? ',
                style: AppTextStyle.body,
              ),
              GestureDetector(
                onTap: () => context.goNamed(AppRoute.signUp.name),
                child: const Text(
                  'Sign up',
                  style: AppTextStyle.linkBold,
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
