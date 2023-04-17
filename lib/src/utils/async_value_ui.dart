import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/widgets/default_snack_bar.dart';

typedef VoidAsyncValue = AsyncValue<void>;

extension AsyncValueUI on VoidAsyncValue {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          DefaultSnackBar.show(
            context: context,
            title: 'Error',
            icon: Icons.error,
            body: error.toString(),
          );
        },
      );
}
