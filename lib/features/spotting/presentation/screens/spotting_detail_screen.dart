import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// TODO: Import SpottingModel when available
// import 'package:brainspire/features/spotting/data/models/spotting_model.dart';

class SpottingDetailScreen extends StatelessWidget {
  // final SpottingModel spotting;
  const SpottingDetailScreen({
    // required this.spotting,
    super.key,
  });

  String _generateSupabaseStorageUrl(String imagePath) {
    // TODO: Implement proper Supabase storage URL generation
    // Format: https://{project-id}.supabase.co/storage/v1/object/public/{bucket}/{path}
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spotting Detail')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Implement image display from Supabase Storage
            CachedNetworkImage(
              imageUrl: _generateSupabaseStorageUrl(''),
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Container(
                  height: 260,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Display spotting details
                  const _SectionWidget(title: 'Description', content: ''),
                  const _SectionWidget(title: 'Composition', content: ''),
                  const _SectionWidget(title: 'Usage', content: ''),
                  const SizedBox(height: 16),
                  const Text(
                    'Viva Questions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  // TODO: Display viva questions
                  const Text('No viva questions available'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const _SectionWidget({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }
}

class VivaAccordionTile extends StatelessWidget {
  final String question;
  final String answer;
  final bool isOfficial;

  const VivaAccordionTile({
    required this.question,
    required this.answer,
    required this.isOfficial,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        isOfficial ? Icons.verified : Icons.person_outline,
        size: 18,
      ),
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(answer),
        ),
      ],
    );
  }
}
