import 'package:flutter/material.dart';
import 'package:managementexample/product/router/route_utils.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ROUTE_PATH.error.toTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error ?? ""),
            TextButton(
              onPressed: () {
              },
              child: const Text(
                "Back to Home"
              ),
            ),
          ],
        ),
      ),
    );
  }
}