import 'package:wefinex/generated/json/base/json_convert_content.dart';

class BongdaModelEntity with JsonConvert<BongdaModelEntity> {
	int? count;
	BongdaModelFilters? filters;
	List<BongdaModelCompetitions>? competitions;
}

class BongdaModelFilters with JsonConvert<BongdaModelFilters> {

}

class BongdaModelCompetitions with JsonConvert<BongdaModelCompetitions> {
	int? id;
	BongdaModelCompetitionsArea? area;
	String? name;
	String? code;
	String? emblemUrl;
	String? plan;
	BongdaModelCompetitionsCurrentSeason? currentSeason;
	int? numberOfAvailableSeasons;
	String? lastUpdated;
}

class BongdaModelCompetitionsArea with JsonConvert<BongdaModelCompetitionsArea> {
	int? id;
	String? name;
	String? countryCode;
	dynamic? ensignUrl;
}

class BongdaModelCompetitionsCurrentSeason with JsonConvert<BongdaModelCompetitionsCurrentSeason> {
	int? id;
	String? startDate;
	String? endDate;
	int? currentMatchday;
	dynamic? winner;
}
