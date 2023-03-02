// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// class DateTimePickerWidget extends StatefulWidget {
//   final String hintText;
//   final Icon prefixIcon;
//   final TextEditingController controller;
//   final void Function(String)? onDateTimeChanged;

//   const DateTimePickerWidget({
//     Key? key,
//     required this.hintText,
//     required this.prefixIcon,
//     required this.controller,
//     this.onDateTimeChanged,
//   }) : super(key: key);

//   @override
//   _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
// }

// class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
//   late DateTime _selectedDateTime;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDateTime = DateTime.now();
//   }

//   String _formatDateTime(DateTime dateTime) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     String fourDigits(int n) => n.toString().padLeft(4, "0");
//     return "${fourDigits(dateTime.year)}-${twoDigits(dateTime.month)}-${twoDigits(dateTime.day)} ${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}:${twoDigits(dateTime.second)}";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       onTap: () {
//         DatePicker.showDateTimePicker(
//           context,
//           showTitleActions: true,
//           onConfirm: (date) {
//             setState(() {
//               _selectedDateTime = date;
//               widget.controller.text = _formatDateTime(_selectedDateTime);
//               if (widget.onDateTimeChanged != null) {
//                 widget.onDateTimeChanged!(_formatDateTime(_selectedDateTime));
//               }
//             });
//           },
//           currentTime: _selectedDateTime,
//         );
//       },
//       readOnly: true,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         border: const OutlineInputBorder(),
//         prefixIcon: widget.prefixIcon,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateTimePickerWidget extends StatefulWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final void Function(String)? onDateTimeChanged;

  const DateTimePickerWidget({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.onDateTimeChanged,
  }) : super(key: key);

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String fourDigits(int n) => n.toString().padLeft(4, "0");
    return "${fourDigits(dateTime.year)}-${twoDigits(dateTime.month)}-${twoDigits(dateTime.day)} ${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}:${twoDigits(dateTime.second)}";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTap: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onConfirm: (date) {
            if (date.isAfter(DateTime.now())) {
              setState(() {
                _selectedDateTime = date;
                widget.controller.text = _formatDateTime(_selectedDateTime);
                if (widget.onDateTimeChanged != null) {
                  widget.onDateTimeChanged!(_formatDateTime(_selectedDateTime));
                }
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Please select a future date and time"),
                duration: Duration(seconds: 2),
              ));
            }
          },
          currentTime: _selectedDateTime,
        );
      },
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
