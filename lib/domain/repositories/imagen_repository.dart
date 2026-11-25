import 'dart:io';

abstract class ImagenRepository {
  Future<String> subirImagenProducto(File archivoImagen);
}
