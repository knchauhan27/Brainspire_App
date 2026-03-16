import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/app_exception.dart';

class ApiClient {
  final SupabaseClient _client;

  ApiClient(this._client);

  /// Perform a GET request
  Future<T> get<T>({
    required String endpoint,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _client.from(endpoint).select();
      return fromJson(response);
    } on PostgrestException catch (e) {
      throw DataException(message: e.message);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw UnknownException(message: 'Failed to fetch from $endpoint: $e');
    }
  }

  /// Perform a POST request
  Future<T> post<T>({
    required String endpoint,
    required Map<String, dynamic> data,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _client.from(endpoint).insert(data).select();
      return fromJson(response.isNotEmpty ? response.first : response);
    } on PostgrestException catch (e) {
      throw DataException(message: e.message);
    } catch (e) {
      throw UnknownException(message: 'Failed to post to $endpoint: $e');
    }
  }

  /// Perform an UPDATE request
  Future<T> update<T>({
    required String endpoint,
    required String id,
    required Map<String, dynamic> data,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _client
          .from(endpoint)
          .update(data)
          .eq('id', id)
          .select();
      return fromJson(response.isNotEmpty ? response.first : response);
    } on PostgrestException catch (e) {
      throw DataException(message: e.message);
    } catch (e) {
      throw UnknownException(message: 'Failed to update $endpoint: $e');
    }
  }

  /// Perform a DELETE request
  Future<void> delete({required String endpoint, required String id}) async {
    try {
      await _client.from(endpoint).delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw DataException(message: e.message);
    } catch (e) {
      throw UnknownException(message: 'Failed to delete from $endpoint: $e');
    }
  }
}
