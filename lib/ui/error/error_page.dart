import 'package:flutter/cupertino.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Icon(CupertinoIcons.clear_circled_solid, size: 100),
          Text(error.toString(), style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
