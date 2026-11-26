import 'package:scholar_chat/static/static.dart';

class ModelMessage {
 final String message;
 final String id;

  ModelMessage(this.message,  this.id);
  factory ModelMessage.fromjson(json) {
    return ModelMessage(json[kMessage],json[kid]??"");
  }
}
