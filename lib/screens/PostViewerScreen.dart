import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instapound/components/IconWithLabel.dart';
import 'package:instapound/utils/Utils.dart';

class PostViewerScreen extends StatefulWidget {
  const PostViewerScreen({
    super.key,
    required this.id,
    required this.image,
    required this.likesCount,
    required this.commentsCount,
    required this.userImage,
    required this.username,
    required this.location,
    required this.isLiked,
    required this.isSaved,
  });

  final int id;
  final String image;
  final int likesCount;
  final int commentsCount;

  final String userImage;
  final String username;
  final String location;

  final bool isLiked;
  final bool isSaved;

  @override
  State<PostViewerScreen> createState() => _PostViewerScreenState();
}

class _PostViewerScreenState extends State<PostViewerScreen> {
  @override
  void initState() {
    print("To ${"image_tag_${widget.id}"}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: UserInfoRow(context, "userinfo_tag_${widget.id}"),
              ),
              Expanded(
                child: Hero(
                  tag: "image_tag_${widget.id}",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ActionButtonsRow(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget UserInfoRow(BuildContext context, String heroTag) {
    return Hero(
      tag: heroTag,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 0),
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.userImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(18)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.ellipsis_circle,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget ActionButtonsRow(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.black,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withAlpha(20),
        //     blurRadius: 20,
        //   )
        // ],
        //borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: IconButton(
              onPressed: () {},
              icon: IconWithLabel(
                icon: widget.isLiked
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                label: getCountText(widget.likesCount),
                color: widget.isLiked ? Colors.red : Colors.white,
                labelColor: Colors.white,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: IconButton(
              onPressed: () {},
              icon: IconWithLabel(
                icon: CupertinoIcons.bubble_left,
                label: getCountText(widget.commentsCount),
                color: Colors.white,
                labelColor: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                widget.isSaved
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
