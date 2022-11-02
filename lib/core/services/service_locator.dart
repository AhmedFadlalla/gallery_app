

import 'package:get_it/get_it.dart';
import 'package:images_app/domain/use_case/get_images_data_use_case.dart';
import 'package:images_app/domain/use_case/upload_image_use_case.dart';
import 'package:images_app/presentation/controller/home/home_event.dart';


import '../../data/data_source/base_remote_data_source.dart';
import '../../data/repo/app_repo.dart';
import '../../domain/repo/base_app_repo.dart';

import '../../domain/use_case/user_sign_in_use_case.dart';
import '../../presentation/controller/home/home_bloc.dart';
import '../../presentation/controller/register/register_bloc.dart';


final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc


    sl.registerLazySingleton<RegisterBloc>(() =>RegisterBloc(sl()));
    sl.registerLazySingleton<HomeBloc>(() =>HomeBloc(sl(),sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case

    sl.registerLazySingleton<UserSignInUseCase>(() =>UserSignInUseCase(sl()) );
    sl.registerLazySingleton<GetImagesDataUseCase>(() =>GetImagesDataUseCase(sl()) );
    sl.registerLazySingleton<UploadImageUseCase>(() =>UploadImageUseCase(sl()) );  // sl.registerLazySingleton<>(() =>(sl()));
    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() =>AppRepository(sl()) );
    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource());
  }

}