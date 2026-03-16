class SpottingDetailScreen extends StatelessWidget {
  final SpottingModel spotting;
  const SpottingDetailScreen({required this.spotting, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spotting.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image from Supabase Storage
            CachedNetworkImage(
              imageUrl: supabaseStorageUrl(spotting.imagePath),
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Section('Description', spotting.description),
                  _Section('Composition', spotting.composition),
                  _Section('Usage', spotting.usageNotes),
                  const SizedBox(height: 16),
                  const Text(
                    'Viva Questions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  ...spotting.vivaQuestions.map(
                    (vq) => VivaAccordionTile(vq: vq),
                  ),
                  _AddVivaQuestionForm(spottingId: spotting.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VivaAccordionTile extends StatelessWidget {
  final VivaQuestion vq;
  const VivaAccordionTile({required this.vq, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        vq.isOfficial ? Icons.verified : Icons.person_outline,
        size: 18,
      ),
      title: Text(vq.question),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(vq.answer),
        ),
      ],
    );
  }
}
