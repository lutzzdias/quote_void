import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/colored_safe_area.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredSafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p20,
              vertical: Sizes.p12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 75,
                ),
                gapH12,
                const Text(
                  'Quote Void',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title,
                ),
                gapH32,
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
                gapH24,
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: AppTextStyle.titleSmall,
                  ),
                ),
                gapH12,
                const Text(
                  'Or',
                  style: AppTextStyle.bodyTranslucent,
                  textAlign: TextAlign.center,
                ),
                gapH12,
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                  label: const Text('Google'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                  label: const Text('Apple ID'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                gapH32,
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
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
