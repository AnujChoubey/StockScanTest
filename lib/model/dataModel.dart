// this model is not used currently, but can be used to display data as well

import 'dart:convert';

class StockScan {
  StockScan({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criterion?>? criteria;

  factory StockScan.fromRawJson(String str) => StockScan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StockScan.fromJson(Map<String, dynamic> json) => StockScan(
      id: json["id"],
      name: json["name"],
      tag: json["tag"],
      color: json["color"],
      criteria: json["criteria"] == null ? [] : json["criteria"] == null ? [] : List<Criterion?>.from(json["criteria"]!.map((x) => Criterion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "tag": tag,
  "color": color,
  "criteria": criteria == null ? [] : criteria == null ? [] : List<dynamic>.from(criteria!.map((x) => x!.toJson())),
};
}

class Criterion {
  Criterion({
    this.type,
    this.text,
    this.variable,
  });

  String? type;
  String? text;
  Variable? variable;

  factory Criterion.fromRawJson(String str) => Criterion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
    type: json["type"],
    text: json["text"],
    variable: json["variable"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "text": text,
    "variable": variable,
  };
}

class Variable {
  Variable({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
  });

  The1? the1;
  The2? the2;
  The2? the3;
  The1? the4;

  factory Variable.fromRawJson(String str) => Variable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
    the1: json["\u00241"],
    the2: json["\u00242"],
    the3: json["\u00243"],
    the4: json["\u00244"],
  );

  Map<String, dynamic> toJson() => {
    "\u00241": the1,
    "\u00242": the2,
    "\u00243": the3,
    "\u00244": the4,
  };
}

class The1 {
  The1({
    this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  String? type;
  List<int?>? values;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;

  factory The1.fromRawJson(String str) => The1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The1.fromJson(Map<String, dynamic> json) => The1(
      type: json["type"],
      values: json["values"] == null ? [] : json["values"] == null ? [] : List<int?>.from(json["values"]!.map((x) => x)),
  studyType: json["study_type"],
  parameterName: json["parameter_name"],
  minValue: json["min_value"],
  maxValue: json["max_value"],
  defaultValue: json["default_value"],
  );

  Map<String, dynamic> toJson() => {
  "type": type,
  "values": values == null ? [] : values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
  "study_type": studyType,
  "parameter_name": parameterName,
  "min_value": minValue,
  "max_value": maxValue,
  "default_value": defaultValue,
};
}

class The2 {
  The2({
    this.type,
    this.values,
  });

  String? type;
  List<double?>? values;

  factory The2.fromRawJson(String str) => The2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The2.fromJson(Map<String, dynamic> json) => The2(
      type: json["type"],
      values: json["values"] == null ? [] : json["values"] == null ? [] : List<double?>.from(json["values"]!.map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
  "type": type,
  "values": values == null ? [] : values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
};
}
