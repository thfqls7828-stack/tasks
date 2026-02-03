import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/core/debouncing/debouncer.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';
import 'package:flutter_basic_assignment/presentaion/viewmodel/todo/todo_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Modal BottomSheet
class BottomSheetAddToDo extends ConsumerStatefulWidget {
  const BottomSheetAddToDo({super.key});

  @override
  ConsumerState<BottomSheetAddToDo> createState() => BottomSheetAddToDoState();
}

class BottomSheetAddToDoState extends ConsumerState<BottomSheetAddToDo> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  bool isDetail = false;
  bool isFavorite = false;
  final debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    desController.dispose();
  }

  void saveTodo() {
    ref
        .read(todoListProvider.notifier)
        .addTodo(
          ToDoEntity(
            id: "temp",
            title: titleController.text,
            isFavorite: isFavorite,
            des: desController.text.trim() == "" ? null : desController.text,
            isDone: false,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 16, color: Colors.black),
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "새 할 일",
              ),
              maxLines: 1,
            ),
            if (isDetail) Details(desController: desController),
            Row(
              children: [
                if (!isDetail)
                  IconButton(
                    icon: Icon(
                      Icons.short_text_rounded,
                      size: 24,
                      color: Theme.of(context).dividerColor,
                    ),
                    onPressed: () => setState(() {
                      isDetail = !isDetail;
                    }),
                  ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    size: 24,
                    color: Theme.of(context).dividerColor,
                  ),
                  onPressed: () => setState(() {
                    isFavorite = !isFavorite;
                  }),
                ),
                Spacer(),

                GestureDetector(
                  onTap: () {
                    if (titleController.text.trim().isNotEmpty) {
                      debouncer.run(() {
                        saveTodo();
                        Navigator.pop(context);
                        debouncer.dispose();
                        setState(() {});
                      });
                    }
                  },
                  child: Text(
                    "저장",
                    style: TextStyle(
                      color: titleController.text.trim().isEmpty
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 세부정보 입력 TextField
class Details extends StatelessWidget {
  const Details({super.key, required this.desController});

  final TextEditingController desController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: desController,
        textInputAction: TextInputAction.newline,
        style: TextStyle(fontSize: 14, color: Theme.of(context).dividerColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "세부정보 추가",
        ),
        maxLines: null,
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
