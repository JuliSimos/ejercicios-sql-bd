## TP3: Ejercicio 3: Insertar datos en tablas
- Genere un script con los insert correspondientes para cargar 10 registros para cada tabla del Diagrama 1 del Ejercicio 1

### REPOSITORIO
``` sql
INSERT INTO RESPOSITORIO (id_repo, nombre, publico, descripcion, propietario) VALUES
(1, 'Repositorio Central', 'S', 'Repositorio principal', 'Admin'),
(2, 'Repositorio Audio', 'S', 'Audios educativos', 'Equipo A'),
(3, 'Repositorio Video', 'S', 'Videos documentales', 'Equipo B'),
(4, 'Repositorio Docs', 'N', 'Documentos internos', 'Empresa X'),
(5, 'Repo Multimedia', 'S', 'Multimedia general', 'Equipo C'),
(6, 'Repo Cultura', 'S', 'Contenido cultural', 'Cultura AR'),
(7, 'Repo Historia', 'N', 'Archivos históricos', 'Archivo'),
(8, 'Repo Ciencia', 'S', 'Ciencia y educación', 'Ciencia'),
(9, 'Repo Arte', 'S', 'Arte digital', 'Museo'),
(10,'Repo Privado', 'N', 'Uso privado', 'Usuario');

```


### COLECCION
``` sql
INSERT INTO COLECCION (id_coleccion, titulo_coleccion, descripcion) VALUES
(1, 'Audios Música', 'Colección de música'),
(2, 'Audios Podcast', 'Podcasts variados'),
(3, 'Videos Educación', 'Clases grabadas'),
(4, 'Videos Documentales', 'Documentales'),
(5, 'Docs Técnicos', 'Documentación técnica'),
(6, 'Docs Académicos', 'Artículos académicos'),
(7, 'Audios Historia', 'Relatos históricos'),
(8, 'Videos Arte', 'Arte audiovisual'),
(9, 'Docs Legales', 'Documentos legales'),
(10,'Multimedia Mixto', 'Colección variada');

```


### OBJETO
- Acá se conectan colección + repositorio
- El campo `tipo`:
    - `A` = Audio
    - `V` = Video
    - `D` = Documento
      
``` sql
INSERT INTO OBJETO 
(id_coleccion, id_objeto, id_repo, titulo, descripcion, fuente, fecha, tipo) VALUES
(1, 1, 2, 'Audio Rock', 'Tema musical', 'Spotify', '2023-01-10', 'A'),
(2, 2, 2, 'Podcast Tech', 'Podcast tecnología', 'Web', '2023-02-11', 'A'),
(3, 3, 3, 'Clase Matemática', 'Video educativo', 'YouTube', '2023-03-12', 'V'),
(4, 4, 3, 'Doc Naturaleza', 'Documental', 'Canal', '2023-04-13', 'V'),
(5, 5, 4, 'Manual SQL', 'Guía SQL', 'PDF', '2023-05-14', 'D'),
(6, 6, 4, 'Paper IA', 'Investigación IA', 'IEEE', '2023-06-15', 'D'),
(7, 7, 6, 'Relato Antiguo', 'Audio histórico', 'Archivo', '2023-07-16', 'A'),
(8, 8, 9, 'Video Arte', 'Arte moderno', 'Museo', '2023-08-17', 'V'),
(9, 9, 10,'Contrato', 'Documento legal', 'Interno', '2023-09-18', 'D'),
(10,10,5,'Mix Media', 'Contenido mixto', 'Web', '2023-10-19', 'A');


```


### VIDEO
``` sql
INSERT INTO VIDEO (id_coleccion, id_objeto, resolucion, frames_x_segundo) VALUES
(3, 3, '1920x1080', 30),
(4, 4, '1280x720', 24),
(8, 8, '1920x1080', 60),
(3, 3, '3840x2160', 30),
(4, 4, '1920x1080', 30),
(8, 8, '1280x720', 24),
(3, 3, '1920x1080', 60),
(4, 4, '3840x2160', 30),
(8, 8, '1920x1080', 30),
(3, 3, '1280x720', 24);

```


### AUDIO
``` sql
INSERT INTO AUDIO (id_coleccion, id_objeto, formato, duracion) VALUES
(1, 1, 'MP3', 210),
(2, 2, 'MP3', 180),
(7, 7, 'WAV', 300),
(10,10,'AAC', 240),
(1, 1, 'OGG', 220),
(2, 2, 'AAC', 200),
(7, 7, 'MP3', 260),
(10,10,'MP3', 230),
(1, 1, 'FLAC', 400),
(2, 2, 'MP3', 190);

```


### DOCUMENTO
``` sql
INSERT INTO DOCUMENTO 
(id_coleccion, id_objeto, tipo_publicacion, modos_color, resolucion_captura) VALUES
(5, 5, 'Manual', 1, '300dpi'),
(6, 6, 'Artículo', 1, '600dpi'),
(9, 9, 'Legal', 0, '300dpi'),
(5, 5, 'Guía', 1, '300dpi'),
(6, 6, 'Paper', 1, '600dpi'),
(9, 9, 'Contrato', 0, '300dpi'),
(5, 5, 'Manual', 1, '600dpi'),
(6, 6, 'Artículo', 1, '300dpi'),
(9, 9, 'Legal', 0, '600dpi'),
(5, 5, 'Guía', 1, '300dpi');

```
