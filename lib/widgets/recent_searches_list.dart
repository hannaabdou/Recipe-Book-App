import 'package:flutter/material.dart';

class RecentSearchesList extends StatelessWidget {
  final List<String> recentSearchesList;
  final Function(String) onSearchTap;

  const RecentSearchesList({
    Key? key,
    required this.recentSearchesList,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recentSearchesList.isEmpty
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Search',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  child: Column(
                    children: recentSearchesList.map((search) {
                      return ListTile(
                        title: Text(search),
                        onTap: () {
                          onSearchTap(search);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
  }
}
