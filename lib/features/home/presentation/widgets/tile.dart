import 'package:flutter/material.dart';
import 'package:test_app/features/home/index.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    required this.data,
    this.isFirstForGroup,
    super.key,
  });

  final HomeData data;
  final bool? isFirstForGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        height: 88,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFirstForGroup != null)
              SizedBox(
                width: 48,
                child: Visibility(
                  visible: isFirstForGroup!,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      data.photographer[0],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data.url,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      PhotoDescriptionWidget(
                        caption: data.photographer,
                        desctiption: data.alt ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
