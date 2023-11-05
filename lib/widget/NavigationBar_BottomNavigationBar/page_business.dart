import 'package:flutter/material.dart';

class Business extends StatefulWidget {
  final Color? color;
  const Business({super.key, this.color});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BUSINESS'),
            backgroundColor:  widget.color ?? Colors.teal
        ),
        body: Center(
          child: Text('Business',style: Theme.of(context).textTheme.headline4),
        )
    );
  }
}
