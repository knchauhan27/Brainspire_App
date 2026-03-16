import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod_annotation/flutter_riverpod_annotation.dart';

part 'app_providers.g.dart';

/// Supabase client provider
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// Auth state provider - tracks if user is authenticated
@riverpod
Stream<AuthState> authStateStream(AuthStateStreamRef ref) {
  return Supabase.instance.client.auth.onAuthStateChange;
}

/// Current user provider
@riverpod
Future<User?> currentUser(CurrentUserRef ref) async {
  const Duration timeout = Duration(seconds: 5);
  try {
    return await Supabase.instance.client.auth.currentUser.timeout(
          timeout,
          onTimeout: () => null,
        ) ??
        Supabase.instance.client.auth.currentUser;
  } catch (e) {
    return null;
  }
}

/// User ID provider - gets current logged-in user's ID
@riverpod
String? userId(UserIdRef ref) {
  return Supabase.instance.client.auth.currentUser?.id;
}

/// Is user authenticated provider
@riverpod
bool isUserAuthenticated(IsUserAuthenticatedRef ref) {
  return Supabase.instance.client.auth.currentUser != null;
}
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
