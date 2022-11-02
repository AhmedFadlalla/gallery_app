
import 'package:equatable/equatable.dart';


import '../../../core/utils/enum.dart';
import '../../../domain/entities/base_auth_data.dart';

class RegisterState extends Equatable{

  final String userAccessToken;
  final RequestState userLoginState;
  final String userLoginMessage;


  RegisterState({
    this.userAccessToken='',
    this.userLoginState=RequestState.loading,
    this.userLoginMessage=''
  });

  RegisterState copyWith({

    String? userAccessToken,
    RequestState? userLoginState,
    String? userLoginMessage,
  }){
    return RegisterState(

        userAccessToken: userAccessToken??this.userAccessToken,
        userLoginState: userLoginState??this.userLoginState,
        userLoginMessage: userLoginMessage??this.userLoginMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    userAccessToken,userLoginState,userLoginMessage
  ];
}
