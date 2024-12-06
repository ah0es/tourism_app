import 'package:flutter/widgets.dart';
import 'package:tourism_app/features/authentication/widgets/custom_text.dart';


class CustomButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final Color backgroundColor;
  final double height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.color = const Color(0xffffffff), // Default text color: white
    this.backgroundColor = const Color(0xff46A0DB), // Default background color: blue
    this.height = 60.0,
    this.borderColor = const Color(0xff46A0DB), // Default border color: blue
    required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isPressed || isHovered
                ? const Color(0xffffffff) // White background when hovered or pressed
                : widget.backgroundColor, // Blue background when idle
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.borderColor, // Blue border always
              width: 2.0,
            ),
          ),
          width: double.infinity,
          height: widget.height,
          child: Center(
            child: CustomText(
              text: widget.text,
              color: isPressed || isHovered
                  ? widget.borderColor // Blue text when hovered or pressed
                  : widget.color, // White text when idle
            ),
          ),
        ),
      ),
    );
  }
}
