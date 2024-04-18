import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shamsi_date/shamsi_date.dart';

class MDatePickerValue extends Equatable {
  const MDatePickerValue({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
  });

  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;

  MDatePickerValue copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
  }) =>
      MDatePickerValue(
        year: year ?? this.year,
        month: month ?? this.month,
        day: day ?? this.day,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
      );

  DateTime toDateTime() => DateTime(year, month, day, hour, minute);

  @override
  String toString() {
    return '$year-$month-$day $hour:$minute';
  }

  @override
  List<Object?> get props => [
        year,
        month,
        day,
        hour,
        minute,
      ];
}

class MDatePicker extends StatefulWidget {
  const MDatePicker({
    required this.title,
    required this.onChage,
    super.key,
  });
  final String title;
  final void Function(MDatePickerValue) onChage;

  @override
  State<MDatePicker> createState() => _MDatePickerState();
}

class _MDatePickerState extends State<MDatePicker> {
  final jalaliDateTime = Jalali.now();
  late int _year = jalaliDateTime.year;
  late int _month = jalaliDateTime.month;
  late int _day = jalaliDateTime.day;
  late int _hour = jalaliDateTime.hour;
  late int _minute = jalaliDateTime.minute;

  MDatePickerValue get _pickedValue => MDatePickerValue(
        year: _year,
        month: _month,
        day: _day,
        hour: _hour,
        minute: _minute,
      );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onChage(_pickedValue);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
            readOnly: true,
            enabled: false,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.margingXS),
              labelText: widget.title,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              suffixIcon: const Icon(Icons.date_range),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                minValue: 0,
                maxValue: 59,
                value: _minute,
                itemWidth: 20,
                textMapper: (numberText) => numberText.replaceEnNumToFa(),
                selectedTextStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textStyle: Theme.of(context).textTheme.labelMedium,
                onChanged: (value) {
                  setState(() {
                    _minute = value;
                  });
                  widget.onChage(_pickedValue);
                },
              ),
              const Text(':'),
              NumberPicker(
                minValue: 0,
                maxValue: 24,
                value: _hour,
                itemWidth: 20,
                textMapper: (numberText) => numberText.replaceEnNumToFa(),
                selectedTextStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textStyle: Theme.of(context).textTheme.labelMedium,
                onChanged: (value) {
                  setState(() {
                    _hour = value;
                  });
                  widget.onChage(_pickedValue);
                },
              ),
              const SizedBox.shrink().paddingS(),
              NumberPicker(
                minValue: 1,
                maxValue: 31,
                value: _day,
                itemWidth: 20,
                textMapper: (numberText) => numberText.replaceEnNumToFa(),
                selectedTextStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textStyle: Theme.of(context).textTheme.labelMedium,
                onChanged: (value) {
                  setState(() {
                    _day = value;
                  });
                  widget.onChage(_pickedValue);
                },
              ),
              const Text('-'),
              NumberPicker(
                minValue: 1,
                maxValue: 12,
                value: _month,
                itemWidth: 20,
                textMapper: (numberText) => numberText.replaceEnNumToFa(),
                selectedTextStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textStyle: Theme.of(context).textTheme.labelMedium,
                onChanged: (value) {
                  setState(() {
                    _month = value;
                  });
                  widget.onChage(_pickedValue);
                },
              ),
              const Text('-'),
              NumberPicker(
                minValue: 1300,
                maxValue: 1500,
                value: _year,
                itemWidth: 40,
                textMapper: (numberText) => numberText.replaceEnNumToFa(),
                selectedTextStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textStyle: Theme.of(context).textTheme.labelMedium,
                onChanged: (value) {
                  setState(() {
                    _year = value;
                  });
                  widget.onChage(_pickedValue);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
