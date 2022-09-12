import 'package:get_it/get_it.dart';

import 'core/config/config.dart';
import 'core/services/api_services.dart';
import 'core/services/auth_service.dart';
import 'core/services/database_service.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  // locator.registerSingleton<LoginBody>(LoginBody());
  // locator.registerSingleton<SignUpBody>(SignUpBody());
  // locator.registerSingleton<UpdatePasswordBody>(UpdatePasswordBody());
  // locator.registerSingleton<EmailBody>(EmailBody());
  // locator.registerSingleton<BasicInfoBody>(BasicInfoBody());

  // locator.registerSingleton(Config());
  // locator.registerSingleton(LocalStorageService());
  // locator.registerSingleton(NotificationsService());
  locator.registerSingleton<Config>(Config());
  locator.registerSingleton<ApiServices>(ApiServices());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerSingleton<AuthService>(AuthService());
}
