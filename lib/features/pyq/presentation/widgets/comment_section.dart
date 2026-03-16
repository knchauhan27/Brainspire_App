class _CommentSection extends ConsumerWidget {
  final String questionId;
  const _CommentSection({required this.questionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(commentExpandedProvider(questionId));
    if (!isExpanded) return const SizedBox.shrink();

    final comments = ref.watch(commentsProvider(questionId));
    final controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        comments.when(
          data: (list) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) => _CommentTile(comment: list[i]),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Add a tip or clarification… (50 words max)',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                ref
                    .read(pyqActionsProvider.notifier)
                    .addComment(questionId, controller.text);
                controller.clear();
              },
            ),
          ],
        ),
      ],
    );
  }
}
