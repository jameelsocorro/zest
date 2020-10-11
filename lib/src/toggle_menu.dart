import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'toggle_menu.g.dart';

@hwidget
Widget toggleMenuScaffold(
  BuildContext context, {
  @required Widget body,
  @required List<Widget> actions,
  Color primaryColor = const Color(0xFFFFCA28),
  Color secondaryColor = const Color(0xFFFF8F00),
}) {
  final active = useState(false);

  setActive() {
    active.value = !active.value;
  }

  return Stack(
    children: [
      Positioned(
        top: 0,
        child: body,
      ),
      if (actions?.length > 0)
        ...actions.asMap().entries.map(
              (m) => AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOutCubic,
                bottom: active.value ? ((m.key + 1) * 70.00) + 40.00 : 40,
                right: 40,
                child: AnimatedOpacity(
                  opacity: active.value ? 1 : 0,
                  duration: const Duration(milliseconds: 50),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: m.value,
                  ),
                ),
              ),
            ),
      Positioned(
        bottom: 40,
        right: 40,
        child: ToggleMenuButton(
          active: active.value,
          onPressed: setActive,
        ),
      )
    ],
  );
}

@hwidget
Widget toggleMenuButton(
  BuildContext context, {
  bool active = false,
  Function onPressed,
  Color primaryColor = const Color(0xFFFFCA28),
  Color secondaryColor = const Color(0xFFFF8F00),
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 60,
      width: 60,
      child: Center(
        child: AnimatedContainer(
          height: active ? 45 : 60,
          width: active ? 45 : 60,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOutCubic,
          decoration: BoxDecoration(
            color: active ? secondaryColor : Colors.white,
            shape: BoxShape.circle,
          ),
          child: ToggleMenuButtonIcon(active: active),
        ),
      ),
    ),
  );
}

@hwidget
Widget toggleMenuButtonIcon(BuildContext context, {@required bool active, Color primaryColor = const Color(0xFFFFCA28)}) {
  final controller = useAnimationController(duration: const Duration(milliseconds: 100));
  final animation = Tween(begin: 0.0, end: 2.35).animate(controller);

  if (active) {
    controller.forward();
  } else {
    controller.reverse();
  }

  return AnimatedBuilder(
    animation: animation,
    builder: (context, child) {
      return Transform.rotate(
        angle: animation.value,
        child: Icon(
          Icons.add,
          color: active ? Colors.white : primaryColor,
        ),
      );
    },
  );
}
