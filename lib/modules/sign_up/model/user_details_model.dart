class RegisterUserDetails {
  String? usertype;
  Photo? photo;
  IsMHProperty? isMHProperty;
  Address? address;

  RegisterUserDetails(
      {this.usertype, this.photo, this.isMHProperty, this.address});

  RegisterUserDetails.fromJson(Map<String, dynamic> json) {
    usertype = json['usertype'];
    photo = json['photo'] != null ?  Photo.fromJson(json['photo']) : null;
    isMHProperty = json['isMHProperty'] != null
        ?  IsMHProperty.fromJson(json['isMHProperty'])
        : null;
    address =
        json['address'] != null ?  Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['usertype'] = usertype;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    if (isMHProperty != null) {
      data['isMHProperty'] = isMHProperty!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Photo {
  String? passportName;
  String? passportSrc;

  Photo({this.passportName, this.passportSrc});

  Photo.fromJson(Map<String, dynamic> json) {
    passportName = json['passportName'];
    passportSrc = json['passportSrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['passportName'] = passportName;
    data['passportSrc'] = passportSrc;
    return data;
  }
}

class IsMHProperty {
  String? hasProperty;
  String? propType;
  UserDetails? userDetails;

  IsMHProperty({this.hasProperty, this.propType, this.userDetails});

  IsMHProperty.fromJson(Map<String, dynamic> json) {
    hasProperty = json['hasProperty'];
    propType = json['propType'];
    userDetails = json['userDetails'] != null
        ?  UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['hasProperty'] = hasProperty;
    data['propType'] = propType;
    if (userDetails != null) {
      data['userDetails'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? khataNo;
  String? naBhu;
  String? ulpin;
  String? userName;
  String? district;
  String? taluka;
  String? village;
  String? suffix;
  String? firstName;
  String? middleName;
  String? lastName;
  String? suffixEng;
  String? firstNameEng;
  String? middleNameEng;
  String? lastNameEng;
  String? companyName;
  String? companyNameEng;

  UserDetails(
      {this.khataNo,
      this.naBhu,
      this.ulpin,
      this.userName,
      this.district,
      this.taluka,
      this.village,
      this.suffix,
      this.firstName,
      this.middleName,
      this.lastName,
      this.suffixEng,
      this.firstNameEng,
      this.middleNameEng,
      this.lastNameEng,
      this.companyName,
      this.companyNameEng});

  UserDetails.fromJson(Map<String, dynamic> json) {
    khataNo = json['khataNo'];
    naBhu = json['naBhu'];
    ulpin = json['ulpin'];
    userName = json['userName'];
    district = json['district'];
    taluka = json['taluka'];
    village = json['village'];
    suffix = json['suffix'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    suffixEng = json['suffixEng'];
    firstNameEng = json['firstNameEng'];
    middleNameEng = json['middleNameEng'];
    lastNameEng = json['lastNameEng'];
    companyName = json['companyName'];
    companyNameEng = json['companyNameEng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['khataNo'] = khataNo;
    data['naBhu'] = naBhu;
    data['ulpin'] = ulpin;
    data['userName'] = userName;
    data['district'] = district;
    data['taluka'] = taluka;
    data['village'] = village;
    data['suffix'] = suffix;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['suffixEng'] = suffixEng;
    data['firstNameEng'] = firstNameEng;
    data['middleNameEng'] = middleNameEng;
    data['lastNameEng'] = lastNameEng;
    data['companyName'] = companyName;
    data['companyNameEng'] = companyNameEng;
    return data;
  }
}

class Address {
  String? addressType;
  ForeignAddress? foreignAddress;
  IndiaAddress? indiaAddress;

  Address({this.addressType, this.foreignAddress, this.indiaAddress});

  Address.fromJson(Map<String, dynamic> json) {
    addressType = json['addressType'];
    foreignAddress = json['foreignAddress'] != null
        ?  ForeignAddress.fromJson(json['foreignAddress'])
        : null;
    indiaAddress = json['indiaAddress'] != null
        ?  IndiaAddress.fromJson(json['indiaAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['addressType'] = addressType;
    if (foreignAddress != null) {
      data['foreignAddress'] = foreignAddress!.toJson();
    }
    if (indiaAddress != null) {
      data['indiaAddress'] = indiaAddress!.toJson();
    }
    return data;
  }
}

class ForeignAddress {
  String? address;
  String? mobile;
  String? email;
  String? emailOTP;
  String? singnatureName;
  String? signatureSrc;

  ForeignAddress(
      {this.address,
      this.mobile,
      this.email,
      this.emailOTP,
      this.singnatureName,
      this.signatureSrc});

  ForeignAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    mobile = json['mobile'];
    email = json['email'];
    emailOTP = json['emailOTP'];
    singnatureName = json['singnatureName'];
    signatureSrc = json['signatureSrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['address'] = address;
    data['mobile'] = mobile;
    data['email'] = email;
    data['emailOTP'] = emailOTP;
    data['singnatureName'] = singnatureName;
    data['signatureSrc'] = signatureSrc;
    return data;
  }
}

class IndiaAddress {
  String? state;
  String? district;
  String? city;
  String? taluka;
  String? plotNo;
  String? building;
  String? mainRoad;
  String? impSymbol;
  String? area;
  String? pincode;
  String? postOfficeName;
  String? addressProofName;
  String? addressProofSrc;
  String? mobile;
  String? mobileOTP;
  String? email;
  String? emailOTP;
  String? securityKey;
  String? singnatureName;
  String? signatureSrc;

  IndiaAddress(
      {this.state,
      this.district,
      this.city,
      this.taluka,
      this.plotNo,
      this.building,
      this.mainRoad,
      this.impSymbol,
      this.area,
      this.pincode,
      this.postOfficeName,
      this.addressProofName,
      this.addressProofSrc,
      this.mobile,
      this.mobileOTP,
      this.email,
      this.emailOTP,
      this.securityKey,
      this.singnatureName,
      this.signatureSrc});

  IndiaAddress.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    district = json['district'];
    city = json['city'];
    taluka = json['taluka'];
    plotNo = json['plotNo'];
    building = json['building'];
    mainRoad = json['mainRoad'];
    impSymbol = json['impSymbol'];
    area = json['area'];
    pincode = json['pincode'];
    postOfficeName = json['postOfficeName'];
    addressProofName = json['addressProofName'];
    addressProofSrc = json['addressProofSrc'];
    mobile = json['mobile'];
    mobileOTP = json['mobileOTP'];
    email = json['email'];
    emailOTP = json['emailOTP'];
    securityKey = json['securityKey'];
    singnatureName = json['singnatureName'];
    signatureSrc = json['signatureSrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['state'] = state;
    data['district'] = district;
    data['city'] = city;
    data['taluka'] = taluka;
    data['plotNo'] = plotNo;
    data['building'] = building;
    data['mainRoad'] = mainRoad;
    data['impSymbol'] =impSymbol;
    data['area'] = area;
    data['pincode'] = pincode;
    data['postOfficeName'] = postOfficeName;
    data['addressProofName'] = addressProofName;
    data['addressProofSrc'] = addressProofSrc;
    data['mobile'] = mobile;
    data['mobileOTP'] = mobileOTP;
    data['email'] = email;
    data['emailOTP'] = emailOTP;
    data['securityKey'] = securityKey;
    data['singnatureName'] = singnatureName;
    data['signatureSrc'] = signatureSrc;
    return data;
  }
}
