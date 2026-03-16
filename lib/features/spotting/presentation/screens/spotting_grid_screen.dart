// features/spotting/presentation/screens/spotting_grid_screen.dart

class SpottingGridScreen extends ConsumerWidget {
  final int subjectId;
  const SpottingGridScreen({required this.subjectId, super.key});

  static const int freeLimit = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(spottingProvider(subjectId));
    final isPremium = ref.watch(currentUserProvider)?.isPremium ?? false;

    return cards.when(
      data: (list) => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isLocked = !isPremium && index >= freeLimit;
          return SpottingCard(spotting: list[index], isLocked: isLocked);
        },
      ),
      loading: () => const LoadingWidget(),
      error: (e, _) => ErrorWidget(message: e.toString()),
    );
  }
}
