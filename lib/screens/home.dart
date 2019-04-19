
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_favorito/blocs/favorite_bloc.dart';
import 'package:youtube_favorito/blocs/videos_bloc.dart';
import 'package:youtube_favorito/delegates/data_search.dart';
import 'package:youtube_favorito/models/video.dart';
import 'package:youtube_favorito/screens/favorites.dart';
import 'package:youtube_favorito/tiles/video_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<VideosBloc>(context);
    final blocFav = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25.0,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: StreamBuilder<Map<String, Video>>(
              initialData: {},
              stream: blocFav.outFav,
              builder: (context,snapshot){
                if (snapshot.hasData) {
                  return Text("${snapshot.data.length}");
                } else {
                  return Container();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Favorites()));
            },
          ), 
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result = await showSearch(context: context, delegate: DataSearch());
              if( result != null ){
                bloc.inSearch.add(result);
              }
            },
          ),          
        ],
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder(
        initialData: [],
        stream: bloc.outVideos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index){
                print("Index: ${index}");
                print("SnapshotSize: ${snapshot.data.length}");
                if (index < snapshot.data.length) {
                  return VideoTile(snapshot.data[index]);
                }else if( index > 1 ){
                  bloc.inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                  );
                } else {
                  return Container();
                }
              },
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}