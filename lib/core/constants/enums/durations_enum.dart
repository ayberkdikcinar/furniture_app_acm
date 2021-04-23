enum DurationEnums {
  DURATIONLOW,
  DURATIONNORMAL,
  DURATIONMEDIUM,
  DURATIONHIGH,
}

extension DurationEnumsExtension on DurationEnums {
  Duration get rawwValue {
    switch (this) {
      case DurationEnums.DURATIONLOW:
        return Duration(milliseconds: 300);
      case DurationEnums.DURATIONNORMAL:
        return Duration(milliseconds: 500);
      case DurationEnums.DURATIONMEDIUM:
        return Duration(milliseconds: 800);
      case DurationEnums.DURATIONHIGH:
        return Duration(milliseconds: 1000);
      default:
        return Duration(milliseconds: 500);
    }
  }
}
