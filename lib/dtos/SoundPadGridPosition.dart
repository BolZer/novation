class SoundPadGridPosition {
  final int page;
  final int row;
  final int column;

  SoundPadGridPosition({this.page, this.row, this.column});

  static SoundPadGridPosition fromMap(Map<String, dynamic> map) {
    return SoundPadGridPosition(
      page: map['page'],
      row: map['row'],
      column: map['column'],
    );
  }

  Map<String, dynamic> toMap() => {
        'page': page,
        'row': row,
        'column': column,
      };

  Map<String, dynamic> toJson() => toMap();
}
