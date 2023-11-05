import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  final Color? color;
  const SchoolPage({super.key,this.color});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SCHOOL'),
            backgroundColor: widget.color ?? Colors.teal
        ),
        body: Center(
          child: Text('SchoolPage',style: Theme.of(context).textTheme.headline4),
        )
    );
  }
}
