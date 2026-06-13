// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TestPage(),
//     );
//   }
// }

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   static const String _profileImage =
//       'https://images.ctfassets.net/kftzwdyauwt9/5QBdHjxB6xgmUxNy8BrCsw/c15c703680f1e5e629d43c24acaf67fe/VariationofDALLE2generationofaportraitpaintingofSalvadorDaliwitharobotichalfface7.jpeg?w=3840&q=90&fm=webp';

//   @override
//   Widget build(BuildContext context) {
//     const image = NetworkImage(_profileImage);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Avatar Showcase')),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Center(
//           child: Wrap(
//             spacing: 24,
//             runSpacing: 24,
//             alignment: WrapAlignment.center,
//             children: [
//               const _AvatarItem(
//                 label: 'CircleAvatar',
//                 child: CircleAvatar(
//                   radius: 40,
//                   backgroundColor: Color(0xFFE63B15),
//                   backgroundImage: image,
//                 ),
//               ),
//               const _AvatarItem(
//                 label: 'SquareAvatar',
//                 child: SquareAvatar(
//                   constraints: BoxConstraints.tightFor(width: 80, height: 80),
//                   backgroundColor: Colors.blue,
//                   backgroundImage: image,
//                 ),
//               ),
//               const _AvatarItem(
//                 label: 'RectAvatar',
//                 child: RectAvatar(
//                   width: 80,
//                   height: 80,
//                   backgroundColor: Colors.green,
//                   backgroundImage: image,
//                 ),
//               ),
//               _AvatarItem(
//                 label: 'RRectAvatar',
//                 child: RRectAvatar(
//                   constraints: const BoxConstraints.tightFor(width: 80, height: 80),
//                   borderRadius: const BorderRadius.all(Radius.circular(16)),
//                   backgroundColor: const Color(0xFFE63B15),
//                   backgroundImage: image,
//                   shapeBorder: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0), // Define o arredondamento
//                     // side: const BorderSide(color: Colors.b, width: 1), // Opcional: adiciona borda
//                   ),
//                 ),
//               ),
//               const _AvatarItem(
//                 label: 'Triangle',
//                 child: RawAvatar(
//                   constraints: BoxConstraints.tightFor(width: 80, height: 80),
//                   shape: TriangleBorder(),
//                   backgroundColor: Colors.blue,
//                   backgroundImage: image,
//                 ),
//               ),
//               const _AvatarItem(
//                 label: 'Star',
//                 child: RawAvatar(
//                   constraints: BoxConstraints.tightFor(width: 80, height: 80),
//                   backgroundColor: Colors.purple,
//                   shape: StarBorder(),
//                   backgroundImage: image,
//                 ),
//               ),
//               const _AvatarItem(
//                 label: 'Hexagon',
//                 child: RawAvatar(
//                   constraints: BoxConstraints.tightFor(width: 80, height: 80),
//                   backgroundColor: Colors.orange,
//                   shape: HexagonBorder(),
//                   backgroundImage: image,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _AvatarItem extends StatelessWidget {
//   final String label;
//   final Widget child;

//   const _AvatarItem({
//     required this.label,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         child,
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: Theme.of(context).textTheme.labelMedium,
//         ),
//       ],
//     );
//   }
// }

// /// Base widget para todos os Avatares, encapsula `RawAvatar`.
// ///
// /// Pode ser circular ou retangular com borda arredondada.
// class Avatar extends StatelessWidget {
//   /// Cria um Avatar customizável.
//   const Avatar({
//     super.key,
//     this.child,
//     this.backgroundColor,
//     this.backgroundImage,
//     this.foregroundImage,
//     this.onBackgroundImageError,
//     this.onForegroundImageError,
//     this.constraints,
//     this.textStyle,
//     this.iconTheme,
//     this.duration = const Duration(milliseconds: 200),
//     this.boxShape = BoxShape.circle,
//     this.shapeBorder,
//   });

//   /// Widget filho exibido dentro do avatar, geralmente `Text` ou `Icon`.
//   final Widget? child;

//   /// Cor de fundo do avatar.
//   final Color? backgroundColor;

//   /// Imagem de fundo.
//   final ImageProvider? backgroundImage;

//   /// Imagem de primeiro plano.
//   final ImageProvider? foregroundImage;

