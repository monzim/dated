import 'package:dated/dated.dart';
import 'package:test/test.dart';

void main() {
  group('DatedBaseBoolExtension', () {
    test('isSameDay should return true for same day', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2023, 5, 8);
      expect(date1.isSameDay(date2), isTrue);
    });

    test('isSameDay should return false for different days', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2023, 5, 9);
      expect(date1.isSameDay(date2), isFalse);
    });

    test('isSameMonth should return true for same month', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2023, 5, 15);
      expect(date1.isSameMonth(date2), isTrue);
    });

    test('isSameMonth should return false for different months', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2023, 6, 15);
      expect(date1.isSameMonth(date2), isFalse);
    });

    test('isSameYear should return true for same year', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2023, 6, 15);
      expect(date1.isSameYear(date2), isTrue);
    });

    test('isSameYear should return false for different years', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2024, 6, 15);
      expect(date1.isSameYear(date2), isFalse);
    });

    test('isBeforeDay should return true for previous day', () {
      final date1 = DateTime(2023, 5, 7);
      final date2 = DateTime(2023, 5, 8);
      expect(date1.isBeforeDay(date2), isTrue);
    });

    test('isBeforeDay should return false for same day', () {
      final date1 = DateTime(2023, 5, 8);
      final date2 = DateTime(2023, 5, 8);
      expect(date1.isBeforeDay(date2), isFalse);
    });

    // Add more tests for isBeforeMonth, isBeforeYear, isAfterDay, isAfterMonth, and isAfterYear
  });

  group('DatedBaseTimeAgoExtension', () {
    test('timeAgo should return "just now" for recent times', () {
      final now = DateTime.now();
      expect(now.timeAgo(), 'just now');
    });

    test('timeAgo should return correct string for minutes ago', () {
      final now = DateTime.now();
      final fiveMinutesAgo = now.subtract(const Duration(minutes: 5));
      expect(fiveMinutesAgo.timeAgo(), '5 minutes ago');
    });

    test('timeAgo should return correct string for hours ago', () {
      final now = DateTime.now();
      final twoHoursAgo = now.subtract(const Duration(hours: 2));
      expect(twoHoursAgo.timeAgo(), '2 hours ago');
    });

    test('timeAgo should return correct string for days ago', () {
      final now = DateTime.now();
      final threeDaysAgo = now.subtract(const Duration(days: 3));
      expect(threeDaysAgo.timeAgo(), '3 days ago');
    });

    test('timeAgo should return correct string for months ago', () {
      final now = DateTime.now();
      final sixMonthsAgo = now.subtract(const Duration(days: 180));
      expect(sixMonthsAgo.timeAgo(), '6 months ago');
    });

    test('timeAgo should return correct string for years ago', () {
      final now = DateTime.now();
      final twoYearsAgo = now.subtract(const Duration(days: 730));
      expect(twoYearsAgo.timeAgo(), '2 years ago');
    });

    test('timeAgo should return "just now" for recent times', () {
      final now = DateTime.now();
      expect(now.timeAgo(), 'just now');
    });

    test('timeAgo should handle prefixes and suffixes correctly', () {
      final now = DateTime.now();
      final twoHoursAgo = now.subtract(const Duration(hours: 2));
      expect(twoHoursAgo.timeAgo(prefix: 'Posted'), 'Posted 2 hours ago');
      expect(twoHoursAgo.timeAgo(suffix: 'earlier'), '2 hours earlier');
      expect(twoHoursAgo.timeAgo(prefix: 'Posted', suffix: 'earlier'),
          'Posted 2 hours earlier');
    });
  });
}
