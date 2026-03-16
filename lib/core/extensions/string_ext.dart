extension StringExtension on String {
  /// Capitalizes the first letter of the string
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Returns the string with the first letter capitalized and the rest lowercased
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Converts string to title case (capitalizes first letter of each word)
  String toTitleCase() {
    return split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }

  /// Checks if the string is a valid email
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Checks if the string is a valid phone number (basic check)
  bool isValidPhoneNumber() {
    final phoneRegex = RegExp(r'^[0-9]{10,}$');
    return phoneRegex.hasMatch(replaceAll(RegExp(r'[^\d+]'), ''));
  }

  /// Checks if the string is a valid URL
  bool isValidUrl() {
    try {
      Uri.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Checks if the string contains only letters
  bool isAlpha() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  /// Checks if the string contains only numbers
  bool isNumeric() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }

  /// Checks if the string is alphanumeric
  bool isAlphaNumeric() {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  /// Truncates string to max length with optional suffix
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength - suffix.length) + suffix;
  }

  /// Removes all whitespace from the string
  String removeAllWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Removes leading and trailing whitespace
  String trimAll() {
    return trim();
  }

  /// Splits into words
  List<String> toWords() {
    return split(RegExp(r'\s+'));
  }

  /// Reverses the string
  String reverse() {
    return split('').reversed.join('');
  }

  /// Swaps case of the string
  String swapCase() {
    return split('')
        .map((char) => char == char.toUpperCase()
            ? char.toLowerCase()
            : char.toUpperCase())
        .join('');
  }

  /// Removes all special characters
  String removeSpecialCharacters() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  }

  /// Checks if string contains only spaces
  bool isBlankString() {
    return trim().isEmpty;
  }

  /// Formats a number string with commas (e.g., 1000 -> 1,000)
  String formatNumber() {
    if (!isNumeric()) return this;
    return replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
  }

  /// Converts a camelCase string to snake_case
  String toSnakeCase() {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    ).replaceFirst('_', '');
  }

  /// Converts a snake_case string to camelCase
  String toCamelCase() {
    final parts = split('_');
    return parts.first +
        parts.skip(1).map((part) => part.capitalize()).join('');
  }

  /// Converts to kebab-case
  String toKebabCase() {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '-${match.group(0)!.toLowerCase()}',
    ).replaceFirst('-', '');
  }

  /// Repeats the string n times
  String repeat(int count) {
    return (this * count);
  }

  /// Checks if this equals another string (case-insensitive)
  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }

  /// Gets the character code of the first character
  int? getCharCode({int position = 0}) {
    if (position >= length || position < 0) return null;
    return codeUnitAt(position);
  }

  /// Converts special characters to HTML entities
  String toHtmlEntity() {
    return replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
  }

  /// Strips HTML tags from string
  String stripHtmlTags() {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// Checks if string contains HTML tags
  bool containsHtmlTags() {
    return RegExp(r'<[^>]*>').hasMatch(this);
  }

  /// Extracts numbers from string
  List<int> extractNumbers() {
    final matches = RegExp(r'\d+').allMatches(this);
    return matches.map((m) => int.parse(m.group(0)!)).toList();
  }

  /// Gets similarity score with another string (0-1)
  double similarityScore(String other) {
    final longer = length > other.length ? this : other;
    final shorter = length > other.length ? other : this;

    if (longer.isEmpty) return 1.0;

    final editDistance = _getEditDistance(longer, shorter);
    return (longer.length - editDistance) / longer.length;
  }

  static int _getEditDistance(String s1, String s2) {
    final distances = List<List<int>>.generate(
      s2.length + 1,
      (i) => List<int>.generate(s1.length + 1, (j) => 0),
    );

    for (var i = 0; i <= s1.length; i++) {
      distances[0][i] = i;
    }
    for (var j = 0; j <= s2.length; j++) {
      distances[j][0] = j;
    }

    for (var i = 1; i <= s2.length; i++) {
      for (var j = 1; j <= s1.length; j++) {
        final cost = s1[j - 1] == s2[i - 1] ? 0 : 1;
        distances[i][j] = [
          distances[i][j - 1] + 1,
          distances[i - 1][j] + 1,
          distances[i - 1][j - 1] + cost,
        ].reduce((a, b) => a < b ? a : b);
      }
    }

    return distances[s2.length][s1.length];
  }
}
