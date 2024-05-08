/// An extension on [DateTime] that provides methods to compare dates and check
/// if they are the same day, month, or year, as well as to check if a date is
/// before or after another date by day, month, or year.
extension DatedBaseBoolExtension on DateTime {
  /// Returns `true` if this [DateTime] object represents the same day as the
  /// given [other] [DateTime] object, `false` otherwise.
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Returns `true` if this [DateTime] object represents the same month as the
  /// given [other] [DateTime] object, `false` otherwise.
  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  /// Returns `true` if this [DateTime] object represents the same year as the
  /// given [other] [DateTime] object, `false` otherwise.
  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// Returns `true` if this [DateTime] object is before the given [other]
  /// [DateTime] object and not on the same day, `false` otherwise.
  bool isBeforeDay(DateTime other) {
    return isBefore(other) && !isSameDay(other);
  }

  /// Returns `true` if this [DateTime] object is before the given [other]
  /// [DateTime] object and not in the same month, `false` otherwise.
  bool isBeforeMonth(DateTime other) {
    return isBefore(other) && !isSameMonth(other);
  }

  /// Returns `true` if this [DateTime] object is before the given [other]
  /// [DateTime] object and not in the same year, `false` otherwise.
  bool isBeforeYear(DateTime other) {
    return isBefore(other) && !isSameYear(other);
  }

  /// Returns `true` if this [DateTime] object is after the given [other]
  /// [DateTime] object and not on the same day, `false` otherwise.
  bool isAfterDay(DateTime other) {
    return isAfter(other) && !isSameDay(other);
  }

  /// Returns `true` if this [DateTime] object is after the given [other]
  /// [DateTime] object and not in the same month, `false` otherwise.
  bool isAfterMonth(DateTime other) {
    return isAfter(other) && !isSameMonth(other);
  }

  /// Returns `true` if this [DateTime] object is after the given [other]
  /// [DateTime] object and not in the same year, `false` otherwise.
  bool isAfterYear(DateTime other) {
    return isAfter(other) && !isSameYear(other);
  }
}

/// An enumeration representing different date parts (minute, hour, day, month, year).
enum DatePart {
  minute,
  hour,
  day,
  month,
  year,
}

/// An extension on [DateTime] that provides a method to calculate the time ago
/// from the current date and time.
extension DatedBaseTimeAgoExtension on DateTime {
  /// Returns a string representing the time ago from this [DateTime] object.
  ///
  /// The [compare] parameter is an optional [DateTime] object to compare against.
  /// If not provided, the current date and time will be used.
  ///
  /// The [prefix] parameter is an optional string to prepend to the output.
  ///
  /// The [suffix] parameter is an optional string to append to the output.
  ///
  /// The output will be in the format of "[prefix] X [unit] [suffix] ago",
  /// where X is the number of units (e.g., 2 hours, 3 days) and [unit] is the
  /// appropriate time unit (minutes, hours, days, months, or years). If the
  /// time difference is less than a minute, the output will be "just now". If
  /// [suffix] is not provided and the time difference is more than a minute,
  /// the word "ago" will be appended to the output.
  String timeAgo({DateTime? compare, String? prefix, String? suffix}) {
    final parts = timeAgoParts(compare: compare);
    final value = parts.$1;
    final part = parts.$2;

    String input = '';
    switch (part) {
      case DatePart.minute:
        if (value < 1) {
          input = 'just now';
        } else {
          input = '$value ${value == 1 ? 'minute' : 'minutes'}';
        }
        break;
      case DatePart.hour:
        input = '$value ${value == 1 ? 'hour' : 'hours'}';
        break;
      case DatePart.day:
        input = '$value ${value == 1 ? 'day' : 'days'}';
        break;
      case DatePart.month:
        input = '$value ${value == 1 ? 'month' : 'months'}';
        break;
      case DatePart.year:
        input = '$value ${value == 1 ? 'year' : 'years'}';
        break;
    }

    if (prefix != null) {
      input = '$prefix $input';
    }

    if (suffix != null) {
      input = '$input $suffix';
    }

    if (suffix == null && input != 'just now') {
      input = '$input ago';
    }

    return input;
  }

  /// Returns a tuple containing the value and the corresponding [DatePart] for
  /// the time difference between this [DateTime] object and the [compare]
  /// [DateTime] object.
  ///
  /// The [compare] parameter is an optional [DateTime] object to compare against.
  /// If not provided, the current date and time will be used.
  ///
  /// The returned tuple will contain the value (an integer representing the
  /// number of units) and the corresponding [DatePart] (minute, hour, day,
  /// month, or year) based on the time difference.
  (int, DatePart) timeAgoParts({DateTime? compare}) {
    final now0 = compare ?? DateTime.now();
    final diff = now0.difference(this);

    if (diff.inDays > 365) {
      final years = (diff.inDays / 365).floor();
      return (years, DatePart.year);
    } else if (diff.inDays > 30) {
      final months = (diff.inDays / 30).floor();
      return (months, DatePart.month);
    } else if (diff.inDays > 0) {
      return (diff.inDays, DatePart.day);
    } else if (diff.inHours > 0) {
      return (diff.inHours, DatePart.hour);
    } else if (diff.inMinutes > 0) {
      return (diff.inMinutes, DatePart.minute);
    } else {
      return (0, DatePart.minute);
    }
  }
}
