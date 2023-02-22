import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: Sizes.p64,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Spacer(),
          Row(
            children: const [
              Icon(
                Icons.lock,
                size: Sizes.p32,
              ),
              gapW8,
              Text(
                'Forgot password?',
                style: AppTextStyle.title,
              )
            ],
          ),
          gapH32,
          Text(
            'Please enter your email address, so we can send you a link to reset your password.',
            style: AppTextStyle.body,
          ),
          gapH24,
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email address',
            ),
          ),
          gapH64,
          SizedBox(
            height: Sizes.p48,
            child: OutlinedButton(
              // TODO: Implement send recover password link logic
              onPressed: () {},
              style: AppButtons.outlinedButtonStyle,
              child: const Text(
                'Send link',
                style: AppTextStyle.titleSmall,
              ),
            ),
          ),
          gapH32,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Return to ',
                style: AppTextStyle.body,
              ),
              GestureDetector(
                onTap: () => context.goNamed(AppRoute.signIn.name),
                child: const Text(
                  'Sign in',
                  style: AppTextStyle.linkBold,
                ),
              ),
            ],
          ),
          // Fix alignment due to logo size on top
          gapH64,
          Spacer(),
        ],
      ),
    );
  }
}
