// features/pyq/data/pyq_repository_impl.dart

class PYQRepositoryImpl implements PYQRepository {
  final SupabaseClient _client;

  @override
  Future<List<QuestionModel>> fetchQuestions(PYQFilter filter) async {
    var query = _client
        .from('questions')
        .select('''
          id, question_text, year, exam_type, marks,
          topic, sub_topic, like_count, bookmark_count, importance_score,
          subjects(name)
        ''')
        .eq('type', 'pyq');

    // Apply filters conditionally
    if (filter.subjectId != null)
      query = query.eq('subject_id', filter.subjectId!);
    if (filter.year != null) query = query.eq('year', filter.year!);
    if (filter.examType != null)
      query = query.eq('exam_type', filter.examType!);
    if (filter.marks != null) query = query.eq('marks', filter.marks!);
    if (filter.topic != null) query = query.ilike('topic', '%${filter.topic}%');
    if (filter.subTopic != null)
      query = query.ilike('sub_topic', '%${filter.subTopic}%');

    final result = await query.order(
      filter.sortBy,
      ascending: filter.sortBy == 'year',
    );
    return result.map((e) => QuestionModel.fromJson(e)).toList();
  }
}
