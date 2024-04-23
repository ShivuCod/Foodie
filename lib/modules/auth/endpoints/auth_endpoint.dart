import 'package:food_ordering/core.network/host.dart';

class AuthEndpoint{
  static String host=Host.host;
  static final loginApi="$host/api/collections/users/auth-with-password";
  static final signUp="$host/api/collections/users/records";
}