import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedPlaceholderImage(String url, {double? w, double? h}) {
  return CachedNetworkImage(
    imageUrl: url,
    width: w,
    height: h,
    fit: BoxFit.cover,
    // placeholder: (context, url) => Container(color: Colors.grey[200]),
    progressIndicatorBuilder: (context, url, progress) {
      return Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      );
    },
    errorWidget: (context, url, err) => const Icon(Icons.error),
  );
}
