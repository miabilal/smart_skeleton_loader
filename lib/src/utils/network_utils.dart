import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  static final NetworkUtils _instance = NetworkUtils._internal();
  factory NetworkUtils() => _instance;
  NetworkUtils._internal();

  final _connectivity = Connectivity();
  final _controller = StreamController<double>.broadcast();

  Stream<double> get networkSpeedStream => _controller.stream;

  Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateNetworkSpeed(result);
    });
  }

  void _updateNetworkSpeed(ConnectivityResult result) {
    double speed;
    switch (result) {
      case ConnectivityResult.wifi:
        speed = 1.0;
        break;
      case ConnectivityResult.mobile:
        speed = 0.7;
        break;
      case ConnectivityResult.ethernet:
        speed = 1.0;
        break;
      case ConnectivityResult.none:
        speed = 0.3;
        break;
      default:
        speed = 0.5;
    }
    _controller.add(speed);
  }

  void dispose() {
    _controller.close();
  }
}
