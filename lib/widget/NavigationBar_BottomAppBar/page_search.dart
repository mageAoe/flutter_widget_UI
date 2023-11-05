import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Color? color;
  const SearchPage({super.key,this.color});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('SEARCH'),
            backgroundColor: widget.color ?? Colors.teal
        ),
        body: Center(
          child: Text('SearchPage',style: Theme.of(context).textTheme.headline4),
        )
    );
  }
}
