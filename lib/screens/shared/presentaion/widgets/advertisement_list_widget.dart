import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/route_names.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

class AdvertisementListWidget extends StatefulWidget {
  const AdvertisementListWidget({
    required this.data,
    this.showStatus = false,
    this.onScrollReachedEnd,
    this.onRefresh,
    super.key,
  });

  final List<Advertisement> data;
  final bool showStatus;
  final VoidCallback? onScrollReachedEnd;
  final Future<void> Function()? onRefresh;

  @override
  State<AdvertisementListWidget> createState() =>
      _AdvertisementListWidgetState();
}

class _AdvertisementListWidgetState extends State<AdvertisementListWidget> {
  late List<Advertisement> data = List.from(widget.data);
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.onScrollReachedEnd?.call();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh ?? () async => Future.value(),
      child: ListView.builder(
        itemCount: data.length,
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return AdvertisementItem(
            showStatus: widget.showStatus,
            advertisement: data[index],
            onTap: () async {
              final updatedAd = await context.pushNamed<Advertisement?>(
                RouteNames.advertisementDetails,
                extra: data[index],
              );
              if (updatedAd != null) {
                setState(() {
                  data[index] = updatedAd;
                });
              }
            },
          )
              .animate()
              .fade()
              .scaleXY(begin: 0.7, duration: 200.ms)
              .then(delay: 200.ms)
              .shimmer();
        },
      ),
    );
  }
}
