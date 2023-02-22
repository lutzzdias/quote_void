import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
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
          const Spacer(),
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
          gapH64,
          CustomOutlinedButton(
            title: 'Send link',
            // TODO: implement send recover link logic
            onPressed: () => debugPrint('Click on send link'),
          ),
          gapH32,
          TextWithLink(
            text: 'Return to ',
            linkText: 'Sign in',
            onTap: () => context.goNamed(AppRoute.signIn.name),
          ),
          // Space to fix alignment due to logo size on top
          gapH64,
          const Spacer(),
        ],
      ),
    );
  }
}
