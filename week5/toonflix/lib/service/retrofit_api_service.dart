import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:toonflix/model/webtoon_dto.dart';

// flutter pub run build_runner build  <- 터미널에 입력해서 생성
part 'retrofit_api_service.g.dart';

@RestApi(baseUrl: "https://webtoon-crawler.nomadcoders.workers.dev")
abstract class RetrofitApiService {
  factory RetrofitApiService(Dio dio) = _RetrofitApiService;

  @GET("/today")
  Future<List<Webtoon>> getTodaysToons();

  @GET("/{id}")
  Future<WebtoonDetail> getToonById(@Path("id") String id);

  @GET("/{id}/episodes")
  Future<List<WebtoonEpisode>> getLatestEpisodesById(@Path("id") String id);
}