//   /// Callback de erro ao carregar a imagem de fundo.
//   final ImageErrorListener? onBackgroundImageError;

//   /// Callback de erro ao carregar a imagem de primeiro plano.
//   final ImageErrorListener? onForegroundImageError;

//   final BoxConstraints? constraints;

//   /// Estilo de texto padrão para o filho.
//   final TextStyle? textStyle;

//   /// Tema de ícone aplicado ao filho.
//   final IconThemeData? iconTheme;

//   /// Duração da animação ao alterar propriedades.
//   final Duration duration;

//   /// Forma básica do avatar, padrão: círculo.
//   final BoxShape? boxShape;

//   final ShapeBorder? shapeBorder;

//   @override
//   Widget build(BuildContext context) {
//     return RawAvatar(
//       backgroundColor: backgroundColor,
//       backgroundImage: backgroundImage,
//       foregroundImage: foregroundImage,
//       onBackgroundImageError: onBackgroundImageError,
//       onForegroundImageError: onForegroundImageError,
//       constraints: constraints,
//       duration: duration,
//       boxShape: boxShape,
//       shape: shapeBorder,
//       // borderRadius: borderRadius,
//       child: child,
//     );
//   }
// }

// /// Avatar quadrado.
// class SquareAvatar extends StatelessWidget {
//   /// Cria um avatar quadrado.
//   const SquareAvatar({
//     super.key,
//     this.constraints,
//     this.child,
//     this.backgroundColor,
//     this.backgroundImage,
//     this.foregroundImage,
//   });

//   final BoxConstraints? constraints;

//   /// Widget filho.
//   final Widget? child;

//   /// Cor de fundo.
//   final Color? backgroundColor;

//   /// Imagem de fundo.
//   final ImageProvider? backgroundImage;

//   /// Imagem de primeiro plano.
//   final ImageProvider? foregroundImage;

//   @override
//   Widget build(BuildContext context) {
//     return Avatar(
//       constraints: constraints,
//       boxShape: BoxShape.rectangle,
//       backgroundColor: backgroundColor,
//       backgroundImage: backgroundImage,
//       foregroundImage: foregroundImage,
//       child: child,
//     );
//   }
// }

// /// Avatar retangular com width e height customizáveis.
// class RectAvatar extends StatelessWidget {
//   /// Cria um avatar retangular customizável.
//   const RectAvatar({
//     super.key,
//     this.width,
//     this.height,
//     this.child,
//     this.backgroundColor,
//     this.backgroundImage,
//     this.foregroundImage,
//   });

//   /// Largura do avatar.
//   final double? width;

//   /// Altura do avatar.
//   final double? height;

//   /// Widget filho.
//   final Widget? child;

//   /// Cor de fundo.
//   final Color? backgroundColor;

//   /// Imagem de fundo.
//   final ImageProvider? backgroundImage;

//   /// Imagem de primeiro plano.
//   final ImageProvider? foregroundImage;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: Avatar(
//         boxShape: BoxShape.rectangle,
//         backgroundColor: backgroundColor,
//         backgroundImage: backgroundImage,
//         foregroundImage: foregroundImage,
//         child: child,
//       ),
//     );
//   }
// }

// /// Avatar retangular com cantos arredondados.
// class RRectAvatar extends StatelessWidget {
//   /// Cria um avatar retangular com bordas arredondadas.
//   const RRectAvatar({
//     super.key,
//     this.child,
//     this.backgroundColor,
//     this.backgroundImage,
//     this.foregroundImage,
//     this.onBackgroundImageError,
//     this.onForegroundImageError,
//     this.constraints,
//     this.borderRadius = const BorderRadius.all(Radius.circular(12)),
//     this.textStyle,
//     this.iconTheme,
//     this.duration = const Duration(milliseconds: 200),
//     this.boxShape,
//     this.shapeBorder,
//   });

//   /// Widget filho.
//   final Widget? child;

//   /// Cor de fundo.
//   final Color? backgroundColor;

//   /// Imagem de fundo.
//   final ImageProvider? backgroundImage;

//   /// Imagem de primeiro plano.
//   final ImageProvider? foregroundImage;

//   /// Callback de erro ao carregar a imagem de fundo.
//   final ImageErrorListener? onBackgroundImageError;

//   /// Callback de erro ao carregar a imagem de primeiro plano.
//   final ImageErrorListener? onForegroundImageError;

