import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/enum.dart';
import '../../../domain/entities/base_image_data.dart';



class HomeState extends Equatable {
  final List<String> imagesData;
  final RequestState  imagesDataState;
  final String  imagesDataMessage;
  final XFile? image;
  final RequestState  uploadImageState;
  final String  uploadImageMessage;



  HomeState(
  {
    this.imagesData=const [],
    this.imagesDataState=RequestState.loading,
    this.imagesDataMessage='',
    this.uploadImageMessage='',
    this.uploadImageState=RequestState.loading,
    this.image
}
  );
  HomeState copyWith({
  List<String>? imagesData,
     RequestState?  imagesDataState,
     String ? imagesDataMessage,
    RequestState?  uploadImageState,
    String ? uploadImageMessage,
     XFile? image,

})=>HomeState(
imagesData: imagesData??this.imagesData,
    imagesDataState:imagesDataState??this.imagesDataState,
    imagesDataMessage: imagesDataMessage??this.imagesDataMessage,
      uploadImageState: uploadImageState??this.uploadImageState,
    uploadImageMessage: uploadImageMessage??this.uploadImageMessage,
image: image??this.image
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
imagesData,imagesDataState,imagesDataMessage,
    uploadImageState,uploadImageMessage,image
  ];




}
