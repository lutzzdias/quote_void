import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          // TODO: Create password field widget
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
              onTap: () => debugPrint('clicked on forgot password'),
              child: Text(
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
                onTap: () => debugPrint('clicked on sign up'),
                child: const Text(
                  'Sign up',
                  style: AppTextStyle.linkBold,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
