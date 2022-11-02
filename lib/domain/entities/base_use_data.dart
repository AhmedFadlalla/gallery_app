import 'package:equatable/equatable.dart';

class BaseUserData extends Equatable {
  final String name;
  final String email;
  final String token;

  BaseUserData({
   required this.name,
    required this.email,
    required  this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,token];


}
