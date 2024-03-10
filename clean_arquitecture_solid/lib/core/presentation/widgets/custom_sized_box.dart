import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double? heitgh;
  final double? width;
  final Widget? child;

  const CustomSizedBox({super.key, this.heitgh, this.width, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heitgh,
      width: width,
      child: child,
    );
  }
}
