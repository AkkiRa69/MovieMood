import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 3, // Number of lines to show before truncating
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: isExpanded ? 10 : widget.maxLines,
          textAlign: TextAlign.left,
          text: TextSpan(
            style: const TextStyle(
              color: Colors.white70,
              height: 1.3,
            ),
            children: [
              TextSpan(text: widget.text),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "Read less" : "Read more",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
