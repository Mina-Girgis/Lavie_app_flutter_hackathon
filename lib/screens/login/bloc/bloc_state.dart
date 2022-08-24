part of 'bloc_cubit.dart';

@immutable
abstract class BlocState {}

class BlocInitial extends BlocState {}

class ChangeTextIndexSuccess extends BlocState {}

class LoginSuccess extends BlocState {}

class LoginFail extends BlocState {}

class SignupSuccess extends BlocState {}

class SignupFail extends BlocState {}


class ChangeCurrentUser extends BlocState {}

class ClearControllers extends BlocState {}


class GetAllDataMethod extends BlocState {}




class GetCurrentUserFromServerSuccess extends BlocState {}


class GetCurrentUserFromServerFail extends BlocState {}




