import 'package:flutter/material.dart';

class BuildNivelChip extends StatelessWidget {
  final String valor;
  final String label;
  final String nivelSelecionado;
  final Function(String) onSelecionado;

  const BuildNivelChip({
    super.key,
    required this.valor,
    required this.label,
    required this.nivelSelecionado,
    required this.onSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selecionado = nivelSelecionado == valor;

    return ChoiceChip(
      label: Text(label),
      selected: selecionado,
      selectedColor: theme.colorScheme.primary,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: selecionado
            ? Colors.white
            : theme.colorScheme.secondary,
      ),
      onSelected: (_) => onSelecionado(valor),
    );
  }
}