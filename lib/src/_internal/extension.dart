extension DoubleParser on double {
  static double? tryParseIfNotNull(String? source) {
    return source != null ? double.tryParse(source) : null;
  }

  static double? parseIfNotNull(String? source) {
    return source != null ? double.parse(source) : null;
  }
}

extension IntParser on int {
  static int? tryParseIfNotNull(String? source) {
    return source != null ? int.tryParse(source) : null;
  }

  static int? parseIfNotNull(String? source) {
    return source != null ? int.parse(source) : null;
  }
}

extension BoolParser on bool {
  static bool? tryParseIfNotNull(String? source) {
    return source != null ? bool.tryParse(source) : null;
  }

  static bool? parseIfNotNull(String? source) {
    return source != null ? bool.parse(source) : null;
  }
}
