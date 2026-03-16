import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod_annotation/flutter_riverpod_annotation.dart';

// TODO: Import these when auth is implemented
// import 'package:brainspire/features/auth/data/models/user_model.dart';
// import 'package:brainspire/features/auth/data/auth_repository_impl.dart';
// import 'package:brainspire/core/services/device_fingerprint_service.dart';
// import 'package:brainspire/core/services/pdf_export_service.dart';
// import 'package:brainspire/core/services/storage_service.dart';

part 'app_providers.g.dart';

/// Supabase client provider
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// TODO: Current authenticated user provider
/// Uncomment and implement when auth is ready
// @riverpod
// Future<UserModel?> currentUser(CurrentUserRef ref) async {
//   // TODO: Implement logic to fetch current user from auth state
//   // return ref.read(authRepositoryProvider).getCurrentUser();
//   return null;
// }

/// TODO: Current user ID provider
/// Uncomment and implement when auth is ready
// @riverpod
// String? userId(UserIdRef ref) {
//   return ref.watch(currentUserProvider)?.id;
// }

/// TODO: Is user premium provider
/// Uncomment and implement when auth is ready
// @riverpod
// Future<bool> isUserPremium(IsUserPremiumRef ref) async {
//   // TODO: Implement logic to check if user is premium
//   return false;
// }

/// PDF Export Service Provider
// TODO: Uncomment when implementing PDF export
// @riverpod
// PDFExportService pdfExportService(PdfExportServiceRef ref) {
//   return PDFExportService();
// }

/// Storage Service Provider
// TODO: Uncomment when implementing storage
// @riverpod
// StorageService storageService(StorageServiceRef ref) {
//   final supabase = ref.watch(supabaseClientProvider);
//   return StorageService(supabase);
// }

/// Device Fingerprint Service Provider
// TODO: Uncomment when implementing device fingerprinting
// @riverpod
// Future<String> deviceFingerprint(DeviceFingerprintRef ref) async {
//   final service = DeviceFingerprintService();
//   return service.getFingerprint();
// }

/// User liked questions provider
// TODO: Uncomment when implementing liked questions
// @riverpod
// Future<Set<String>> userLikedQuestions(UserLikedQuestionsRef ref) async {
//   // TODO: Fetch from database
//   return {};
// }

/// User bookmarked questions provider
// TODO: Uncomment when implementing bookmarks
// @riverpod
// Future<Set<String>> userBookmarkedQuestions(UserBookmarkedQuestionsRef ref) async {
//   // TODO: Fetch from database
//   return {};
// }

/// Comments provider
// TODO: Uncomment when implementing comments
// @riverpod
// Future<List<CommentModel>> questionComments(
//   QuestionCommentsRef ref,
//   String questionId,
// ) async {
//   // TODO: Fetch comments from database
//   return [];
// }

/// Auth Repository Provider
// TODO: Uncomment when auth is ready
// @riverpod
// AuthRepository authRepository(AuthRepositoryRef ref) {
//   final supabase = ref.watch(supabaseClientProvider);
//   return AuthRepositoryImpl(supabase);
// }

/// PYQ Repository Provider
// TODO: Uncomment when PYQ is ready
// @riverpod
// PyqRepository pyqRepository(PyqRepositoryRef ref) {
//   final supabase = ref.watch(supabaseClientProvider);
//   return PyqRepositoryImpl(supabase);
// }

/// Spotting Repository Provider
// TODO: Uncomment when spotting is ready
// @riverpod
// SpottingRepository spottingRepository(SpottingRepositoryRef ref) {
//   final supabase = ref.watch(supabaseClientProvider);
//   return SpottingRepositoryImpl(supabase);
// }

/// Subjects Repository Provider
// TODO: Uncomment when subjects are ready
// @riverpod
// SubjectsRepository subjectsRepository(SubjectsRepositoryRef ref) {
//   final supabase = ref.watch(supabaseClientProvider);
//   return SubjectsRepositoryImpl(supabase);
// }

/// Premium Repository Provider
// TODO: Uncomment when premium is ready
// @riverpod
// PremiumRepository premiumRepository(PremiumRepositoryRef ref) {
//   final supabase = ref.watch(supabaseClientProvider);
//   return PremiumRepositoryImpl(supabase);
// }