//   final BoxConstraints? constraints;

//   /// Raio das bordas.
//   final BorderRadius borderRadius;

//   /// Estilo de texto do filho.
//   final TextStyle? textStyle;

//   /// Tema de ícones do filho.
//   final IconThemeData? iconTheme;

//   /// Duração da animação ao alterar propriedades.
//   final Duration duration;

//   /// Forma básica do avatar, padrão: círculo.
//   final BoxShape? boxShape;

//   final ShapeBorder? shapeBorder;

//   @override
//   Widget build(BuildContext context) {
//     return Avatar(
//       constraints: constraints,
//       boxShape: boxShape,
//       shapeBorder: shapeBorder,
//       backgroundColor: backgroundColor,
//       backgroundImage: backgroundImage,
//       foregroundImage: foregroundImage,
//       onBackgroundImageError: onBackgroundImageError,
//       onForegroundImageError: onForegroundImageError,
//       textStyle: textStyle,
//       iconTheme: iconTheme,
//       duration: duration,
//       child: child,
//     );
//   }
// }

// class TriangleBorder extends ShapeBorder {
//   const TriangleBorder();

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     return Path()
//       ..moveTo(rect.left + rect.width / 2, rect.top) // Topo central
//       ..lineTo(rect.right, rect.bottom) // Canto inferior direito
//       ..lineTo(rect.left, rect.bottom) // Canto inferior esquerdo
//       ..close();
//   }

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return getOuterPath(rect, textDirection: textDirection);
//   }

//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   ShapeBorder scale(double t) => this;

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     // TODO: implement paint
//   }
// }

// class HexagonBorder extends ShapeBorder {
//   const HexagonBorder();

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final double w = rect.width;
//     final double h = rect.height;

//     return Path()
//       ..moveTo(rect.left + w * 0.5, rect.top)
//       ..lineTo(rect.right, rect.top + h * 0.25)
//       ..lineTo(rect.right, rect.top + h * 0.75)
//       ..lineTo(rect.left + w * 0.5, rect.bottom)
//       ..lineTo(rect.left, rect.top + h * 0.75)
//       ..lineTo(rect.left, rect.top + h * 0.25)
//       ..close();
//   }

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return getOuterPath(rect, textDirection: textDirection);
//   }

//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   ShapeBorder scale(double t) => this;

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
// }

// class StarBorder extends ShapeBorder {
//   const StarBorder({this.points = 5, this.innerRadiusRatio = 0.5});

//   final int points;
//   final double innerRadiusRatio;

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final Path path = Path();

//     final double cx = rect.center.dx;
//     final double cy = rect.center.dy;

//     final double outerRadius = math.min(rect.width, rect.height) / 2;
//     final double innerRadius = outerRadius * innerRadiusRatio;

//     final int totalVertices = points * 2;
//     final double angleStep = math.pi / points;

//     for (int i = 0; i < totalVertices; i++) {
//       final bool isOuter = i.isEven;
//       final double radius = isOuter ? outerRadius : innerRadius;
//       final double angle = -math.pi / 2 + angleStep * i;

//       final double x = cx + radius * math.cos(angle);
//       final double y = cy + radius * math.sin(angle);

//       if (i == 0) {
//         path.moveTo(x, y);
//       } else {
//         path.lineTo(x, y);
//       }
//     }

//     path.close();
//     return path;
//   }

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return getOuterPath(rect, textDirection: textDirection);
//   }

//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   ShapeBorder scale(double t) => this;

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
// }

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Modal Barrier')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 150),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _showBlurryDialog(context),
              child: const Text('Open Glass Modal'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBlurryDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 400),

      // 1. New native barrierBuilder handling the blur!
      barrierBuilder: (context, animation, barrier) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final double currentBlur = animation.value * 20.0;

            if (currentBlur == 0.0) {
              return barrier;
            }

            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: currentBlur,
                sigmaY: currentBlur,
              ),
              child: barrier,
            );
          },
        );
      },

      // 2. Custom transitions
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      },

      // 3. The page content itself
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Card(
            elevation: 0,
            color: Colors.white.withValues(alpha: 0.9),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Clean Glass Effect',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This ModalBarrier uses a BackdropFilter to achieve a premium blur effect while maintaining dismissal control.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
