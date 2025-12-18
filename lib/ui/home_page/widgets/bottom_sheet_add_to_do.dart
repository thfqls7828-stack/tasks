import 'package:flutter/material.dart';

class BottomSheetAddToDo extends StatefulWidget {
  const BottomSheetAddToDo({super.key});

  @override
  State<BottomSheetAddToDo> createState() => _BottomSheetAddToDoState();
}

class _BottomSheetAddToDoState extends State<BottomSheetAddToDo> {
  String _textValue = "";
  bool _isEmpty = true;

  void onToggleSaveBtn() {
    setState(() {
      _isEmpty = _textValue == "" ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 16),
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "새 할 일",
            ),
            maxLines: 1,
            onSubmitted: (value) => setState(() {
              _textValue = value;
            }),
          ),
          GestureDetector(
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.short_text_rounded, size: 24),
                Icon(Icons.star_border, size: 24),
                Spacer(),
                Text(
                  "저장",
                  style: TextStyle(
                    color: _isEmpty ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
