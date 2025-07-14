class AttendanceLogQuery {
  AttendanceLogQuery({
      this.year, 
      this.month, 
      this.typeRequest,});

  AttendanceLogQuery.fromJson(dynamic json) {
    year = json['year'];
    month = json['month'];
    typeRequest = json['typeRequest'];
  }
  int ?year;
  int ?month;
  int ?typeRequest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['month'] = month;
    map['typeRequest'] = typeRequest;
    return map;
  }

}