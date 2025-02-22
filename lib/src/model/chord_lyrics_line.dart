class ChordLyricsLine {
  List<Chord> chords;
  String lyrics;
  String originalLine;

  String get textLine => lyrics.replaceAll(RegExp(r'{[^}]+?}'), '').replaceAll(RegExp(r'[^A-z0-9]+'), '');

  ChordLyricsLine()
      : chords = [],
        lyrics = '',
        originalLine = '';

  ChordLyricsLine.line(this.chords, this.lyrics, this.originalLine);

  /// Remove also the keyword
  bool isStartOfChorus() {
    const String startOfChorusAbbreviation = '{soc}';
    const String startOfChorus = '{start_of_chorus}';
    bool out = lyrics.contains(startOfChorus) ||
        lyrics.contains(startOfChorusAbbreviation);
    if (out) {
      lyrics = lyrics.replaceAll(startOfChorus, '');
      lyrics = lyrics.replaceAll(startOfChorusAbbreviation, '').trim();
    }
    return out;
  }

  /// Remove also the keyword
  bool isEndOfChorus() {
    const String endOfChorusAbbreviation = '{eoc}';
    const String endOfChorus = '{end_of_chorus}';
    bool out = lyrics.contains(endOfChorus) ||
        lyrics.contains(endOfChorusAbbreviation);
    if (out) {
      lyrics = lyrics.replaceAll(endOfChorus, '');
      lyrics = lyrics.replaceAll(endOfChorusAbbreviation, '').trim();
    }
    return out;
  }

  /// Remove also the keyword
  bool isComment() {
    const String comment = '{comment:';
    bool out = lyrics.contains(comment);
    if (out) {
      lyrics = lyrics.replaceAll(comment, '');
      lyrics = lyrics.replaceAll('}', '').trim();
    }
    return out;
  }

  @override
  String toString() {
    return 'ChordLyricsLine($chords, lyrics: $lyrics, textLine: $textLine, originalLine: $originalLine)';
  }
}

class Chord {
  double leadingSpace;
  String chordText;
  String? suffix;

  Chord(this.leadingSpace, this.chordText, {this.suffix = null});

  @override
  String toString() {
    return 'Chord(leadingSpace: $leadingSpace, chordText: $chordText, suffix: $suffix)';
  }
}
