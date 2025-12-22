import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/bottom_sheet_provider.dart';
import 'package:flutter_basic_assignment/entity/to_do_entity.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:provider/provider.dart';

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
            style: TextStyle(fontSize: 16),
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "새 할 일",
            ),
            maxLines: 1,
            onChanged: (value) => bottomSheetProvider.getTitle(value),
            onSubmitted: (value) {
              if (bottomSheetProvider.title != "") {
                saveTodo();
                Navigator.pop(context);
              }
            },
          ),
          if (bottomSheetProvider.isDetail)
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.newline,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  // isDense: true,
                  border: InputBorder.none,
                  hintText: "세부정보 추가",
                ),
                maxLines: null,
                onChanged: (value) => bottomSheetProvider.getDes(value),
              ),
            ),
          Row(
            children: [
              if (!bottomSheetProvider.isDetail)
                IconButton(
                  icon: Icon(Icons.short_text_rounded, size: 24),
                  onPressed: () => {bottomSheetProvider.onToggleDetail()},
                ),
              IconButton(
                icon: Icon(
                  bottomSheetProvider.isFavorite
                      ? Icons.star
                      : Icons.star_border,
                  size: 24,
                ),
                onPressed: () => bottomSheetProvider.onToggleFavorite(),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (bottomSheetProvider.title != "") {
                    saveTodo();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "저장",
                  style: TextStyle(
                    color: bottomSheetProvider.title == ""
                        ? Colors.grey
                        : Colors.black,
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
