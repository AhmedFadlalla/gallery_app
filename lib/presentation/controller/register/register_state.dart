
import 'package:equatable/equatable.dart';


import '../../../core/utils/enum.dart';
import '../../../domain/entities/base_auth_data.dart';
import '../../../domain/entities/base_use_data.dart';

class RegisterState extends Equatable{

  final BaseUserData? userData;
  final RequestState userLoginState;
  final String userLoginMessage;


  RegisterState({
    this.userData,
    this.userLoginState=RequestState.loading,
    this.userLoginMessage=''
  });

  RegisterState copyWith({

    BaseUserData? userData,
    RequestState? userLoginState,
    String? userLoginMessage,
  }){
    return RegisterState(

        userData: userData??this.userData,
        userLoginState: userLoginState??this.userLoginState,
        userLoginMessage: userLoginMessage??this.userLoginMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    userData,userLoginState,userLoginMessage
  ];
}
