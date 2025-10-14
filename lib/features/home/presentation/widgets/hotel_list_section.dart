import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';

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
      ],
    );
  }
}
