import 'package:dated/dated.dart';

void main() {
  final today = DateTime.now();
  final yesterday = today.subtract(const Duration(days: 1));
  final tomorrow = today.add(const Duration(days: 1));
  final lastMonth = today.subtract(const Duration(days: 30));
  final nextYear = today.add(const Duration(days: 365));

  print('Today: $today');
  print('Yesterday: $yesterday');
  print('Tomorrow: $tomorrow');
  print('Last Month: $lastMonth');
  print('Next Year: $nextYear');

  print(
      'Is today and yesterday the same day? ${today.isSameDay(yesterday)}'); // false
  print(
      'Is today and tomorrow the same month? ${today.isSameMonth(tomorrow)}'); // true
  print(
      'Is today and next year the same year? ${today.isSameYear(nextYear)}'); // true
  print('Is yesterday before today? ${yesterday.isBeforeDay(today)}'); // true
  print(
      'Is last month before this month? ${lastMonth.isBeforeMonth(today)}'); // true
  print(
      'Is this year before next year? ${today.isBeforeYear(nextYear)}'); // true

  final twoHoursAgo = today.subtract(const Duration(hours: 2));
  final threeDaysAgo = today.subtract(const Duration(days: 3));
  final sixMonthsAgo = today.subtract(const Duration(days: 180));
  final twoYearsAgo = today.subtract(const Duration(days: 730));

  print('Two hours ago: ${twoHoursAgo.timeAgo()}'); // 2 hours ago
  print('Three days ago: ${threeDaysAgo.timeAgo()}'); // 3 days ago
  print('Six months ago: ${sixMonthsAgo.timeAgo()}'); // 6 months ago
  print('Two years ago: ${twoYearsAgo.timeAgo()}'); // 2 years ago
  print('Just now: ${today.timeAgo()}'); // just now
  print(
      'With prefix: ${twoHoursAgo.timeAgo(prefix: 'Posted')}'); // Posted 2 hours ago
  print(
      'With suffix: ${threeDaysAgo.timeAgo(suffix: 'earlier')}'); // 3 days earlier
  print(
      'With prefix and suffix: ${sixMonthsAgo.timeAgo(prefix: 'Created', suffix: 'ago')}'); // Created 6 months ago
}
