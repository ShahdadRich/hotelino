import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/features/home/presentation/widgets/search_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            SearchBarWidget(),
            SizedBox(height: 16),
            AdBanner(),
          ],
        ),
      ),
    );
  }
}
