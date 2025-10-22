import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formatter.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';

class HotelCardVertical extends StatelessWidget {
  final Hotel hotel;
  const HotelCardVertical({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              spreadRadius: 2,
            )
          else
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHigh.withValues(alpha: 1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12, left: 12),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('رزو هتل', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 4),
                  Text(
                    hotel.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${hotel.city} , ${hotel.country}'),
                      SizedBox(width: 5),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${hotel.bedType.type} , ${hotel.bedType.count}'),
                      SizedBox(width: 5),
                      Icon(
                        Icons.bed_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(' از ${formatPrice(hotel.pricePerNight)} / شب '),
                  SizedBox(height: 4),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.network(
              networkUrl(hotel.images[0]),
              width: 100,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
