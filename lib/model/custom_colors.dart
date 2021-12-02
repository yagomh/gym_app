import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 63, 81, 181);
  Color _activeSecondaryButton = Color.fromARGB(255, 230, 230, 255);

  Color _gradientMainColor = Colors.blue.shade100;
  Color _gradientSecColor = Colors.blue.shade500;
  Color _gradientBottomColor = Colors.indigo.shade700;

  Color _textColorPrimary = Colors.white;
  Color _textColorSecondary = Colors.black;

  Color _alertColor = Colors.red;

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButton() {
    return _activeSecondaryButton;
  }

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecColor() {
    return _gradientSecColor;
  }

  Color getGradientBottomColor() {
    return _gradientBottomColor;
  }

  Color getTextColorPrimary() {
    return _textColorPrimary;
  }

  Color getTextColorSecondary() {
    return _textColorSecondary;
  }

  Color getAlertColor() {
    return _alertColor;
  }
}
