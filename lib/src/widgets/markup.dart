import 'package:flutter/widgets.dart';

/// Tiny inline-markup renderer: supports <b>…</b> and <i>…</i> only. Used for
/// the teaching notes, where a term or emphasis wants to stand out.
List<TextSpan> parseMarkup(String src, TextStyle base, {Color? bold}) {
  final spans = <TextSpan>[];
  final re = RegExp(r'<(/?)(b|i)>');
  var bold_ = false;
  var italic = false;
  var pos = 0;

  TextStyle style() => base.copyWith(
        fontWeight: bold_ ? FontWeight.w800 : base.fontWeight,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        color: bold_ ? (bold ?? base.color) : base.color,
      );

  for (final m in re.allMatches(src)) {
    if (m.start > pos) {
      spans.add(TextSpan(text: src.substring(pos, m.start), style: style()));
    }
    final closing = m.group(1) == '/';
    if (m.group(2) == 'b') bold_ = !closing;
    if (m.group(2) == 'i') italic = !closing;
    pos = m.end;
  }
  if (pos < src.length) {
    spans.add(TextSpan(text: src.substring(pos), style: style()));
  }
  return spans;
}

class RichNote extends StatelessWidget {
  final String text;
  final TextStyle base;
  final Color? boldColor;
  final TextAlign align;
  const RichNote(this.text,
      {super.key, required this.base, this.boldColor, this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(children: parseMarkup(text, base, bold: boldColor)),
        textAlign: align,
      );
}
