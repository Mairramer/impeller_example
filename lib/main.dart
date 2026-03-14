import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  static const String _profileImage =
      'https://images.ctfassets.net/kftzwdyauwt9/5QBdHjxB6xgmUxNy8BrCsw/c15c703680f1e5e629d43c24acaf67fe/VariationofDALLE2generationofaportraitpaintingofSalvadorDaliwitharobotichalfface7.jpeg?w=3840&q=90&fm=webp';

  @override
  Widget build(BuildContext context) {
    const image = NetworkImage(_profileImage);

    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Showcase')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _AvatarItem(
                label: 'CircleAvatar',
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFE63B15),
                  backgroundImage: image,
                ),
              ),
              _AvatarItem(
                label: 'SquareAvatar',
                child: SquareAvatar(
                  size: 80,
                  backgroundColor: Colors.blue,
                  backgroundImage: image,
                ),
              ),
              _AvatarItem(
                label: 'RectAvatar',
                child: RectAvatar(
                  width: 80,
                  height: 80,
                  backgroundColor: Colors.green,
                  backgroundImage: image,
                ),
              ),
              _AvatarItem(
                label: 'RRectAvatar',
                child: RRectAvatar(
                  size: 80,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  backgroundColor: Color(0xFFE63B15),
                  backgroundImage: image,
                ),
              ),
              _AvatarItem(
                label: 'Triangle',
                child: RawAvatar(
                  size: 80,
                  shape: TriangleBorder(),
                  backgroundColor: Colors.blue,
                  backgroundImage: image,
                ),
              ),
              _AvatarItem(
                label: 'Star',
                child: RawAvatar(
                  size: 80,
                  backgroundColor: Colors.purple,
                  shape: StarBorder(),
                  backgroundImage: image,
                ),
              ),
              _AvatarItem(
                label: 'Hexagon',
                child: RawAvatar(
                  size: 80,
                  backgroundColor: Colors.orange,
                  shape: HexagonBorder(),
                  backgroundImage: image,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarItem extends StatelessWidget {
  final String label;
  final Widget child;

  const _AvatarItem({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}

/// Base widget para todos os Avatares, encapsula `RawAvatar`.
///
/// Pode ser circular ou retangular com borda arredondada.
class Avatar extends StatelessWidget {
  /// Cria um Avatar customizável.
  const Avatar({
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.size,
    this.minSize,
    this.maxSize,
    this.textStyle,
    this.iconTheme,
    this.duration = const Duration(milliseconds: 200),
    this.boxShape = BoxShape.circle,
    this.borderRadius,
  });

  /// Widget filho exibido dentro do avatar, geralmente `Text` ou `Icon`.
  final Widget? child;

  /// Cor de fundo do avatar.
  final Color? backgroundColor;

  /// Imagem de fundo.
  final ImageProvider? backgroundImage;

  /// Imagem de primeiro plano.
  final ImageProvider? foregroundImage;

  /// Callback de erro ao carregar a imagem de fundo.
  final ImageErrorListener? onBackgroundImageError;

  /// Callback de erro ao carregar a imagem de primeiro plano.
  final ImageErrorListener? onForegroundImageError;

  /// Tamanho do avatar (altura e largura se quadrado, diâmetro se circular).
  final double? size;

  /// Tamanho mínimo do avatar.
  final double? minSize;

  /// Tamanho máximo do avatar.
  final double? maxSize;

  /// Estilo de texto padrão para o filho.
  final TextStyle? textStyle;

  /// Tema de ícone aplicado ao filho.
  final IconThemeData? iconTheme;

  /// Duração da animação ao alterar propriedades.
  final Duration duration;

  /// Forma básica do avatar, padrão: círculo.
  final BoxShape boxShape;

  /// Raio das bordas, usado quando [boxShape] é retangular.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return RawAvatar(
      backgroundColor: backgroundColor,
      backgroundImage: backgroundImage,
      foregroundImage: foregroundImage,
      onBackgroundImageError: onBackgroundImageError,
      onForegroundImageError: onForegroundImageError,
      size: size,
      minSize: minSize,
      maxSize: maxSize,
      textStyle: textStyle,
      iconTheme: iconTheme,
      duration: duration,
      boxShape: boxShape,
      borderRadius: borderRadius,
      child: child,
    );
  }
}

/// Avatar quadrado.
class SquareAvatar extends StatelessWidget {
  /// Cria um avatar quadrado.
  const SquareAvatar({
    super.key,
    this.size,
    this.minSize,
    this.maxSize,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
  });

  /// Tamanho do avatar (altura e largura iguais).
  final double? size;

  /// Tamanho mínimo do avatar.
  final double? minSize;

  /// Tamanho máximo do avatar.
  final double? maxSize;

  /// Widget filho.
  final Widget? child;

  /// Cor de fundo.
  final Color? backgroundColor;

  /// Imagem de fundo.
  final ImageProvider? backgroundImage;

  /// Imagem de primeiro plano.
  final ImageProvider? foregroundImage;

  @override
  Widget build(BuildContext context) {
    return Avatar(
      size: size,
      minSize: minSize,
      maxSize: maxSize,
      boxShape: BoxShape.rectangle,
      backgroundColor: backgroundColor,
      backgroundImage: backgroundImage,
      foregroundImage: foregroundImage,
      child: child,
    );
  }
}

/// Avatar retangular com width e height customizáveis.
class RectAvatar extends StatelessWidget {
  /// Cria um avatar retangular customizável.
  const RectAvatar({
    super.key,
    this.width,
    this.height,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
  });

  /// Largura do avatar.
  final double? width;

  /// Altura do avatar.
  final double? height;

  /// Widget filho.
  final Widget? child;

  /// Cor de fundo.
  final Color? backgroundColor;

  /// Imagem de fundo.
  final ImageProvider? backgroundImage;

  /// Imagem de primeiro plano.
  final ImageProvider? foregroundImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Avatar(
        boxShape: BoxShape.rectangle,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        foregroundImage: foregroundImage,
        child: child,
      ),
    );
  }
}

