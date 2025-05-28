
import 'package:flutter/material.dart';

class StepperDataModel {
  int? stepId;

  /// title for the stepper
  StepperText? title;

  /// subtitle for the stepper
  StepperText? subtitle;
  StepperText? date;
  StepperText? time;
  bool isStepCompleted;
  bool isVisible;
  Widget? iconWidget;

  /// Use the constructor of [StepperDataModel] to pass the data needed.
  StepperDataModel(
      {required this.stepId,
      this.iconWidget,
      this.date,
      this.time,
      this.title,
      this.subtitle,
      this.isStepCompleted = false,
      this.isVisible = true});
}

class StepperText {
  /// text for the stepper
  String text;

  /// textStyle for stepper
  TextStyle? textStyle;

  StepperText(this.text, {this.textStyle});
}
