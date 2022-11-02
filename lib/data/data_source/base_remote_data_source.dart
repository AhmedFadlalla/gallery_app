import 'package:dio/dio.dart';
import 'package:images_app/data/models/image_data_model.dart';


import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';
import '../../core/services/dio_helper.dart';
import '../../core/utils/constrant.dart';
import '../../core/utils/end_point.dart';
import '../models/auth_data_model.dart';


abstract class BaseRemoteDataSource {


  Future<String> userSignIn(UserParameter parameter);
  Future<List<String>> getImagesData();
  Future<void> uploadImage(ImageParameter parameter);


}

class RemoteDataSource extends BaseRemoteDataSource{


  @override
  Future<String> userSignIn(UserParameter parameter)async {

    final response=await DioHelper.postData(url:login, data: {
      "email":parameter.email,
      "password":parameter.password
    });

    print(response.data);

    
    if(response.statusCode==200){
      return response.data["token"];
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data) );
    }
    
  }

  @override
  Future<List<String>> getImagesData() async{
    print(uId);
    final response=await DioHelper.getData(url:gallery,token: uId);
    print(' my images ${response.data["data"]["images"]}');
    if(response.statusCode==200){
      return List<String>.from((response.data["data"]["images"] as List).map((e) => e));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data) );
    }
  }

  @override
  Future<void> uploadImage(ImageParameter parameter) async{
    FormData data=FormData.fromMap({
      "img":await MultipartFile.fromFile(parameter.imagePath,filename: parameter.imageName),
    });
    final response=await DioHelper.postData(url:upload, data: data,token: uId);

    print(response.data);


    if(response.statusCode==200){
      print(response.data["message"]);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data) );
    }

  }



}