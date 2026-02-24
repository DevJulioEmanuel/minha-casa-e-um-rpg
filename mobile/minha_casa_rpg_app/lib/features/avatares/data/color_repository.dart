import 'dart:ui';

import 'package:minha_casa_rpg_app/features/avatares/data/color_model.dart';

class ColorRepository {
  static const List<ColorModel> colors = [
    // --- VERMELHOS / ROSAS ---
    ColorModel(id: "vermelho_suave", color: Color(0xFFC96B6B)),
    ColorModel(id: "rosa_antigo", color: Color(0xFFC7829E)),

    // --- LARANJAS / TERSACOTAS ---
    ColorModel(id: "laranja_pastel", color: Color(0xFFD6946A)),
    ColorModel(id: "terracota_clara", color: Color(0xFFC97C5D)),

    // --- AMARELOS / DOURADOS (Levemente "queimados" pro branco aparecer) ---
    ColorModel(id: "amarelo_mel", color: Color(0xFFC4A454)),
    ColorModel(id: "dourado_fosco", color: Color(0xFFB5984A)),

    // --- VERDES ---
    ColorModel(id: "verde_musgo", color: Color(0xFF8BA882)),
    ColorModel(id: "verde_salvia", color: Color(0xFF7CA391)),

    // --- AZUIS ---
    ColorModel(id: "azul_sereno", color: Color(0xFF6794B5)),
    ColorModel(id: "azul_denim", color: Color(0xFF798DB5)),

    // --- ROXOS / VIOLETAS ---
    ColorModel(id: "lavanda_medio", color: Color(0xFF9381B8)),
    ColorModel(id: "ametista_palida", color: Color(0xFFA67DA3)),
  ];
}