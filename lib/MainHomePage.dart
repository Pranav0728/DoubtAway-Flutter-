import 'package:doubtaway/UiHelper.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<Post> posts = [
    Post(
      username: 'Priya Sharma',
      profileImagePath: 'assets/images/b.jpg',
      imagePath: 'assets/images/post3.jpeg',
      likes: 10,
      comments: 5,
    ),
    Post(
      username: 'Rohit Kumar',
      profileImagePath: 'assets/images/a.jpg',
      imagePath: 'assets/images/post1.png',
      likes: 20,
      comments: 15,
    ),
    Post(
      username: 'Ayush Jagtap',
      profileImagePath: 'assets/images/c.jpg',
      imagePath: 'assets/images/poat2.jpg',
      likes: 20,
      comments: 15,
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DoubtAway",
          style: TextStyle(color: Colors.white, fontFamily: "Helvetica2"),
        ),
        backgroundColor: myCustomColor, // Change to your custom color
      ),
      body: Container(
        // color: myCustomColor,
        child: ListView.builder(
          // padding: EdgeInsets.all(0),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              post: posts[index],
            );
          },
        ),
      ),
    );
  }
}

class Post {
  final String username;
  final String profileImagePath;
  final String imagePath;
  final int likes;
  final int comments;

  Post({
    required this.username,
    required this.profileImagePath,
    required this.imagePath,
    required this.likes,
    required this.comments,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(post.profileImagePath),
              ),
              title: Text(
                post.username,
                style: TextStyle(color: myCustomColor),
              ),
            ),
            Image.asset(
              post.imagePath,
              fit: BoxFit.cover, // Adjust the image fit as needed
              width: double.infinity, // Adjust the image width as needed
              // height: 300, // Adjust the image height as needed
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: myCustomColor,
                      ),
                      onPressed: () {
                        // Implement like functionality
                      },
                    ),
                    Text(
                      '${post.likes} likes',
                      style: TextStyle(
                        color: myCustomColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.comment,
                        color: myCustomColor,
                      ),
                      onPressed: () {
                        // Implement comment functionality
                      },
                    ),
                    Text(
                      '${post.comments} comments',
                      style: TextStyle(
                        color: myCustomColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
