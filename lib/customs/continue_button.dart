import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key, required this.text, required this.onPressed, this.loadingNotifier, this.isEnabledNotifier, this.style})
      : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loadingNotifier;
  final ValueNotifier<bool>? isEnabledNotifier;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (loadingNotifier == null) {
      return ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      );
    }

    return ValueListenableBuilder<bool>(
      valueListenable: loadingNotifier!,
      builder: (context, isLoading, child) {
        return ElevatedButton(
          style: style,
          onPressed: onPressed,
          child: (isLoading)
              ? CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).scaffoldBackgroundColor),
                )
              : Text(text.toUpperCase(), style: Theme.of(context).textTheme.button),
        );
      },
    );
  }

  bool shouldButtonBeEnabled(bool isEnabled, bool isLoading) => isEnabled && !isLoading;
}
