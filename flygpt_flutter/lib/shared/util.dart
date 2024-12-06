String getRelativeDate(DateTime date) {
  final difference = DateTime.now().difference(date).inDays;

  if (difference == 0) return 'Today';
  if (difference == 1) return 'Yesterday';
  if (difference <= 7) return '$difference Days Ago';
  return 'Older';
}