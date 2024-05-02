import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instapound/components/ExpandableText.dart';
import 'package:instapound/components/IconWithLabel.dart';
import 'package:instapound/utils/Constants.dart';
import 'package:instapound/utils/Utils.dart';

class PostView extends StatefulWidget {
  const PostView({
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
    this.onPressed,
    this.onMenuPressed,
    this.onLikePressed,
    this.onCommentPressed,
    this.onSharePressed,
    this.onSavePressed,
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

  final VoidCallback? onPressed;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onLikePressed;
  final VoidCallback? onCommentPressed;
  final VoidCallback? onSharePressed;
  final VoidCallback? onSavePressed;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  bool isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
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
          GestureDetector(
            onTap: () {
              print("from ${"image_tag_${widget.id}"}");
              widget.onPressed?.call();
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 42),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withAlpha(200),
                    isDescriptionExpanded
                        ? Colors.black.withAlpha(200)
                        : Colors.black.withAlpha(100),
                    isDescriptionExpanded
                        ? Colors.black.withAlpha(200)
                        : Colors.black.withAlpha(0),
                    Colors.black.withAlpha(200),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInfoRow(context, "userinfo_tag_${widget.id}"),
                  const SizedBox(height: 16),
                  Flexible(
                    child: ExpandableText(
                      text: longText,
                      isExpanded: isDescriptionExpanded,
                      onPressed: () {
                        setState(() =>
                            isDescriptionExpanded = !isDescriptionExpanded);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 24,
            right: 24,
            child: ActionButtonsRow(context),
          )
        ],
      ),
    );
  }

  Widget UserInfoRow(BuildContext context, String heroTag) {
    return Hero(
      tag: heroTag,
      child: Row(
        children: [
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
            onPressed: widget.onMenuPressed,
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
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
          )
        ],
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: IconButton(
              onPressed: widget.onLikePressed,
              icon: IconWithLabel(
                icon: widget.isLiked
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                label: getCountText(widget.likesCount),
                color: widget.isLiked ? Colors.red : Colors.grey.shade800,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: IconButton(
              onPressed: widget.onCommentPressed,
              icon: IconWithLabel(
                icon: CupertinoIcons.bubble_left,
                label: getCountText(widget.commentsCount),
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: widget.onSharePressed,
              icon:
                  Icon(CupertinoIcons.paperplane, color: Colors.grey.shade800),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: widget.onSavePressed,
              icon: Icon(
                widget.isSaved
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
