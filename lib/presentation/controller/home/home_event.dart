import 'package:equatable/equatable.dart';

abstract class BaseHomeEvent extends Equatable{
  BaseHomeEvent();
  @override
  List<Object?> get props => [];
}


class GetImagesDataEvent extends BaseHomeEvent{}
class GetImageFromGalleryEvent extends BaseHomeEvent{}
class UploadImageEvent extends BaseHomeEvent{
  final String imagePath;
  final String imageName;


  UploadImageEvent(
      {
        required this.imagePath,
        required this.imageName,
      });
}
