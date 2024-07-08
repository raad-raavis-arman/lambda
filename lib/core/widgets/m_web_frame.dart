import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MWebFrame extends StatelessWidget {
  const MWebFrame({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return child;
    } else {
      return Material(
        color: const Color(0xFF006A6A),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
              minHeight: double.infinity,
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    size: Size(constraint.maxWidth, constraint.maxHeight),
                  ),
                  child: child,
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
