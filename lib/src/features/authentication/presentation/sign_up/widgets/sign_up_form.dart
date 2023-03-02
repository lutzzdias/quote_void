import 'package:flutter/material.dart';
import 'package:quote_void/src/common_widgets/password_field.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';
import 'package:quote_void/src/features/authentication/presentation/widgets/auth_button.dart';

// TODO: Convert from stateful widget to riverpod solution
class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.onSubmit,
  });

  final ValueChanged<Map<String, String>> onSubmit;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  Map<String, String> _values = {
    'name': '',
    'username': '',
    'email': '',
    'password': '',
    'imageUrl':
        'https://images.vexels.com/media/users/3/129616/isolated/preview/fb517f8913bd99cd48ef00facb4a67c0-businessman-avatar-silhouette-by-vexels.png',
  };

  Future<void> _submit() async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_values);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 75,
            child: GestureDetector(
              onTap: () => debugPrint('Click on avatar placeholder'),
              child: const CircleAvatar(
                backgroundColor: AppColors.black,
                child: Icon(
                  Icons.person_rounded,
                  color: AppColors.white,
                  size: Sizes.p48,
                ),
              ),
            ),
          ),
          Spacer(flex: 25),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _values['name'] = value,
            validator: (name) {
              // TODO: Improve validation messages
              // TODO: Check for special characters
              if (name == null || name.isEmpty) {
                return 'Can\'t be empty';
              } else if (name.length < 2) {
                return 'Too short';
              } else {
                return null;
              }
            },
          ),
          gapH16,
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _values['username'] = value,
            validator: (username) {
              // TODO: Improve validation messages
              // TODO: Check for special characters
              if (username == null || username.isEmpty) {
                return 'Can\'t be empty';
              } else if (username.length < 2) {
                return 'Too short';
              } else {
                return null;
              }
            },
          ),
          gapH16,
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email address',
            ),
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _values['email'] = value,
            validator: (email) {
              // TODO: Improve validation messages
              // TODO: Check for special characters
              // TODO: Email validation with Regex or package
              if (email == null || email.isEmpty) {
                return 'Can\'t be empty';
              } else if (!email.contains('@')) {
                return 'Invalid email';
              } else {
                return null;
              }
            },
          ),
          gapH16,
          PasswordField(
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _values['password'] = value,
            validator: (password) {
              // TODO: Improve validation messages
              // TODO: Check for special characters
              if (password == null || password.isEmpty) {
                return 'Can\'t be empty';
              } else if (password.length < 6) {
                return 'Too short';
              } else {
                return null;
              }
            },
          ),
          // TODO: Create logic to have button in the screen, not on this widget
          const Spacer(flex: 13),
          AuthButton(
            title: 'Sign up',
            onPressed: () => _submit(),
            provider: signUpControllerProvider,
          ),
        ],
      ),
    );
  }
}
