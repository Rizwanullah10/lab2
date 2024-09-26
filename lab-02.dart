import 'dart:async';

Future<String> fetchWeatherData() async {
  await Future.delayed(Duration(seconds: 3));

  return 'hot, 35°C';
}

void main() async {
  print('Fetching weather data...');

  try {
    String weatherInfo = await fetchWeatherData();
    print('Weather : $weatherInfo');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Weather fetched successfully.');
  }
}