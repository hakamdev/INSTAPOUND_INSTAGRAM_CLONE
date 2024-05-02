import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instapound/screens/PostViewerScreen.dart';
import 'package:instapound/utils/NavigationTools.dart';
import 'package:instapound/views/PostView.dart';
import 'package:instapound/views/StoriesView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          InstaAppBar(),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverToBoxAdapter(
            child: StoriesView(count: 30),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return PostView(
                  id: index,
                  image:
                      "https://picsum.photos/${1200 + index}/${1200 + index}",
                  userImage:
                      "https://picsum.photos/${400 + index}/${400 + index}",
                  username: "Hakam $index",
                  location: "at Um6p University",
                  likesCount: 1431200,
                  commentsCount: 25421,
                  isLiked: index % 2 == 0,
                  isSaved: index % 3 == 0,
                  onPressed: () {
                    goToScreen(
                        context,
                        PostViewerScreen(
                          id: index,
                          image:
                              "https://picsum.photos/${2000 + index}/${2000 + index}",
                          userImage:
                              "https://picsum.photos/${400 + index}/${400 + index}",
                          username: "Hakam $index",
                          location: "at Um6p University",
                          likesCount: 1431200,
                          commentsCount: 25421,
                          isLiked: index % 2 == 0,
                          isSaved: index % 3 == 0,
                        ));
                  },
                  onMenuPressed: () {},
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  SliverAppBar InstaAppBar() {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      title: Image.asset(
        "assets/instagram_text_logo.png",
        height: 40,
        fit: BoxFit.contain,
      ),
      centerTitle: false,
      snap: true,
      floating: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.camera),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.paperplane),
        ),
      ],
    );
  }
}
