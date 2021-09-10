class Data {
  String? s;

  String? nAME;

  String? nAME1;
  String? cONSUMPTIONDATE;
  String? cONSUMPTIONVALUE;

  Data({
    this.s,
    this.nAME,
    this.nAME1,
    this.cONSUMPTIONDATE,
    this.cONSUMPTIONVALUE,
  });

  Data.fromJson(Map<String, dynamic> json) {
    s = json['0'];

    nAME = json['NAME'];

    nAME1 = json['NAME_1'];
    cONSUMPTIONDATE = json['CONSUMPTION_DATE'];
    cONSUMPTIONVALUE = json['CONSUMPTION_VALUE'];
  }
}
