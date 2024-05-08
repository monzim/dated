# Dated

`dated` is a Dart package that provides useful extensions for working with `DateTime` objects. It includes extensions for comparing dates, checking if dates are the same day, month, or year, and calculating the time ago from a given date.

## Installation

Add the `dated` package to your `pubspec.yaml` file:

```bash
dart pub add dated
```

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Usage

Import the `dated` package in your Dart file:

```dart
import 'package:dated/dated.dart';
```

### DatedBaseBoolExtension

The `DatedBaseBoolExtension` provides methods to compare `DateTime` objects.

```dart
final today = DateTime.now();
final yesterday = today.subtract(const Duration(days: 1));
final nextMonth = today.add(const Duration(days: 30));

print(today.isSameDay(yesterday)); // false
print(today.isSameMonth(nextMonth)); // false
print(today.isSameYear(nextMonth)); // true
print(yesterday.isBeforeDay(today)); // true
print(today.isBeforeMonth(nextMonth)); // true
print(nextMonth.isAfterYear(today)); // false
```

### DatedBaseTimeAgoExtension

The `DatedBaseTimeAgoExtension` provides a method to calculate the time ago from a given `DateTime` object.

```dart
final twoHoursAgo = DateTime.now().subtract(const Duration(hours: 2));
final threeDaysAgo = DateTime.now().subtract(const Duration(days: 3));
final sixMonthsAgo = DateTime.now().subtract(const Duration(days: 180));

print(twoHoursAgo.timeAgo()); // 2 hours ago
print(threeDaysAgo.timeAgo()); // 3 days ago
print(sixMonthsAgo.timeAgo()); // 6 months ago

print(threeDaysAgo.timeAgo(prefix: 'Posted')); // Posted 3 days ago
print(sixMonthsAgo.timeAgo(suffix: 'earlier')); // 6 months earlier
print(twoHoursAgo.timeAgo(prefix: 'Created', suffix: 'ago')); // Created 2 hours ago
```

## API Reference

### DatedBaseBoolExtension

- `isSameDay(DateTime other)`: Returns `true` if the `DateTime` objects represent the same day, `false` otherwise.
- `isSameMonth(DateTime other)`: Returns `true` if the `DateTime` objects represent the same month, `false` otherwise.
- `isSameYear(DateTime other)`: Returns `true` if the `DateTime` objects represent the same year, `false` otherwise.
- `isBeforeDay(DateTime other)`: Returns `true` if the `DateTime` object is before the given `other` date and not on the same day, `false` otherwise.
- `isBeforeMonth(DateTime other)`: Returns `true` if the `DateTime` object is before the given `other` date and not in the same month, `false` otherwise.
- `isBeforeYear(DateTime other)`: Returns `true` if the `DateTime` object is before the given `other` date and not in the same year, `false` otherwise.
- `isAfterDay(DateTime other)`: Returns `true` if the `DateTime` object is after the given `other` date and not on the same day, `false` otherwise.
- `isAfterMonth(DateTime other)`: Returns `true` if the `DateTime` object is after the given `other` date and not in the same month, `false` otherwise.
- `isAfterYear(DateTime other)`: Returns `true` if the `DateTime` object is after the given `other` date and not in the same year, `false` otherwise.

### DatedBaseTimeAgoExtension

- `timeAgo({DateTime? compare, String? prefix, String? suffix})`: Returns a string representing the time ago from the `DateTime` object. Optionally, you can provide a `compare` `DateTime` to compare against, a `prefix` string to prepend to the output, and a `suffix` string to append to the output.

## Contributing

Contributions to the `dated` package are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the GitHub repository.

## License

This package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
