import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled25/post.dart';

class AllPostsPage extends StatefulWidget {
  @override
  _AllPostsPageState createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  List<Post> _posts = [];

  void _addPost(Post post) {
    setState(() {
      _posts.add(post);
    });

    // Navigate back to the AllPostsPage after adding the post
    Navigator.pop(context);

    // Show a snackbar to indicate the successful post
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Post added successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange[100],
        title: Row(
          children: [
            Text('Home',style: TextStyle(color: Colors.black),),
            Spacer(),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.notifications_none_outlined,color: Colors.black,))
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return PostPreview(
            text: post.text,
            images: post.images,
            video: post.video,
          );
        },
      ),
      floatingActionButton: Container(
        width: 130,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(
                  addPost: _addPost,
                  posts: _posts,
                ),
              ),
            );
          },
          backgroundColor: Colors.black,
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Icon(Icons.add),
              SizedBox(width: 5.w),
              Text('Add Post'),
            ],
          ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),)
        ),
      ),
    );
  }
}