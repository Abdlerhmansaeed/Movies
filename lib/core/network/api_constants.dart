class ApiConstants {
  ApiConstants._();
  static const String baseUrl = ' https://route-movie-apis.vercel.app/';
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String resetPassword = "auth/reset-password";
  static const String addFavMovies = "favorites/add";
  static const String getFavMovies = "favorites/all";
  static const String removeFavMovies = "favorites/remove/movieId";
  static const String isFavMovie = "favorites/is-favorite/movieId";
  static const String getprofile = "profile";
  static const String updateProfile = "profile";
  static const String deleteProfile = "profile";

  //========================MoviesConstsnts=================
  static const String getMovies = "list_movies.json";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
