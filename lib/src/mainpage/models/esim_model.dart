class EsimResponse {
  final int result;
  final int status;
  final String requestId;
  final String message;
  final String developerMessage;
  final EsimData esim;

  EsimResponse({
    required this.result,
    required this.status,
    required this.requestId,
    required this.message,
    required this.developerMessage,
    required this.esim,
  });

  factory EsimResponse.fromJson(Map<String, dynamic> json) {
    return EsimResponse(
      result: json['result'] ?? 0,
      status: json['status'] ?? 0,
      requestId: json['request_id'] ?? '',
      message: json['message'] ?? '',
      developerMessage: json['developer_message'] ?? '',
      esim: EsimData.fromJson(json['esim'] ?? {}),
    );
  }
}

class EsimData {
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

  EsimData({
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

  factory EsimData.fromJson(Map<String, dynamic> json) {
    return EsimData(
      uid: json['uid'] ?? '',
      iccid: json['iccid'] ?? '',
      activationCode: json['activation_code'] ?? '',
      manualCode: json['manual_code'] ?? '',
      smdpAddress: json['smdp_address'] ?? '',
      autoApn: json['auto_apn'] ?? 0,
      apn: json['apn'] ?? '',
      state: json['state'] ?? '',
      serviceStatus: json['service_status'] ?? '',
      networkStatus: json['network_status'] ?? '',
      tag: json['tag'] ?? '',
      dateAssigned: json['date_assigned'] ?? '',
    );
  }
}
