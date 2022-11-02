import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/presentation/controller/home/home_bloc.dart';
import 'package:images_app/presentation/controller/home/home_state.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enum.dart';
import '../../controller/home/home_event.dart';
import 'compenent.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<HomeBloc>(),
      child: BlocConsumer<HomeBloc,HomeState>(builder: (context,state){
        return AlertDialog(
           backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: ListBody(

                children: [
                  Center(
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: MaterialButton(

                        onPressed: (){
                          sl<HomeBloc>().add(GetImageFromGalleryEvent());
                        },
                        child: Row(
                          children: const [
                             Icon(
                                 Icons.photo_library,
                               color: Colors.blue,
                             ),
                              SizedBox(width: 10,),
                            Text(
                              'Gallery',
                              style:  TextStyle(
                                  fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: MaterialButton(

                        onPressed: (){
                          sl<HomeBloc>().add(GetImageFromCameraEvent());
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'Camera',
                              style:  TextStyle(
                                  fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  defaultButton(function: (){
                    sl<HomeBloc>().add(UploadImageEvent(
                        imagePath:state.image!.path , imageName: state.image!.name));
                  }, text: 'Upload')
                ],
              ),
            )
        );
      }, listener: (context,state){
        if(state.uploadImageState==RequestState.loaded){
          showToast(text: 'Uploaded', state: ToastStates.SUCCESS);
        }
      }),
    );
  }


}
