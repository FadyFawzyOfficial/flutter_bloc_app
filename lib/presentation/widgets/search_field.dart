import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onChange;

  const SearchField(
      {Key? key, required this.onChange, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Seach Field Build');
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        hintText: 'Find a Character...',
      ),
      onChanged: onChange,
    );
  }
}
