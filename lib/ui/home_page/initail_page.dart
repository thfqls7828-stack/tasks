import 'package:flutter/material.dart';

// initial Page, No Data
class InitailPage extends StatelessWidget {
  const InitailPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Icon(Icons.task_outlined, size: 100, color: Colors.orange),
          Text(
            "아직 할 일이 없음",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).dividerColor,
            ),
          ),
          Text(
            "할 일을 추가하고 $name's Tasks에서 할 일을 추적하세요.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: Theme.of(context).dividerColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
