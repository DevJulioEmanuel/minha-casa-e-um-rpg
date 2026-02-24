import 'dart:ui';

import 'package:minha_casa_rpg_app/features/avatares/data/color_model.dart';

class ColorRepository {
  static const List<ColorModel> colors = [
    // --- VERMELHOS / ROSAS ---
    ColorModel(id: "Vermelho Suave", color: Color(0xFFC96B6B)),
    ColorModel(id: "Rosa Antigo", color: Color(0xFFC7829E)),

    // --- LARANJAS / TERSACOTAS ---
    ColorModel(id: "Laranja Pastel", color: Color(0xFFD6946A)),
    ColorModel(id: "Terracota Clara", color: Color(0xFFC97C5D)),

    // --- AMARELOS / DOURADOS (Levemente "queimados" pro branco aparecer) ---
    ColorModel(id: "Amarelo Mel", color: Color(0xFFC4A454)),
    ColorModel(id: "Dourado Fosco", color: Color(0xFFB5984A)),

    // --- VERDES ---
    ColorModel(id: "Verde Musgo", color: Color(0xFF8BA882)),
    ColorModel(id: "Verde Sálvia", color: Color(0xFF7CA391)),

    // --- AZUIS ---
    ColorModel(id: "Azul Sereno", color: Color(0xFF6794B5)),
    ColorModel(id: "Azul Denim", color: Color(0xFF798DB5)),

    // --- ROXOS / VIOLETAS ---
    ColorModel(id: "Lavanda Médio", color: Color(0xFF9381B8)),
    ColorModel(id: "Ametista Pálida", color: Color(0xFFA67DA3)),
  ];
}