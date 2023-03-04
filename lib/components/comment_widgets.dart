import 'package:flutter/material.dart';

class Comment {
  final String text;
  final List<Comment>? replies;
  final String avatarUrl;
  final String username;
  final String commentTime;
  final int commentStar;
  final List<String>? commentPictures;

  Comment({
    required this.text,
    this.replies,
    required this.avatarUrl,
    required this.username,
    required this.commentTime,
    required this.commentStar,
    this.commentPictures,
  });
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(comment.avatarUrl),
          ),
          title: Text(comment.username),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.commentTime),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 4),
                  Text(comment.commentStar.toString()),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(comment.text),
        ),
        if (comment.commentPictures != null && comment.commentPictures!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: comment.commentPictures!
                  .map((url) => Image.network(
                url,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ))
                  .toList(),
            ),
          ),
        if (comment.replies != null && comment.replies!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var reply in comment.replies!)
                  CommentWidget(comment: reply),
              ],
            ),
          ),
      ],
    );
  }
}

class CommentListWidget extends StatelessWidget {
  final List<Comment> comments;

  const CommentListWidget({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        var comment = comments[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommentWidget(comment: comment),
            if (comment.replies != null && comment.replies!.isNotEmpty)
              ExpansionTile(
                title: Text('Replies (${comment.replies!.length})'),
                children: [
                  for (var reply in comment.replies!)
                    CommentWidget(comment: reply),
                ],
              ),
            const Divider(),
          ],
        );
      },
    );
  }
}
