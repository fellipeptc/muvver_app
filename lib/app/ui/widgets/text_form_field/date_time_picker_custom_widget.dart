import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class DateTimePickerCustom extends StatelessWidget {
  final String labelText;
  final double width;
  final TextEditingController controller;

  const DateTimePickerCustom({
    Key? key,
    required this.labelText,
    required this.width,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DateTimePicker(
        controller: controller,
        type: DateTimePickerType.date,
        dateMask: 'dd/MM/yyyy',
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelStyle: const TextStyle(
            color: AppColors.labelText2,
            fontSize: 14,
            fontFamily: 'TitilliumWeb',
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.border,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        dateLabelText: 'Data',
        timeLabelText: "Hora",
        locale: const Locale('pt', 'BR'),
        onChanged: (val) => print(val),
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) => print(val),

      ),
    );
  }
}
