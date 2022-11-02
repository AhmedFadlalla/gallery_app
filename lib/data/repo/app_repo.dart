import 'package:dartz/dartz.dart';
import 'package:images_app/domain/entities/base_image_data.dart';

import '../../core/error/failure.dart';
import '../../core/utils/constrant.dart';
import '../../domain/entities/base_auth_data.dart';
import '../../domain/entities/base_use_data.dart';
import '../../domain/repo/base_app_repo.dart';
import '../data_source/base_remote_data_source.dart';
import '../models/user_data_model.dart';

class AppRepository extends BaseAppRepository{
  final BaseRemoteDataSource baseRemoteDataSource;


  AppRepository(this.baseRemoteDataSource);


  @override
  Future<Either<Failure, BaseUserData>> userSignIn(UserParameter parameter)async {
    final result=await baseRemoteDataSource.userSignIn(parameter);
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }

  }

  @override
  Future<Either<Failure, List<String>>> getImagesData()async {
    final result=await baseRemoteDataSource.getImagesData();
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> uploadImage(ImageParameter parameter) async{
    await baseRemoteDataSource.uploadImage(parameter);
    try{
      return Right(print("Success"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }



}