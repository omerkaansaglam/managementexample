import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:managementexample/core/constants/navigation_constants.dart';
import 'package:managementexample/features/login/service/login_service.dart';
import 'package:managementexample/product/router/app_router.dart';
import 'package:managementexample/product/service/locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ILoginService _loginService;
  LoginCubit(this._loginService) : super(const LoginInitial());

  Future<void> postLogin({required userName, required password}) async {
    final result = await _loginService.postLogin(userName: userName, password: password);
    if (result == true) {
      getIt<AppRouter>().replaceNamed(NavigationConstants.HOME);
    }else {
      const String error = "'Kullanıcı adı' veya 'Şifre' hatalı";
      emit( const LoginError(error));
    }
  }

}
