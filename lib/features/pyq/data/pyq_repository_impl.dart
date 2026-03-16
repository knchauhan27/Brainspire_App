// features/pyq/data/pyq_repository_impl.dart

class PYQRepositoryImpl implements PYQRepository {
  final SupabaseClient _client;
  static const int pageSize = 20; // Number of questions per page

  @override
  Future<List<QuestionModel>> fetchQuestions(
    PYQFilter filter, {
    int page = 1,
  }) async {
    // Ensure page is at least 1
    final actualPage = page < 1 ? 1 : page;
    final offset = (actualPage - 1) * pageSize;

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
    if (filter.topic != null)
      query = query.ilike('topic', '%${filter.topic}%');
    if (filter.subTopic != null)
      query = query.ilike('sub_topic', '%${filter.subTopic}%');

    // Apply sorting and pagination
    final result = await query
        .order(
          filter.sortBy,
          ascending: filter.sortBy == 'year',
        )
        .range(offset, offset + pageSize - 1); // Pagination with range

    return result.map((e) => QuestionModel.fromJson(e)).toList();
  }

  /// Fetch all questions (avoid using without pagination in UI)
  @Deprecated('Use fetchQuestions with pagination instead')
  Future<List<QuestionModel>> fetchAllQuestions(PYQFilter filter) async {
    var query = _client
        .from('questions')
        .select('''
          id, question_text, year, exam_type, marks,
          topic, sub_topic, like_count, bookmark_count, importance_score,
          subjects(name)
        ''')
        .eq('type', 'pyq');

    // Apply filters
    if (filter.subjectId != null)
      query = query.eq('subject_id', filter.subjectId!);
    if (filter.year != null) query = query.eq('year', filter.year!);
    if (filter.examType != null)
      query = query.eq('exam_type', filter.examType!);
    if (filter.marks != null) query = query.eq('marks', filter.marks!);
    if (filter.topic != null)
      query = query.ilike('topic', '%${filter.topic}%');
    if (filter.subTopic != null)
      query = query.ilike('sub_topic', '%${filter.subTopic}%');

    final result = await query.order(
      filter.sortBy,
      ascending: filter.sortBy == 'year',
    );
    
    return result.map((e) => QuestionModel.fromJson(e)).toList();
  }

  /// Get total count of questions matching the filter
  Future<int> getQuestionCount(PYQFilter filter) async {
    var query = _client
        .from('questions')
        .select('id', const QuerySelectFinalOptions(count: CountOption.exact))
        .eq('type', 'pyq');

    // Apply filters
    if (filter.subjectId != null)
      query = query.eq('subject_id', filter.subjectId!);
    if (filter.year != null) query = query.eq('year', filter.year!);
    if (filter.examType != null)
      query = query.eq('exam_type', filter.examType!);
    if (filter.marks != null) query = query.eq('marks', filter.marks!);
    if (filter.topic != null)
      query = query.ilike('topic', '%${filter.topic}%');
    if (filter.subTopic != null)
      query = query.ilike('sub_topic', '%${filter.subTopic}%');

    try {
      final result = await query;
      return result.length;
    } catch (e) {
      return 0;
    }
  }
}
