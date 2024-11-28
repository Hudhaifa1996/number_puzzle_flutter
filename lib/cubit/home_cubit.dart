import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<int> slideWeight = [32,4,1,16,2,8];
  int slideNumber = 1;
  int result = 0;
  void incSlideNumber ()
  {
    slideNumber++;
    if (slideNumber == 8)
    {emit (HomeEnd());}
        else
          {emit (HomeMiddle());}
  }

void repeat ()
{
  slideNumber = 1;
  result = 0;
  emit(HomeInitial());
}
}
