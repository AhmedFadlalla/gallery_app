import 'package:dartz/dartz.dart';
import 'package:images_app/core/error/failure.dart';
import 'package:images_app/core/utils/constrant.dart';

import '../../core/use_case/base_use_case.dart';
import '../repo/base_app_repo.dart';

class UploadImageUseCase extends BaseUseCase<void,ImageParameter>{

  final BaseAppRepository baseAppRepository;


  UploadImageUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(ImageParameter parameter) async{
    return await baseAppRepository.uploadImage(parameter);
  }


}