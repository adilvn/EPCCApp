class Data {
  String? s2;
  String? s8;
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
      {this.s2,
      this.s8,
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
    s2 = json['2'];
    s8 = json["8"];
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
}
