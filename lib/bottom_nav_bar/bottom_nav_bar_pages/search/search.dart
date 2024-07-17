import 'package:flutter/material.dart';

import '../home/widgets/search_items.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            SearchItems(),
          ],
        ),
      ),
    );
  }
}
