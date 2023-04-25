import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/widgets/image_form_field.dart';
import 'package:quote_void/src/widgets/password_field.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';
import 'package:quote_void/src/features/authentication/presentation/widgets/auth_button.dart';
import 'package:uuid/uuid.dart';

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
  File? _profilePic;

  final Map<String, String> _values = {
    'name': '',
    'username': '',
    'email': '',
    'password': '',
    'imageUrl': '',
  };

  Future<void> _submit() async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      // TODO: Move this logic to a more appropriate place
      TaskSnapshot task = await FirebaseStorage.instance
          .ref()
          .child('profile-pics')
          .child(_values['username']!)
          .child(const Uuid().v4())
          .putFile(_profilePic!);
      final url = await task.ref.getDownloadURL();
      _values['imageUrl'] = url;
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
          ImageFormField(
            // TODO: Move validation to appropriate place in the architecture
            validator: (file) {
              if (file == null) return 'Profile picture cannot be empty.';
              return null;
            },
            onChanged: (file) {
              _profilePic = file;
              _formKey.currentState?.validate();
            },
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

            /// Remove consecutive spaces and leave only one space in its place
            onChanged: (value) =>
                _values['name'] = value.replaceAll(RegExp(r'\s+'), ' '),
            // TODO: Move validation to appropriate place in the architecture
            validator: (name) {
              if (name == null || name.isEmpty) {
                return 'Name cannot be empty.';
              } else if (name.length < 2) {
                return 'Name must be at least 2 characters long.';
              } else if (name.length > 50) {
                return 'Name cannot exceed 50 characters.';
              } else if (!RegExp(r'^[A-Za-z\sÀ-ÖØ-öø-ÿ]*$').hasMatch(name)) {
                return 'Name cannot contain numbers or special characters.';
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
              // TODO: Move validation to appropriate place in the architecture
              if (username == null || username.isEmpty) {
                return 'Username cannot be empty.';
              } else if (username.length < 3) {
                return 'Username must be at least 3 characters long.';
              } else if (username.length > 20) {
                return 'Username cannot exceed 20 characters.';
              } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
                return 'Username can only contain letters, numbers and underscores.';
              } else if (RegExp(r'^[\d_]').hasMatch(username)) {
                return 'Username must start with a letter.';
              } else if (RegExp(r'_{2,}').hasMatch(username)) {
                return 'Username cannot contain consecutive underscores.';
              }
              // TODO: Check if username already exists
              // ignore: dead_code
              else if (false) {
                return 'Username already exists.';
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
            // TODO: Move validation to appropriate place in the architecture
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Email address cannot be empty.';
              } else if (email.length < 4) {
                return 'Email address must be at least 4 characters long.';
              } else if (!email.contains('@')) {
                return 'Email address must contain an \'@\' symbol.';
              } else if (RegExp(r'[^a-zA-Z0-9@.]').hasMatch(email)) {
                return 'Invalid characters in email address.';
              } else if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(email)) {
                return 'Invalid email address format.';
              }
              // TODO: Check if email already exists
              // ignore: dead_code
              else if (false) {
                return 'The email address is already in use.';
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
              // TODO: Move validation to appropriate place in the architecture
              if (password == null || password.isEmpty) {
                return 'Password cannot be empty.';
              } else if (password.length < 8) {
                return 'Password must be at least 8 characters long.';
              } else if (password.length > 50) {
                return 'Password cannot exceed 50 characters.';
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
