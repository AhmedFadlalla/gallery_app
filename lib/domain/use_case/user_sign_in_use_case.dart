import 'package:dartz/dartz.dart';


import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../../core/utils/constrant.dart';
import '../entities/base_auth_data.dart';
import '../entities/base_use_data.dart';
import '../repo/base_app_repo.dart';

class UserSignInUseCase extends BaseUseCase<BaseUserData,UserParameter>{
  final BaseAppRepository baseAppRepository;

  UserSignInUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, BaseUserData>> call(UserParameter parameter)async {
    return await baseAppRepository.userSignIn(parameter);
  }


}