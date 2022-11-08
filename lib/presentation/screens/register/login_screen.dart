import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../core/services/cach_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_color.dart';
import '../../controller/register/register_bloc.dart';
import '../../controller/register/register_event.dart';
import '../../controller/register/register_state.dart';
import '../component/compenent.dart';
import '../home_screen.dart';



class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context)=>sl<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc,RegisterState>(
          builder: (context,state){
            return Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.02,),
                        SizedBox(height: height*0.1,),
                        Text(
                          'Login',
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.black),
                        ),
                        SizedBox(height: height*0.02,),
                        TextFormField(
                            controller: emailController,
                            style:const TextStyle(
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintStyle: const TextStyle(
                                    color: Colors.black
                                ),
                                labelStyle: const TextStyle(
                                    color: Colors.black
                                ),
                                prefixIcon:const  Icon(
                                  Icons.email,
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:  BorderSide(
                                      color: mainColor,

                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: mainColor  ,

                                    )
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,

                                    )
                                )
                            )

                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: passwordController,
                            style:const TextStyle(
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "Password",
                                hintStyle: const TextStyle(
                                    color: Colors.black
                                ),
                                labelStyle: const TextStyle(
                                    color: Colors.black
                                ),
                                prefixIcon:const  Icon(
                                  Icons.lock,
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: mainColor,

                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: mainColor  ,

                                    )
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,

                                    )
                                )
                            )

                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(height: height*0.1,),
                        defaultButton(function: () {
                          if(formKey.currentState!.validate()){
                            sl<RegisterBloc>().add(
                                UserLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ));


                            // navigateTo(context,  HomeScreen());
                          }
                        }, text: 'Login')


                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        listener: (context,state){
            print(state.userData!.token);
          if(state.userData!.token.isNotEmpty){
            CachHelper.saveData(key: "uId", value: state.userData!.token)
                .then((value) {
                  CachHelper.saveData(key: "name", value: state.userData!.name).then((value) {
                    navigateTo(context,  HomeScreen());
                  });

            });

          }
        },
      ),

    );
  }
}
