// features/pyq/presentation/widgets/locked_card_overlay.dart

class LockedCardOverlay extends StatelessWidget {
  final Widget child;
  const LockedCardOverlay({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: child,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_outline, color: Colors.white, size: 32),
              const SizedBox(height: 8),
              const Text(
                'Go Premium to Unlock',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => context.push('/premium'),
                child: const Text('View Plans'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
