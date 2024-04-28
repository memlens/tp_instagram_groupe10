import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/story_item.dart';
import '../widgets/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Map<String, String>> stories = [
    {'name': 'Votre story', 'imageUrl': 'assets/images/story1.jpg'},
    {'name': 'leo_prono_spor', 'imageUrl': 'assets/images/story2.jpg'},
    {'name': 'gazo.team.officiel', 'imageUrl': 'assets/images/story3.jpg'},
    {'name': 'sidiki_diabate', 'imageUrl': 'assets/images/story4.jpg'},
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'imageUrl': 'assets/images/post1.jpg',
      'userName': 'André Lover',
      'userImage': 'assets/images/user1.jpg',
      'caption': 'Couché de soleil dans la chambre.',
      'song': 'Song 1',
      'likes': 123,
    },
    {
      'imageUrl': 'assets/images/post2.jpg',
      'userName': 'Stacy Travel',
      'userImage': 'assets/images/user2.jpg',
      'caption': 'Je profite des vacances sur la plage. Tema ce couché de soleil!!',
      'song': 'Song 2',
      'likes': 456,
    },
    {
      'imageUrl': 'assets/images/post3.jpg',
      'userName': "John l'explorateur",
      'userImage': 'assets/images/user3.jpg',
      'caption': 'Notre planète est magnifique',
      'song': 'Song 3',
      'likes': 1022,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          'assets/images/instagram_logo.svg',
          height: 35,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final story in stories)
                    StoryItem(
                      name: story['name'] ?? 'Michy',
                      imageUrl: story['imageUrl'] ?? 'assets/images/default_story.jpg',
                      showPlus: story['name'] == 'Votre story',
                    ),
                ],
              ),
            ),
            for (final post in posts)
              PostItem(
                imageUrl: post['imageUrl'],
                userName: post['userName'],
                userImage: post['userImage'],
                caption: post['caption'],
                song: post['song'],
                likes: post['likes'],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                  'https://source.unsplash.com/random/300x400?img=67'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
