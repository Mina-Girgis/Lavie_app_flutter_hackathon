part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class getPlantsDataSuccess extends HomeState {}

class getPlantsDataFail extends HomeState {}

class getSeedsDataSuccess extends HomeState {}

class getSeedsDataFail extends HomeState {}

class getToolsDataSuccess extends HomeState {}

class getToolsDataFail extends HomeState {}

class getProductsDataSuccess extends HomeState {}

class getProductsDataFail extends HomeState {}

class Counterplueplus extends HomeState {}

class AddtoCartSuccess extends HomeState {}

class RemoveFromCartSuccess extends HomeState {}


class ChangeBottomNavBarIndex extends HomeState {}

class changeCategoriesIndexSuccess extends HomeState {}


class PostFreeSeedsSuccess extends HomeState {}


class PostFreeSeedsFail extends HomeState {}


class ChangeTotalPrice extends HomeState {}




// getPlantsData