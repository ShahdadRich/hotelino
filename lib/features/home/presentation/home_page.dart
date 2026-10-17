import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_vertical_list.dart';
import 'package:hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:hotelino/features/home/presentation/widgets/story_carousel.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const SearchBarWidget(hintText: 'جستجوی هتل ها...'),
            const SizedBox(height: 16),
            const AdBanner(),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  titel: 'محبوب ترین هتل ها',
                  hotels: homeProvider.getPopularHotels(),
                  oneSeeAllPressed: () {},
                );
              },
            ),
            // -----------------pishnehad vizhe roz------------------------------
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  titel: 'پیشنهاد ویژه روز',
                  hotels: homeProvider.getSpecialOffersHotels(),
                  oneSeeAllPressed: () {},
                );
              },
            ),
            const SizedBox(height: 16),
            // --------------------------Story carousel--------------------------
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  image: homeProvider.getStoryImage(),
                  titel: homeProvider.storyTitel,
                );
              },
            ),
            const SizedBox(height: 16),
            // -----------------------------Hotel list vertical-------------------
            Consumer<HomeProvider>(
              builder: (context, homeprovider, child) {
                return HotelVerticalList(
                  titlel: 'جدید ترین هتل ها',
                  hotels: homeprovider.getNewestHotels(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
