import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class MPopup extends StatelessWidget {
  const MPopup({
    required this.title,
    required this.description,
    super.key,
    this.buttonLabel,
    this.onButtonClick,
  });

  final String title;
  final String description;
  final String? buttonLabel;
  final VoidCallback? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200]!.withOpacity(0.65),
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(
        horizontal: context.margingM,
        vertical: context.margingS,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(context.radiusM)),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.margingS),
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(context.radiusS),
                ),
              ),
              child: MText(
                text: title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: context.margingS),
            Container(
              padding: EdgeInsets.all(context.margingS),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(context.radiusS),
                ),
              ),
              child: MText(
                text: description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: context.margingS),
            if (buttonLabel != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: MText(
                    text: buttonLabel!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    context.pop();
                    onButtonClick?.call();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
