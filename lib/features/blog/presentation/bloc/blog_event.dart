part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUploadEvent extends BlogEvent {
  final File image;
  final String title;
  final String content;
  final String userID;
  final List<String> topics;

  BlogUploadEvent({
    required this.image,
    required this.title,
    required this.content,
    required this.userID,
    required this.topics,
  });
}

final class BlogFetchAllBlogs extends BlogEvent {}
