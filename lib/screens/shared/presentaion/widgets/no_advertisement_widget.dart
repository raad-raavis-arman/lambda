import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/route_names.dart';
import 'package:landa/core/widgets/m_text.dart';
import 'package:landa/l10n/l10n.dart';

class NoAdvertisementWidget extends StatelessWidget {
  const NoAdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MText(
            text: context.l10n.thereIsNoAdToShow,
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              context.goNamed(RouteNames.createAdvertisement);
            },
            child: MText(
              text: context.l10n.createAdvertisement,
            ),
          ),
        ],
      ),
    );
  }
}
