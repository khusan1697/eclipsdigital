import 'package:dio/dio.dart';
import 'package:eclipsdigital/model/albums_response.dart';
import 'package:eclipsdigital/model/comments_response.dart';
import 'package:eclipsdigital/model/photos_response.dart';
import 'package:eclipsdigital/model/posts_respons.dart';
import 'package:eclipsdigital/model/users_response.dart';

class EclipsDigitalRepository {
  static String mainUrl = "https://jsonplaceholder.typicode.com";
  var getPostUrl = "$mainUrl/posts";
  var getCommentsUrl = "$mainUrl/comments?";
  var getCommentsPostUrl = "$mainUrl/comments";
  var getUsersUrl = "$mainUrl/users";
  var getAlbumsUrl = "$mainUrl/albums";
  var getPhotosUrl = "$mainUrl/photos";
  final Dio _dio = Dio();

  Future<PostsResponse> getPosts() async {
    try {
      Response response = await _dio.get(getPostUrl);
      return PostsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Expaction Ecuret $stacktrace");
      return PostsResponse.withError("$error");
    }
  }

  Future<CommentsResponse> getComments(int postId) async {
    var post = {"postId": postId};
    try {
      Response response = await _dio.get(getCommentsUrl, queryParameters: post);
      return CommentsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Expaction Ecurat $stacktrace");
      return CommentsResponse.withError("$error");
    }
  }

  Future<void> postComment(int postId, String comment) async {
    var postParam = {
      "postId": postId,
      "email": "eclips.digital@gmail.com",
      "name": "Eclips Digital",
      "body": comment
    };
    Response response = await _dio.post(getCommentsPostUrl, data: postParam);
    print(response.data);
  }

  Future<UsersResponse> getUsers() async {
    try {
      Response response = await _dio.get(getUsersUrl);
      return UsersResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Expaction Ecurat $stacktrace");
      return UsersResponse.withError("$error");
    }
  }

  Future<PostsResponse> getUserPost(int userId) async {
    var postId = {"userId": userId};
    try {
      Response response = await _dio.get(getPostUrl, queryParameters: postId);
      return PostsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Expaction Ecurat $stacktrace");
      return PostsResponse.withError("$error");
    }
  }

  Future<AlbumsResponse> getAlbums(int userId) async {
    var albumParam = {"userId": userId};
    try {
      Response response =
          await _dio.get(getAlbumsUrl, queryParameters: albumParam);
      return AlbumsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Expaction Ecure $stacktrace");
      return AlbumsResponse.withError("$error");
    }
  }

  Future<PhotosResponse> getPhotos(int albumId) async {
    var photoParam = {"albumId": albumId};
    try {
      Response response =
          await _dio.get(getPhotosUrl, queryParameters: photoParam);
      return PhotosResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Expaction Ecure $stacktrace");
      return PhotosResponse.withError("$error");
    }
  }

  Future<String> profile(int userId, String title, String description) async {
    var profileParam = {"title": title, "body": description, "userId": userId};
    Response response = await _dio.post(getPostUrl, data: profileParam);
    return response.data;
  }
}
