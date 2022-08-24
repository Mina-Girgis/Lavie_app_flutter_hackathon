part of 'forums_cubit.dart';

@immutable
abstract class ForumsState {}

class ForumsInitial extends ForumsState {}


class GetForumsDataSuccess extends ForumsState {}

class GetForumsDataFail extends ForumsState {}

class ChangeTitelsIndexSuccess extends ForumsState {}


class ChangeaddPhotoIndex extends ForumsState {}


class PostForumDataSuccess extends ForumsState {}


class PostForumDataFail extends ForumsState {}

class ChangePhotoBase64Succeess extends ForumsState {}


class GetSearchForumsDataSuccess extends ForumsState {}

class GetSearchForumsDataFail extends ForumsState {}







