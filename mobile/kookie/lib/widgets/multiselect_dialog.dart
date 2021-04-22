import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelectDialogItem {
  const MultiSelectDialogItem(this.value, this.label);

  final int value;
  final String label;
}

class MultiSelectDialog extends StatefulWidget {
  MultiSelectDialog({
    required Key key,
    required this.title,
    required this.items,
    required this.initialSelectedValues,
    required this.onSubmitData,
  }) : super(key: key);

  final String title;
  final List<MultiSelectDialogItem> items;
  final Set<int> initialSelectedValues;
  final onSubmitData;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  final _selectedValues = Set<int>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(int value, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(value);
      } else {
        _selectedValues.remove(value);
      }
    });
  }

  void _onSubmitTap() {
    widget.onSubmitData(_selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: Container(
        child: SingleChildScrollView(
          child: ListTileTheme(
            contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
            child: ListBody(
              children: widget.items.map(_buildItem).toList(),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('ANNULER'),
          onPressed: _onSubmitTap,
        ),
        TextButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked!),
    );
  }
}
