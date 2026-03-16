// features/auth/data/auth_repository_impl.dart

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _client;
  final DeviceFingerprintService _fpService;

  AuthRepositoryImpl(this._client, this._fpService);

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String username,
    required String college,
    required int year,
  }) async {
    try {
      final resp = await _client.auth.signUp(email: email, password: password);
      if (resp.user == null) return Left(AuthFailure('Signup failed'));

      // Insert profile row
      await _client.from('users').insert({
        'id': resp.user!.id,
        'username': username,
        'email': email,
        'college': college,
        'year': year,
        'avatar_id': 1,
      });

      await _registerDeviceFingerprint(resp.user!.id);
      return Right(UserModel.fromSupabase(resp.user!));
    } on PostgrestException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (resp.user == null) return Left(AuthFailure('Login failed'));

      // Check suspension
      final profile = await _client
          .from('users')
          .select('is_suspended, is_premium')
          .eq('id', resp.user!.id)
          .single();

      if (profile['is_suspended'] == true) {
        await _client.auth.signOut();
        return Left(
          SuspendedFailure(
            'Account suspended. Email support@brainspire.in to restore access.',
          ),
        );
      }

      await _registerDeviceFingerprint(resp.user!.id);
      return Right(UserModel.fromSupabase(resp.user!));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  Future<void> _registerDeviceFingerprint(String userId) async {
    final fp = await _fpService.getFingerprint();
    // Delegate to Edge Function — see Section 9
    await _client.functions.invoke(
      'register-device',
      body: {
        'user_id': userId,
        'fingerprint': fp,
        'device_label': await _fpService.getDeviceLabel(),
      },
    );
  }
}
