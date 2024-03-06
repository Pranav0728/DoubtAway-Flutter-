import 'package:doubtaway/UiHelper.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Textbook> textbooks = [
    Textbook(
      title: 'ICAE',
      image: 'assets/images/textbook1.jpg', // Replace with your image path
    ),
    Textbook(
      title: 'Construction',
      image: 'assets/images/textbook2.jpg', // Replace with your image path
    ),
    Textbook(
      title: 'Amjith',
      image: 'assets/images/textbook3.jpg', // Replace with your image path
    ),
    Textbook(
      title: 'BEE',
      image: 'assets/images/textbook4.jpeg', // Replace with your image path
    ),
    Textbook(
      title: 'Design',
      image: 'assets/images/textbook5.jpeg', // Replace with your image path
    ),
    Textbook(
      title: 'Mechanical',
      image: 'assets/images/textbook6.jpg', // Replace with your image path
    ),
    // Add more textbooks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: myCustomColor, // Change to your custom color
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          childAspectRatio: 100 / 130, // Width / Height ratio of each item
        ),
        itemCount: textbooks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // Adjust elevation as needed
            margin: EdgeInsets.all(8), // Adjust margin as needed
            child: Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 100,
                  child: Image.asset(
                    textbooks[index].image,
                    // fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textbooks[index].title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Textbook {
  final String title;
  final String image;

  Textbook({required this.title, required this.image});
}
