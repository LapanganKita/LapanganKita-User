part of 'components.dart';

// ignore: must_be_immutable
class HeadingText extends StatelessWidget {
  final _fontFamily = "Ubuntu";
  var _fontSize = 36.0;
  var _fontWeight = FontWeight.bold;
  var _color;
  final _text;

  HeadingText(this._text, this._fontSize);
  HeadingText.withColor(this._text, this._fontSize, this._color);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        fontSize: _fontSize,
        fontFamily: _fontFamily,
        fontWeight: _fontWeight,
        color: _color,
      ),
    );
  }
}
