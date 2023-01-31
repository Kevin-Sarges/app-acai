import 'package:app_acai/app/features/splash/domain/usecase/user_is_logger_usecase.dart';
import 'package:app_acai/app/features/splash/presenter/controllers/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.userIsLoggerInUseCase}) : super(SplashIntial());

  final UserIsLoggerInUseCase userIsLoggerInUseCase;

  Future<void> checkLogin() async {
    emit(SplashCarregando());

    final result = await userIsLoggerInUseCase();
  }
}
