import 'package:aklk_3ndna/features/all_meals/presentaion/views/search_view.dart';
import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => SearchView()),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
                const SizedBox(width: 5),
                Text('Search for meal'),
                const Spacer(),
                const Icon(Icons.filter_list_sharp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
