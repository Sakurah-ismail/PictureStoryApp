import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        fontFamily:'IndieFlower' ,
        primarySwatch: Colors.purple,
      ),
      home: StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text(
            'Story Library :)',
                style:TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.purple.shade900,
                ) ,
        ),
        backgroundColor:Colors.pink.shade100,
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
FlutterTts flutterTts=FlutterTts();
class StoryViewerScreen extends StatelessWidget {
  final Story story;

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontFamily:'IndieFlower',fontSize: 35),
              ),
            ),

            ElevatedButton(
              onPressed: _speak ,



              child: Text(

                'Read Aloud ^__^',
                style: TextStyle(
                  color: Colors.pink.shade50,

                ),


              ),


            ),
          ],
        ),
      ),
    );

  }
  void _speak() async
  {
    await flutterTts.speak(story.content);
  }
}


class Story {
  final String title;
  final String coverImage;
  final String content;

  Story( {required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'Enchanted Forest Treasure Hunt',
    coverImage: 'images/story1_1.jpeg',
    content: 'In a magical forest, a brave group of animal friends embarked on an incredible adventure. Led by a clever squirrel named Sammy, they journeyed through towering trees, crossed bubbling streams, and solved riddles to find the fabled Rainbow Crystal. This legendary gem was said to grant wishes, and the friends hoped to use it to bring harmony to their forest home. Along the way, they encountered talking birds, mischievous fairies, and a wise old owl who helped them navigate the challenges of their epic quest. With teamwork and courage, they reached the hidden crystal, and together, they made a heartfelt wish to fill their forest with laughter and love, ensuring endless adventures for years to come.',
  ),
  Story(
    title: 'On A Rainy Day!',
    coverImage: 'images/story2.jpeg',
    content: 'Deep in the heart of a mysterious forest, a group of intrepid kids stumbled upon a hidden cave. Inside, they uncovered a cryptic map that led to a long-lost treasure. Excitement filled their hearts as they embarked on a treacherous journey, encountering secret traps, enigmatic riddles, and a shadowy figure determined to steal the treasure for themselves. With courage and cunning, the young adventurers unraveled the mystery and outwitted the villain, securing the hidden riches and learning that true friendship and bravery were the greatest treasures of all.',
  ),
  Story(
    title: 'Spirited Away!',
    coverImage: 'images/story1.jpeg',
    content: 'In a land where dreams came to life, a curious child discovered a key that unlocked the door to endless enchantment.As the child turned the key, a magnificent portal of shimmering light emerged before them, inviting them into a world beyond imagination. Stepping through, they found themselves in a realm where talking animals and sentient trees were their companions, and the air was filled with the sweet melodies of enchanted songbirds. Each day brought new wonders, from flying on the backs of friendly dragons to picnicking on clouds. Yet, as time passed, the child realized that in this world, dreams could manifest as vividly as nightmares. With the key as their only means of return, they embarked on a quest to find the heart of this enchantment and discovered that it lay within themselves. They learned that dreams, whether wondrous or daunting, were the essence of their own spirit, and by embracing them, they could shape their world into a tapestry of endless enchantment, forever guiding their adventures and creating their own magical destiny.',
  ),
  // Add more stories here
];
