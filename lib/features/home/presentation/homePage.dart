import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:provider/provider.dart';

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
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  titel: 'محبوب ترین هتل ها',
                  hotels: homeProvider.getPopularHotels(),
                  oneSeeAllPressed: () {},
                );
              },
            ),
            // -----------------pishnehad vizhe roz-------
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  titel: 'پیشنهاد ویژه روز',
                  hotels: homeProvider.getSpecialOffersHotels(),
                  oneSeeAllPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
