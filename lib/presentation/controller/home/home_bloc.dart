import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_app/core/use_case/base_use_case.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/constrant.dart';
import '../../../core/utils/enum.dart';
import '../../../domain/use_case/get_images_data_use_case.dart';
import '../../../domain/use_case/upload_image_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<BaseHomeEvent, HomeState> {

  final GetImagesDataUseCase getImagesDataUseCase;
  final UploadImageUseCase uploadImageUseCase;
  HomeBloc(this.getImagesDataUseCase,this.uploadImageUseCase) : super(HomeState()) {
    on<GetImagesDataEvent>((event, emit) async{
      final result=await getImagesDataUseCase(const NoParameters());

      result.fold((l) => emit(
        state.copyWith(
          imagesDataState: RequestState.error,
          imagesDataMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          imagesData: r,
          imagesDataState: RequestState.loaded
        )
      ));
    } );

    on<GetImageFromGalleryEvent>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final file = await picker.pickImage(source: ImageSource.gallery);
      emit(
          state.copyWith(
              image: XFile(file!.path)
          )
      );
    });
    on<UploadImageEvent>((event, emit)async {
      final result=await uploadImageUseCase(ImageParameter(
          imagePath: event.imagePath,
          imageName: event.imageName));

      result.fold((l) => emit(
          state.copyWith(
              uploadImageState: RequestState.error,
              uploadImageMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              uploadImageState: RequestState.loaded
          )
      ));
    });



  }
}
