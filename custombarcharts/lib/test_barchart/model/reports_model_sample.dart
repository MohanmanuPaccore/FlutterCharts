import 'dart:convert';

ReportsModelSample reportsModelSampleFromJson(String str) => ReportsModelSample.fromJson(json.decode(str));

String reportsModelSampleToJson(ReportsModelSample data) => json.encode(data.toJson());

class ReportsModelSample {
    Data? data;
    String? message;
    bool? status;
    int? statusCode;

    ReportsModelSample({
        this.data,
        this.message,
        this.status,
        this.statusCode,
    });

    factory ReportsModelSample.fromJson(Map<String, dynamic> json) => ReportsModelSample(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
        "statusCode": statusCode,
    };
}

class Data {
    List<Trip>? trips;
    AvgInfo? avgInfo;

    Data({
        this.trips,
        this.avgInfo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        trips: json["trips"] == null ? [] : List<Trip>.from(json["trips"]!.map((x) => Trip.fromJson(x))),
        avgInfo: json["avgInfo"] == null ? null : AvgInfo.fromJson(json["avgInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "trips": trips == null ? [] : List<dynamic>.from(trips!.map((x) => x.toJson())),
        "avgInfo": avgInfo?.toJson(),
    };
}

class AvgInfo {
    int? count;
    String? avgDuration;
    String? totalDuration;
    double? avgSpeed;
    dynamic avgFuelConsumption;
    dynamic avgPower;
    int? totalSpeed;
    int? totalfuelConsumption;
    int? totalPower;

    AvgInfo({
        this.count,
        this.avgDuration,
        this.totalDuration,
        this.avgSpeed,
        this.avgFuelConsumption,
        this.avgPower,
        this.totalSpeed,
        this.totalfuelConsumption,
        this.totalPower,
    });

    factory AvgInfo.fromJson(Map<String, dynamic> json) => AvgInfo(
        count: json["count"],
        avgDuration: json["avgDuration"],
        totalDuration: json["totalDuration"],
        avgSpeed: json["avgSpeed"]?.toDouble(),
        avgFuelConsumption: json["avgFuelConsumption"],
        avgPower: json["avgPower"],
        totalSpeed: json["totalSpeed"],
        totalfuelConsumption: json["totalfuelConsumption"],
        totalPower: json["totalPower"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "avgDuration": avgDuration,
        "totalDuration": totalDuration,
        "avgSpeed": avgSpeed,
        "avgFuelConsumption": avgFuelConsumption,
        "avgPower": avgPower,
        "totalSpeed": totalSpeed,
        "totalfuelConsumption": totalfuelConsumption,
        "totalPower": totalPower,
    };
}

class Trip {
    DateTime? groupcreatedAt;
    String? date;
    List<TripsByDate>? tripsByDate;

    Trip({
        this.groupcreatedAt,
        this.date,
        this.tripsByDate,
    });

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        groupcreatedAt: json["groupcreatedAt"] == null ? null : DateTime.parse(json["groupcreatedAt"]),
        date: json["date"],
        tripsByDate: json["tripsByDate"] == null ? [] : List<TripsByDate>.from(json["tripsByDate"]!.map((x) => TripsByDate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "groupcreatedAt": "${groupcreatedAt!.year.toString().padLeft(4, '0')}-${groupcreatedAt!.month.toString().padLeft(2, '0')}-${groupcreatedAt!.day.toString().padLeft(2, '0')}",
        "date": date,
        "tripsByDate": tripsByDate == null ? [] : List<dynamic>.from(tripsByDate!.map((x) => x.toJson())),
    };
}

class TripsByDate {
    String? id;
    Load? load;
    List<StartPosition>? startPosition;
    List<EndPosition>? endPosition;
    List<SensorInfo>? sensorInfo;
    DeviceInfo? deviceInfo;
    VesselId? vesselId;
    int? tripStatus;
    int? dataExtStatus;
    AtedBy? createdBy;
    DateTime? createdAt;
    AtedBy? updatedBy;
    DateTime? updatedAt;
    String? filePath;
    DateTime? syncCreatedAt;
    DateTime? syncUpdatedAt;
    String? duration;
    double? distance;
    double? speed;
    double? avgSpeed;
    MissingLineNumbers? missingLineNumbers;
    List<SensorType>? sensorType;
    bool? vesselAnalyticsCalc;
    String? cloudFilePath;
    int? numberOfPassengers;

    TripsByDate({
        this.id,
        this.load,
        this.startPosition,
        this.endPosition,
        this.sensorInfo,
        this.deviceInfo,
        this.vesselId,
        this.tripStatus,
        this.dataExtStatus,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt,
        this.filePath,
        this.syncCreatedAt,
        this.syncUpdatedAt,
        this.duration,
        this.distance,
        this.speed,
        this.avgSpeed,
        this.missingLineNumbers,
        this.sensorType,
        this.vesselAnalyticsCalc,
        this.cloudFilePath,
        this.numberOfPassengers,
    });

    factory TripsByDate.fromJson(Map<String, dynamic> json) => TripsByDate(
        id: json["_id"],
        load: loadValues.map[json["load"]]!,
        startPosition: json["startPosition"] == null ? [] : List<StartPosition>.from(json["startPosition"]!.map((x) => startPositionValues.map[x]!)),
        endPosition: json["endPosition"] == null ? [] : List<EndPosition>.from(json["endPosition"]!.map((x) => endPositionValues.map[x]!)),
        sensorInfo: json["sensorInfo"] == null ? [] : List<SensorInfo>.from(json["sensorInfo"]!.map((x) => SensorInfo.fromJson(x))),
        deviceInfo: json["deviceInfo"] == null ? null : DeviceInfo.fromJson(json["deviceInfo"]),
        vesselId: vesselIdValues.map[json["vesselId"]]!,
        tripStatus: json["tripStatus"],
        dataExtStatus: json["dataExtStatus"],
        createdBy: atedByValues.map[json["createdBy"]]!,
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedBy: atedByValues.map[json["updatedBy"]]!,
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        filePath: json["filePath"],
        syncCreatedAt: json["syncCreatedAt"] == null ? null : DateTime.parse(json["syncCreatedAt"]),
        syncUpdatedAt: json["syncUpdatedAt"] == null ? null : DateTime.parse(json["syncUpdatedAt"]),
        duration: json["duration"],
        distance: json["distance"]?.toDouble(),
        speed: json["speed"]?.toDouble(),
        avgSpeed: json["avgSpeed"]?.toDouble(),
        missingLineNumbers: json["missingLineNumbers"] == null ? null : MissingLineNumbers.fromJson(json["missingLineNumbers"]),
        sensorType: json["sensorType"] == null ? [] : List<SensorType>.from(json["sensorType"]!.map((x) => sensorTypeValues.map[x]!)),
        vesselAnalyticsCalc: json["vesselAnalyticsCalc"],
        cloudFilePath: json["cloudFilePath"],
        numberOfPassengers: json["number_of_passengers"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "load": loadValues.reverse[load],
        "startPosition": startPosition == null ? [] : List<dynamic>.from(startPosition!.map((x) => startPositionValues.reverse[x])),
        "endPosition": endPosition == null ? [] : List<dynamic>.from(endPosition!.map((x) => endPositionValues.reverse[x])),
        "sensorInfo": sensorInfo == null ? [] : List<dynamic>.from(sensorInfo!.map((x) => x.toJson())),
        "deviceInfo": deviceInfo?.toJson(),
        "vesselId": vesselIdValues.reverse[vesselId],
        "tripStatus": tripStatus,
        "dataExtStatus": dataExtStatus,
        "createdBy": atedByValues.reverse[createdBy],
        "createdAt": createdAt?.toIso8601String(),
        "updatedBy": atedByValues.reverse[updatedBy],
        "updatedAt": updatedAt?.toIso8601String(),
        "filePath": filePath,
        "syncCreatedAt": syncCreatedAt?.toIso8601String(),
        "syncUpdatedAt": syncUpdatedAt?.toIso8601String(),
        "duration": duration,
        "distance": distance,
        "speed": speed,
        "avgSpeed": avgSpeed,
        "missingLineNumbers": missingLineNumbers?.toJson(),
        "sensorType": sensorType == null ? [] : List<dynamic>.from(sensorType!.map((x) => sensorTypeValues.reverse[x])),
        "vesselAnalyticsCalc": vesselAnalyticsCalc,
        "cloudFilePath": cloudFilePath,
        "number_of_passengers": numberOfPassengers,
    };
}

enum AtedBy {
    THE_64_DC6_C2_EB4_D2_E81_E31_F94_DC7
}

final atedByValues = EnumValues({
    "64dc6c2eb4d2e81e31f94dc7": AtedBy.THE_64_DC6_C2_EB4_D2_E81_E31_F94_DC7
});

class DeviceInfo {
    DeviceId? deviceId;
    Model? model;
    String? version;
    DeviceInfoMake? make;
    Board? board;
    DeviceType? deviceType;

    DeviceInfo({
        this.deviceId,
        this.model,
        this.version,
        this.make,
        this.board,
        this.deviceType,
    });

    factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
        deviceId: deviceIdValues.map[json["deviceId"]]!,
        model: modelValues.map[json["model"]]!,
        version: json["version"],
        make: deviceInfoMakeValues.map[json["make"]]!,
        board: boardValues.map[json["board"]]!,
        deviceType: deviceTypeValues.map[json["deviceType"]]!,
    );

    Map<String, dynamic> toJson() => {
        "deviceId": deviceIdValues.reverse[deviceId],
        "model": modelValues.reverse[model],
        "version": version,
        "make": deviceInfoMakeValues.reverse[make],
        "board": boardValues.reverse[board],
        "deviceType": deviceTypeValues.reverse[deviceType],
    };
}

enum Board {
    A32_X,
    EXYNOS2100
}

final boardValues = EnumValues({
    "a32x": Board.A32_X,
    "exynos2100": Board.EXYNOS2100
});

enum DeviceId {
    TP1_A_220624014
}

final deviceIdValues = EnumValues({
    "TP1A.220624.014": DeviceId.TP1_A_220624014
});

enum DeviceType {
    ANDROID
}

final deviceTypeValues = EnumValues({
    "Android": DeviceType.ANDROID
});

enum DeviceInfoMake {
    SAMSUNG
}

final deviceInfoMakeValues = EnumValues({
    "samsung": DeviceInfoMake.SAMSUNG
});

enum Model {
    SM_G990_E,
    SM_M326_B
}

final modelValues = EnumValues({
    "SM-G990E": Model.SM_G990_E,
    "SM-M326B": Model.SM_M326_B
});

enum EndPosition {
    NULL,
    THE_174224445,
    THE_783848499
}

final endPositionValues = EnumValues({
    "null": EndPosition.NULL,
    "17.4224445": EndPosition.THE_174224445,
    "78.3848499": EndPosition.THE_783848499
});

enum Load {
    EMPTY,
    FULL,
    HALF
}

final loadValues = EnumValues({
    "Empty": Load.EMPTY,
    "Full": Load.FULL,
    "Half": Load.HALF
});

class MissingLineNumbers {
    List<dynamic>? mobile0Csv;

    MissingLineNumbers({
        this.mobile0Csv,
    });

    factory MissingLineNumbers.fromJson(Map<String, dynamic> json) => MissingLineNumbers(
        mobile0Csv: json["mobile_0.csv"] == null ? [] : List<dynamic>.from(json["mobile_0.csv"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mobile_0.csv": mobile0Csv == null ? [] : List<dynamic>.from(mobile0Csv!.map((x) => x)),
    };
}

class SensorInfo {
    SensorInfoMake? make;
    Name? name;
    List<Acc>? gyro;
    List<Acc>? acc;
    List<Acc>? mag;
    List<Uacc>? uacc;

    SensorInfo({
        this.make,
        this.name,
        this.gyro,
        this.acc,
        this.mag,
        this.uacc,
    });

    factory SensorInfo.fromJson(Map<String, dynamic> json) => SensorInfo(
        make: sensorInfoMakeValues.map[json["make"]]!,
        name: nameValues.map[json["name"]]!,
        gyro: json["GYRO"] == null ? [] : List<Acc>.from(json["GYRO"]!.map((x) => Acc.fromJson(x))),
        acc: json["ACC"] == null ? [] : List<Acc>.from(json["ACC"]!.map((x) => Acc.fromJson(x))),
        mag: json["MAG"] == null ? [] : List<Acc>.from(json["MAG"]!.map((x) => Acc.fromJson(x))),
        uacc: json["UACC"] == null ? [] : List<Uacc>.from(json["UACC"]!.map((x) => Uacc.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "make": sensorInfoMakeValues.reverse[make],
        "name": nameValues.reverse[name],
        "GYRO": gyro == null ? [] : List<dynamic>.from(gyro!.map((x) => x.toJson())),
        "ACC": acc == null ? [] : List<dynamic>.from(acc!.map((x) => x.toJson())),
        "MAG": mag == null ? [] : List<dynamic>.from(mag!.map((x) => x.toJson())),
        "UACC": uacc == null ? [] : List<dynamic>.from(uacc!.map((x) => x.toJson())),
    };
}

class Acc {
    String? name;
    int? indexPosition;
    String? units;

    Acc({
        this.name,
        this.indexPosition,
        this.units,
    });

    factory Acc.fromJson(Map<String, dynamic> json) => Acc(
        name: json["name"],
        indexPosition: json["IndexPosition"],
        units: json["units"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "IndexPosition": indexPosition,
        "units": units,
    };
}

enum SensorInfoMake {
    QUALICOM
}

final sensorInfoMakeValues = EnumValues({
    "qualicom": SensorInfoMake.QUALICOM
});

enum Name {
    GPS
}

final nameValues = EnumValues({
    "gps": Name.GPS
});

class Uacc {
    String? name;
    int? indxPosition;
    String? units;

    Uacc({
        this.name,
        this.indxPosition,
        this.units,
    });

    factory Uacc.fromJson(Map<String, dynamic> json) => Uacc(
        name: json["name"],
        indxPosition: json["IndxPosition"],
        units: json["units"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "IndxPosition": indxPosition,
        "units": units,
    };
}

enum SensorType {
    MOBILE
}

final sensorTypeValues = EnumValues({
    "mobile": SensorType.MOBILE
});

enum StartPosition {
    NULL,
    THE_174224447,
    THE_783848489
}

final startPositionValues = EnumValues({
    "null": StartPosition.NULL,
    "17.4224447": StartPosition.THE_174224447,
    "78.3848489": StartPosition.THE_783848489
});

enum VesselId {
    THE_64_DC6_CAAC486_EEA7_C0473_F06
}

final vesselIdValues = EnumValues({
    "64dc6caac486eea7c0473f06": VesselId.THE_64_DC6_CAAC486_EEA7_C0473_F06
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
