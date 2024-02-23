class EachSimResponse {
  final String uid;
  final String iccid;
  final String activationCode;
  final String manualCode;
  final String smdpAddress;
  final int autoApn;
  final String apn;
  final String state;
  final String serviceStatus;
  final String networkStatus;
  final String tag;
  final String dateAssigned;

  EachSimResponse({
    required this.uid,
    required this.iccid,
    required this.activationCode,
    required this.manualCode,
    required this.smdpAddress,
    required this.autoApn,
    required this.apn,
    required this.state,
    required this.serviceStatus,
    required this.networkStatus,
    required this.tag,
    required this.dateAssigned,
  });

  factory EachSimResponse.fromJson(Map<String, dynamic> json) {
    return EachSimResponse(
      uid: json['uid'],
      iccid: json['iccid'],
      activationCode: json['activation_code'],
      manualCode: json['manual_code'],
      smdpAddress: json['smdp_address'],
      autoApn: json['auto_apn'],
      apn: json['apn'],
      state: json['state'],
      serviceStatus: json['service_status'],
      networkStatus: json['network_status'],
      tag: json['tag'],
      dateAssigned: json['date_assigned'],
    );
  }
}
