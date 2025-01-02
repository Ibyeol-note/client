String formatDateTime(DateTime dateTime) {
  return '(일자)${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일 ${dateTime.hour}시 ${dateTime.minute}분';
}

String formatCount(int count) {
  if (count >= 1000000000) {
    return '${(count / 1000000000).toStringAsFixed(1)}B';
  } else if (count >= 1000000) {
    return '${(count / 1000000).toStringAsFixed(1)}M';
  } else if (count >= 10000) {
    return '${(count / 1000).toStringAsFixed(1)}K';
  } else if (count >= 1000) {
    return count.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  } else {
    return count.toString();
  }
}
