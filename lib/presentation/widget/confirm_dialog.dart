import 'package:flutter/material.dart';
import 'package:study_tracker_mobile/app/constant.dart';
import 'package:study_tracker_mobile/presentation/resources/color_manager.dart';
import 'package:study_tracker_mobile/presentation/resources/font_manager.dart';
import 'package:study_tracker_mobile/presentation/resources/styles_manager.dart';
import 'package:study_tracker_mobile/presentation/resources/value_manager.dart';
import 'package:study_tracker_mobile/presentation/widget/custom_button.dart';

class ConfirmAlert extends StatelessWidget {
  final String title;
  final String content;
  final Function()? onConfirm;
  final bool emergency;

  const ConfirmAlert({
    super.key,
    required this.content,
    required this.onConfirm,
    required this.title,
    this.emergency = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Warning',
        style: getBoldStyle(color: XColors.neutral_1, fontSize: FontSize.s24),
      ),
      content: Text(
        content,
        style:
            getSemiBoldStyle(color: XColors.neutral_1, fontSize: FontSize.s16),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: !emergency ? TextDirection.ltr : TextDirection.rtl,
          spacing: AppSize.s12,
          children: [
            SizedBox(
              width: 0.3 * Constants.deviceWidth,
              height: 0.06 * Constants.deviceHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
                child: Text('Cancel',
                    style: getSemiBoldStyle(color: XColors.neutral_1)),
              ),
            ),
            CustomButton(
              title: title,
              onPressed: onConfirm,
              width: 0.3 * Constants.deviceWidth,
              backgroundColor: XColors.semanticError,
            )
          ],
        ),
      ],
    );
  }
}
