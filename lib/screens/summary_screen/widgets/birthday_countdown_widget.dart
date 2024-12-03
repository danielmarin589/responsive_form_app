import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';

class BirthdayCountdownWidget extends StatefulWidget {
  final DateTime? birthday;

  const BirthdayCountdownWidget({
    required this.birthday,
    super.key,
  });

  @override
  State<BirthdayCountdownWidget> createState() =>
      _BirthdayCountdownWidgetState();
}

class _BirthdayCountdownWidgetState extends State<BirthdayCountdownWidget> {
  late Timer _timer;
  String _countdown = AppStrings.calculating;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    if (widget.birthday == null) {
      setState(() {
        _countdown = AppStrings.birthdayNotSet;
      });
      return;
    }

    _updateCountdown(widget.birthday!);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (widget.birthday == null) {
        _timer.cancel();
        setState(() {
          _countdown = AppStrings.birthdayNotSet;
        });
        return;
      }

      _updateCountdown(widget.birthday!);
    });
  }

  void _updateCountdown(DateTime birthday) {
    final now = DateTime.now();
    final thisYearBirthday = DateTime(now.year, birthday.month, birthday.day);
    final nextBirthday = thisYearBirthday.isBefore(now)
        ? DateTime(now.year + 1, birthday.month, birthday.day)
        : thisYearBirthday;

    final difference = nextBirthday.difference(now);

    if (thisYearBirthday.year == now.year &&
        thisYearBirthday.month == now.month &&
        thisYearBirthday.day == now.day) {
      setState(() {
        _countdown = "${AppStrings.happyBirthday} 🎉🎉🎉";
      });
    } else {
      setState(() {
        _countdown =
            '${difference.inDays} days, ${difference.inHours % 24} hours, ${difference.inMinutes % 60} minutes, and ${difference.inSeconds % 60} seconds';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.mainRose,
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.countdownToBday,
                style: TextStyle(
                  color: AppColors.mainBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(16),
              Text(
                _countdown,
                style: const TextStyle(
                  color: AppColors.mainBlack,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
