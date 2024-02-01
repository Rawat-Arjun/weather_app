import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_json/provider/data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<DataProvider>();
    provider.fetchData();
    TextEditingController search = TextEditingController();

    return Consumer(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search City'),
            elevation: 10,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onTap: provider.testFieldOnTap(),
                  onChanged: provider.buildList(searchText: search.text),
                  controller: search,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          search.clear();
                        },
                        child: const Icon(Icons.clear)),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.cities.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              context
                                  .read<DataProvider>()
                                  .getData(provider.cities[index]);

                              Navigator.of(context).pushNamed('weather');
                            },
                            title: Text(
                              provider.newList[index]['name'],
                            ),
                            trailing: const Icon(Icons.arrow_back),
                          ),
                          const Divider(
                            thickness: 1,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
