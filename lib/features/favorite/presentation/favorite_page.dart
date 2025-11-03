import 'package:flutter/material.dart';
import 'package:hotelino/features/favorite/presentation/widgets/favorite_hotel_card.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_proovider.dart';
import 'package:hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:provider/provider.dart';

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
            Consumer<FavoriteItemProovider>(
              builder: (context, favoriteItem, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: favoriteItem.favoritHotelsId.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      child: FavoriteHotelCard(
                        hotel: favoriteItem.favoritHotelsId[index],
                        onRemovedHotelCard: (hotelId) {
                          favoriteItem.toggelFavoritItem(hotelId);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                if (profileProvider.recentlyViweHotels.isEmpty) {
                  return HotelListSection(
                    titel: 'بازدید های اخیر',
                    hotels: profileProvider.recentlyViweHotels,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
