import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/widgets/home_appbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeAppbar(), body: Center());
  }
}
