class PincodeDataModel {
  final String message;
  final String status;
  final List<PostOffice> postOffices;

  PincodeDataModel({
    required this.message,
    required this.status,
    required this.postOffices,
  });

  factory PincodeDataModel.fromJson(Map<String, dynamic> json) {
    return PincodeDataModel(
      message: json['Message'],
      status: json['Status'],
      postOffices: (json['PostOffice'] as List<dynamic>)
          .map((e) => PostOffice.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Message': message,
      'Status': status,
      'PostOffice': postOffices.map((e) => e.toJson()).toList(),
    };
  }
}

class PostOffice {
  final String name;
  final String? description;
  final String branchType;
  final String deliveryStatus;
  final String circle;
  final String district;
  final String division;
  final String region;
  final String block;
  final String state;
  final String country;
  final String pincode;

  PostOffice({
    required this.name,
    this.description,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json['Name'],
      description: json['Description'],
      branchType: json['BranchType'],
      deliveryStatus: json['DeliveryStatus'],
      circle: json['Circle'],
      district: json['District'],
      division: json['Division'],
      region: json['Region'],
      block: json['Block'],
      state: json['State'],
      country: json['Country'],
      pincode: json['Pincode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'BranchType': branchType,
      'DeliveryStatus': deliveryStatus,
      'Circle': circle,
      'District': district,
      'Division': division,
      'Region': region,
      'Block': block,
      'State': state,
      'Country': country,
      'Pincode': pincode,
    };
  }
}





// class PinCodeDataModel {
//   String? code;
//   String? message;
//   List<ResponseData>? responseData;

//   PinCodeDataModel({this.code, this.message, this.responseData});

//   PinCodeDataModel.fromJson(Map<String, dynamic> json) {
//     code = json['Code'];
//     message = json['Message'];
//     if (json['ResponseData'] != null) {
//       responseData = <ResponseData>[];
//       json['ResponseData'].forEach((v) {
//         responseData!.add(new ResponseData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Code'] = this.code;
//     data['Message'] = this.message;
//     if (this.responseData != null) {
//       data['ResponseData'] = this.responseData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ResponseData {
//   String? name;
//   Null? description;
//   String? branchType;
//   String? deliveryStatus;
//   String? circle;
//   String? district;
//   String? division;
//   String? region;
//   String? block;
//   String? state;
//   String? country;
//   int? pincode;

//   ResponseData(
//       {this.name,
//       this.description,
//       this.branchType,
//       this.deliveryStatus,
//       this.circle,
//       this.district,
//       this.division,
//       this.region,
//       this.block,
//       this.state,
//       this.country,
//       this.pincode});

//   ResponseData.fromJson(Map<String, dynamic> json) {
//     name = json['Name'];
//     description = json['Description'];
//     branchType = json['BranchType'];
//     deliveryStatus = json['DeliveryStatus'];
//     circle = json['Circle'];
//     district = json['District'];
//     division = json['Division'];
//     region = json['Region'];
//     block = json['Block'];
//     state = json['State'];
//     country = json['Country'];
//     pincode = json['Pincode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['BranchType'] = this.branchType;
//     data['DeliveryStatus'] = this.deliveryStatus;
//     data['Circle'] = this.circle;
//     data['District'] = this.district;
//     data['Division'] = this.division;
//     data['Region'] = this.region;
//     data['Block'] = this.block;
//     data['State'] = this.state;
//     data['Country'] = this.country;
//     data['Pincode'] = this.pincode;
//     return data;
//   }
// }
