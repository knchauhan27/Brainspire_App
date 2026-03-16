import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize({
    required String url,
    required String anonKey,
  }) async {
    await Supabase.initialize(url: url, anonKey: anonKey);
  }

  static SupabaseClient get client {
    return Supabase.instance.client;
  }

  static User? get currentUser {
    return Supabase.instance.client.auth.currentUser;
  }

  static Stream<AuthState> get authStateChanges {
    return Supabase.instance.client.auth.onAuthStateChange;
  }
}
