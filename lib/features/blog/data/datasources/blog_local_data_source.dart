import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:hive/hive.dart';

abstract interface class BlogLocalDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});
  List<BlogModel> loadLocalBlogs();
}

class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  final Box box;
  BlogLocalDataSourceImpl({
    required this.box,
  });

  @override
  List<BlogModel> loadLocalBlogs() {
    List<BlogModel> loadedBlogs = [];

    box.read(
      () {
        for (var i = 0; i < box.length; i++) {
          loadedBlogs.add(BlogModel.fromJson(box.get(i.toString())));
        }
      },
    );
    return loadedBlogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();
    box.write(() {
      blogs.asMap().forEach((index, blog) {
        box.put(index.toString(), blog.toJson());
      });
    });
  }
}
