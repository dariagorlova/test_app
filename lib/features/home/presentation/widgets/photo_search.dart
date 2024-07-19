import 'package:flutter/material.dart';
import 'package:test_app/features/home/index.dart';

class PhotoSearchDelegate extends SearchDelegate<String> {
  final List<HomeData> data;

  PhotoSearchDelegate({required this.data});

  @override
  String get searchFieldLabel => 'Search';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.close,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredData = data
        .where(
            (d) => d.photographer.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return filteredData.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return TileWidget(
                  data: filteredData[index],
                );
              },
            ),
          )
        : const Column(
            children: [
              SizedBox(height: 72),
              Text('No item found'),
            ],
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? data
        : data
            .where((d) =>
                d.photographer.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return suggestionList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: suggestionList.length,
              itemBuilder: (context, index) {
                return TileWidget(
                  data: suggestionList[index],
                );
              },
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 72, width: double.infinity),
              Text(
                'No item found',
                style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.secondary),
                textAlign: TextAlign.center,
              ),
            ],
          );
  }
}
