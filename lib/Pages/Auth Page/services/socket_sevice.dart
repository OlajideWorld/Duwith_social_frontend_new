import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart";
import "package:duwith_social/common/getxmessage.dart";

import "package:get/get.dart";
import "package:socket_io_client/socket_io_client.dart" as IO;
import "package:socket_io_client/socket_io_client.dart";

import "../../../models/main_post_model.dart";
import "../../../models/user_data.dart";

AuthController authController = AuthController.instance;

class SocketService extends GetxController {
  static SocketService instance = Get.find();

  late IO.Socket _socket;

  // SocketService.internal();

  // factory SocketService() {
  //   return instance;
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void connectAndListen() async {
    try {
      _socket = IO.io(
          'http://192.168.1.123:3000',
          IO.OptionBuilder()
              .setTransports(["websocket"])
              .disableAutoConnect()
              .build());

      _socket.connect();

      _socket.onConnect((data) => {print('Connected to server : $data')});

      _socket.emit("connectnow", "Olajide Connected");
      print(_socket);
    } catch (e) {
      print('ConnectionScreen -> initState -> err ->');
      print(e.toString());
    }
  }

  void connectSocket() async {
    try {
      _socket = io(
          'http://192.168.1.123:3000',
          // OptionBuilder()
          //   .setTransports(['websocket']) // for Flutter or Dart VM
          //   .disableAutoConnect()  // disable auto-connection
          //   .setExtraHeaders({'foo': 'bar'}) // optional
          //   .build()
          <String, dynamic>{
            'transports': ['websocket'],
            'autoConnect': false,
            // 'query': {'token': 'THIS IS MY TOKEN FOR AUTHENTICATION'}
          });

      _socket.onError((data) {
        // ignore: prefer_interpolation_to_compose_strings
        print('socket.onError -> data -> ' + data);
      });

      _socket.onConnect((_) {
        print('connect');
        // socket.emit('msg', 'test');
      });

      _socket.onDisconnect((_) => print('disconnect'));

      _socket.connect();
      print(_socket);
    } catch (e) {
      print('ConnectionScreen -> initState -> err ->');
      print(e.toString());
    }
  }

  RxBool isloading = false.obs;

  void createUser(Map<String, dynamic> userData) {
    _socket.emit('createUser', userData);
    //
    _socket.on('userCreated', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  // void initSocket() async {
  //   print("Flutter websocket beginning");

  //   _socket = IO.io('http://localhost:3000', <String, dynamic>{
  //     'transports': ['websocket'],
  //     'autoConnect': true,
  //   });

  //   _socket!.connect();

  // _socket.onConnect((_) {
  //   debugPrint('Connected to server');
  //   getSuccessSnackBar("Connected");
  // });

  // _socket.onDisconnect((_) {
  //   debugPrint('Disconnected from server');
  //   getErrorSnackBar("Disconnected, check internet");
  // });

  // _socket.on("error", (data) {
  //   getErrorSnackBar(data);
  // });

  //   print("Flutter ran the websocket");
  // }

  // connectSocket() async {
  //   debugPrint("connect");
  // }
}
