import 'package:wefinex/repository/model/coin_entity.dart';

coinEntityFromJson(CoinEntity data, Map<String, dynamic> json) {
	if (json['Message'] != null) {
		data.message = json['Message'].toString();
	}
	if (json['Type'] != null) {
		data.type = json['Type'] is String
				? int.tryParse(json['Type'])
				: json['Type'].toInt();
	}
	if (json['MetaData'] != null) {
		data.metaData = CoinMetaData().fromJson(json['MetaData']);
	}
	if (json['SponsoredData'] != null) {
		data.sponsoredData = (json['SponsoredData'] as List).map((v) => CoinSponsoredData().fromJson(v)).toList();
	}
	if (json['Data'] != null) {
		data.data = (json['Data'] as List).map((v) => CoinData().fromJson(v)).toList();
	}
	if (json['RateLimit'] != null) {
		data.rateLimit = CoinRateLimit().fromJson(json['RateLimit']);
	}
	if (json['HasWarning'] != null) {
		data.hasWarning = json['HasWarning'];
	}
	return data;
}

Map<String, dynamic> coinEntityToJson(CoinEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Message'] = entity.message;
	data['Type'] = entity.type;
	data['MetaData'] = entity.metaData?.toJson();
	data['SponsoredData'] =  entity.sponsoredData?.map((v) => v.toJson())?.toList();
	data['Data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['RateLimit'] = entity.rateLimit?.toJson();
	data['HasWarning'] = entity.hasWarning;
	return data;
}

coinMetaDataFromJson(CoinMetaData data, Map<String, dynamic> json) {
	if (json['Count'] != null) {
		data.count = json['Count'] is String
				? int.tryParse(json['Count'])
				: json['Count'].toInt();
	}
	return data;
}

Map<String, dynamic> coinMetaDataToJson(CoinMetaData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Count'] = entity.count;
	return data;
}

coinSponsoredDataFromJson(CoinSponsoredData data, Map<String, dynamic> json) {
	if (json['CoinInfo'] != null) {
		data.coinInfo = CoinSponsoredDataCoinInfo().fromJson(json['CoinInfo']);
	}
	if (json['RAW'] != null) {
		data.rAW = CoinSponsoredDataRAW().fromJson(json['RAW']);
	}
	if (json['DISPLAY'] != null) {
		data.dISPLAY = CoinSponsoredDataDISPLAY().fromJson(json['DISPLAY']);
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataToJson(CoinSponsoredData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['CoinInfo'] = entity.coinInfo?.toJson();
	data['RAW'] = entity.rAW?.toJson();
	data['DISPLAY'] = entity.dISPLAY?.toJson();
	return data;
}

coinSponsoredDataCoinInfoFromJson(CoinSponsoredDataCoinInfo data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['FullName'] != null) {
		data.fullName = json['FullName'].toString();
	}
	if (json['Internal'] != null) {
		data.internal = json['Internal'].toString();
	}
	if (json['ImageUrl'] != null) {
		data.imageUrl = json['ImageUrl'].toString();
	}
	if (json['Url'] != null) {
		data.url = json['Url'].toString();
	}
	if (json['Algorithm'] != null) {
		data.algorithm = json['Algorithm'].toString();
	}
	if (json['ProofType'] != null) {
		data.proofType = json['ProofType'].toString();
	}
	if (json['Rating'] != null) {
		data.rating = CoinSponsoredDataCoinInfoRating().fromJson(json['Rating']);
	}
	if (json['NetHashesPerSecond'] != null) {
		data.netHashesPerSecond = json['NetHashesPerSecond'] is String
				? int.tryParse(json['NetHashesPerSecond'])
				: json['NetHashesPerSecond'].toInt();
	}
	if (json['BlockNumber'] != null) {
		data.blockNumber = json['BlockNumber'] is String
				? int.tryParse(json['BlockNumber'])
				: json['BlockNumber'].toInt();
	}
	if (json['BlockTime'] != null) {
		data.blockTime = json['BlockTime'] is String
				? int.tryParse(json['BlockTime'])
				: json['BlockTime'].toInt();
	}
	if (json['BlockReward'] != null) {
		data.blockReward = json['BlockReward'] is String
				? int.tryParse(json['BlockReward'])
				: json['BlockReward'].toInt();
	}
	if (json['AssetLaunchDate'] != null) {
		data.assetLaunchDate = json['AssetLaunchDate'].toString();
	}
	if (json['MaxSupply'] != null) {
		data.maxSupply = json['MaxSupply'] is String
				? int.tryParse(json['MaxSupply'])
				: json['MaxSupply'].toInt();
	}
	if (json['Type'] != null) {
		data.type = json['Type'] is String
				? int.tryParse(json['Type'])
				: json['Type'].toInt();
	}
	if (json['DocumentType'] != null) {
		data.documentType = json['DocumentType'].toString();
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataCoinInfoToJson(CoinSponsoredDataCoinInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['FullName'] = entity.fullName;
	data['Internal'] = entity.internal;
	data['ImageUrl'] = entity.imageUrl;
	data['Url'] = entity.url;
	data['Algorithm'] = entity.algorithm;
	data['ProofType'] = entity.proofType;
	data['Rating'] = entity.rating?.toJson();
	data['NetHashesPerSecond'] = entity.netHashesPerSecond;
	data['BlockNumber'] = entity.blockNumber;
	data['BlockTime'] = entity.blockTime;
	data['BlockReward'] = entity.blockReward;
	data['AssetLaunchDate'] = entity.assetLaunchDate;
	data['MaxSupply'] = entity.maxSupply;
	data['Type'] = entity.type;
	data['DocumentType'] = entity.documentType;
	return data;
}

coinSponsoredDataCoinInfoRatingFromJson(CoinSponsoredDataCoinInfoRating data, Map<String, dynamic> json) {
	if (json['Weiss'] != null) {
		data.weiss = CoinSponsoredDataCoinInfoRatingWeiss().fromJson(json['Weiss']);
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataCoinInfoRatingToJson(CoinSponsoredDataCoinInfoRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Weiss'] = entity.weiss?.toJson();
	return data;
}

coinSponsoredDataCoinInfoRatingWeissFromJson(CoinSponsoredDataCoinInfoRatingWeiss data, Map<String, dynamic> json) {
	if (json['Rating'] != null) {
		data.rating = json['Rating'].toString();
	}
	if (json['TechnologyAdoptionRating'] != null) {
		data.technologyAdoptionRating = json['TechnologyAdoptionRating'].toString();
	}
	if (json['MarketPerformanceRating'] != null) {
		data.marketPerformanceRating = json['MarketPerformanceRating'].toString();
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataCoinInfoRatingWeissToJson(CoinSponsoredDataCoinInfoRatingWeiss entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Rating'] = entity.rating;
	data['TechnologyAdoptionRating'] = entity.technologyAdoptionRating;
	data['MarketPerformanceRating'] = entity.marketPerformanceRating;
	return data;
}

coinSponsoredDataRAWFromJson(CoinSponsoredDataRAW data, Map<String, dynamic> json) {
	if (json['USD'] != null) {
		data.uSD = CoinSponsoredDataRAWUSD().fromJson(json['USD']);
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataRAWToJson(CoinSponsoredDataRAW entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['USD'] = entity.uSD?.toJson();
	return data;
}

coinSponsoredDataRAWUSDFromJson(CoinSponsoredDataRAWUSD data, Map<String, dynamic> json) {
	if (json['TYPE'] != null) {
		data.tYPE = json['TYPE'].toString();
	}
	if (json['MARKET'] != null) {
		data.mARKET = json['MARKET'].toString();
	}
	if (json['FROMSYMBOL'] != null) {
		data.fROMSYMBOL = json['FROMSYMBOL'].toString();
	}
	if (json['TOSYMBOL'] != null) {
		data.tOSYMBOL = json['TOSYMBOL'].toString();
	}
	if (json['FLAGS'] != null) {
		data.fLAGS = json['FLAGS'].toString();
	}
	if (json['PRICE'] != null) {
		data.pRICE = json['PRICE'] is String
				? double.tryParse(json['PRICE'])
				: json['PRICE'].toDouble();
	}
	if (json['LASTUPDATE'] != null) {
		data.lASTUPDATE = json['LASTUPDATE'] is String
				? int.tryParse(json['LASTUPDATE'])
				: json['LASTUPDATE'].toInt();
	}
	if (json['MEDIAN'] != null) {
		data.mEDIAN = json['MEDIAN'] is String
				? double.tryParse(json['MEDIAN'])
				: json['MEDIAN'].toDouble();
	}
	if (json['LASTVOLUME'] != null) {
		data.lASTVOLUME = json['LASTVOLUME'] is String
				? double.tryParse(json['LASTVOLUME'])
				: json['LASTVOLUME'].toDouble();
	}
	if (json['LASTVOLUMETO'] != null) {
		data.lASTVOLUMETO = json['LASTVOLUMETO'] is String
				? double.tryParse(json['LASTVOLUMETO'])
				: json['LASTVOLUMETO'].toDouble();
	}
	if (json['LASTTRADEID'] != null) {
		data.lASTTRADEID = json['LASTTRADEID'].toString();
	}
	if (json['VOLUMEDAY'] != null) {
		data.vOLUMEDAY = json['VOLUMEDAY'] is String
				? int.tryParse(json['VOLUMEDAY'])
				: json['VOLUMEDAY'].toInt();
	}
	if (json['VOLUMEDAYTO'] != null) {
		data.vOLUMEDAYTO = json['VOLUMEDAYTO'] is String
				? int.tryParse(json['VOLUMEDAYTO'])
				: json['VOLUMEDAYTO'].toInt();
	}
	if (json['VOLUME24HOUR'] != null) {
		data.vOLUME24HOUR = json['VOLUME24HOUR'] is String
				? int.tryParse(json['VOLUME24HOUR'])
				: json['VOLUME24HOUR'].toInt();
	}
	if (json['VOLUME24HOURTO'] != null) {
		data.vOLUME24HOURTO = json['VOLUME24HOURTO'] is String
				? int.tryParse(json['VOLUME24HOURTO'])
				: json['VOLUME24HOURTO'].toInt();
	}
	if (json['OPENDAY'] != null) {
		data.oPENDAY = json['OPENDAY'] is String
				? double.tryParse(json['OPENDAY'])
				: json['OPENDAY'].toDouble();
	}
	if (json['HIGHDAY'] != null) {
		data.hIGHDAY = json['HIGHDAY'] is String
				? double.tryParse(json['HIGHDAY'])
				: json['HIGHDAY'].toDouble();
	}
	if (json['LOWDAY'] != null) {
		data.lOWDAY = json['LOWDAY'] is String
				? double.tryParse(json['LOWDAY'])
				: json['LOWDAY'].toDouble();
	}
	if (json['OPEN24HOUR'] != null) {
		data.oPEN24HOUR = json['OPEN24HOUR'] is String
				? double.tryParse(json['OPEN24HOUR'])
				: json['OPEN24HOUR'].toDouble();
	}
	if (json['HIGH24HOUR'] != null) {
		data.hIGH24HOUR = json['HIGH24HOUR'] is String
				? double.tryParse(json['HIGH24HOUR'])
				: json['HIGH24HOUR'].toDouble();
	}
	if (json['LOW24HOUR'] != null) {
		data.lOW24HOUR = json['LOW24HOUR'] is String
				? double.tryParse(json['LOW24HOUR'])
				: json['LOW24HOUR'].toDouble();
	}
	if (json['LASTMARKET'] != null) {
		data.lASTMARKET = json['LASTMARKET'].toString();
	}
	if (json['VOLUMEHOUR'] != null) {
		data.vOLUMEHOUR = json['VOLUMEHOUR'] is String
				? int.tryParse(json['VOLUMEHOUR'])
				: json['VOLUMEHOUR'].toInt();
	}
	if (json['VOLUMEHOURTO'] != null) {
		data.vOLUMEHOURTO = json['VOLUMEHOURTO'] is String
				? int.tryParse(json['VOLUMEHOURTO'])
				: json['VOLUMEHOURTO'].toInt();
	}
	if (json['OPENHOUR'] != null) {
		data.oPENHOUR = json['OPENHOUR'] is String
				? double.tryParse(json['OPENHOUR'])
				: json['OPENHOUR'].toDouble();
	}
	if (json['HIGHHOUR'] != null) {
		data.hIGHHOUR = json['HIGHHOUR'] is String
				? double.tryParse(json['HIGHHOUR'])
				: json['HIGHHOUR'].toDouble();
	}
	if (json['LOWHOUR'] != null) {
		data.lOWHOUR = json['LOWHOUR'] is String
				? double.tryParse(json['LOWHOUR'])
				: json['LOWHOUR'].toDouble();
	}
	if (json['TOPTIERVOLUME24HOUR'] != null) {
		data.tOPTIERVOLUME24HOUR = json['TOPTIERVOLUME24HOUR'] is String
				? int.tryParse(json['TOPTIERVOLUME24HOUR'])
				: json['TOPTIERVOLUME24HOUR'].toInt();
	}
	if (json['TOPTIERVOLUME24HOURTO'] != null) {
		data.tOPTIERVOLUME24HOURTO = json['TOPTIERVOLUME24HOURTO'] is String
				? int.tryParse(json['TOPTIERVOLUME24HOURTO'])
				: json['TOPTIERVOLUME24HOURTO'].toInt();
	}
	if (json['CHANGE24HOUR'] != null) {
		data.cHANGE24HOUR = json['CHANGE24HOUR'] is String
				? double.tryParse(json['CHANGE24HOUR'])
				: json['CHANGE24HOUR'].toDouble();
	}
	if (json['CHANGEPCT24HOUR'] != null) {
		data.cHANGEPCT24HOUR = json['CHANGEPCT24HOUR'] is String
				? double.tryParse(json['CHANGEPCT24HOUR'])
				: json['CHANGEPCT24HOUR'].toDouble();
	}
	if (json['CHANGEDAY'] != null) {
		data.cHANGEDAY = json['CHANGEDAY'] is String
				? double.tryParse(json['CHANGEDAY'])
				: json['CHANGEDAY'].toDouble();
	}
	if (json['CHANGEPCTDAY'] != null) {
		data.cHANGEPCTDAY = json['CHANGEPCTDAY'] is String
				? double.tryParse(json['CHANGEPCTDAY'])
				: json['CHANGEPCTDAY'].toDouble();
	}
	if (json['CHANGEHOUR'] != null) {
		data.cHANGEHOUR = json['CHANGEHOUR'] is String
				? double.tryParse(json['CHANGEHOUR'])
				: json['CHANGEHOUR'].toDouble();
	}
	if (json['CHANGEPCTHOUR'] != null) {
		data.cHANGEPCTHOUR = json['CHANGEPCTHOUR'] is String
				? double.tryParse(json['CHANGEPCTHOUR'])
				: json['CHANGEPCTHOUR'].toDouble();
	}
	if (json['CONVERSIONTYPE'] != null) {
		data.cONVERSIONTYPE = json['CONVERSIONTYPE'].toString();
	}
	if (json['CONVERSIONSYMBOL'] != null) {
		data.cONVERSIONSYMBOL = json['CONVERSIONSYMBOL'].toString();
	}
	if (json['SUPPLY'] != null) {
		data.sUPPLY = json['SUPPLY'] is String
				? int.tryParse(json['SUPPLY'])
				: json['SUPPLY'].toInt();
	}
	if (json['MKTCAP'] != null) {
		data.mKTCAP = json['MKTCAP'] is String
				? int.tryParse(json['MKTCAP'])
				: json['MKTCAP'].toInt();
	}
	if (json['MKTCAPPENALTY'] != null) {
		data.mKTCAPPENALTY = json['MKTCAPPENALTY'] is String
				? int.tryParse(json['MKTCAPPENALTY'])
				: json['MKTCAPPENALTY'].toInt();
	}
	if (json['TOTALVOLUME24H'] != null) {
		data.tOTALVOLUME24H = json['TOTALVOLUME24H'] is String
				? int.tryParse(json['TOTALVOLUME24H'])
				: json['TOTALVOLUME24H'].toInt();
	}
	if (json['TOTALVOLUME24HTO'] != null) {
		data.tOTALVOLUME24HTO = json['TOTALVOLUME24HTO'] is String
				? int.tryParse(json['TOTALVOLUME24HTO'])
				: json['TOTALVOLUME24HTO'].toInt();
	}
	if (json['TOTALTOPTIERVOLUME24H'] != null) {
		data.tOTALTOPTIERVOLUME24H = json['TOTALTOPTIERVOLUME24H'] is String
				? int.tryParse(json['TOTALTOPTIERVOLUME24H'])
				: json['TOTALTOPTIERVOLUME24H'].toInt();
	}
	if (json['TOTALTOPTIERVOLUME24HTO'] != null) {
		data.tOTALTOPTIERVOLUME24HTO = json['TOTALTOPTIERVOLUME24HTO'] is String
				? int.tryParse(json['TOTALTOPTIERVOLUME24HTO'])
				: json['TOTALTOPTIERVOLUME24HTO'].toInt();
	}
	if (json['IMAGEURL'] != null) {
		data.iMAGEURL = json['IMAGEURL'].toString();
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataRAWUSDToJson(CoinSponsoredDataRAWUSD entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['TYPE'] = entity.tYPE;
	data['MARKET'] = entity.mARKET;
	data['FROMSYMBOL'] = entity.fROMSYMBOL;
	data['TOSYMBOL'] = entity.tOSYMBOL;
	data['FLAGS'] = entity.fLAGS;
	data['PRICE'] = entity.pRICE;
	data['LASTUPDATE'] = entity.lASTUPDATE;
	data['MEDIAN'] = entity.mEDIAN;
	data['LASTVOLUME'] = entity.lASTVOLUME;
	data['LASTVOLUMETO'] = entity.lASTVOLUMETO;
	data['LASTTRADEID'] = entity.lASTTRADEID;
	data['VOLUMEDAY'] = entity.vOLUMEDAY;
	data['VOLUMEDAYTO'] = entity.vOLUMEDAYTO;
	data['VOLUME24HOUR'] = entity.vOLUME24HOUR;
	data['VOLUME24HOURTO'] = entity.vOLUME24HOURTO;
	data['OPENDAY'] = entity.oPENDAY;
	data['HIGHDAY'] = entity.hIGHDAY;
	data['LOWDAY'] = entity.lOWDAY;
	data['OPEN24HOUR'] = entity.oPEN24HOUR;
	data['HIGH24HOUR'] = entity.hIGH24HOUR;
	data['LOW24HOUR'] = entity.lOW24HOUR;
	data['LASTMARKET'] = entity.lASTMARKET;
	data['VOLUMEHOUR'] = entity.vOLUMEHOUR;
	data['VOLUMEHOURTO'] = entity.vOLUMEHOURTO;
	data['OPENHOUR'] = entity.oPENHOUR;
	data['HIGHHOUR'] = entity.hIGHHOUR;
	data['LOWHOUR'] = entity.lOWHOUR;
	data['TOPTIERVOLUME24HOUR'] = entity.tOPTIERVOLUME24HOUR;
	data['TOPTIERVOLUME24HOURTO'] = entity.tOPTIERVOLUME24HOURTO;
	data['CHANGE24HOUR'] = entity.cHANGE24HOUR;
	data['CHANGEPCT24HOUR'] = entity.cHANGEPCT24HOUR;
	data['CHANGEDAY'] = entity.cHANGEDAY;
	data['CHANGEPCTDAY'] = entity.cHANGEPCTDAY;
	data['CHANGEHOUR'] = entity.cHANGEHOUR;
	data['CHANGEPCTHOUR'] = entity.cHANGEPCTHOUR;
	data['CONVERSIONTYPE'] = entity.cONVERSIONTYPE;
	data['CONVERSIONSYMBOL'] = entity.cONVERSIONSYMBOL;
	data['SUPPLY'] = entity.sUPPLY;
	data['MKTCAP'] = entity.mKTCAP;
	data['MKTCAPPENALTY'] = entity.mKTCAPPENALTY;
	data['TOTALVOLUME24H'] = entity.tOTALVOLUME24H;
	data['TOTALVOLUME24HTO'] = entity.tOTALVOLUME24HTO;
	data['TOTALTOPTIERVOLUME24H'] = entity.tOTALTOPTIERVOLUME24H;
	data['TOTALTOPTIERVOLUME24HTO'] = entity.tOTALTOPTIERVOLUME24HTO;
	data['IMAGEURL'] = entity.iMAGEURL;
	return data;
}

coinSponsoredDataDISPLAYFromJson(CoinSponsoredDataDISPLAY data, Map<String, dynamic> json) {
	if (json['USD'] != null) {
		data.uSD = CoinSponsoredDataDISPLAYUSD().fromJson(json['USD']);
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataDISPLAYToJson(CoinSponsoredDataDISPLAY entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['USD'] = entity.uSD?.toJson();
	return data;
}

coinSponsoredDataDISPLAYUSDFromJson(CoinSponsoredDataDISPLAYUSD data, Map<String, dynamic> json) {
	if (json['FROMSYMBOL'] != null) {
		data.fROMSYMBOL = json['FROMSYMBOL'].toString();
	}
	if (json['TOSYMBOL'] != null) {
		data.tOSYMBOL = json['TOSYMBOL'].toString();
	}
	if (json['MARKET'] != null) {
		data.mARKET = json['MARKET'].toString();
	}
	if (json['PRICE'] != null) {
		data.pRICE = json['PRICE'].toString();
	}
	if (json['LASTUPDATE'] != null) {
		data.lASTUPDATE = json['LASTUPDATE'].toString();
	}
	if (json['LASTVOLUME'] != null) {
		data.lASTVOLUME = json['LASTVOLUME'].toString();
	}
	if (json['LASTVOLUMETO'] != null) {
		data.lASTVOLUMETO = json['LASTVOLUMETO'].toString();
	}
	if (json['LASTTRADEID'] != null) {
		data.lASTTRADEID = json['LASTTRADEID'].toString();
	}
	if (json['VOLUMEDAY'] != null) {
		data.vOLUMEDAY = json['VOLUMEDAY'].toString();
	}
	if (json['VOLUMEDAYTO'] != null) {
		data.vOLUMEDAYTO = json['VOLUMEDAYTO'].toString();
	}
	if (json['VOLUME24HOUR'] != null) {
		data.vOLUME24HOUR = json['VOLUME24HOUR'].toString();
	}
	if (json['VOLUME24HOURTO'] != null) {
		data.vOLUME24HOURTO = json['VOLUME24HOURTO'].toString();
	}
	if (json['OPENDAY'] != null) {
		data.oPENDAY = json['OPENDAY'].toString();
	}
	if (json['HIGHDAY'] != null) {
		data.hIGHDAY = json['HIGHDAY'].toString();
	}
	if (json['LOWDAY'] != null) {
		data.lOWDAY = json['LOWDAY'].toString();
	}
	if (json['OPEN24HOUR'] != null) {
		data.oPEN24HOUR = json['OPEN24HOUR'].toString();
	}
	if (json['HIGH24HOUR'] != null) {
		data.hIGH24HOUR = json['HIGH24HOUR'].toString();
	}
	if (json['LOW24HOUR'] != null) {
		data.lOW24HOUR = json['LOW24HOUR'].toString();
	}
	if (json['LASTMARKET'] != null) {
		data.lASTMARKET = json['LASTMARKET'].toString();
	}
	if (json['VOLUMEHOUR'] != null) {
		data.vOLUMEHOUR = json['VOLUMEHOUR'].toString();
	}
	if (json['VOLUMEHOURTO'] != null) {
		data.vOLUMEHOURTO = json['VOLUMEHOURTO'].toString();
	}
	if (json['OPENHOUR'] != null) {
		data.oPENHOUR = json['OPENHOUR'].toString();
	}
	if (json['HIGHHOUR'] != null) {
		data.hIGHHOUR = json['HIGHHOUR'].toString();
	}
	if (json['LOWHOUR'] != null) {
		data.lOWHOUR = json['LOWHOUR'].toString();
	}
	if (json['TOPTIERVOLUME24HOUR'] != null) {
		data.tOPTIERVOLUME24HOUR = json['TOPTIERVOLUME24HOUR'].toString();
	}
	if (json['TOPTIERVOLUME24HOURTO'] != null) {
		data.tOPTIERVOLUME24HOURTO = json['TOPTIERVOLUME24HOURTO'].toString();
	}
	if (json['CHANGE24HOUR'] != null) {
		data.cHANGE24HOUR = json['CHANGE24HOUR'].toString();
	}
	if (json['CHANGEPCT24HOUR'] != null) {
		data.cHANGEPCT24HOUR = json['CHANGEPCT24HOUR'].toString();
	}
	if (json['CHANGEDAY'] != null) {
		data.cHANGEDAY = json['CHANGEDAY'].toString();
	}
	if (json['CHANGEPCTDAY'] != null) {
		data.cHANGEPCTDAY = json['CHANGEPCTDAY'].toString();
	}
	if (json['CHANGEHOUR'] != null) {
		data.cHANGEHOUR = json['CHANGEHOUR'].toString();
	}
	if (json['CHANGEPCTHOUR'] != null) {
		data.cHANGEPCTHOUR = json['CHANGEPCTHOUR'].toString();
	}
	if (json['CONVERSIONTYPE'] != null) {
		data.cONVERSIONTYPE = json['CONVERSIONTYPE'].toString();
	}
	if (json['CONVERSIONSYMBOL'] != null) {
		data.cONVERSIONSYMBOL = json['CONVERSIONSYMBOL'].toString();
	}
	if (json['SUPPLY'] != null) {
		data.sUPPLY = json['SUPPLY'].toString();
	}
	if (json['MKTCAP'] != null) {
		data.mKTCAP = json['MKTCAP'].toString();
	}
	if (json['MKTCAPPENALTY'] != null) {
		data.mKTCAPPENALTY = json['MKTCAPPENALTY'].toString();
	}
	if (json['TOTALVOLUME24H'] != null) {
		data.tOTALVOLUME24H = json['TOTALVOLUME24H'].toString();
	}
	if (json['TOTALVOLUME24HTO'] != null) {
		data.tOTALVOLUME24HTO = json['TOTALVOLUME24HTO'].toString();
	}
	if (json['TOTALTOPTIERVOLUME24H'] != null) {
		data.tOTALTOPTIERVOLUME24H = json['TOTALTOPTIERVOLUME24H'].toString();
	}
	if (json['TOTALTOPTIERVOLUME24HTO'] != null) {
		data.tOTALTOPTIERVOLUME24HTO = json['TOTALTOPTIERVOLUME24HTO'].toString();
	}
	if (json['IMAGEURL'] != null) {
		data.iMAGEURL = json['IMAGEURL'].toString();
	}
	return data;
}

Map<String, dynamic> coinSponsoredDataDISPLAYUSDToJson(CoinSponsoredDataDISPLAYUSD entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['FROMSYMBOL'] = entity.fROMSYMBOL;
	data['TOSYMBOL'] = entity.tOSYMBOL;
	data['MARKET'] = entity.mARKET;
	data['PRICE'] = entity.pRICE;
	data['LASTUPDATE'] = entity.lASTUPDATE;
	data['LASTVOLUME'] = entity.lASTVOLUME;
	data['LASTVOLUMETO'] = entity.lASTVOLUMETO;
	data['LASTTRADEID'] = entity.lASTTRADEID;
	data['VOLUMEDAY'] = entity.vOLUMEDAY;
	data['VOLUMEDAYTO'] = entity.vOLUMEDAYTO;
	data['VOLUME24HOUR'] = entity.vOLUME24HOUR;
	data['VOLUME24HOURTO'] = entity.vOLUME24HOURTO;
	data['OPENDAY'] = entity.oPENDAY;
	data['HIGHDAY'] = entity.hIGHDAY;
	data['LOWDAY'] = entity.lOWDAY;
	data['OPEN24HOUR'] = entity.oPEN24HOUR;
	data['HIGH24HOUR'] = entity.hIGH24HOUR;
	data['LOW24HOUR'] = entity.lOW24HOUR;
	data['LASTMARKET'] = entity.lASTMARKET;
	data['VOLUMEHOUR'] = entity.vOLUMEHOUR;
	data['VOLUMEHOURTO'] = entity.vOLUMEHOURTO;
	data['OPENHOUR'] = entity.oPENHOUR;
	data['HIGHHOUR'] = entity.hIGHHOUR;
	data['LOWHOUR'] = entity.lOWHOUR;
	data['TOPTIERVOLUME24HOUR'] = entity.tOPTIERVOLUME24HOUR;
	data['TOPTIERVOLUME24HOURTO'] = entity.tOPTIERVOLUME24HOURTO;
	data['CHANGE24HOUR'] = entity.cHANGE24HOUR;
	data['CHANGEPCT24HOUR'] = entity.cHANGEPCT24HOUR;
	data['CHANGEDAY'] = entity.cHANGEDAY;
	data['CHANGEPCTDAY'] = entity.cHANGEPCTDAY;
	data['CHANGEHOUR'] = entity.cHANGEHOUR;
	data['CHANGEPCTHOUR'] = entity.cHANGEPCTHOUR;
	data['CONVERSIONTYPE'] = entity.cONVERSIONTYPE;
	data['CONVERSIONSYMBOL'] = entity.cONVERSIONSYMBOL;
	data['SUPPLY'] = entity.sUPPLY;
	data['MKTCAP'] = entity.mKTCAP;
	data['MKTCAPPENALTY'] = entity.mKTCAPPENALTY;
	data['TOTALVOLUME24H'] = entity.tOTALVOLUME24H;
	data['TOTALVOLUME24HTO'] = entity.tOTALVOLUME24HTO;
	data['TOTALTOPTIERVOLUME24H'] = entity.tOTALTOPTIERVOLUME24H;
	data['TOTALTOPTIERVOLUME24HTO'] = entity.tOTALTOPTIERVOLUME24HTO;
	data['IMAGEURL'] = entity.iMAGEURL;
	return data;
}

coinDataFromJson(CoinData data, Map<String, dynamic> json) {
	if (json['CoinInfo'] != null) {
		data.coinInfo = CoinDataCoinInfo().fromJson(json['CoinInfo']);
	}
	if (json['RAW'] != null) {
		data.rAW = CoinDataRAW().fromJson(json['RAW']);
	}
	if (json['DISPLAY'] != null) {
		data.dISPLAY = CoinDataDISPLAY().fromJson(json['DISPLAY']);
	}
	return data;
}

Map<String, dynamic> coinDataToJson(CoinData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['CoinInfo'] = entity.coinInfo?.toJson();
	data['RAW'] = entity.rAW?.toJson();
	data['DISPLAY'] = entity.dISPLAY?.toJson();
	return data;
}

coinDataCoinInfoFromJson(CoinDataCoinInfo data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['FullName'] != null) {
		data.fullName = json['FullName'].toString();
	}
	if (json['Internal'] != null) {
		data.internal = json['Internal'].toString();
	}
	if (json['ImageUrl'] != null) {
		data.imageUrl = json['ImageUrl'].toString();
	}
	if (json['Url'] != null) {
		data.url = json['Url'].toString();
	}
	if (json['Algorithm'] != null) {
		data.algorithm = json['Algorithm'].toString();
	}
	if (json['ProofType'] != null) {
		data.proofType = json['ProofType'].toString();
	}
	if (json['Rating'] != null) {
		data.rating = CoinDataCoinInfoRating().fromJson(json['Rating']);
	}
	if (json['NetHashesPerSecond'] != null) {
		data.netHashesPerSecond = json['NetHashesPerSecond'] is String
				? int.tryParse(json['NetHashesPerSecond'])
				: json['NetHashesPerSecond'].toInt();
	}
	if (json['BlockNumber'] != null) {
		data.blockNumber = json['BlockNumber'] is String
				? int.tryParse(json['BlockNumber'])
				: json['BlockNumber'].toInt();
	}
	if (json['BlockTime'] != null) {
		data.blockTime = json['BlockTime'] is String
				? double.tryParse(json['BlockTime'])
				: json['BlockTime'].toDouble();
	}
	if (json['BlockReward'] != null) {
		data.blockReward = json['BlockReward'] is String
				? double.tryParse(json['BlockReward'])
				: json['BlockReward'].toDouble();
	}
	if (json['AssetLaunchDate'] != null) {
		data.assetLaunchDate = json['AssetLaunchDate'].toString();
	}
	if (json['MaxSupply'] != null) {
		data.maxSupply = json['MaxSupply'] is String
				? double.tryParse(json['MaxSupply'])
				: json['MaxSupply'].toDouble();
	}
	if (json['Type'] != null) {
		data.type = json['Type'] is String
				? int.tryParse(json['Type'])
				: json['Type'].toInt();
	}
	if (json['DocumentType'] != null) {
		data.documentType = json['DocumentType'].toString();
	}
	return data;
}

Map<String, dynamic> coinDataCoinInfoToJson(CoinDataCoinInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['FullName'] = entity.fullName;
	data['Internal'] = entity.internal;
	data['ImageUrl'] = entity.imageUrl;
	data['Url'] = entity.url;
	data['Algorithm'] = entity.algorithm;
	data['ProofType'] = entity.proofType;
	data['Rating'] = entity.rating?.toJson();
	data['NetHashesPerSecond'] = entity.netHashesPerSecond;
	data['BlockNumber'] = entity.blockNumber;
	data['BlockTime'] = entity.blockTime;
	data['BlockReward'] = entity.blockReward;
	data['AssetLaunchDate'] = entity.assetLaunchDate;
	data['MaxSupply'] = entity.maxSupply;
	data['Type'] = entity.type;
	data['DocumentType'] = entity.documentType;
	return data;
}

coinDataCoinInfoRatingFromJson(CoinDataCoinInfoRating data, Map<String, dynamic> json) {
	if (json['Weiss'] != null) {
		data.weiss = CoinDataCoinInfoRatingWeiss().fromJson(json['Weiss']);
	}
	return data;
}

Map<String, dynamic> coinDataCoinInfoRatingToJson(CoinDataCoinInfoRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Weiss'] = entity.weiss?.toJson();
	return data;
}

coinDataCoinInfoRatingWeissFromJson(CoinDataCoinInfoRatingWeiss data, Map<String, dynamic> json) {
	if (json['Rating'] != null) {
		data.rating = json['Rating'].toString();
	}
	if (json['TechnologyAdoptionRating'] != null) {
		data.technologyAdoptionRating = json['TechnologyAdoptionRating'].toString();
	}
	if (json['MarketPerformanceRating'] != null) {
		data.marketPerformanceRating = json['MarketPerformanceRating'].toString();
	}
	return data;
}

Map<String, dynamic> coinDataCoinInfoRatingWeissToJson(CoinDataCoinInfoRatingWeiss entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Rating'] = entity.rating;
	data['TechnologyAdoptionRating'] = entity.technologyAdoptionRating;
	data['MarketPerformanceRating'] = entity.marketPerformanceRating;
	return data;
}

coinDataRAWFromJson(CoinDataRAW data, Map<String, dynamic> json) {
	if (json['USD'] != null) {
		data.uSD = CoinDataRAWUSD().fromJson(json['USD']);
	}
	return data;
}

Map<String, dynamic> coinDataRAWToJson(CoinDataRAW entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['USD'] = entity.uSD?.toJson();
	return data;
}

coinDataRAWUSDFromJson(CoinDataRAWUSD data, Map<String, dynamic> json) {
	if (json['TYPE'] != null) {
		data.tYPE = json['TYPE'].toString();
	}
	if (json['MARKET'] != null) {
		data.mARKET = json['MARKET'].toString();
	}
	if (json['FROMSYMBOL'] != null) {
		data.fROMSYMBOL = json['FROMSYMBOL'].toString();
	}
	if (json['TOSYMBOL'] != null) {
		data.tOSYMBOL = json['TOSYMBOL'].toString();
	}
	if (json['FLAGS'] != null) {
		data.fLAGS = json['FLAGS'].toString();
	}
	if (json['PRICE'] != null) {
		data.pRICE = json['PRICE'] is String
				? double.tryParse(json['PRICE'])
				: json['PRICE'].toDouble();
	}
	if (json['LASTUPDATE'] != null) {
		data.lASTUPDATE = json['LASTUPDATE'] is String
				? int.tryParse(json['LASTUPDATE'])
				: json['LASTUPDATE'].toInt();
	}
	if (json['MEDIAN'] != null) {
		data.mEDIAN = json['MEDIAN'] is String
				? double.tryParse(json['MEDIAN'])
				: json['MEDIAN'].toDouble();
	}
	if (json['LASTVOLUME'] != null) {
		data.lASTVOLUME = json['LASTVOLUME'] is String
				? double.tryParse(json['LASTVOLUME'])
				: json['LASTVOLUME'].toDouble();
	}
	if (json['LASTVOLUMETO'] != null) {
		data.lASTVOLUMETO = json['LASTVOLUMETO'] is String
				? double.tryParse(json['LASTVOLUMETO'])
				: json['LASTVOLUMETO'].toDouble();
	}
	if (json['LASTTRADEID'] != null) {
		data.lASTTRADEID = json['LASTTRADEID'].toString();
	}
	if (json['VOLUMEDAY'] != null) {
		data.vOLUMEDAY = json['VOLUMEDAY'] is String
				? double.tryParse(json['VOLUMEDAY'])
				: json['VOLUMEDAY'].toDouble();
	}
	if (json['VOLUMEDAYTO'] != null) {
		data.vOLUMEDAYTO = json['VOLUMEDAYTO'] is String
				? double.tryParse(json['VOLUMEDAYTO'])
				: json['VOLUMEDAYTO'].toDouble();
	}
	if (json['VOLUME24HOUR'] != null) {
		data.vOLUME24HOUR = json['VOLUME24HOUR'] is String
				? double.tryParse(json['VOLUME24HOUR'])
				: json['VOLUME24HOUR'].toDouble();
	}
	if (json['VOLUME24HOURTO'] != null) {
		data.vOLUME24HOURTO = json['VOLUME24HOURTO'] is String
				? double.tryParse(json['VOLUME24HOURTO'])
				: json['VOLUME24HOURTO'].toDouble();
	}
	if (json['OPENDAY'] != null) {
		data.oPENDAY = json['OPENDAY'] is String
				? double.tryParse(json['OPENDAY'])
				: json['OPENDAY'].toDouble();
	}
	if (json['HIGHDAY'] != null) {
		data.hIGHDAY = json['HIGHDAY'] is String
				? double.tryParse(json['HIGHDAY'])
				: json['HIGHDAY'].toDouble();
	}
	if (json['LOWDAY'] != null) {
		data.lOWDAY = json['LOWDAY'] is String
				? double.tryParse(json['LOWDAY'])
				: json['LOWDAY'].toDouble();
	}
	if (json['OPEN24HOUR'] != null) {
		data.oPEN24HOUR = json['OPEN24HOUR'] is String
				? double.tryParse(json['OPEN24HOUR'])
				: json['OPEN24HOUR'].toDouble();
	}
	if (json['HIGH24HOUR'] != null) {
		data.hIGH24HOUR = json['HIGH24HOUR'] is String
				? double.tryParse(json['HIGH24HOUR'])
				: json['HIGH24HOUR'].toDouble();
	}
	if (json['LOW24HOUR'] != null) {
		data.lOW24HOUR = json['LOW24HOUR'] is String
				? double.tryParse(json['LOW24HOUR'])
				: json['LOW24HOUR'].toDouble();
	}
	if (json['LASTMARKET'] != null) {
		data.lASTMARKET = json['LASTMARKET'].toString();
	}
	if (json['VOLUMEHOUR'] != null) {
		data.vOLUMEHOUR = json['VOLUMEHOUR'] is String
				? double.tryParse(json['VOLUMEHOUR'])
				: json['VOLUMEHOUR'].toDouble();
	}
	if (json['VOLUMEHOURTO'] != null) {
		data.vOLUMEHOURTO = json['VOLUMEHOURTO'] is String
				? double.tryParse(json['VOLUMEHOURTO'])
				: json['VOLUMEHOURTO'].toDouble();
	}
	if (json['OPENHOUR'] != null) {
		data.oPENHOUR = json['OPENHOUR'] is String
				? double.tryParse(json['OPENHOUR'])
				: json['OPENHOUR'].toDouble();
	}
	if (json['HIGHHOUR'] != null) {
		data.hIGHHOUR = json['HIGHHOUR'] is String
				? double.tryParse(json['HIGHHOUR'])
				: json['HIGHHOUR'].toDouble();
	}
	if (json['LOWHOUR'] != null) {
		data.lOWHOUR = json['LOWHOUR'] is String
				? double.tryParse(json['LOWHOUR'])
				: json['LOWHOUR'].toDouble();
	}
	if (json['TOPTIERVOLUME24HOUR'] != null) {
		data.tOPTIERVOLUME24HOUR = json['TOPTIERVOLUME24HOUR'] is String
				? double.tryParse(json['TOPTIERVOLUME24HOUR'])
				: json['TOPTIERVOLUME24HOUR'].toDouble();
	}
	if (json['TOPTIERVOLUME24HOURTO'] != null) {
		data.tOPTIERVOLUME24HOURTO = json['TOPTIERVOLUME24HOURTO'] is String
				? double.tryParse(json['TOPTIERVOLUME24HOURTO'])
				: json['TOPTIERVOLUME24HOURTO'].toDouble();
	}
	if (json['CHANGE24HOUR'] != null) {
		data.cHANGE24HOUR = json['CHANGE24HOUR'] is String
				? double.tryParse(json['CHANGE24HOUR'])
				: json['CHANGE24HOUR'].toDouble();
	}
	if (json['CHANGEPCT24HOUR'] != null) {
		data.cHANGEPCT24HOUR = json['CHANGEPCT24HOUR'] is String
				? double.tryParse(json['CHANGEPCT24HOUR'])
				: json['CHANGEPCT24HOUR'].toDouble();
	}
	if (json['CHANGEDAY'] != null) {
		data.cHANGEDAY = json['CHANGEDAY'] is String
				? double.tryParse(json['CHANGEDAY'])
				: json['CHANGEDAY'].toDouble();
	}
	if (json['CHANGEPCTDAY'] != null) {
		data.cHANGEPCTDAY = json['CHANGEPCTDAY'] is String
				? double.tryParse(json['CHANGEPCTDAY'])
				: json['CHANGEPCTDAY'].toDouble();
	}
	if (json['CHANGEHOUR'] != null) {
		data.cHANGEHOUR = json['CHANGEHOUR'] is String
				? double.tryParse(json['CHANGEHOUR'])
				: json['CHANGEHOUR'].toDouble();
	}
	if (json['CHANGEPCTHOUR'] != null) {
		data.cHANGEPCTHOUR = json['CHANGEPCTHOUR'] is String
				? double.tryParse(json['CHANGEPCTHOUR'])
				: json['CHANGEPCTHOUR'].toDouble();
	}
	if (json['CONVERSIONTYPE'] != null) {
		data.cONVERSIONTYPE = json['CONVERSIONTYPE'].toString();
	}
	if (json['CONVERSIONSYMBOL'] != null) {
		data.cONVERSIONSYMBOL = json['CONVERSIONSYMBOL'].toString();
	}
	if (json['SUPPLY'] != null) {
		data.sUPPLY = json['SUPPLY'] is String
				? int.tryParse(json['SUPPLY'])
				: json['SUPPLY'].toInt();
	}
	if (json['MKTCAP'] != null) {
		data.mKTCAP = json['MKTCAP'] is String
				? double.tryParse(json['MKTCAP'])
				: json['MKTCAP'].toDouble();
	}
	if (json['MKTCAPPENALTY'] != null) {
		data.mKTCAPPENALTY = json['MKTCAPPENALTY'] is String
				? int.tryParse(json['MKTCAPPENALTY'])
				: json['MKTCAPPENALTY'].toInt();
	}
	if (json['TOTALVOLUME24H'] != null) {
		data.tOTALVOLUME24H = json['TOTALVOLUME24H'] is String
				? double.tryParse(json['TOTALVOLUME24H'])
				: json['TOTALVOLUME24H'].toDouble();
	}
	if (json['TOTALVOLUME24HTO'] != null) {
		data.tOTALVOLUME24HTO = json['TOTALVOLUME24HTO'] is String
				? double.tryParse(json['TOTALVOLUME24HTO'])
				: json['TOTALVOLUME24HTO'].toDouble();
	}
	if (json['TOTALTOPTIERVOLUME24H'] != null) {
		data.tOTALTOPTIERVOLUME24H = json['TOTALTOPTIERVOLUME24H'] is String
				? double.tryParse(json['TOTALTOPTIERVOLUME24H'])
				: json['TOTALTOPTIERVOLUME24H'].toDouble();
	}
	if (json['TOTALTOPTIERVOLUME24HTO'] != null) {
		data.tOTALTOPTIERVOLUME24HTO = json['TOTALTOPTIERVOLUME24HTO'] is String
				? double.tryParse(json['TOTALTOPTIERVOLUME24HTO'])
				: json['TOTALTOPTIERVOLUME24HTO'].toDouble();
	}
	if (json['IMAGEURL'] != null) {
		data.iMAGEURL = json['IMAGEURL'].toString();
	}
	return data;
}

Map<String, dynamic> coinDataRAWUSDToJson(CoinDataRAWUSD entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['TYPE'] = entity.tYPE;
	data['MARKET'] = entity.mARKET;
	data['FROMSYMBOL'] = entity.fROMSYMBOL;
	data['TOSYMBOL'] = entity.tOSYMBOL;
	data['FLAGS'] = entity.fLAGS;
	data['PRICE'] = entity.pRICE;
	data['LASTUPDATE'] = entity.lASTUPDATE;
	data['MEDIAN'] = entity.mEDIAN;
	data['LASTVOLUME'] = entity.lASTVOLUME;
	data['LASTVOLUMETO'] = entity.lASTVOLUMETO;
	data['LASTTRADEID'] = entity.lASTTRADEID;
	data['VOLUMEDAY'] = entity.vOLUMEDAY;
	data['VOLUMEDAYTO'] = entity.vOLUMEDAYTO;
	data['VOLUME24HOUR'] = entity.vOLUME24HOUR;
	data['VOLUME24HOURTO'] = entity.vOLUME24HOURTO;
	data['OPENDAY'] = entity.oPENDAY;
	data['HIGHDAY'] = entity.hIGHDAY;
	data['LOWDAY'] = entity.lOWDAY;
	data['OPEN24HOUR'] = entity.oPEN24HOUR;
	data['HIGH24HOUR'] = entity.hIGH24HOUR;
	data['LOW24HOUR'] = entity.lOW24HOUR;
	data['LASTMARKET'] = entity.lASTMARKET;
	data['VOLUMEHOUR'] = entity.vOLUMEHOUR;
	data['VOLUMEHOURTO'] = entity.vOLUMEHOURTO;
	data['OPENHOUR'] = entity.oPENHOUR;
	data['HIGHHOUR'] = entity.hIGHHOUR;
	data['LOWHOUR'] = entity.lOWHOUR;
	data['TOPTIERVOLUME24HOUR'] = entity.tOPTIERVOLUME24HOUR;
	data['TOPTIERVOLUME24HOURTO'] = entity.tOPTIERVOLUME24HOURTO;
	data['CHANGE24HOUR'] = entity.cHANGE24HOUR;
	data['CHANGEPCT24HOUR'] = entity.cHANGEPCT24HOUR;
	data['CHANGEDAY'] = entity.cHANGEDAY;
	data['CHANGEPCTDAY'] = entity.cHANGEPCTDAY;
	data['CHANGEHOUR'] = entity.cHANGEHOUR;
	data['CHANGEPCTHOUR'] = entity.cHANGEPCTHOUR;
	data['CONVERSIONTYPE'] = entity.cONVERSIONTYPE;
	data['CONVERSIONSYMBOL'] = entity.cONVERSIONSYMBOL;
	data['SUPPLY'] = entity.sUPPLY;
	data['MKTCAP'] = entity.mKTCAP;
	data['MKTCAPPENALTY'] = entity.mKTCAPPENALTY;
	data['TOTALVOLUME24H'] = entity.tOTALVOLUME24H;
	data['TOTALVOLUME24HTO'] = entity.tOTALVOLUME24HTO;
	data['TOTALTOPTIERVOLUME24H'] = entity.tOTALTOPTIERVOLUME24H;
	data['TOTALTOPTIERVOLUME24HTO'] = entity.tOTALTOPTIERVOLUME24HTO;
	data['IMAGEURL'] = entity.iMAGEURL;
	return data;
}

coinDataDISPLAYFromJson(CoinDataDISPLAY data, Map<String, dynamic> json) {
	if (json['USD'] != null) {
		data.uSD = CoinDataDISPLAYUSD().fromJson(json['USD']);
	}
	return data;
}

Map<String, dynamic> coinDataDISPLAYToJson(CoinDataDISPLAY entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['USD'] = entity.uSD?.toJson();
	return data;
}

coinDataDISPLAYUSDFromJson(CoinDataDISPLAYUSD data, Map<String, dynamic> json) {
	if (json['FROMSYMBOL'] != null) {
		data.fROMSYMBOL = json['FROMSYMBOL'].toString();
	}
	if (json['TOSYMBOL'] != null) {
		data.tOSYMBOL = json['TOSYMBOL'].toString();
	}
	if (json['MARKET'] != null) {
		data.mARKET = json['MARKET'].toString();
	}
	if (json['PRICE'] != null) {
		data.pRICE = json['PRICE'].toString();
	}
	if (json['LASTUPDATE'] != null) {
		data.lASTUPDATE = json['LASTUPDATE'].toString();
	}
	if (json['LASTVOLUME'] != null) {
		data.lASTVOLUME = json['LASTVOLUME'].toString();
	}
	if (json['LASTVOLUMETO'] != null) {
		data.lASTVOLUMETO = json['LASTVOLUMETO'].toString();
	}
	if (json['LASTTRADEID'] != null) {
		data.lASTTRADEID = json['LASTTRADEID'].toString();
	}
	if (json['VOLUMEDAY'] != null) {
		data.vOLUMEDAY = json['VOLUMEDAY'].toString();
	}
	if (json['VOLUMEDAYTO'] != null) {
		data.vOLUMEDAYTO = json['VOLUMEDAYTO'].toString();
	}
	if (json['VOLUME24HOUR'] != null) {
		data.vOLUME24HOUR = json['VOLUME24HOUR'].toString();
	}
	if (json['VOLUME24HOURTO'] != null) {
		data.vOLUME24HOURTO = json['VOLUME24HOURTO'].toString();
	}
	if (json['OPENDAY'] != null) {
		data.oPENDAY = json['OPENDAY'].toString();
	}
	if (json['HIGHDAY'] != null) {
		data.hIGHDAY = json['HIGHDAY'].toString();
	}
	if (json['LOWDAY'] != null) {
		data.lOWDAY = json['LOWDAY'].toString();
	}
	if (json['OPEN24HOUR'] != null) {
		data.oPEN24HOUR = json['OPEN24HOUR'].toString();
	}
	if (json['HIGH24HOUR'] != null) {
		data.hIGH24HOUR = json['HIGH24HOUR'].toString();
	}
	if (json['LOW24HOUR'] != null) {
		data.lOW24HOUR = json['LOW24HOUR'].toString();
	}
	if (json['LASTMARKET'] != null) {
		data.lASTMARKET = json['LASTMARKET'].toString();
	}
	if (json['VOLUMEHOUR'] != null) {
		data.vOLUMEHOUR = json['VOLUMEHOUR'].toString();
	}
	if (json['VOLUMEHOURTO'] != null) {
		data.vOLUMEHOURTO = json['VOLUMEHOURTO'].toString();
	}
	if (json['OPENHOUR'] != null) {
		data.oPENHOUR = json['OPENHOUR'].toString();
	}
	if (json['HIGHHOUR'] != null) {
		data.hIGHHOUR = json['HIGHHOUR'].toString();
	}
	if (json['LOWHOUR'] != null) {
		data.lOWHOUR = json['LOWHOUR'].toString();
	}
	if (json['TOPTIERVOLUME24HOUR'] != null) {
		data.tOPTIERVOLUME24HOUR = json['TOPTIERVOLUME24HOUR'].toString();
	}
	if (json['TOPTIERVOLUME24HOURTO'] != null) {
		data.tOPTIERVOLUME24HOURTO = json['TOPTIERVOLUME24HOURTO'].toString();
	}
	if (json['CHANGE24HOUR'] != null) {
		data.cHANGE24HOUR = json['CHANGE24HOUR'].toString();
	}
	if (json['CHANGEPCT24HOUR'] != null) {
		data.cHANGEPCT24HOUR = json['CHANGEPCT24HOUR'].toString();
	}
	if (json['CHANGEDAY'] != null) {
		data.cHANGEDAY = json['CHANGEDAY'].toString();
	}
	if (json['CHANGEPCTDAY'] != null) {
		data.cHANGEPCTDAY = json['CHANGEPCTDAY'].toString();
	}
	if (json['CHANGEHOUR'] != null) {
		data.cHANGEHOUR = json['CHANGEHOUR'].toString();
	}
	if (json['CHANGEPCTHOUR'] != null) {
		data.cHANGEPCTHOUR = json['CHANGEPCTHOUR'].toString();
	}
	if (json['CONVERSIONTYPE'] != null) {
		data.cONVERSIONTYPE = json['CONVERSIONTYPE'].toString();
	}
	if (json['CONVERSIONSYMBOL'] != null) {
		data.cONVERSIONSYMBOL = json['CONVERSIONSYMBOL'].toString();
	}
	if (json['SUPPLY'] != null) {
		data.sUPPLY = json['SUPPLY'].toString();
	}
	if (json['MKTCAP'] != null) {
		data.mKTCAP = json['MKTCAP'].toString();
	}
	if (json['MKTCAPPENALTY'] != null) {
		data.mKTCAPPENALTY = json['MKTCAPPENALTY'].toString();
	}
	if (json['TOTALVOLUME24H'] != null) {
		data.tOTALVOLUME24H = json['TOTALVOLUME24H'].toString();
	}
	if (json['TOTALVOLUME24HTO'] != null) {
		data.tOTALVOLUME24HTO = json['TOTALVOLUME24HTO'].toString();
	}
	if (json['TOTALTOPTIERVOLUME24H'] != null) {
		data.tOTALTOPTIERVOLUME24H = json['TOTALTOPTIERVOLUME24H'].toString();
	}
	if (json['TOTALTOPTIERVOLUME24HTO'] != null) {
		data.tOTALTOPTIERVOLUME24HTO = json['TOTALTOPTIERVOLUME24HTO'].toString();
	}
	if (json['IMAGEURL'] != null) {
		data.iMAGEURL = json['IMAGEURL'].toString();
	}
	return data;
}

Map<String, dynamic> coinDataDISPLAYUSDToJson(CoinDataDISPLAYUSD entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['FROMSYMBOL'] = entity.fROMSYMBOL;
	data['TOSYMBOL'] = entity.tOSYMBOL;
	data['MARKET'] = entity.mARKET;
	data['PRICE'] = entity.pRICE;
	data['LASTUPDATE'] = entity.lASTUPDATE;
	data['LASTVOLUME'] = entity.lASTVOLUME;
	data['LASTVOLUMETO'] = entity.lASTVOLUMETO;
	data['LASTTRADEID'] = entity.lASTTRADEID;
	data['VOLUMEDAY'] = entity.vOLUMEDAY;
	data['VOLUMEDAYTO'] = entity.vOLUMEDAYTO;
	data['VOLUME24HOUR'] = entity.vOLUME24HOUR;
	data['VOLUME24HOURTO'] = entity.vOLUME24HOURTO;
	data['OPENDAY'] = entity.oPENDAY;
	data['HIGHDAY'] = entity.hIGHDAY;
	data['LOWDAY'] = entity.lOWDAY;
	data['OPEN24HOUR'] = entity.oPEN24HOUR;
	data['HIGH24HOUR'] = entity.hIGH24HOUR;
	data['LOW24HOUR'] = entity.lOW24HOUR;
	data['LASTMARKET'] = entity.lASTMARKET;
	data['VOLUMEHOUR'] = entity.vOLUMEHOUR;
	data['VOLUMEHOURTO'] = entity.vOLUMEHOURTO;
	data['OPENHOUR'] = entity.oPENHOUR;
	data['HIGHHOUR'] = entity.hIGHHOUR;
	data['LOWHOUR'] = entity.lOWHOUR;
	data['TOPTIERVOLUME24HOUR'] = entity.tOPTIERVOLUME24HOUR;
	data['TOPTIERVOLUME24HOURTO'] = entity.tOPTIERVOLUME24HOURTO;
	data['CHANGE24HOUR'] = entity.cHANGE24HOUR;
	data['CHANGEPCT24HOUR'] = entity.cHANGEPCT24HOUR;
	data['CHANGEDAY'] = entity.cHANGEDAY;
	data['CHANGEPCTDAY'] = entity.cHANGEPCTDAY;
	data['CHANGEHOUR'] = entity.cHANGEHOUR;
	data['CHANGEPCTHOUR'] = entity.cHANGEPCTHOUR;
	data['CONVERSIONTYPE'] = entity.cONVERSIONTYPE;
	data['CONVERSIONSYMBOL'] = entity.cONVERSIONSYMBOL;
	data['SUPPLY'] = entity.sUPPLY;
	data['MKTCAP'] = entity.mKTCAP;
	data['MKTCAPPENALTY'] = entity.mKTCAPPENALTY;
	data['TOTALVOLUME24H'] = entity.tOTALVOLUME24H;
	data['TOTALVOLUME24HTO'] = entity.tOTALVOLUME24HTO;
	data['TOTALTOPTIERVOLUME24H'] = entity.tOTALTOPTIERVOLUME24H;
	data['TOTALTOPTIERVOLUME24HTO'] = entity.tOTALTOPTIERVOLUME24HTO;
	data['IMAGEURL'] = entity.iMAGEURL;
	return data;
}

coinRateLimitFromJson(CoinRateLimit data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> coinRateLimitToJson(CoinRateLimit entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}