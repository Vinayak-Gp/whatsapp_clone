// To parse this JSON data, do
//
//     final callModel = callModelFromJson(jsonString);

import 'dart:convert';

CallModel callModelFromJson(String str) => CallModel.fromJson(json.decode(str));

String callModelToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
    CallModel({
        this.name,
        this.image,
        this.updatedAt,
        this.missedCall,
        this.isvideocall,
    });

    String? name;
    String? image;
    String? updatedAt;
    bool? missedCall;
    bool? isvideocall;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        name: json["name"],
        image: json["image"],
        updatedAt: json["updatedAt"],
        missedCall: json["missedCall"],
        isvideocall: json["isvideocall"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "updatedAt": updatedAt,
        "missedCall": missedCall,
        "isvideocall": isvideocall,
    };
}

