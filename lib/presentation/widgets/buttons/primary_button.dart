import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

enum IconPosition { left, right }

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.label,
    super.key,
    this.disable = false,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height = 50,
    this.loading = false,
    this.icon,
    this.hoverColor,
    this.iconPosition = IconPosition.right,
    this.radius = 10,
    this.borderColor = Colors.transparent,
    this.textStyle,
    this.padding,
  });
  final VoidCallback onPressed;
  final bool loading;
  final bool disable;
  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double height;
  final Widget? icon;
  final double radius;
  final Color? hoverColor;
  final Color borderColor;
  final IconPosition? iconPosition;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool loading = false;
  bool disable = false;

  void init() {
    loading = widget.loading;
    disable = widget.disable;
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void didUpdateWidget(PrimaryButton oldWidget) {
    if (oldWidget.disable != widget.disable ||
        oldWidget.loading != widget.loading) {
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      elevation: 0,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: widget.padding,
      onPressed: () {
        if (loading || disable) {
          return;
        }
        widget.onPressed();
      },
      hoverColor: widget.hoverColor,
      mouseCursor: widget.disable ? SystemMouseCursors.forbidden : null,
      color: widget.buttonColor ??
          context.buttonColor.withOpacity(disable == true ? 0.3 : 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        side: BorderSide(color: widget.borderColor),
      ),
      child: Container(
        padding: widget.padding,
        width: widget.width ?? context.screenWidth(),
        height: widget.height,
        alignment: Alignment.center,
        child: loading
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: LoadingSpinner.circle(
                    strokeWidth: 2,
                    size: 10,
                    color: context.buttonTextColor,
                  ),
                ),
              )
            : widget.icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (widget.iconPosition == IconPosition.left) ...<Widget>[
                        widget.icon!,
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                      Text(
                        widget.label,
                        style: widget.textStyle ??
                            context.textTheme.titleSmall!.copyWith(
                              color:
                                  widget.textColor ?? context.buttonTextColor,
                            ),
                      ),
                      if (widget.iconPosition ==
                          IconPosition.right) ...<Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        widget.icon!,
                      ],
                    ],
                  )
                : Text(
                    widget.label,
                    style: widget.textStyle ??
                        context.textTheme.titleSmall!.copyWith(
                          color: widget.textColor ?? context.buttonTextColor,
                        ),
                  ),
      ),
    );
  }
}
