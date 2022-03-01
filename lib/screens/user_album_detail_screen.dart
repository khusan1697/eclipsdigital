import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclipsdigital/bloc/albums_bloc.dart';
import 'package:eclipsdigital/bloc/photos_bloc.dart';
import 'package:eclipsdigital/model/photos.dart';
import 'package:eclipsdigital/model/photos_response.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/user_album_detail_item_widget.dart';
import 'package:eclipsdigital/widget/user_album_detail_loading_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/albums_response.dart';

class UserAlbumDetailScreen extends StatefulWidget {
  final int albumId;

  const UserAlbumDetailScreen({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  @override
  _UserAlbumDetailScreenState createState() => _UserAlbumDetailScreenState();
}

class _UserAlbumDetailScreenState extends State<UserAlbumDetailScreen> {
  final PhotosBloc _photosBloc = PhotosBloc();

  @override
  void initState() {
    _photosBloc.getPhotos(widget.albumId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Album Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: _photosBloc.subject,
        builder:
            (BuildContext context, AsyncSnapshot<PhotosResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null &&
                snapshot.data!.error.length > 0) {
              return _buildErrorWidget(snapshot.data!.error);
            }
            return _buildAlbumDetailWidget(snapshot.data!);
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
              2,
              (index) {
                return const UserAlbumDetailItemLoadingWidget();
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Column(
              children: const [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 4.0,
                  ),
                ),
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
              "Expaction ecured $error",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumDetailWidget(PhotosResponse photosResponse) {
    List<Photos> photosList = photosResponse.photosList;
    if (photosList.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "There is no album detail",
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    } else {
      return ListView(
        children: List.generate(
          photosList.length,
          (index) {
            return UserAlbumDetailItemWidget(
              photos: photosList[index],
            );
          },
        ),
      );
    }
  }
}
