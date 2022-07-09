import 'package:flutter/material.dart';

class CustomElevationButton extends StatefulWidget {
  final Future<void>? Function() onPressed;
  final Widget? title;
  final bool isCircle;
  final Color? primaryColor;
  const CustomElevationButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.isCircle = false,
      this.primaryColor})
      : super(key: key);

  @override
  _CustomElevationButtonState createState() => _CustomElevationButtonState();
}

class _CustomElevationButtonState extends State<CustomElevationButton> {



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          primary: widget.primaryColor,
          shape: widget.isCircle ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ) : null),
      child: widget.title,
    );
  }
}