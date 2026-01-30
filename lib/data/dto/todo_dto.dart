import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_dto.freezed.dart';
part 'todo_dto.g.dart';

@freezed
abstract class TodoDto with _$TodoDto {
  const factory TodoDto({
    required String id,
    required String title,
    String? des,
    @JsonKey(name: "is_favorite") required bool isFavorite,
    @JsonKey(name: "is_done") required bool isDone,
  }) = _TodoDto;

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);
}