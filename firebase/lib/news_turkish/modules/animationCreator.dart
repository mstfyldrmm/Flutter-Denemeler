import 'package:flutter/cupertino.dart';

class AnimationCreator {
  static Route createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Sağdan gelen
        const end = Offset.zero; // Hedef konum
        const curve = Curves.easeInOutCubic;

        // Animasyonun ilerlemesini hesapla
        var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: curve)); // Eğri ile birleştir
        var offsetAnimation = animation.drive(tween);

        // Geçişi oluştur
        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            // Fade efekt ekle
            opacity: animation, // Geçiş sırasında opaklık
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 50000), // Animasyon süresi
    );
  }
}
