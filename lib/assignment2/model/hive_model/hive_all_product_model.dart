import 'package:hive/hive.dart';

part 'hive_all_product_model.g.dart';
@HiveType(typeId: 0)
class HiveAllProductModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  num? price;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? image;

  @HiveField(6)
  Rating? rating;

  HiveAllProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory HiveAllProductModel.fromJson(Map<String, dynamic> json) {
    return HiveAllProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1) // Unique type ID for Rating
class Rating {
  @HiveField(0)
  num? rate;

  @HiveField(1)
  num? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}


@HiveType(typeId: 2)
class WeatherModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  Main? main;

  @HiveField(2)
  Sys? sys;

  @HiveField(3)
  List<Weather>? weather;

  WeatherModel({this.name, this.main, this.sys, this.weather});

  // fromJson method to parse the API response
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      weather: json['weather'] != null
          ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList()
          : null,
    );
  }

  // toJson method for saving data to Hive or for API response serialization
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'main': main?.toJson(),
      'sys': sys?.toJson(),
      'weather': weather?.map((i) => i.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 3)
class Main {
  @HiveField(0)
  double? temp;

  @HiveField(1)
  double? feelsLike;

  @HiveField(2)
  double? tempMin;

  @HiveField(3)
  double? tempMax;

  @HiveField(4)
  int? pressure;

  @HiveField(5)
  int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  // fromJson for Main class
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  // toJson method for Main class
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}

@HiveType(typeId: 4)
class Sys {
  @HiveField(0)
  int? type;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? country;

  @HiveField(3)
  int? sunrise;

  @HiveField(4)
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  // fromJson for Sys class
  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  // toJson method for Sys class
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}

@HiveType(typeId: 5)
class Weather {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? main;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // fromJson for Weather class
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  // toJson method for Weather class
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}


