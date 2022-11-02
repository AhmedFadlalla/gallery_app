import 'package:images_app/domain/entities/base_image_data.dart';

class ImageDataModel extends BaseImageData{
  ImageDataModel({required super.imageUrl});

  factory ImageDataModel.fromJson(Map<String,dynamic> json){
    return ImageDataModel(imageUrl: json["images"]);
  }


}