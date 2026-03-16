// In pyq_screen.dart

ElevatedButton.icon(
  icon: const Icon(Icons.picture_as_pdf_outlined),
  label: const Text('Export PDF'),
  onPressed: () async {
    final questions = ref.read(pyqListProvider(filter)).value ?? [];
    final visibleQuestions = questions.where((q) => !q.isLocked).toList();

    if (visibleQuestions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No questions to export')));
      return;
    }

    await ref.read(pdfExportServiceProvider)
        .exportPYQs(questions: visibleQuestions, filter: filter);
  },
),