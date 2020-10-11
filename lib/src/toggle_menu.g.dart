// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_menu.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ToggleMenuScaffold extends HookWidget {
  const ToggleMenuScaffold(
      {Key key,
      @required this.body,
      @required this.actions,
      this.primaryColor = const Color(0xFFFFCA28),
      this.secondaryColor = const Color(0xFFFF8F00)})
      : super(key: key);

  final Widget body;

  final List<Widget> actions;

  final Color primaryColor;

  final Color secondaryColor;

  @override
  Widget build(BuildContext _context) => toggleMenuScaffold(_context,
      body: body,
      actions: actions,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor);
}

class ToggleMenuButton extends HookWidget {
  const ToggleMenuButton(
      {Key key,
      this.active = false,
      this.onPressed,
      this.primaryColor = const Color(0xFFFFCA28),
      this.secondaryColor = const Color(0xFFFF8F00)})
      : super(key: key);

  final bool active;

  final Function onPressed;

  final Color primaryColor;

  final Color secondaryColor;

  @override
  Widget build(BuildContext _context) => toggleMenuButton(_context,
      active: active,
      onPressed: onPressed,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor);
}

class ToggleMenuButtonIcon extends HookWidget {
  const ToggleMenuButtonIcon(
      {Key key,
      @required this.active,
      this.primaryColor = const Color(0xFFFFCA28)})
      : super(key: key);

  final bool active;

  final Color primaryColor;

  @override
  Widget build(BuildContext _context) => toggleMenuButtonIcon(_context,
      active: active, primaryColor: primaryColor);
}
