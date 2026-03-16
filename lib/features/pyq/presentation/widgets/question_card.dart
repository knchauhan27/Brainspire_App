// features/pyq/presentation/widgets/question_card.dart

class QuestionCard extends ConsumerStatefulWidget {
  final QuestionModel question;
  final bool isLocked;

  const QuestionCard({
    required this.question,
    this.isLocked = false,
    super.key,
  });

  @override
  ConsumerState<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends ConsumerState<QuestionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _heartCtrl;
  bool _showHeart = false;

  @override
  void initState() {
    super.initState();
    _heartCtrl =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 800),
        )..addStatusListener((s) {
          if (s == AnimationStatus.completed) {
            setState(() => _showHeart = false);
            _heartCtrl.reset();
          }
        });
  }

  void _handleDoubleTap() {
    ref.read(pyqActionsProvider.notifier).like(widget.question.id);
    setState(() => _showHeart = true);
    _heartCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: widget.isLocked ? null : _handleDoubleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: widget.isLocked
                ? LockedCardOverlay(child: _cardContent())
                : _cardContent(),
          ),
          if (_showHeart)
            ScaleTransition(
              scale: CurvedAnimation(
                parent: _heartCtrl,
                curve: Curves.elasticOut,
              ),
              child: const Icon(Icons.favorite, color: Colors.red, size: 80),
            ),
        ],
      ),
    );
  }

  Widget _cardContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.questionText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              TagChip(label: widget.question.subjectName),
              if (widget.question.year != null)
                TagChip(label: '${widget.question.year}'),
              if (widget.question.examType != null)
                TagChip(label: widget.question.examType!),
              if (widget.question.marks != null)
                TagChip(label: '${widget.question.marks}m'),
              if (widget.question.topic != null)
                TagChip(label: widget.question.topic!),
            ],
          ),
          const SizedBox(height: 12),
          _ActionRow(question: widget.question),
          _CommentSection(questionId: widget.question.id),
        ],
      ),
    );
  }
}

// Action row: Like, Bookmark, Comment counts
class _ActionRow extends ConsumerWidget {
  final QuestionModel question;
  const _ActionRow({required this.question});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLiked = ref.watch(userLikedProvider(question.id));
    final userBookmarked = ref.watch(userBookmarkedProvider(question.id));

    return Row(
      children: [
        _ActionButton(
          icon: userLiked ? Icons.favorite : Icons.favorite_border,
          color: userLiked ? Colors.red : null,
          count: question.likeCount,
          onTap: () =>
              ref.read(pyqActionsProvider.notifier).toggleLike(question.id),
        ),
        const SizedBox(width: 16),
        _ActionButton(
          icon: userBookmarked ? Icons.bookmark : Icons.bookmark_border,
          color: userBookmarked ? Colors.amber : null,
          count: question.bookmarkCount,
          onTap: () =>
              ref.read(pyqActionsProvider.notifier).toggleBookmark(question.id),
        ),
        const SizedBox(width: 16),
        _ActionButton(
          icon: Icons.comment_outlined,
          count: 0, // expanded in CommentSection
          onTap: () =>
              ref.read(commentExpandedProvider(question.id).notifier).toggle(),
        ),
      ],
    );
  }
}
