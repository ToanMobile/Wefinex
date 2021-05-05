import 'package:wefinex/repository/model/bong_da_entity.dart';

bongDaEntityFromJson(BongDaEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count'] is String
				? int.tryParse(json['count'])
				: json['count'].toInt();
	}
	if (json['filters'] != null) {
		data.filters = BongDaFilters().fromJson(json['filters']);
	}
	if (json['competitions'] != null) {
		data.competitions = (json['competitions'] as List).map((v) => BongDaCompetitions().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> bongDaEntityToJson(BongDaEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['filters'] = entity.filters?.toJson();
	data['competitions'] =  entity.competitions?.map((v) => v.toJson())?.toList();
	return data;
}

bongDaFiltersFromJson(BongDaFilters data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> bongDaFiltersToJson(BongDaFilters entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

bongDaCompetitionsFromJson(BongDaCompetitions data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['area'] != null) {
		data.area = BongDaCompetitionsArea().fromJson(json['area']);
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['emblemUrl'] != null) {
		data.emblemUrl = json['emblemUrl'].toString();
	}
	if (json['plan'] != null) {
		data.plan = json['plan'].toString();
	}
	if (json['currentSeason'] != null) {
		data.currentSeason = BongDaCompetitionsCurrentSeason().fromJson(json['currentSeason']);
	}
	if (json['numberOfAvailableSeasons'] != null) {
		data.numberOfAvailableSeasons = json['numberOfAvailableSeasons'] is String
				? int.tryParse(json['numberOfAvailableSeasons'])
				: json['numberOfAvailableSeasons'].toInt();
	}
	if (json['lastUpdated'] != null) {
		data.lastUpdated = json['lastUpdated'].toString();
	}
	return data;
}

Map<String, dynamic> bongDaCompetitionsToJson(BongDaCompetitions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['area'] = entity.area?.toJson();
	data['name'] = entity.name;
	data['code'] = entity.code;
	data['emblemUrl'] = entity.emblemUrl;
	data['plan'] = entity.plan;
	data['currentSeason'] = entity.currentSeason?.toJson();
	data['numberOfAvailableSeasons'] = entity.numberOfAvailableSeasons;
	data['lastUpdated'] = entity.lastUpdated;
	return data;
}

bongDaCompetitionsAreaFromJson(BongDaCompetitionsArea data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['countryCode'] != null) {
		data.countryCode = json['countryCode'].toString();
	}
	if (json['ensignUrl'] != null) {
		data.ensignUrl = json['ensignUrl'];
	}
	return data;
}

Map<String, dynamic> bongDaCompetitionsAreaToJson(BongDaCompetitionsArea entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['countryCode'] = entity.countryCode;
	data['ensignUrl'] = entity.ensignUrl;
	return data;
}

bongDaCompetitionsCurrentSeasonFromJson(BongDaCompetitionsCurrentSeason data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['startDate'] != null) {
		data.startDate = json['startDate'].toString();
	}
	if (json['endDate'] != null) {
		data.endDate = json['endDate'].toString();
	}
	if (json['currentMatchday'] != null) {
		data.currentMatchday = json['currentMatchday'] is String
				? int.tryParse(json['currentMatchday'])
				: json['currentMatchday'].toInt();
	}
	if (json['winner'] != null) {
		data.winner = json['winner'];
	}
	return data;
}

Map<String, dynamic> bongDaCompetitionsCurrentSeasonToJson(BongDaCompetitionsCurrentSeason entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['currentMatchday'] = entity.currentMatchday;
	data['winner'] = entity.winner;
	return data;
}