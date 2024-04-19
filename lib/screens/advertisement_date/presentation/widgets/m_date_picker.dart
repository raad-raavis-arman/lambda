import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  factory MDatePickerValue.now() {
    final jalaliDateTime = Jalali.now();
    return MDatePickerValue(
      year: jalaliDateTime.year,
      month: jalaliDateTime.month,
      day: jalaliDateTime.day,
      hour: jalaliDateTime.hour,
      minute: jalaliDateTime.minute,
    );
  }

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

  DateTime toJalaliDateTime() => DateTime(year, month, day, hour, minute);

  String toUtcDateTime() {
    return DateFormat('yyyy-MM-dd HH:mmZ').format(
      Gregorian.fromJalali(
        Jalali(year, month, day, hour, minute),
      ).toUtcDateTime(),
    );
  }

  @override
  String toString() {
    final twoDidgiFormat = NumberFormat('00');
    final fourDidgiFormat = NumberFormat('0000');
    return '${fourDidgiFormat.format(year)}-${twoDidgiFormat.format(month)}'
        '-${twoDidgiFormat.format(day)}'
        ' ${twoDidgiFormat.format(hour)}:${twoDidgiFormat.format(minute)}';
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
    this.initialValue,
    super.key,
  });
  final String title;
  final MDatePickerValue? initialValue;
  final void Function(MDatePickerValue) onChage;

  @override
  State<MDatePicker> createState() => _MDatePickerState();
}

class _MDatePickerState extends State<MDatePicker> {
  late int _year;
  late int _month;
  late int _day;
  late int _hour;
  late int _minute;

  MDatePickerValue get _pickedValue => MDatePickerValue(
        year: _year,
        month: _month,
        day: _day,
        hour: _hour,
        minute: _minute,
      );

  void _firstInitialize() {
    if (widget.initialValue == null) {
      final jalaliDateTime = Jalali.now();
      _year = jalaliDateTime.year;
      _month = jalaliDateTime.month;
      _day = jalaliDateTime.day;
      _hour = jalaliDateTime.hour;
      _minute = jalaliDateTime.minute;
    } else {
      _year = widget.initialValue!.year;
      _month = widget.initialValue!.month;
      _day = widget.initialValue!.day;
      _hour = widget.initialValue!.hour;
      _minute = widget.initialValue!.minute;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onChage(_pickedValue);
    });
    _firstInitialize();
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
                textMapper: (numberText) => NumberFormat('00')
                    .format(int.parse(numberText))
                    .replaceEnNumToFa(),
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
                textMapper: (numberText) => NumberFormat('00')
                    .format(int.parse(numberText))
                    .replaceEnNumToFa(),
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
                textMapper: (numberText) => NumberFormat('00')
                    .format(int.parse(numberText))
                    .replaceEnNumToFa(),
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
                textMapper: (numberText) => NumberFormat('00')
                    .format(int.parse(numberText))
                    .replaceEnNumToFa(),
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
                textMapper: (numberText) => NumberFormat('0000')
                    .format(int.parse(numberText))
                    .replaceEnNumToFa(),
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
