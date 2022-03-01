import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclipsdigital/bloc/albums_bloc.dart';
import 'package:eclipsdigital/model/albums.dart';
import 'package:eclipsdigital/model/albums_response.dart';
import 'package:eclipsdigital/model/users.dart';
import 'package:eclipsdigital/screens/user_album_detail_screen.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/user_album_item_loading_widget.dart';
import 'package:eclipsdigital/widget/user_album_item_widget.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatefulWidget {
  final int userId;
  const AlbumScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final AlbumsBloc _albumsBloc = AlbumsBloc();

  @override
  void initState() {
    _albumsBloc.getAlbums(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Albums",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<AlbumsResponse>(
        stream: _albumsBloc.subject,
        builder:
            (BuildContext context, AsyncSnapshot<AlbumsResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null &&
                snapshot.data!.error.length > 0) {
              return _buildErrorWidget(snapshot.data!.error);
            }
            return _buildAlbumWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data!.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: ListView(
            children: List.generate(
              7,
              (index) {
                return const UserAlbumItemLoadingWidget();
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(String error) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Error ecured $error",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumWidget(AlbumsResponse response) {
    List<Albums> albumsList = response.albumList;
    if (albumsList.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "There is no albums",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      return ListView(
        children: List.generate(
          albumsList.length,
          (index) {
            return UserAlbumItemWidget(
              albums: albumsList[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UserAlbumDetailScreen(
                    albumId: albumsList[index].id,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
