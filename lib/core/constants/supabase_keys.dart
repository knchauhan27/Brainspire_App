// ignore_for_file: public_member_api_docs

/// Supabase configuration keys.
/// 
/// ⚠️ SECURITY WARNING: Never hardcode sensitive credentials in source code!
/// Always use environment variables or secure configuration files.
/// 
/// To use this file:
/// 1. Create a .env file in the project root
/// 2. Add your Supabase credentials:
///    SUPABASE_URL=your_supabase_url
///    SUPABASE_ANON_KEY=your_supabase_anon_key
/// 3. Use flutter_dotenv or similar package to load these at runtime
/// 
/// Example:
/// ```dart
/// import 'package:flutter_dotenv/flutter_dotenv.dart';
/// 
/// class SupabaseKeys {
///   static const String url = String.fromEnvironment('SUPABASE_URL');
///   static const String anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
/// }
/// ```

class SupabaseKeys {
  /// Supabase project URL
  /// 
  /// Get this from Supabase project settings
  /// Format: https://[project-id].supabase.co
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  /// Supabase anonymous key (public key)
  /// 
  /// Get this from Supabase project settings
  /// This key is safe to expose in client-side code
  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  /// Supabase service role key (secret key)
  /// 
  /// ⚠️ NEVER expose this in client-side code!
  /// Use only in backend services
  /// Get this from Supabase project settings
  static const String serviceRoleKey = String.fromEnvironment(
    'SUPABASE_SERVICE_ROLE_KEY',
    defaultValue: '',
  );

  /// Validate that required keys are configured
  static bool areKeysConfigured() {
    return url.isNotEmpty && anonKey.isNotEmpty;
  }

  /// Check if keys have been properly set from environment
  static void validateConfiguration() {
    if (!areKeysConfigured()) {
      throw Exception(
        'Supabase keys are not configured. '
        'Please ensure SUPABASE_URL and SUPABASE_ANON_KEY '
        'environment variables are set.',
      );
    }
  }
}
