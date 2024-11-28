import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/home.dart';
import 'cubit/home_cubit.dart';

void main() =>
    runApp(BlocProvider(
      create: (context) => HomeCubit(),
      child: const MaterialApp(
        home: Home(),
      ),
    ));

