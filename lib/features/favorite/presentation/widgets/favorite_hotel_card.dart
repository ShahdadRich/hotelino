import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formatter.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';

class FavoriteHotelCard extends StatelessWidget {
  final Hotel hotel;
  Function(String) onRemovedHotelCard;
  FavoriteHotelCard({
    super.key,
    required this.hotel,
    required this.onRemovedHotelCard,
  });

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
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'رزو اتاق',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(height: 4),
                      Text(
                        hotel.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${hotel.city} , ${hotel.country}'),
                          SizedBox(width: 5),
                          Icon(
                            Icons.location_on_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${hotel.bedType.type}, ${hotel.bedType.count}'),
                          SizedBox(width: 5),
                          Icon(
                            Icons.bed_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text('از ${formatPrice(hotel.pricePerNight)} / شب'),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
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
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => onRemovedHotelCard(hotel.id),
              child: Icon(Icons.favorite, color: Colors.red, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
