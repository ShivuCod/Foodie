import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const String user = 'user';

Future<void> loadHive() async {
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox(user);
}

class HiveUser {
  static Box<dynamic> userBox() => Hive.box(user);
  static bool isFirstTime() => userBox().get('intro') ?? true;
  static doneFirstTime(bool? intro) => userBox().put('intro', intro);
  static setToken(String token) => userBox().put("token", token);
  static String getToken() => userBox().get("token")??'';
  static bool isLogged()=>userBox().get("token")?true:false;

}
