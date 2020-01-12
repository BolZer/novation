class SoundGridPosition {
  final int page;
  final int row;
  final int column;

  SoundGridPosition({this.page, this.row, this.column});

  static SoundGridPosition fromMap(Map<String, dynamic> map) {
    return SoundGridPosition(
      page: map['page'],
      row: map['row'],
      column: map['column'],
    );
  }
}
