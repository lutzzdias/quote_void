import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/widgets/custom_outlined_button.dart';
import 'package:quote_void/src/widgets/responsive_center.dart';
import 'package:quote_void/src/widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveCenter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const Text(
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
            gapH32,
            CustomOutlinedButton(
              title: 'Send link',
              isLoading: false,
              // TODO: implement send recover link logic
              onPressed: () => debugPrint('Click on send link'),
            ),
            gapH12,
            TextWithLink(
              text: 'Return to ',
              linkText: 'Sign in',
              onTap: () => context.goNamed(AppRoute.signIn.name),
            ),
          ],
        ),
      ),
    );
  }
}
