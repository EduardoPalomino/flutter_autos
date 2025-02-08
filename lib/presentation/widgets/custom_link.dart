import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLink extends StatelessWidget {
  final String texto;
  final String? url; // URL para abrir enlaces externos (opcional)
  final VoidCallback? onTap; // Acción personalizada para navegación interna (opcional)

  const CustomLink({
    Key? key,
    required this.texto,
    this.url,
    this.onTap,
  }) : super(key: key);

  void _launchURL(BuildContext context) async {
    if (url != null) {
      final Uri uri = Uri.parse(url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se puede abrir el enlace: $url')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => _launchURL(context),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
