import 'package:dartz/dartz.dart';
import 'package:images_app/core/error/failure.dart';
import 'package:images_app/core/use_case/base_use_case.dart';
import 'package:images_app/domain/entities/base_image_data.dart';
import 'package:images_app/domain/repo/base_app_repo.dart';

class GetImagesDataUseCase extends BaseUseCase<List<String>,NoParameters>{


  final BaseAppRepository baseAppRepository;

  GetImagesDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<String>>> call(NoParameters parameter)async {
    return await baseAppRepository.getImagesData();
  }

}