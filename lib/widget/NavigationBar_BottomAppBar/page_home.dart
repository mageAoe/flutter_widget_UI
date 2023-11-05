import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Color? color;
  const HomePage({super.key,this.color});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
            backgroundColor: widget.color ?? Colors.teal
        ),
        body: Center(
          child: Text('HomePage',style: Theme.of(context).textTheme.headlineMedium),
        )
    );
  }
}
