import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool showProgress;

  AppButton({
    required this.text,
    required this.onPressed,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Visibility(
          visible: !showProgress,
          child: Text(
            text,
            style: TextStyle(fontSize: 22),
          ),
          replacement: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// showProgress
//             ? Center(
//                 child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ))
//             : Text(
//                 text,
//                 style: TextStyle(fontSize: 22),
//               ),
