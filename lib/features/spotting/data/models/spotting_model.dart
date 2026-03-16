// features/spotting/data/models/spotting_model.dart

@freezed
class SpottingModel with _$SpottingModel {
  const factory SpottingModel({
    required String id,
    required String name,
    String? description,
    String? composition,
    String? usageNotes,
    String? imagePath,
    @Default([]) List<VivaQuestion> vivaQuestions,
  }) = _SpottingModel;

  factory SpottingModel.fromJson(Map<String, dynamic> json) =>
      _$SpottingModelFromJson(json);
}

@freezed
class VivaQuestion with _$VivaQuestion {
  const factory VivaQuestion({
    required String id,
    required String question,
    required String answer,
    required bool isOfficial,
  }) = _VivaQuestion;
  factory VivaQuestion.fromJson(Map<String, dynamic> json) =>
      _$VivaQuestionFromJson(json);
}
