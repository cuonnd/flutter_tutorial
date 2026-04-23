import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/weather/weather_event.dart';
import 'package:newapp/blocs/weather/weather_state.dart';
import 'package:newapp/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepo = WeatherRepository();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherFetchByLocation>(_onFetchByLocation);
    on<WeatherFetchByCity>(_onFetchByCity);
  }

  Future<void> _onFetchByLocation(
    WeatherFetchByLocation event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    final response = await _weatherRepo.getWeatherByLocation(
      event.lat,
      event.lng,
    );
    if (response.success && response.data != null) {
      emit(WeatherLoaded(weather: response.data!));
    } else {
      emit(WeatherError(message: response.message ?? 'Unknown error'));
    }
  }

  Future<void> _onFetchByCity(
    WeatherFetchByCity event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    final response = await _weatherRepo.getWeatherByCity(event.city);
    if (response.success && response.data != null) {
      emit(WeatherLoaded(weather: response.data!));
    } else {
      emit(WeatherError(message: response.message ?? 'Unknown error'));
    }
  }
}