/// Avatar retangular com cantos arredondados.
class RRectAvatar extends StatelessWidget {
  /// Cria um avatar retangular com bordas arredondadas.
  const RRectAvatar({
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.size,
    this.minSize,
    this.maxSize,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.textStyle,
    this.iconTheme,
    this.duration = const Duration(milliseconds: 200),
  });

  /// Widget filho.
  final Widget? child;

  /// Cor de fundo.
  final Color? backgroundColor;

  /// Imagem de fundo.
  final ImageProvider? backgroundImage;

  /// Imagem de primeiro plano.
  final ImageProvider? foregroundImage;

  /// Callback de erro ao carregar a imagem de fundo.
  final ImageErrorListener? onBackgroundImageError;

  /// Callback de erro ao carregar a imagem de primeiro plano.
  final ImageErrorListener? onForegroundImageError;

  /// Tamanho do avatar.
  final double? size;

  /// Tamanho mínimo.
  final double? minSize;

  /// Tamanho máximo.
  final double? maxSize;

  /// Raio das bordas.
  final BorderRadius borderRadius;

  /// Estilo de texto do filho.
  final TextStyle? textStyle;

  /// Tema de ícones do filho.
  final IconThemeData? iconTheme;

  /// Duração da animação ao alterar propriedades.
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Avatar(
      size: size,
      minSize: minSize,
      maxSize: maxSize,
      boxShape: BoxShape.rectangle,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      backgroundImage: backgroundImage,
      foregroundImage: foregroundImage,
      onBackgroundImageError: onBackgroundImageError,
      onForegroundImageError: onForegroundImageError,
      textStyle: textStyle,
      iconTheme: iconTheme,
      duration: duration,
      child: child,
    );
  }
}

class TriangleBorder extends ShapeBorder {
  const TriangleBorder();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2, rect.top) // Topo central
      ..lineTo(rect.right, rect.bottom) // Canto inferior direito
      ..lineTo(rect.left, rect.bottom) // Canto inferior esquerdo
      ..close();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => this;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }
}

class HexagonBorder extends ShapeBorder {
  const HexagonBorder();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double w = rect.width;
    final double h = rect.height;

    return Path()
      ..moveTo(rect.left + w * 0.5, rect.top)
      ..lineTo(rect.right, rect.top + h * 0.25)
      ..lineTo(rect.right, rect.top + h * 0.75)
      ..lineTo(rect.left + w * 0.5, rect.bottom)
      ..lineTo(rect.left, rect.top + h * 0.75)
      ..lineTo(rect.left, rect.top + h * 0.25)
      ..close();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => this;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
}

class StarBorder extends ShapeBorder {
  const StarBorder({this.points = 5, this.innerRadiusRatio = 0.5});

  final int points;
  final double innerRadiusRatio;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();

    final double cx = rect.center.dx;
    final double cy = rect.center.dy;

    final double outerRadius = math.min(rect.width, rect.height) / 2;
    final double innerRadius = outerRadius * innerRadiusRatio;

    final int totalVertices = points * 2;
    final double angleStep = math.pi / points;

    for (int i = 0; i < totalVertices; i++) {
      final bool isOuter = i.isEven;
      final double radius = isOuter ? outerRadius : innerRadius;
      final double angle = -math.pi / 2 + angleStep * i;

      final double x = cx + radius * math.cos(angle);
      final double y = cy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => this;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
}
