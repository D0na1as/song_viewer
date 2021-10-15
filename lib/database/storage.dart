import 'package:song_viewer/models/song.dart';
import 'package:song_viewer/models/song_category.dart';

class Storage {
  Storage._();

  static List<SongCategory> songs = [
    const SongCategory(title: 'Rock', songs: [
      Song(
          title: 'AC/DC - Back In Black',
          imageLink:
              'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 263),
          size: 10),
      Song(
          title: 'Fleetwood Mac - Dreams - 2004 Remaster',
          imageLink:
              'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 223),
          size: 10),
      Song(
          title: 'The Rolling Stones - Paint It, Black',
          imageLink:
              'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 53),
          size: 10),
      Song(
          title: 'Foo Fighters - Everlong',
          imageLink:
              'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 263),
          size: 10),
      Song(
          title: 'Led Zeppelin - Stairway to Heaven - Remaster',
          imageLink:
              'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 293),
          size: 10),
      Song(
          title: 'Guns N\' Roses - Sweet Child O\' Mine',
          imageLink:
              'https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 203),
          size: 10),
    ]),
    const SongCategory(title: 'Trance', songs: [
      Song(
          title: 'Armin van Buuren - Blah Blah Blah',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 303),
          size: 10),
      Song(
          title: 'ATB - 9Pm (Till I Come)',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 223),
          size: 10),
      Song(
          title: 'Gareth Emery, Sarah de Warren - Calling Home',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 53),
          size: 10),
      Song(
          title: 'Dash Berlin - Till The Sky Falls Down',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 263),
          size: 10),
      Song(
          title: 'Chicane, Moya Brennan - Saltwater',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 293),
          size: 10),
      Song(
          title:
              'Art Of Trance, Ferry Corsten - Madagascar - Ferry Corsten Remix',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 203),
          size: 10),
      Song(
          title: 'Paul van Dyk - For An Angel - Radio Edit',
          imageLink:
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
          duration: Duration(seconds: 203),
          size: 10),
    ]),
    const SongCategory(title: 'Hip Hop', songs: [
      Song(
          title: 'Polo G, Lil Wayne - GANG GANG (with Lil Wayne)',
          imageLink:
              'https://images.unsplash.com/photo-1601643157091-ce5c665179ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1172&q=80',
          duration: Duration(seconds: 263),
          size: 10),
      Song(
          title: 'Kendrick Lamar - HUMBLE.',
          imageLink:
              'https://images.unsplash.com/photo-1601643157091-ce5c665179ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1172&q=80',
          duration: Duration(seconds: 223),
          size: 10),
      Song(
          title: 'Kid Cudi, Skepta - Show Out (with Skepta & Pop Smoke)',
          imageLink:
              'https://images.unsplash.com/photo-1601643157091-ce5c665179ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1172&q=80',
          duration: Duration(seconds: 53),
          size: 10),
    ]),
  ];
}
