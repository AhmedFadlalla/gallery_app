import 'package:equatable/equatable.dart';

class BaseImageData extends Equatable{
  final String imageUrl;

  BaseImageData({required this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props =>[imageUrl];


}