import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_card.dart';

class HotelListSection extends StatelessWidget {
  final String titel;
  final List<Hotel> hotels; //مشاهده همه هتل ها
  final VoidCallback? oneSeeAllPressed;

  const HotelListSection({
    super.key,
    required this.titel,
    required this.hotels,
    this.oneSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'مشاهده همه',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(titel, style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
        ),
        SizedBox(
          height: 360,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 16),
            reverse: true,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: HotelCard(hotel: hotels[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
