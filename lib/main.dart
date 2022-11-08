import 'package:flutter/material.dart';
import 'package:images_app/core/services/cach_helper.dart';
import 'package:images_app/core/services/service_locator.dart';
import 'package:images_app/presentation/screens/home_screen.dart';
import 'package:images_app/presentation/screens/register/login_screen.dart';

import 'core/services/dio_helper.dart';
import 'core/utils/constrant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  await DioHelper.init();
   ServicesLocator().init();

   uId=CachHelper.getData(key: 'uId');
   name=CachHelper.getData(key: "name");
   Widget? widget;
   if(uId!=null){
     widget=HomeScreen();
   }else{
     widget=UserLoginScreen();
   }

  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({
    super.key,
    required this.startWidget
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  UserLoginScreen(),
    );
  }
}


