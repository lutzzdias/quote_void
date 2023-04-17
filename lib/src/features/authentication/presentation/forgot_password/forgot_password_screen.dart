import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/features/authentication/presentation/forgot_password/forgot_password_controller.dart';
import 'package:quote_void/src/widgets/custom_outlined_button.dart';
import 'package:quote_void/src/widgets/default_snack_bar.dart';
import 'package:quote_void/src/widgets/responsive_center.dart';
import 'package:quote_void/src/widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String _email = '';

  Future<void> _submit() async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      final result = await ref
          .read(forgotPasswordControllerProvider.notifier)
          .resetPassword(email: _email);
      if (mounted) {
        !result.hasError
            ? DefaultSnackBar.show(
                context: context,
                title: 'Email sent',
                icon: Icons.email_outlined,
                body: 'Check your email',
              )
            : DefaultSnackBar.show(
                context: context,
                title: 'Error',
                icon: Icons.email_outlined,
                body: result.asError!.error.toString(),
              );
        if (!result.hasError) context.goNamed(AppRoute.signIn.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveCenter(
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
              Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email address or username',
                  ),
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  onChanged: (value) => _email = value,
                  validator: (emailOrUsername) {
                    // TODO: Improve validation messages
                    // TODO: Check for special characters
                    // TODO: Email validation with Regex or package (?)
                    if (emailOrUsername == null || emailOrUsername.isEmpty) {
                      return 'Can\'t be empty';
                    } else if (emailOrUsername.length < 2) {
                      return 'Too short';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              gapH32,
              CustomOutlinedButton(
                title: 'Send link',
                isLoading:
                    ref.watch(forgotPasswordControllerProvider).isLoading,
                onPressed: () => _submit(),
              ),
              gapH64,
              TextWithLink(
                text: 'Return to ',
                linkText: 'Sign in',
                onTap: () => context.goNamed(AppRoute.signIn.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
