import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_favorito/models/video.dart';
import 'dart:async';

class FavoriteBloc implements BlocBase {

  Map<String, Video> _favorites = {};

  final StreamController<Map<String,Video>> _favController = StreamController();
  Stream<Map<String,Video>> get outFav => _favController.stream;

  void toggleFavorite(Video video){
    if (_favorites.containsKey(video.id)) _favorites.remove(video.id);
  }


  @override
  void dispose() {
    _favController.close();
  }
  
}