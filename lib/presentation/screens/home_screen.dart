import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/presentation/controller/register/register_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


import '../../core/services/cach_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/utils/constrant.dart';
import '../../core/utils/enum.dart';
import '../controller/home/home_bloc.dart';
import '../controller/home/home_event.dart';
import '../controller/home/home_state.dart';
import 'component/bottom.dart';
import 'component/compenent.dart';
import 'component/gallery_screen.dart';
import 'component/upload_image.dart';


class HomeScreen extends StatelessWidget {

   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    uId ??= CachHelper.getData(key: "uId");
    name ??= CachHelper.getData(key: "name");
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context)=>sl<HomeBloc>(),
      child: BlocConsumer<HomeBloc,HomeState>(
        builder: (context,state){
      return  Scaffold(

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome \n$name',
                      style: TextStyle(
                          fontSize: 25
                      ),
                    )
                  ],
                ),
                SizedBox(height: height*0.06,),
                const BottomScreen(),
                const GalleryScreen(),

              ],
            ),
          ),
        ),

      );
        },
        listener: (context,state){


        },
      ),
    );
  }


}
