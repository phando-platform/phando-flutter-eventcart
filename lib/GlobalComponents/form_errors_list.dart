import 'package:flutter/material.dart';

class FormErrorsList extends StatelessWidget {
  List errorsList;
  FormErrorsList(this.errorsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.deepOrangeAccent,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "We got following errors in your data",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.35,
            ),
          ),
          ...errorsList
              .map<Widget>((err) => Text(
                    err,
                    style: const TextStyle(
                      height: 1.35,
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
