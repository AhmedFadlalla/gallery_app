import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:images_app/presentation/controller/register/register_event.dart';
import 'package:images_app/presentation/controller/register/register_state.dart';



import '../../../core/utils/constrant.dart';
import '../../../core/utils/enum.dart';
import '../../../domain/use_case/user_sign_in_use_case.dart';




class RegisterBloc extends Bloc<BaseRegisterEvent, RegisterState> {

  final UserSignInUseCase userSignInUseCase;
  RegisterBloc(this.userSignInUseCase) : super(RegisterState()) {
    on<UserLoginEvent>((event, emit) async{
      final result=await userSignInUseCase(UserParameter(
        email: event.email,
        password: event.password,
      ));

      result.fold((l) => emit(
          state.copyWith(
              userLoginState: RequestState.error,
              userLoginMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              userLoginState: RequestState.loaded,
              userAccessToken: r
          )
      ));
    });



  }
}
