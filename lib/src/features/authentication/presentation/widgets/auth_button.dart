import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/widgets/custom_outlined_button.dart';
import 'package:quote_void/src/utils/async_value_ui.dart';

class AuthButton extends ConsumerWidget {
  final String title;
  final Future<void> Function() onPressed;
  final AutoDisposeAsyncNotifierProvider provider;

  const AuthButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<VoidAsyncValue>(
      provider,
      (_, state) => state.showSnackBarOnError(context),
    );

    final state = ref.watch(provider);

    return CustomOutlinedButton(
      title: title,
      isLoading: state.isLoading,
      onPressed: state.isLoading ? null : onPressed,
    );
  }
}
