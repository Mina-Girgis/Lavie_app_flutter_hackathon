part of 'blog_cubit.dart';

@immutable
abstract class BlogState {}

class BlogInitial extends BlogState {}
class getBlogsDataSuccess extends BlogState {}
class getBlogDataFail extends BlogState {}




