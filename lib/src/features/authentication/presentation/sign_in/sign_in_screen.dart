import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_safe_area.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSafeArea(
      builder: (context, size) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p20,
                  vertical: Sizes.p12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(
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
                    Spacer(
                      flex: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Email address or username',
                      ),
                    ),
                    gapH16,
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    gapH12,
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password',
                        style: AppTextStyle.link,
                      ),
                    ),
                    Spacer(
                      flex: 15,
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
                        style: AppButtons.outlinedButtonStyle,
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
                        style: AppButtons.outlinedButtonStyle,
                      ),
                    ),
                    Spacer(
                      flex: 35,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Don\'t have an account? ',
                        style: AppTextStyle.body,
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: AppTextStyle.linkBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
