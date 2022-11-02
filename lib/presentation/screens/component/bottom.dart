import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/presentation/controller/home/home_bloc.dart';
import 'package:images_app/presentation/controller/home/home_state.dart';
import 'package:images_app/presentation/screens/component/compenent.dart';
import 'package:images_app/presentation/screens/component/upload_image.dart';
import 'package:images_app/presentation/screens/register/login_screen.dart';

import '../../../core/services/cach_helper.dart';
import '../../../core/services/service_locator.dart';
class BottomScreen extends StatelessWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context)=>sl<HomeBloc>(),
      child: BlocConsumer<HomeBloc,HomeState>(builder: (context,state){
        return  Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(width: width*0.1,),
              buildBottomItem(Colors.red, Icons.logout_sharp, 'Log out',(){
                CachHelper.removeData(key: 'uId').then((value) {
                  navigateTo(context, UserLoginScreen());
                });
              }),
              SizedBox(width: width*0.1,),
              buildBottomItem(
                  Colors.amber,
                  Icons.upload_sharp,
                  'Upload',(){
                showDialog(context: context, builder: (builder){
                  return const UploadImage();
                });
              }),

            ],
          ),
        );
      }, listener: (context,state){

      }),
    );
  }

  Widget buildBottomItem(Color color,IconData icon,String text,var onTap)=> Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: MaterialButton(

      onPressed: onTap,

      child: Row(
        children: [

          Container(
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(6)
              ),
              child:  Padding(
                padding:  const EdgeInsets.all(4.0),
                child: Icon(icon),
              )
          ),
          const  SizedBox(width: 10,),
          Text(
            text,
            style: const TextStyle(
                fontSize: 18
            ),
          )
        ],
      ),
    ),
  );
}
