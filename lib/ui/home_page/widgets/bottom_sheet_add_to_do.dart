import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/bottom_sheet_provider.dart';
import 'package:flutter_basic_assignment/entity/to_do_entity.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:provider/provider.dart';

// Modal BottomSheet
class BottomSheetAddToDo extends StatelessWidget {
  const BottomSheetAddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomSheetProvider = Provider.of<BottomSheetProvider>(context);
    final todoProvider = Provider.of<TodoProvider>(context);

    void saveTodo() {
      todoProvider.getTodo(
        ToDoEntity(
          title: bottomSheetProvider.title,
          isFavorite: bottomSheetProvider.isFavorite,
          description: bottomSheetProvider.des,
          isDone: false,
        ),
      );
      bottomSheetProvider.resetData();
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).dividerColor,
            ),
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "새 할 일",
            ),
            maxLines: 1,
            onChanged: (value) => bottomSheetProvider.getTitle(value),
            onSubmitted: (value) {
              if (bottomSheetProvider.title.trim() != "") {
                saveTodo();
                Navigator.pop(context);
              }
            },
          ),
          if (bottomSheetProvider.isDetail) Details(),
          Row(
            children: [
              if (!bottomSheetProvider.isDetail)
                IconButton(
                  icon: Icon(
                    Icons.short_text_rounded,
                    size: 24,
                    color: Theme.of(context).dividerColor,
                  ),
                  onPressed: () => {bottomSheetProvider.onToggleDetail()},
                ),
              IconButton(
                icon: Icon(
                  bottomSheetProvider.isFavorite
                      ? Icons.star
                      : Icons.star_border,
                  size: 24,
                  color: Theme.of(context).dividerColor,
                ),
                onPressed: () => bottomSheetProvider.onToggleFavorite(),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  bottomSheetProvider.resetData();
                  Navigator.pop(context);
                },
                child: Text(
                  "뒤로",
                  style: TextStyle(color: Theme.of(context).dividerColor),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  if (bottomSheetProvider.title.trim() != "") {
                    saveTodo();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "저장",
                  style: TextStyle(
                    color: bottomSheetProvider.title.trim() == ""
                        ? Colors.grey
                        : Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 세부정보 입력 TextField
class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomSheetProvider = Provider.of<BottomSheetProvider>(context);

    return Expanded(
      child: TextField(
        textInputAction: TextInputAction.newline,
        style: TextStyle(fontSize: 14, color: Theme.of(context).dividerColor),
        decoration: InputDecoration(
          // isDense: true,
          border: InputBorder.none,
          hintText: "세부정보 추가",
        ),
        maxLines: null,
        onChanged: (value) => bottomSheetProvider.getDes(value),
      ),
    );
  }
}

// 시행착오들

// class DeatilWidget extends StatelessWidget {
//   const DeatilWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<BottomSheetProvider>(context);

//     return Column(
//       children: [
//         TextField(
//           textInputAction: TextInputAction.newline,
//           style: TextStyle(fontSize: 14),
//           decoration: InputDecoration(
//             isDense: true,
//             border: InputBorder.none,
//             hintText: "세부정보 추가",
//           ),
//           maxLines: null,
//           onChanged: (value) => provider.getDes(value),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             if (!provider.isDetail)
//               IconButton(
//                 icon: Icon(Icons.short_text_rounded, size: 24),
//                 onPressed: () => {provider.onToggleisDetail()},
//               ),
//             IconButton(
//               icon: Icon(
//                 provider.isFavorite ? Icons.star : Icons.star_border,
//                 size: 24,
//               ),
//               onPressed: () => provider.onToggleisFavorite(),
//             ),
//             GestureDetector(
//               onTap: () {
//                 if (provider.title != "") {
//                   provider.resetData();
//                   Navigator.pop(context);
//                 }
//               },
//               child: Text(
//                 "저장",
//                 style: TextStyle(
//                   color: provider.title == "" ? Colors.grey : Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class InitialWidget extends StatelessWidget {
//   const InitialWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<BottomSheetProvider>(context);

//     return Row(
//       spacing: 20,
//       children: [
//         IconButton(
//           icon: Icon(Icons.short_text_rounded, size: 24),
//           onPressed: () {
//             context.read<BottomSheetProvider>().onToggleisDetail();
//           },
//         ),
//         IconButton(
//           icon: Icon(
//             provider.isFavorite ? Icons.star : Icons.star_border,
//             size: 24,
//           ),
//           onPressed: () {
//             provider.onToggleisFavorite();
//           },
//         ),
//         Spacer(),
//         GestureDetector(
//           onTap: () {
//             if (provider.title != "") Navigator.pop(context);
//           },
//           child: Text(
//             "저장",
//             style: TextStyle(
//               color: provider.title == "" ? Colors.grey : Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
