import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/home/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeData>? data;
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('List page'),
        actions: [
          IconButton(
              onPressed: () => _searchPressed(context, data ?? []),
              icon: Icon(
                Icons.search,
                size: 24,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ))
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeProcess || state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeFailure) {
            return Center(
              child: Text(state.message, style: const TextStyle(fontSize: 24)),
            );
          }

          data = (state as HomeSuccess).data;

          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return TileWidget(
                    data: data![index],
                    isFirstForGroup: index == 0 ||
                        data![index].photographer[0] !=
                            data![index - 1].photographer[0],
                  );
                }),
          );
        }),
      ),
    );
  }

  void _searchPressed(BuildContext context, List<HomeData> data) {
    showSearch(
      context: context,
      delegate: PhotoSearchDelegate(data: data), // Pass your search data source
    );
  }
}
