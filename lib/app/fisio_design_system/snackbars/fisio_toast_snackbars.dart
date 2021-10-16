import '../colors_palette/colors_palette.dart';
import '../spacing/spacing.dart';
import '../text_styles/text_styles.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showToastSucess(String message, {String? subtitle}) => BotToast.showCustomNotification(
      duration: const Duration(seconds: 2),
      toastBuilder: (cancelFunc) => _ContainerFisioSnackbar(
        color: FisioColors.primaryColor,
        title: message,
        subtitle: subtitle,
        icon: Icons.check_circle_outline,
      ),
    );
void showToastError(String message, {String? subtitle}) => BotToast.showCustomNotification(
      duration: const Duration(seconds: 2),
      toastBuilder: (cancelFunc) => _ContainerFisioSnackbar(
        color: FisioColors.red,
        title: message,
        subtitle: subtitle,
        icon: Icons.check_circle_outline,
      ),
    );

class _ContainerFisioSnackbar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color color;

  const _ContainerFisioSnackbar({Key? key, required this.title, this.subtitle, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing),
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(top: Spacing.spacing),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: RobotoStyle.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: RobotoStyle.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]
                  ],
                ),
              ),
              InkWell(
                onTap: () => BotToast.cleanAll(),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
