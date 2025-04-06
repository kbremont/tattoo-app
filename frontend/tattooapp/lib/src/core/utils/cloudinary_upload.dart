import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

Future<String> uploadImageToCloudinary({
  required File file,
  required String cloudName,
  required String uploadPreset,
}) async {
  final uri = Uri.parse(
    'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
  );
  final mimeType = lookupMimeType(file.path);

  final request =
      http.MultipartRequest('POST', uri)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(
          await http.MultipartFile.fromPath(
            'file',
            file.path,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );

  final response = await request.send();

  if (response.statusCode != 200) {
    final body = await response.stream.bytesToString();
    throw Exception('Failed to upload image: ${response.statusCode} $body');
  }

  final responseData = await response.stream.bytesToString();
  final data = json.decode(responseData);

  return data['secure_url'];
}
