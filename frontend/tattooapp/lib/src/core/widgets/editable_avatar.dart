import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditableAvatar extends StatelessWidget {
  final String? imageUrl;
  final void Function(File image) onImageSelected;
  final double size;

  const EditableAvatar({
    super.key,
    this.imageUrl,
    required this.onImageSelected,
    this.size = 96,
  });

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      onImageSelected(File(picked.path));
    }
  }

  ImageProvider? _resolveImage(String? path) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return NetworkImage(path);
    return FileImage(File(path));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: size / 2,
          // backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          backgroundImage: _resolveImage(imageUrl),
          backgroundColor: Colors.grey[300],
          child:
              imageUrl == null
                  ? Icon(Icons.person, size: size * 0.5, color: Colors.white70)
                  : null,
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: InkWell(
            onTap: () => _pickImage(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.edit, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
