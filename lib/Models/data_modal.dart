class Consumption {
  String? status;
  List<Data>? data;

  Consumption({ this.status,   this.data});

  Consumption.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? iD;
  String? lOCATIONID;
  String? nAME;
  String? uNITID;
  String? iD1;
  String? cONSUMPTIONCENTER;
  String? nAME1;
  String? cONSUMPTIONDATE;
  String? cONSUMPTIONVALUE;
  String? cREATED;
  String? cREATEDBY;
  String? uPDATED;
  String? uPDATEDBY;

  Data(
      { this.s0,
      this.s1,
      this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.s9,
      this.s10,
      this.s11,
      this.s12,
      this.s13,
      this.s14,
      this.iD,
      this.lOCATIONID,
      this.nAME,
      this.uNITID,
      this.iD1,
      this.cONSUMPTIONCENTER,
      this.nAME1,
      this.cONSUMPTIONDATE,
      this.cONSUMPTIONVALUE,
      this.cREATED,
      this.cREATEDBY,
      this.uPDATED,
      this.uPDATEDBY});

  Data.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    iD = json['ID'];
    lOCATIONID = json['LOCATION_ID'];
    nAME = json['NAME'];
    uNITID = json['UNIT_ID'];
    iD1 = json['ID_1'];
    cONSUMPTIONCENTER = json['CONSUMPTION_CENTER'];
    nAME1 = json['NAME_1'];
    cONSUMPTIONDATE = json['CONSUMPTION_DATE'];
    cONSUMPTIONVALUE = json['CONSUMPTION_VALUE'];
    cREATED = json['CREATED'];
    cREATEDBY = json['CREATED_BY'];
    uPDATED = json['UPDATED'];
    uPDATEDBY = json['UPDATED_BY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['ID'] = this.iD;
    data['LOCATION_ID'] = this.lOCATIONID;
    data['NAME'] = this.nAME;
    data['UNIT_ID'] = this.uNITID;
    data['ID_1'] = this.iD1;
    data['CONSUMPTION_CENTER'] = this.cONSUMPTIONCENTER;
    data['NAME_1'] = this.nAME1;
    data['CONSUMPTION_DATE'] = this.cONSUMPTIONDATE;
    data['CONSUMPTION_VALUE'] = this.cONSUMPTIONVALUE;
    data['CREATED'] = this.cREATED;
    data['CREATED_BY'] = this.cREATEDBY;
    data['UPDATED'] = this.uPDATED;
    data['UPDATED_BY'] = this.uPDATEDBY;
    return data;
  }
}
