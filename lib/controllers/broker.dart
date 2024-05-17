// broker.dart
// ignore: depend_on_referenced_packages
import 'package:mqtt_client/mqtt_client.dart';
// ignore: depend_on_referenced_packages
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTClientWrapper {
  MqttServerClient? _client;

  Future<void> initializeMQTTClient() async {
    _client = MqttServerClient('161.132.38.243', 'flutter_client');
    _client!.port = 1883;
    _client!.keepAlivePeriod = 60;
    _client!.onConnected = onConnected;
    _client!.onDisconnected = onDisconnected;
    _client!.onSubscribed = onSubscribed;
    _client!.logging(on: true);

    final connMess = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    _client!.connectionMessage = connMess;

    try {
      print('MQTT Client connecting....');
      await _client!.connect();
    } catch (e) {
      print('Exception: $e');
      _client!.disconnect();
    }

    if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT Client connected');
    } else {
      print('ERROR: MQTT Client connection failed - ${_client!.connectionStatus}');
    }

    const topic = 'MallNorte/cam01';
    _client!.subscribe(topic, MqttQos.atLeastOnce);

    _client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('Received message: $pt from topic: ${c[0].topic}');
    });
  }

  void onConnected() {
    print('Connected');
  }

  void onDisconnected() {
    print('Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }
}