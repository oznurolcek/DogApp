import 'package:dog_app/bloc/dog_bloc.dart';
import 'package:dog_app/bloc/dog_event.dart';
import 'package:dog_app/bloc/dog_state.dart';
import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/views/appwidget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogDataBloc(),
      child: BlocConsumer<DogDataBloc, DogDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is InitialState) {
            BlocProvider.of<DogDataBloc>(context).add(FetchDataEvent());
            return Scaffold(
              body: Center(
                child: Image.asset(
                  ImageConstants.instance.splashIcon,
                ),
              ),
            );
          } else if (state is LoadedState) {
            return AppWidget(
              dogList: state.dogList,
              dogsImageUrls: state.dogImageUrls,
            );
          } else if (state is FailedState) {
            return Scaffold(
              body: Center(
                child: Image.asset(
                  ImageConstants.instance.splashIcon,
                ),
              ),
            );
          }

          return Container(
            color: Colors.white,
            child: Image.asset(
                    ImageConstants.instance.splashIcon,
                  ),
          );
        },
      ),
    );
  }
}
