import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/widgets/search_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'هتل های مورد علاقه',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            SearchBarWidget(hintText: 'جستجو هتل های مورد علاقه'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
