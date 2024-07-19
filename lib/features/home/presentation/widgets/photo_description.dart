import 'package:flutter/material.dart';

class PhotoDescriptionWidget extends StatelessWidget {
  const PhotoDescriptionWidget({
    required this.caption,
    required this.desctiption,
    super.key,
  });
  final String caption;
  final String desctiption;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caption,
            style: TextStyle(
              letterSpacing: 0.5,
              fontSize: 16,
              height: 24 / 16,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            desctiption,
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 0.25,
              height: 18 / 14, // sorry, but 20/14 is out of bounds
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
