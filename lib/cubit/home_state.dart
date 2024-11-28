part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeMiddle extends HomeState {}

final class HomeEnd extends HomeState {}
