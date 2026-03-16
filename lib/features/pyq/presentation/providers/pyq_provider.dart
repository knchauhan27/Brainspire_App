// features/pyq/presentation/providers/pyq_provider.dart

@riverpod
class PYQActionsNotifier extends _$PYQActionsNotifier {
  @override
  void build() {}

  Future<void> toggleLike(String questionId) async {
    final userId = ref.read(currentUserProvider)!.id;
    final repo = ref.read(pyqRepositoryProvider);
    await repo.toggleLike(userId: userId, questionId: questionId);
    ref.invalidate(userLikedProvider(questionId));
    // Optimistically update the question list cache
    ref.invalidate(pyqListProvider);
  }

  Future<void> toggleBookmark(String questionId) async {
    final userId = ref.read(currentUserProvider)!.id;
    final repo = ref.read(pyqRepositoryProvider);
    await repo.toggleBookmark(userId: userId, questionId: questionId);
    ref.invalidate(userBookmarkedProvider(questionId));
    ref.invalidate(pyqListProvider);
  }

  Future<void> addComment(String questionId, String body) async {
    final userId = ref.read(currentUserProvider)!.id;
    final wordCount = body.trim().split(' ').length;
    if (wordCount > 50) throw CommentTooLongException();

    final repo = ref.read(pyqRepositoryProvider);
    await repo.addComment(userId: userId, questionId: questionId, body: body);
    ref.invalidate(commentsProvider(questionId));
  }
}
