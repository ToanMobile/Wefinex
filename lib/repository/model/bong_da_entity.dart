import 'package:wefinex/generated/json/base/json_convert_content.dart';

class BongDaEntity with JsonConvert<BongDaEntity> {
	int? count;
	BongDaFilters? filters;
	List<BongDaCompetitions>? competitions;
}

class BongDaFilters with JsonConvert<BongDaFilters> {

}

class BongDaCompetitions with JsonConvert<BongDaCompetitions> {
	int? id;
	BongDaCompetitionsArea? area;
	String? name;
	String? code;
	String? emblemUrl;
	String? plan;
	BongDaCompetitionsCurrentSeason? currentSeason;
	int? numberOfAvailableSeasons;
	String? lastUpdated;
}

class BongDaCompetitionsArea with JsonConvert<BongDaCompetitionsArea> {
	int? id;
	String? name;
	String? countryCode;
	dynamic? ensignUrl;
}

class BongDaCompetitionsCurrentSeason with JsonConvert<BongDaCompetitionsCurrentSeason> {
	int? id;
	String? startDate;
	String? endDate;
	int? currentMatchday;
	dynamic? winner;
}
