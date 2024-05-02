String getCountText(int count) {
  if (count < 1000) {
    return count.toString();
  } else if (count < 1000000) {
    return '${(count / 1000).toStringAsFixed(1)}k';
  } else if (count < 1000000000) {
    return '${(count / 1000000).toStringAsFixed(1)}m';
  } else {
    return '${(count / 1000000000).toStringAsFixed(1)}b';
  }
}