import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/presentation/controller/home/home_bloc.dart';
import 'package:images_app/presentation/controller/home/home_state.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enum.dart';
import '../../controller/home/home_event.dart';
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<HomeBloc>()..add(GetImagesDataEvent()),
      child: BlocBuilder<HomeBloc,HomeState>(
          builder:(context,state) {
            switch (state.imagesDataState) {
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                var images = state.imagesData;
                print(images.length);
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1 / 1.42,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    children: List.generate(images.length,
                            (index) => buildItem(images[index])),
                  ),
                );
              case RequestState.error:
                return Center(child: Text(state.imagesDataMessage),);
            }

          }
            )
    );
  }

  Widget buildItem(String image)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150,
      width: 150,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(image),
          fit: BoxFit.cover
        )
      ),
    ),
  );
}
