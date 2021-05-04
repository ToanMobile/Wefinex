import 'package:wefinex/repository/model/xoso_entity.dart';

xosoEntityFromJson(XosoEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['link'] != null) {
		data.link = json['link'].toString();
	}
	return data;
}

Map<String, dynamic> xosoEntityToJson(XosoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['icon'] = entity.icon;
	data['link'] = entity.link;
	return data;
}