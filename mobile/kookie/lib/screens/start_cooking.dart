import 'package:flutter/material.dart';
import 'package:kookie/models/step/StepDTO.dart';
import 'package:kookie/widgets/custom_button.dart';

import 'home_screen.dart';

class StartCooking extends StatefulWidget {
  final List<StepDTO> listStepDTO;

  StartCooking({Key? key, required this.listStepDTO}) : super(key: key);

  @override
  _StartCookingState createState() => _StartCookingState();
}

class _StartCookingState extends State<StartCooking> {
  int currentStep = 0;
  String buttonText = 'Étape suivante';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description : ${widget.listStepDTO[currentStep].name!}'),
              Text(
                  'Numéro d\'etape : ${widget.listStepDTO[currentStep].stepNumber.toString()}'),
              Text(
                  'Type d\'etape : ${widget.listStepDTO[currentStep].stepType!.name}'),
              Text(
                  'Nomnre d\'ustensils : ${widget.listStepDTO[currentStep].ustensils!.length.toString()}'),
              widget.listStepDTO[currentStep].ingredientLine != null
                  ? Column(
                      children: [
                        Text(widget.listStepDTO[currentStep].ingredientLine!
                            .ingredient.name),
                        Text(widget
                            .listStepDTO[currentStep].ingredientLine!.quantity
                            .toString())
                      ],
                    )
                  : SizedBox(
                      height: 20,
                    ),
              CustomButton(
                text: buttonText,
                onTap: _nextStep,
              ),
              Text('${currentStep + 1} / ${widget.listStepDTO.length}'),
            ],
          ),
        ),
      ),
    );
  }

  _nextStep() {
    currentStep++;
    _isLastStep()
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()))
        : setState(() {});
  }

  bool _isLastStep() {
    buttonText = currentStep + 1 == widget.listStepDTO.length
        ? 'J\'ai finis !'
        : 'Étape suivante';
    return currentStep == widget.listStepDTO.length;
  }
}
