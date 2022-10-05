class WeatherModel {
  final String weatherText;
  final bool isDayTime;
  final TemperatureModel temperature;

  WeatherModel(this.weatherText, this.isDayTime, this.temperature);
}

class TemperatureModel {
  final MetricModel metric;

  TemperatureModel(this.metric);
}

class MetricModel {
  final String value;
  final String unit;
  final String unitType;

  MetricModel(this.value, this.unit, this.unitType);
}
