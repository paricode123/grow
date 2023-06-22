import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Post {
  final String text;
  final List<File> images;
  final File? video;

  Post({required this.text, required this.images, this.video});
}

class PostPage extends StatefulWidget {
  final void Function(Post) addPost;
  final List<Post> posts;

  PostPage({required this.addPost, required this.posts});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<File> _selectedImages = [];
  File? _selectedVideo;
  TextEditingController _textEditingController = TextEditingController();

  VideoPlayerController? _videoController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network('');
    _initializeVideoPlayerFuture = _videoController!.initialize();
  }

  @override
  void dispose() {
    _videoController!.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _pickVideo(ImageSource source) async {
    final pickedFile = await ImagePicker().pickVideo(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedVideo = File(pickedFile.path);
        _videoController = VideoPlayerController.file(_selectedVideo!);
        _initializeVideoPlayerFuture = _videoController!.initialize();
      });
    }
  }

  void _post() {
    final text = _textEditingController.text;
    final images = _selectedImages;
    final video = _selectedVideo;

    final newPost = Post(text: text, images: images, video: video);

    // Call the addPost callback to add the new post
    widget.addPost(newPost);

    // Clear the selected data
    setState(() {
      _textEditingController.text = '';
      _selectedImages.clear();
      _selectedVideo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange[100],
        title: Text('Add Post',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter your post text...',
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Add Images:-',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Curve the corners
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue.shade800, // Border color
                        width: 2, // Border width
                      ),// Change the background color
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 0.0,horizontal: 15),
                      child: IconButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: Icon(Icons.add_a_photo_outlined,color: Colors.blue.shade800,),
                        color: Colors.white, // Change the icon color
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.file(_selectedImages[index]),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                children: [
                  Text(
                    'Video:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Curve the corners
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue.shade800, // Border color
                        width: 2, // Border width
                      ),// Change the background color
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 0.0,horizontal: 15),
                      child: IconButton(
                        onPressed: () => _pickVideo(ImageSource.gallery),
                        icon: Icon(Icons.video_call,color: Colors.blue.shade800,),
                        color: Colors.white, // Change the icon color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_selectedVideo != null)
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _videoController!.value.aspectRatio,
                      child: VideoPlayer(_videoController!),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            Divider(),
            SizedBox(height: 100.h,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _post,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Change the background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Curve the corners
                        ),
                      ),
                      child: Text('Post',style: TextStyle(fontSize: 16.sp),),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostPreview extends StatelessWidget {
  final String text;
  final List<File> images;
  final File? video;

  PostPreview({required this.text, required this.images, this.video});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(text),
          ),
          if (images.isNotEmpty)
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.file(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          if (video != null)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(
                VideoPlayerController.file(
                  File(video!.path),
                ),
              ),
            ),
          ButtonBar(
            children: [
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up_rounded),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.comment),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}






