import 'package:flutter/material.dart';

RichText getRequiredLabel(String fieldName) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black87, fontSize: 16),
      text: fieldName,
      children: const [
        TextSpan(
          text: '*',
          style: TextStyle(color: Colors.red),
        )
      ],
    ),
  );
}
