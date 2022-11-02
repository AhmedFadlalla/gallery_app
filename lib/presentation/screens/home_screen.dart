import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


import '../../core/services/cach_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/utils/constrant.dart';
import '../../core/utils/enum.dart';
import '../controller/home/home_bloc.dart';
import '../controller/home/home_event.dart';
import '../controller/home/home_state.dart';
import 'component/compenent.dart';
import 'component/upload_image.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    uId ??= CachHelper.getData(key: "uId");

    return BlocProvider(
        create: (context)=>sl<HomeBloc>()..add(GetImagesDataEvent()),
      child: BlocConsumer<HomeBloc,HomeState>(
        builder: (context,state){
          switch(state.imagesDataState){
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              var images=state.imagesData;
              print(images.length);
              return Scaffold(
                appBar: AppBar(
                  title:const Text('My Gallery'),
                ),
                body: ListView.separated(
                    itemBuilder: (context,index)=>buildItem(images[index]),
                    separatorBuilder: (context,index)=>myDivider(),
                    itemCount: images.length),
                floatingActionButton: FloatingActionButton(
                  onPressed: (){
                    showDialog(context: context, builder: (builder){
                      return const UploadImage();
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              );
            case RequestState.error:
              return Center(child: Text(state.imagesDataMessage),);
          }
        },
        listener: (context,state){


        },
      ),
    );
  }
  Widget buildItem(String image)=>Card(
    color: Colors.grey,
    child: Center(
      child: Image(image: NetworkImage(
          image),
        width: 200,
        fit: BoxFit.cover,
      ),
    ),
  );
}
