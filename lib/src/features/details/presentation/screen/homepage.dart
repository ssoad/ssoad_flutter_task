import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';



class RepositoryDetails extends StatelessWidget {
  const RepositoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryDetailsCubit, RepositoryDetailsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Repository Details'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        ),

      );
    });
  }
}

