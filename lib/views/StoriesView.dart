import 'package:flutter/material.dart';
import 'package:instapound/components/StoryAddButton.dart';
import 'package:instapound/components/StoryButton.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const StoryAddButton();
            } else {
              return StoryButton(
                  image: "https://picsum.photos/${300 + index}/${300 + index}");
            }
          },
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemCount: count + 1 // +1 for first add story button.
          ),
    );
  }
}
