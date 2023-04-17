import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/utils/image_helper.dart';
import 'package:quote_void/src/widgets/password_field.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';
import 'package:quote_void/src/features/authentication/presentation/widgets/auth_button.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({
    super.key,
    required this.onSubmit,
  });

  final ValueChanged<Map<String, String>> onSubmit;

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  File? profilePic;

  final Map<String, String> _values = {
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

  Future<void> pickImage() async {
    final imageHelper = ref.watch(imageHelperProvider);
    final file = await imageHelper.pickImage();
    if (file != null) {
      final croppedFile = await imageHelper.cropImage(file: file);
      if (croppedFile != null) {
        setState(() => profilePic = File(croppedFile.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => pickImage(),
            child: Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: Sizes.p80,
                  backgroundColor: AppColors.black,
                  backgroundImage: profilePic != null
                      ? FileImage(File(profilePic!.path))
                      : const AssetImage(
                              'assets/images/default-profile-pic.png')
                          as ImageProvider,
                ),
              ),
            ),
          ),
          gapH32,
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
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
          gapH32,
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
