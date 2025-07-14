class AttendanceLog {
  AttendanceLog({
      this.fullDates, 
      this.checkIn, 
      this.status, 
      this.checkOut,this.vacationType});

  AttendanceLog.fromJson(dynamic json) {
    fullDates = json['fullDates'];
    checkIn = json['checkIn'];
    status = json['status'];
    checkOut = json['checkOut'];
    vacationType = json['vactionType'];
  }
  String? fullDates;
  String? checkIn;
  String? status;
  String? checkOut;
  String? vacationType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullDates'] = fullDates;
    map['checkIn'] = checkIn;
    map['status'] = status;
    map['checkOut'] = checkOut;
    map['vactionType'] = vacationType;
    return map;
  }

}