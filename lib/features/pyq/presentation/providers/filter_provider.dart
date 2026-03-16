// features/pyq/presentation/providers/filter_provider.dart

@freezed
class PYQFilter with _$PYQFilter {
  const factory PYQFilter({
    @Default(null) int? subjectId,
    @Default(null) int? year,
    @Default(null) String? examType,
    @Default(null) int? marks,
    @Default(null) String? topic,
    @Default(null) String? subTopic,
    @Default('importance_score')
    String sortBy, // year | topic | marks | importance_score
  }) = _PYQFilter;
}

@riverpod
class PYQFilterNotifier extends _$PYQFilterNotifier {
  @override
  PYQFilter build() => const PYQFilter();

  void setSubject(int? id) => state = state.copyWith(subjectId: id);
  void setYear(int? y) => state = state.copyWith(year: y);
  void setExamType(String? e) => state = state.copyWith(examType: e);
  void setMarks(int? m) => state = state.copyWith(marks: m);
  void setTopic(String? t) => state = state.copyWith(topic: t);
  void setSortBy(String s) => state = state.copyWith(sortBy: s);
  void reset() => state = const PYQFilter();
}
