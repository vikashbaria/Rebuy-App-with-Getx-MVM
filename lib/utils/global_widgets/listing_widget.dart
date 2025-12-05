import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/listing_controller/listing_screen.dart';
import 'package:rebay/models/listings.dart';
import 'package:rebay/utils/font.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;
  final int index;

  const ListingCard({super.key, required this.listing, required this.index});

  @override
  Widget build(BuildContext context) {
    final ListingController controller = Get.find<ListingController>();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(listing.avatarUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listing.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.secondaryFont,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        listing.location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
          ),

          Stack(
            children: [
              Container(
                width: double.infinity,
                color: Color.fromRGBO(193, 131, 159, 0.25),

                child: Image.network(listing.imageUrl, height: 240),
              ),
              Positioned(
                bottom: 12,
                right: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      controller.toggleFavorite(index);
                    },
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listing.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.secondaryFont,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${listing.make} • ${listing.year}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  listing.price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
