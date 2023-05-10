import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/manager/values_manager.dart';
import '../core/manager/font_manager.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;
  final bool isDisable;

  const ButtonPrimary({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisable = false,
    super.key,
  });

  Widget get textButton {
    if (!isLoading) {
      return Text(
        text,
        style: Typograph.label14m.copyWith(color: Colors.white),
      );
    }
    return const SizedBox.shrink();
  }

  Widget get loadingButton {
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpinKitFadingCircle(
            size: AppSize.s24,
            color: Colors.white,
          ),
          const SizedBox(width: AppMargin.m6),
          Text("Loading...",
              style: Typograph.label14m.copyWith(color: Colors.white)),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
          vertical: AppPadding.p10,
        ),
      ),
      onPressed: (isLoading || isDisable) ? null : onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          textButton,
          loadingButton,
        ],
      ),
    );
  }
}
