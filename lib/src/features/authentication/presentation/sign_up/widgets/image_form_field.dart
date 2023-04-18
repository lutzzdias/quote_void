import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/utils/image_helper.dart';

class ImageFormField extends ConsumerStatefulWidget {
  const ImageFormField({
    super.key,
    required this.validator,
    required this.onChanged,
  });

  final String? Function(File?) validator;
  final Function(File) onChanged;

  @override
  ConsumerState<ImageFormField> createState() => _ImageFormFieldState();
}

class _ImageFormFieldState extends ConsumerState<ImageFormField> {
  File? _pickedFile;

  Future<void> pickImage(final ref, final formFieldState) async {
    final ImageHelper imageHelper = ref.watch(imageHelperProvider);
    final XFile? file = await imageHelper.pickImage();
    if (file != null) {
      final croppedFile = await imageHelper.cropImage(file: file);
      if (croppedFile != null) {
        setState(() => _pickedFile = File(croppedFile.path));
        formFieldState.didChange(_pickedFile);
        widget.onChanged.call(_pickedFile!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      validator: (file) => widget.validator(file),
      builder: (formFieldState) => Column(
        children: [
          GestureDetector(
            onTap: () async => await pickImage(ref, formFieldState),
            child: Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: Sizes.p80,
                  backgroundColor: AppColors.black,
                  backgroundImage: _pickedFile == null
                      ? const AssetImage(
                              'assets/images/default-profile-pic.png')
                          as ImageProvider
                      : FileImage(
                          File(_pickedFile!.path),
                        ),
                ),
              ),
            ),
          ),
          if (formFieldState.hasError) ...[
            gapH4,
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(
                formFieldState.errorText!,
                style: AppTextStyle.error,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
