import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final Color color;
  final List<String> options;

  MultiSelectChip({this.color, this.options});

  List<String> selectedChoices = new List();

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  _buildChoiceList() {
    List<Widget> choices = List();

    widget.options.forEach((element) {
      choices.add(
        ChoiceChip(
          label: Text(element),
          selected: widget.selectedChoices.contains(element),
          labelStyle: TextStyle(color: Colors.white),
          onSelected: (selected) {
            setState(() {
              if (selected && widget.selectedChoices.length > 1) {
                // do nothing
              } else {
                widget.selectedChoices.contains(element)
                    ? widget.selectedChoices.remove(element)
                    : widget.selectedChoices.add(element);
              }
            });
          },
          selectedColor: widget.color,
        ),
      );
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: _buildChoiceList(),
    );
  }
}
