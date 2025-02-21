

import 'package:get_it/get_it.dart';
import 'package:nota_mais/auth/data/repositories/auth_repository_impl.dart';
import 'package:nota_mais/auth/domain/auth_repository.dart';
import 'package:nota_mais/utils/lock.dart';

class AuthDi{
  static final _lock = Lock();
  static GetIt? _getIt;

  static GetIt? get getIt => _getIt;

  static Future<void> init({
    required GetIt getIt,
}) =>
      _lock.syncRunOnce(
          (){
            _getIt = getIt;

            getIt.registerLazySingleton<AuthRepository>(
                AuthRepositoryImpl.new,
            );
          }
      );
}
