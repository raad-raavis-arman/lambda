import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:landa/core/resources/resources.dart';

class AdvertisementImage extends StatelessWidget {
  const AdvertisementImage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        kIsWeb ? '$corsProxyUrl/$imageUrl' : imageUrl,
        headers: const {
          'origin': '*',
        },
        width: 80,
        height: 80,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
      ),
    );
  }
}
