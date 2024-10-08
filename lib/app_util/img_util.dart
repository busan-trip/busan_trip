import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImgUtil {
  ///XFile -> 리사이즈(축소) Uint8List
  static Future<Uint8List> convertResizedUint8List({required XFile? xFile}) async{

    // XFile을 Uint8List로 변환
    Uint8List? bytes = await xFile!.readAsBytes();

    // Image 패키지를 사용하여 이미지 로드
    img.Image _image = img.decodeImage(Uint8List.fromList(bytes))!;


    //todo 사이즈 축소 (resize)
    // 이미지 리사이즈
    var h = (_image.height * 700)/ _image.width;
    img.Image resizedImage = img.copyResize(_image, width: 700, height: h.toInt());

    //todo f -> base64
    // 리사이즈된 이미지를 Uint8List로 변환
    Uint8List resizedBytes = Uint8List.fromList(img.encodePng(resizedImage));

    return resizedBytes;
  }
}