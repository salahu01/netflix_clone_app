import 'package:tmdb_api/tmdb_api.dart';

class Functions {
  static const String apikey = '536ddbd96e937b073b3833670547e756';
  static const String readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MzZkZGJkOTZlOTM3YjA3M2IzODMzNjcwNTQ3ZTc1NiIsInN1YiI6IjYyYWQ2YTJlOTQ0YTU3MDA1MDEyM2E2YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ib4E5zl-Y9IBiLKCXkftyF38x9VGdwcXYNoCJhyTRJA';

  static Future<dynamic> loadtrendingmovies()async{
    TMDB tmdbwithcustomlogs=TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig:const ConfigLogger(showLogs: true,showErrorLogs: true));
    Map trendingresults = await tmdbwithcustomlogs.v3.trending.getTrending();
    return trendingresults['results'];
  }

  static Future<dynamic> loadtopratedmovies()async{
    TMDB tmdbwithcustomlogs=TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig:const ConfigLogger(showLogs: true,showErrorLogs: true)
    );
    Map topratedresults = await tmdbwithcustomlogs.v3.movies.getTopRated();
    return topratedresults['results'];
  }

  static Future<dynamic> loadpopularshows()async{
    TMDB tmdbwithcustomlogs=TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig:const ConfigLogger(showLogs: true,showErrorLogs: true)
    );
    Map topratedresults = await tmdbwithcustomlogs.v3.tv.getPopular();
    return topratedresults['results'];
  }

  static Future<dynamic> loadtopratedshows()async{
    TMDB tmdbwithcustomlogs=TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig:const ConfigLogger(showLogs: true,showErrorLogs: true)
    );
    Map topratedresults = await tmdbwithcustomlogs.v3.tv.getTopRated();
    return topratedresults['results'];
  }

  static Future<dynamic> returncontroller(value)async{
    dynamic returnvalue;
    switch (value) {
      case 1:returnvalue=await loadtrendingmovies();
        break;
      case 2:returnvalue=await loadtopratedmovies();
        break;
      case 3:returnvalue=await loadpopularshows();
        break;
      case 4:returnvalue=await loadtopratedshows();
        break;
    }
    return returnvalue;
  }
}