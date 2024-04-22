import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const String user = 'user';

Future<void> loadHive() async {
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox(user);
}

class HiveUser{
  static Box<dynamic> userBox() => Hive.box(user);
  static bool isLogged()=>userBox().get("isLogged")??false;
  static setLogged(bool val)=>userBox().put("isLogged",val);
}