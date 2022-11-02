import 'package:equatable/equatable.dart';

class UserParameter extends Equatable{

   final  String email;
   final String password;


   UserParameter({
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}

class ImageParameter extends Equatable{

  final String imagePath;
  final String imageName;


  ImageParameter(
      {
        required this.imagePath,
        required this.imageName,
       });

  @override
  // TODO: implement props
  List<Object?> get props => [imagePath,imageName];

}

String? uId;
String? name;
