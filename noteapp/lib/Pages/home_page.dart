import 'package:flutter/material.dart';
import 'package:noteapp/widgets/custome_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 35),
          CustomAppBar(),
        ],
      ),
    ));
  }
}
