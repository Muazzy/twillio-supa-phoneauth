import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:phone_auth_twillio/src/base/utils/local_db_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSetup {
  static final String _supabaseUrl = dotenv.env[EnvKeys.supabaseUrl]!;
  static final String _supabaseAnonKey = dotenv.env[EnvKeys.supabaseAnonKey]!;

  static Future<void> init() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
    );
  }
}
