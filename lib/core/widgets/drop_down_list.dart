import 'package:flutter/material.dart';
import 'package:task_managment_app/core/model/manager.dart';

// ignore: must_be_immutable
class DropDownItems extends StatelessWidget {
  String label;
  Manager selectedItem;
  List<Manager> options;
  IconData? prefixIcon;
  // ignore: prefer_typing_uninitialized_variables
  var validator, onChange;
  DropDownItems({
    super.key,
    required this.label,
    required this.options,
    required this.selectedItem,
    required this.validator,
    required this.onChange,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        value: selectedItem.name,
        onChanged: onChange,
        validator: validator,
        iconDisabledColor: Theme.of(context).primaryColor,
        iconEnabledColor: Theme.of(context).primaryColor,
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option.name,
            child: Text(option.name!),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).primaryColor,
          ),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
