extension StringExtensions on String {
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }

  String getIdByUrl() {
    final parts = split('/');
    if (parts.isEmpty) return '';
    final idPart = parts.last;
    return idPart.isNotEmpty ? idPart : '';
  }
}