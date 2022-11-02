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
            title: Text("Add Task"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [

                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: IconButton(
                            onPressed: () {

                              sl<HomeBloc>().add(GetImageFromGalleryEvent());
                            }, icon: const Icon(Icons.image, size: 32,),
                            color: Colors.blue,

                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),
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
