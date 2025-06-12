class DoubleConverterUtils {
  static double parseDouble(String value) {
    final cleanedValue = value.replaceAll(RegExp(r'[^0-9.,]'), '');
    final sanitizedValue = cleanedValue.replaceAll(',', '.');

    try {
      if (sanitizedValue.isNotEmpty) {
        return double.parse(sanitizedValue);
      }
    } catch (e) {
      return 0.0;
    }
    return 0.0;
  }
}
