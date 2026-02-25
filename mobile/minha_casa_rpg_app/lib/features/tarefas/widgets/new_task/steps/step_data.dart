import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class StepData extends StatelessWidget {
  final Function(DateTime) onNext;
  final VoidCallback onBack;

  const StepData({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(3),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Escolha a data",
            style: Theme.of(context).textTheme.titleMedium),
        
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2028),
              initialDate: DateTime.now(),
            );
            if (date != null) onNext(date);
          },
          child: Image.asset(
            "assets/icons/calendario.png",
            filterQuality: FilterQuality.none,
            scale: 0.4,
          ),
        ),
        SizedBox(height: 24),
        RpgStepButtom(texto: "VOLTAR", function: onBack)
      ],
    );
  }
}