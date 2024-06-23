/// name : "MD. Sajid Hossain"
/// email : "sajidrec@gmail.com"
/// uid : "1"
library;

class UserCredentialModel {
  UserCredentialModel({
      String? name, 
      String? email, 
      String? uid,}){
    _name = name;
    _email = email;
    _uid = uid;
}

  UserCredentialModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _uid = json['uid'];
  }
  String? _name;
  String? _email;
  String? _uid;
UserCredentialModel copyWith({  String? name,
  String? email,
  String? uid,
}) => UserCredentialModel(  name: name ?? _name,
  email: email ?? _email,
  uid: uid ?? _uid,
);
  String? get name => _name;
  String? get email => _email;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['uid'] = _uid;
    return map;
  }

}