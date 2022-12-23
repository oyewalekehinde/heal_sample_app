class ConsultationResponse {
  ConsultationResponse({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory ConsultationResponse.fromJson(Map<String, dynamic> json) =>
      ConsultationResponse(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.patient,
    this.consultationOwner,
    this.symptoms,
    this.discomfortLevel,
    this.firstNotice,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.type,
    this.contactMedium,
    this.joined,
    this.providerId,
    this.trackingId,
    this.createdThrough,
    this.url,
  });

  String? id;
  String? patient;
  String? consultationOwner;
  List<Symptom>? symptoms;
  String? discomfortLevel;
  String? firstNotice;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? type;
  String? contactMedium;
  bool? joined;
  String? providerId;
  String? trackingId;
  String? createdThrough;
  String? url;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        patient: json["patient"],
        consultationOwner: json["consultationOwner"],
        symptoms: List<Symptom>.from(
            json["symptoms"].map((x) => Symptom.fromJson(x))),
        discomfortLevel: json["discomfortLevel"],
        firstNotice: json["firstNotice"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        status: json["status"],
        type: json["type"],
        contactMedium: json["contactMedium"],
        joined: json["joined"],
        providerId: json["providerId"],
        trackingId: json["trackingId"],
        createdThrough: json["createdThrough"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "patient": patient,
        "consultationOwner": consultationOwner,
        "symptoms": List<dynamic>.from(symptoms!.map((x) => x.toJson())),
        "discomfortLevel": discomfortLevel,
        "firstNotice": firstNotice,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "status": status,
        "type": type,
        "contactMedium": contactMedium,
        "joined": joined,
        "providerId": providerId,
        "trackingId": trackingId,
        "createdThrough": createdThrough,
        "url": url,
      };
}

class Symptom {
  Symptom({
    this.name,
  });

  String? name;

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
