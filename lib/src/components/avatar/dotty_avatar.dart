import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyAvatar extends StatelessWidget {
  const DottyAvatar({
    super.key,
    this.imageUrl,
    this.placeholder,
    this.size = 40,
    this.name,
    this.onTap,
  });

  final String? imageUrl;
  final String? placeholder;
  final double size;
  final String? name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: DottyColors.surface,
          border: Border.all(color: DottyColors.border),
        ),
        child: ClipOval(
          child: imageUrl != null
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildInitials(),
                )
              : _buildInitials(),
        ),
      ),
    );
  }

  Widget _buildInitials() {
    String initials = placeholder ?? '?';
    if (name != null && name!.isNotEmpty) {
      final parts = name!.split(' ');
      if (parts.length >= 2) {
        initials = '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      } else {
        initials = name![0].toUpperCase();
      }
    }

    return Center(
      child: Text(
        initials,
        style: DottyTypography.labelMedium.copyWith(
          fontSize: size * 0.4,
          color: DottyColors.accent,
        ),
      ),
    );
  }
}

class DottyAvatarGroup extends StatelessWidget {
  const DottyAvatarGroup({
    super.key,
    required this.avatars,
    this.max = 3,
    this.size = 32,
    this.overflow,
  });

  final List<DottyAvatar> avatars;
  final int max;
  final double size;
  final Widget? overflow;

  @override
  Widget build(BuildContext context) {
    final visible = avatars.take(max).toList();
    final remaining = avatars.length - max;

    return Row(
      children: [
        ...visible.map(
          (avatar) => Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Transform.translate(
              offset: Offset(-visible.indexOf(avatar) * size * 0.3, 0),
              child: SizedBox(width: size, height: size, child: avatar),
            ),
          ),
        ),
        if (remaining > 0 && overflow != null)
          Transform.translate(
            offset: Offset(-visible.length * size * 0.3, 0),
            child:
                overflow ??
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DottyColors.surface,
                    border: Border.all(color: DottyColors.border),
                  ),
                  child: Center(
                    child: Text(
                      '+$remaining',
                      style: DottyTypography.labelSmall.copyWith(
                        fontSize: size * 0.35,
                      ),
                    ),
                  ),
                ),
          ),
      ],
    );
  }
}
