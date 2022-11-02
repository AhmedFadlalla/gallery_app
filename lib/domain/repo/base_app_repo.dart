import 'package:dartz/dartz.dart';
import 'package:images_app/domain/entities/base_image_data.dart';
import 'package:images_app/domain/entities/base_use_data.dart';

import '../../core/error/failure.dart';
import '../../core/utils/constrant.dart';
import '../entities/base_auth_data.dart';

abstract class BaseAppRepository {
  Future<Either<Failure, BaseUserData>> userSignIn(UserParameter parameter);
  Future<Either<Failure, List<String>>> getImagesData();
  Future<Either<Failure, void>> uploadImage(ImageParameter parameter);


}