import 'package:flutter/material.dart';
import 'package:quote_void/src/common_widgets/password_field.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required TextEditingController nameController,
    required TextEditingController usernameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _usernameController = usernameController,
        _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _nameController;
  final TextEditingController _usernameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
          TextField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          gapH16,
          TextField(
            controller: _usernameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
          ),
          gapH16,
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email address',
            ),
          ),
          gapH16,
          PasswordField(
            passwordController: _passwordController,
          ),
        ],
      ),
    );
  }
}
