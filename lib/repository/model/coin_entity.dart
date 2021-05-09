import 'package:wefinex/generated/json/base/json_convert_content.dart';
import 'package:wefinex/generated/json/base/json_field.dart';

class CoinEntity with JsonConvert<CoinEntity> {
	@JSONField(name: "Message")
	String? message;
	@JSONField(name: "Type")
	int? type;
	@JSONField(name: "MetaData")
	CoinMetaData? metaData;
	@JSONField(name: "SponsoredData")
	List<CoinSponsoredData>? sponsoredData;
	@JSONField(name: "Data")
	List<CoinData>? data;
	@JSONField(name: "RateLimit")
	CoinRateLimit? rateLimit;
  @JSONField(name: "HasWarning")
	bool? hasWarning;

	@override
	String toString() {
		return 'CoinEntity{message: $message, type: $type, metaData: $metaData, sponsoredData: $sponsoredData, data: $data, rateLimit: $rateLimit, hasWarning: $hasWarning}';
	}
}

class CoinMetaData with JsonConvert<CoinMetaData> {
	@JSONField(name: "Count")
	int? count;

	@override
  String toString() {
    return 'CoinMetaData{count: $count}';
  }
}

class CoinSponsoredData with JsonConvert<CoinSponsoredData> {
	@JSONField(name: "CoinInfo")
	CoinSponsoredDataCoinInfo? coinInfo;
  @JSONField(name: "RAW")
	CoinSponsoredDataRAW? rAW;
	@JSONField(name: "DISPLAY")
	CoinSponsoredDataDISPLAY? dISPLAY;

	@override
	String toString() {
		return 'CoinSponsoredData{coinInfo: $coinInfo, rAW: $rAW, dISPLAY: $dISPLAY}';
	}

}

class CoinSponsoredDataCoinInfo with JsonConvert<CoinSponsoredDataCoinInfo> {
	@JSONField(name: "Id")
	String? id;
	@JSONField(name: "Name")
	String? name;
	@JSONField(name: "FullName")
	String? fullName;
	@JSONField(name: "Internal")
	String? internal;
	@JSONField(name: "ImageUrl")
	String? imageUrl;
	@JSONField(name: "Url")
	String? url;
	@JSONField(name: "Algorithm")
	String? algorithm;
	@JSONField(name: "ProofType")
	String? proofType;
	@JSONField(name: "Rating")
	CoinSponsoredDataCoinInfoRating? rating;
	@JSONField(name: "NetHashesPerSecond")
	int? netHashesPerSecond;
	@JSONField(name: "BlockNumber")
	int? blockNumber;
	@JSONField(name: "BlockTime")
	int? blockTime;
	@JSONField(name: "BlockReward")
	int? blockReward;
	@JSONField(name: "AssetLaunchDate")
	String? assetLaunchDate;
	@JSONField(name: "MaxSupply")
	int? maxSupply;
  @JSONField(name: "Type")
	int? type;
	@JSONField(name: "DocumentType")
	String? documentType;

	@override
	String toString() {
		return 'CoinSponsoredDataCoinInfo{id: $id, name: $name, fullName: $fullName, internal: $internal, imageUrl: $imageUrl, url: $url, algorithm: $algorithm, proofType: $proofType, rating: $rating, netHashesPerSecond: $netHashesPerSecond, blockNumber: $blockNumber, blockTime: $blockTime, blockReward: $blockReward, assetLaunchDate: $assetLaunchDate, maxSupply: $maxSupply, type: $type, documentType: $documentType}';
	}

}

class CoinSponsoredDataCoinInfoRating with JsonConvert<CoinSponsoredDataCoinInfoRating> {
	@JSONField(name: "Weiss")
	CoinSponsoredDataCoinInfoRatingWeiss? weiss;

	@override
  String toString() {
    return 'CoinSponsoredDataCoinInfoRating{weiss: $weiss}';
  }
}

class CoinSponsoredDataCoinInfoRatingWeiss with JsonConvert<CoinSponsoredDataCoinInfoRatingWeiss> {
	@JSONField(name: "Rating")
	String? rating;
	@JSONField(name: "TechnologyAdoptionRating")
	String? technologyAdoptionRating;
	@JSONField(name: "MarketPerformanceRating")
	String? marketPerformanceRating;

	@override
  String toString() {
    return 'CoinSponsoredDataCoinInfoRatingWeiss{rating: $rating, technologyAdoptionRating: $technologyAdoptionRating, marketPerformanceRating: $marketPerformanceRating}';
  }
}

class CoinSponsoredDataRAW with JsonConvert<CoinSponsoredDataRAW> {
	@JSONField(name: "USD")
	CoinSponsoredDataRAWUSD? uSD;

	@override
  String toString() {
    return 'CoinSponsoredDataRAW{uSD: $uSD}';
  }
}

class CoinSponsoredDataRAWUSD with JsonConvert<CoinSponsoredDataRAWUSD> {
	@JSONField(name: "TYPE")
	String? tYPE;
	@JSONField(name: "MARKET")
	String? mARKET;
	@JSONField(name: "FROMSYMBOL")
	String? fROMSYMBOL;
	@JSONField(name: "TOSYMBOL")
	String? tOSYMBOL;
	@JSONField(name: "FLAGS")
	String? fLAGS;
	@JSONField(name: "PRICE")
	double? pRICE;
	@JSONField(name: "LASTUPDATE")
	int? lASTUPDATE;
	@JSONField(name: "MEDIAN")
	double? mEDIAN;
	@JSONField(name: "LASTVOLUME")
	double? lASTVOLUME;
	@JSONField(name: "LASTVOLUMETO")
	double? lASTVOLUMETO;
	@JSONField(name: "LASTTRADEID")
	String? lASTTRADEID;
	@JSONField(name: "VOLUMEDAY")
	int? vOLUMEDAY;
	@JSONField(name: "VOLUMEDAYTO")
	int? vOLUMEDAYTO;
	@JSONField(name: "VOLUME24HOUR")
	int? vOLUME24HOUR;
	@JSONField(name: "VOLUME24HOURTO")
	int? vOLUME24HOURTO;
	@JSONField(name: "OPENDAY")
	double? oPENDAY;
	@JSONField(name: "HIGHDAY")
	double? hIGHDAY;
	@JSONField(name: "LOWDAY")
	double? lOWDAY;
	@JSONField(name: "OPEN24HOUR")
	double? oPEN24HOUR;
	@JSONField(name: "HIGH24HOUR")
	double? hIGH24HOUR;
	@JSONField(name: "LOW24HOUR")
	double? lOW24HOUR;
	@JSONField(name: "LASTMARKET")
	String? lASTMARKET;
	@JSONField(name: "VOLUMEHOUR")
	int? vOLUMEHOUR;
	@JSONField(name: "VOLUMEHOURTO")
	int? vOLUMEHOURTO;
	@JSONField(name: "OPENHOUR")
	double? oPENHOUR;
	@JSONField(name: "HIGHHOUR")
	double? hIGHHOUR;
	@JSONField(name: "LOWHOUR")
	double? lOWHOUR;
	@JSONField(name: "TOPTIERVOLUME24HOUR")
	int? tOPTIERVOLUME24HOUR;
	@JSONField(name: "TOPTIERVOLUME24HOURTO")
	int? tOPTIERVOLUME24HOURTO;
	@JSONField(name: "CHANGE24HOUR")
	double? cHANGE24HOUR;
	@JSONField(name: "CHANGEPCT24HOUR")
	double? cHANGEPCT24HOUR;
	@JSONField(name: "CHANGEDAY")
	double? cHANGEDAY;
	@JSONField(name: "CHANGEPCTDAY")
	double? cHANGEPCTDAY;
	@JSONField(name: "CHANGEHOUR")
	double? cHANGEHOUR;
	@JSONField(name: "CHANGEPCTHOUR")
	double? cHANGEPCTHOUR;
	@JSONField(name: "CONVERSIONTYPE")
	String? cONVERSIONTYPE;
	@JSONField(name: "CONVERSIONSYMBOL")
	String? cONVERSIONSYMBOL;
	@JSONField(name: "SUPPLY")
	int? sUPPLY;
	@JSONField(name: "MKTCAP")
	int? mKTCAP;
	@JSONField(name: "MKTCAPPENALTY")
	int? mKTCAPPENALTY;
	@JSONField(name: "TOTALVOLUME24H")
	int? tOTALVOLUME24H;
	@JSONField(name: "TOTALVOLUME24HTO")
	int? tOTALVOLUME24HTO;
	@JSONField(name: "TOTALTOPTIERVOLUME24H")
	int? tOTALTOPTIERVOLUME24H;
	@JSONField(name: "TOTALTOPTIERVOLUME24HTO")
	int? tOTALTOPTIERVOLUME24HTO;
	@JSONField(name: "IMAGEURL")
	String? iMAGEURL;

	@override
  String toString() {
    return 'CoinSponsoredDataRAWUSD{tYPE: $tYPE, mARKET: $mARKET, fROMSYMBOL: $fROMSYMBOL, tOSYMBOL: $tOSYMBOL, fLAGS: $fLAGS, pRICE: $pRICE, lASTUPDATE: $lASTUPDATE, mEDIAN: $mEDIAN, lASTVOLUME: $lASTVOLUME, lASTVOLUMETO: $lASTVOLUMETO, lASTTRADEID: $lASTTRADEID, vOLUMEDAY: $vOLUMEDAY, vOLUMEDAYTO: $vOLUMEDAYTO, vOLUME24HOUR: $vOLUME24HOUR, vOLUME24HOURTO: $vOLUME24HOURTO, oPENDAY: $oPENDAY, hIGHDAY: $hIGHDAY, lOWDAY: $lOWDAY, oPEN24HOUR: $oPEN24HOUR, hIGH24HOUR: $hIGH24HOUR, lOW24HOUR: $lOW24HOUR, lASTMARKET: $lASTMARKET, vOLUMEHOUR: $vOLUMEHOUR, vOLUMEHOURTO: $vOLUMEHOURTO, oPENHOUR: $oPENHOUR, hIGHHOUR: $hIGHHOUR, lOWHOUR: $lOWHOUR, tOPTIERVOLUME24HOUR: $tOPTIERVOLUME24HOUR, tOPTIERVOLUME24HOURTO: $tOPTIERVOLUME24HOURTO, cHANGE24HOUR: $cHANGE24HOUR, cHANGEPCT24HOUR: $cHANGEPCT24HOUR, cHANGEDAY: $cHANGEDAY, cHANGEPCTDAY: $cHANGEPCTDAY, cHANGEHOUR: $cHANGEHOUR, cHANGEPCTHOUR: $cHANGEPCTHOUR, cONVERSIONTYPE: $cONVERSIONTYPE, cONVERSIONSYMBOL: $cONVERSIONSYMBOL, sUPPLY: $sUPPLY, mKTCAP: $mKTCAP, mKTCAPPENALTY: $mKTCAPPENALTY, tOTALVOLUME24H: $tOTALVOLUME24H, tOTALVOLUME24HTO: $tOTALVOLUME24HTO, tOTALTOPTIERVOLUME24H: $tOTALTOPTIERVOLUME24H, tOTALTOPTIERVOLUME24HTO: $tOTALTOPTIERVOLUME24HTO, iMAGEURL: $iMAGEURL}';
  }
}

class CoinSponsoredDataDISPLAY with JsonConvert<CoinSponsoredDataDISPLAY> {
	@JSONField(name: "USD")
	CoinSponsoredDataDISPLAYUSD? uSD;

	@override
  String toString() {
    return 'CoinSponsoredDataDISPLAY{uSD: $uSD}';
  }
}

class CoinSponsoredDataDISPLAYUSD with JsonConvert<CoinSponsoredDataDISPLAYUSD> {
	@JSONField(name: "FROMSYMBOL")
	String? fROMSYMBOL;
	@JSONField(name: "TOSYMBOL")
	String? tOSYMBOL;
	@JSONField(name: "MARKET")
	String? mARKET;
	@JSONField(name: "PRICE")
	String? pRICE;
	@JSONField(name: "LASTUPDATE")
	String? lASTUPDATE;
	@JSONField(name: "LASTVOLUME")
	String? lASTVOLUME;
	@JSONField(name: "LASTVOLUMETO")
	String? lASTVOLUMETO;
	@JSONField(name: "LASTTRADEID")
	String? lASTTRADEID;
	@JSONField(name: "VOLUMEDAY")
	String? vOLUMEDAY;
	@JSONField(name: "VOLUMEDAYTO")
	String? vOLUMEDAYTO;
	@JSONField(name: "VOLUME24HOUR")
	String? vOLUME24HOUR;
	@JSONField(name: "VOLUME24HOURTO")
	String? vOLUME24HOURTO;
	@JSONField(name: "OPENDAY")
	String? oPENDAY;
	@JSONField(name: "HIGHDAY")
	String? hIGHDAY;
	@JSONField(name: "LOWDAY")
	String? lOWDAY;
	@JSONField(name: "OPEN24HOUR")
	String? oPEN24HOUR;
	@JSONField(name: "HIGH24HOUR")
	String? hIGH24HOUR;
	@JSONField(name: "LOW24HOUR")
	String? lOW24HOUR;
	@JSONField(name: "LASTMARKET")
	String? lASTMARKET;
	@JSONField(name: "VOLUMEHOUR")
	String? vOLUMEHOUR;
	@JSONField(name: "VOLUMEHOURTO")
	String? vOLUMEHOURTO;
	@JSONField(name: "OPENHOUR")
	String? oPENHOUR;
	@JSONField(name: "HIGHHOUR")
	String? hIGHHOUR;
	@JSONField(name: "LOWHOUR")
	String? lOWHOUR;
	@JSONField(name: "TOPTIERVOLUME24HOUR")
	String? tOPTIERVOLUME24HOUR;
	@JSONField(name: "TOPTIERVOLUME24HOURTO")
	String? tOPTIERVOLUME24HOURTO;
	@JSONField(name: "CHANGE24HOUR")
	String? cHANGE24HOUR;
	@JSONField(name: "CHANGEPCT24HOUR")
	String? cHANGEPCT24HOUR;
	@JSONField(name: "CHANGEDAY")
	String? cHANGEDAY;
	@JSONField(name: "CHANGEPCTDAY")
	String? cHANGEPCTDAY;
	@JSONField(name: "CHANGEHOUR")
	String? cHANGEHOUR;
	@JSONField(name: "CHANGEPCTHOUR")
	String? cHANGEPCTHOUR;
	@JSONField(name: "CONVERSIONTYPE")
	String? cONVERSIONTYPE;
	@JSONField(name: "CONVERSIONSYMBOL")
	String? cONVERSIONSYMBOL;
	@JSONField(name: "SUPPLY")
	String? sUPPLY;
	@JSONField(name: "MKTCAP")
	String? mKTCAP;
	@JSONField(name: "MKTCAPPENALTY")
	String? mKTCAPPENALTY;
	@JSONField(name: "TOTALVOLUME24H")
	String? tOTALVOLUME24H;
	@JSONField(name: "TOTALVOLUME24HTO")
	String? tOTALVOLUME24HTO;
	@JSONField(name: "TOTALTOPTIERVOLUME24H")
	String? tOTALTOPTIERVOLUME24H;
	@JSONField(name: "TOTALTOPTIERVOLUME24HTO")
	String? tOTALTOPTIERVOLUME24HTO;
	@JSONField(name: "IMAGEURL")
	String? iMAGEURL;

	@override
  String toString() {
    return 'CoinSponsoredDataDISPLAYUSD{fROMSYMBOL: $fROMSYMBOL, tOSYMBOL: $tOSYMBOL, mARKET: $mARKET, pRICE: $pRICE, lASTUPDATE: $lASTUPDATE, lASTVOLUME: $lASTVOLUME, lASTVOLUMETO: $lASTVOLUMETO, lASTTRADEID: $lASTTRADEID, vOLUMEDAY: $vOLUMEDAY, vOLUMEDAYTO: $vOLUMEDAYTO, vOLUME24HOUR: $vOLUME24HOUR, vOLUME24HOURTO: $vOLUME24HOURTO, oPENDAY: $oPENDAY, hIGHDAY: $hIGHDAY, lOWDAY: $lOWDAY, oPEN24HOUR: $oPEN24HOUR, hIGH24HOUR: $hIGH24HOUR, lOW24HOUR: $lOW24HOUR, lASTMARKET: $lASTMARKET, vOLUMEHOUR: $vOLUMEHOUR, vOLUMEHOURTO: $vOLUMEHOURTO, oPENHOUR: $oPENHOUR, hIGHHOUR: $hIGHHOUR, lOWHOUR: $lOWHOUR, tOPTIERVOLUME24HOUR: $tOPTIERVOLUME24HOUR, tOPTIERVOLUME24HOURTO: $tOPTIERVOLUME24HOURTO, cHANGE24HOUR: $cHANGE24HOUR, cHANGEPCT24HOUR: $cHANGEPCT24HOUR, cHANGEDAY: $cHANGEDAY, cHANGEPCTDAY: $cHANGEPCTDAY, cHANGEHOUR: $cHANGEHOUR, cHANGEPCTHOUR: $cHANGEPCTHOUR, cONVERSIONTYPE: $cONVERSIONTYPE, cONVERSIONSYMBOL: $cONVERSIONSYMBOL, sUPPLY: $sUPPLY, mKTCAP: $mKTCAP, mKTCAPPENALTY: $mKTCAPPENALTY, tOTALVOLUME24H: $tOTALVOLUME24H, tOTALVOLUME24HTO: $tOTALVOLUME24HTO, tOTALTOPTIERVOLUME24H: $tOTALTOPTIERVOLUME24H, tOTALTOPTIERVOLUME24HTO: $tOTALTOPTIERVOLUME24HTO, iMAGEURL: $iMAGEURL}';
  }
}

class CoinData with JsonConvert<CoinData> {
	@JSONField(name: "CoinInfo")
	CoinDataCoinInfo? coinInfo;
  @JSONField(name: "RAW")
	CoinDataRAW? rAW;
	@JSONField(name: "DISPLAY")
	CoinDataDISPLAY? dISPLAY;

	@override
	String toString() {
		return 'CoinData{coinInfo: $coinInfo, rAW: $rAW, dISPLAY: $dISPLAY}';
	}

}

class CoinDataCoinInfo with JsonConvert<CoinDataCoinInfo> {
	@JSONField(name: "Id")
	String? id;
	@JSONField(name: "Name")
	String? name;
  @JSONField(name: "FullName")
	String? fullName;
	@JSONField(name: "Internal")
	String? internal;
	@JSONField(name: "ImageUrl")
	String? imageUrl;
	@JSONField(name: "Url")
	String? url;
	@JSONField(name: "Algorithm")
	String? algorithm;
	@JSONField(name: "ProofType")
	String? proofType;
	@JSONField(name: "Rating")
	CoinDataCoinInfoRating? rating;
	@JSONField(name: "NetHashesPerSecond")
	int? netHashesPerSecond;
	@JSONField(name: "BlockNumber")
	int? blockNumber;
	@JSONField(name: "BlockTime")
	double? blockTime;
	@JSONField(name: "BlockReward")
	double? blockReward;
	@JSONField(name: "AssetLaunchDate")
	String? assetLaunchDate;
	@JSONField(name: "MaxSupply")
	double? maxSupply;
	@JSONField(name: "Type")
	int? type;
	@JSONField(name: "DocumentType")
	String? documentType;

	@override
	String toString() {
		return 'CoinDataCoinInfo{id: $id, name: $name, fullName: $fullName, internal: $internal, imageUrl: $imageUrl, url: $url, algorithm: $algorithm, proofType: $proofType, rating: $rating, netHashesPerSecond: $netHashesPerSecond, blockNumber: $blockNumber, blockTime: $blockTime, blockReward: $blockReward, assetLaunchDate: $assetLaunchDate, maxSupply: $maxSupply, type: $type, documentType: $documentType}';
	}

}

class CoinDataCoinInfoRating with JsonConvert<CoinDataCoinInfoRating> {
	@JSONField(name: "Weiss")
	CoinDataCoinInfoRatingWeiss? weiss;

	@override
  String toString() {
    return 'CoinDataCoinInfoRating{weiss: $weiss}';
  }
}

class CoinDataCoinInfoRatingWeiss with JsonConvert<CoinDataCoinInfoRatingWeiss> {
	@JSONField(name: "Rating")
	String? rating;
	@JSONField(name: "TechnologyAdoptionRating")
	String? technologyAdoptionRating;
	@JSONField(name: "MarketPerformanceRating")
	String? marketPerformanceRating;

	@override
  String toString() {
    return 'CoinDataCoinInfoRatingWeiss{rating: $rating, technologyAdoptionRating: $technologyAdoptionRating, marketPerformanceRating: $marketPerformanceRating}';
  }
}

class CoinDataRAW with JsonConvert<CoinDataRAW> {
	@JSONField(name: "USD")
	CoinDataRAWUSD? uSD;

	@override
  String toString() {
    return 'CoinDataRAW{uSD: $uSD}';
  }
}

class CoinDataRAWUSD with JsonConvert<CoinDataRAWUSD> {
	@JSONField(name: "TYPE")
	String? tYPE;
	@JSONField(name: "MARKET")
	String? mARKET;
	@JSONField(name: "FROMSYMBOL")
	String? fROMSYMBOL;
	@JSONField(name: "TOSYMBOL")
	String? tOSYMBOL;
	@JSONField(name: "FLAGS")
	String? fLAGS;
	@JSONField(name: "PRICE")
	double? pRICE;
	@JSONField(name: "LASTUPDATE")
	int? lASTUPDATE;
	@JSONField(name: "MEDIAN")
	double? mEDIAN;
	@JSONField(name: "LASTVOLUME")
	double? lASTVOLUME;
  @JSONField(name: "LASTVOLUMETO")
	double? lASTVOLUMETO;
	@JSONField(name: "LASTTRADEID")
	String? lASTTRADEID;
	@JSONField(name: "VOLUMEDAY")
	double? vOLUMEDAY;
	@JSONField(name: "VOLUMEDAYTO")
	double? vOLUMEDAYTO;
	@JSONField(name: "VOLUME24HOUR")
	double? vOLUME24HOUR;
	@JSONField(name: "VOLUME24HOURTO")
	double? vOLUME24HOURTO;
	@JSONField(name: "OPENDAY")
	double? oPENDAY;
	@JSONField(name: "HIGHDAY")
	double? hIGHDAY;
	@JSONField(name: "LOWDAY")
	double? lOWDAY;
	@JSONField(name: "OPEN24HOUR")
	double? oPEN24HOUR;
	@JSONField(name: "HIGH24HOUR")
	double? hIGH24HOUR;
	@JSONField(name: "LOW24HOUR")
	double? lOW24HOUR;
	@JSONField(name: "LASTMARKET")
	String? lASTMARKET;
	@JSONField(name: "VOLUMEHOUR")
	double? vOLUMEHOUR;
	@JSONField(name: "VOLUMEHOURTO")
	double? vOLUMEHOURTO;
	@JSONField(name: "OPENHOUR")
	double? oPENHOUR;
	@JSONField(name: "HIGHHOUR")
	double? hIGHHOUR;
	@JSONField(name: "LOWHOUR")
	double? lOWHOUR;
	@JSONField(name: "TOPTIERVOLUME24HOUR")
	double? tOPTIERVOLUME24HOUR;
	@JSONField(name: "TOPTIERVOLUME24HOURTO")
	double? tOPTIERVOLUME24HOURTO;
	@JSONField(name: "CHANGE24HOUR")
	double? cHANGE24HOUR;
	@JSONField(name: "CHANGEPCT24HOUR")
	double? cHANGEPCT24HOUR;
	@JSONField(name: "CHANGEDAY")
	double? cHANGEDAY;
	@JSONField(name: "CHANGEPCTDAY")
	double? cHANGEPCTDAY;
	@JSONField(name: "CHANGEHOUR")
	double? cHANGEHOUR;
	@JSONField(name: "CHANGEPCTHOUR")
	double? cHANGEPCTHOUR;
	@JSONField(name: "CONVERSIONTYPE")
	String? cONVERSIONTYPE;
	@JSONField(name: "CONVERSIONSYMBOL")
	String? cONVERSIONSYMBOL;
	@JSONField(name: "SUPPLY")
	int? sUPPLY;
	@JSONField(name: "MKTCAP")
	double? mKTCAP;
	@JSONField(name: "MKTCAPPENALTY")
	int? mKTCAPPENALTY;
	@JSONField(name: "TOTALVOLUME24H")
	double? tOTALVOLUME24H;
	@JSONField(name: "TOTALVOLUME24HTO")
	double? tOTALVOLUME24HTO;
	@JSONField(name: "TOTALTOPTIERVOLUME24H")
	double? tOTALTOPTIERVOLUME24H;
	@JSONField(name: "TOTALTOPTIERVOLUME24HTO")
	double? tOTALTOPTIERVOLUME24HTO;
	@JSONField(name: "IMAGEURL")
	String? iMAGEURL;

	@override
	String toString() {
		return 'CoinDataRAWUSD{tYPE: $tYPE, mARKET: $mARKET, fROMSYMBOL: $fROMSYMBOL, tOSYMBOL: $tOSYMBOL, fLAGS: $fLAGS, pRICE: $pRICE, lASTUPDATE: $lASTUPDATE, mEDIAN: $mEDIAN, lASTVOLUME: $lASTVOLUME, lASTVOLUMETO: $lASTVOLUMETO, lASTTRADEID: $lASTTRADEID, vOLUMEDAY: $vOLUMEDAY, vOLUMEDAYTO: $vOLUMEDAYTO, vOLUME24HOUR: $vOLUME24HOUR, vOLUME24HOURTO: $vOLUME24HOURTO, oPENDAY: $oPENDAY, hIGHDAY: $hIGHDAY, lOWDAY: $lOWDAY, oPEN24HOUR: $oPEN24HOUR, hIGH24HOUR: $hIGH24HOUR, lOW24HOUR: $lOW24HOUR, lASTMARKET: $lASTMARKET, vOLUMEHOUR: $vOLUMEHOUR, vOLUMEHOURTO: $vOLUMEHOURTO, oPENHOUR: $oPENHOUR, hIGHHOUR: $hIGHHOUR, lOWHOUR: $lOWHOUR, tOPTIERVOLUME24HOUR: $tOPTIERVOLUME24HOUR, tOPTIERVOLUME24HOURTO: $tOPTIERVOLUME24HOURTO, cHANGE24HOUR: $cHANGE24HOUR, cHANGEPCT24HOUR: $cHANGEPCT24HOUR, cHANGEDAY: $cHANGEDAY, cHANGEPCTDAY: $cHANGEPCTDAY, cHANGEHOUR: $cHANGEHOUR, cHANGEPCTHOUR: $cHANGEPCTHOUR, cONVERSIONTYPE: $cONVERSIONTYPE, cONVERSIONSYMBOL: $cONVERSIONSYMBOL, sUPPLY: $sUPPLY, mKTCAP: $mKTCAP, mKTCAPPENALTY: $mKTCAPPENALTY, tOTALVOLUME24H: $tOTALVOLUME24H, tOTALVOLUME24HTO: $tOTALVOLUME24HTO, tOTALTOPTIERVOLUME24H: $tOTALTOPTIERVOLUME24H, tOTALTOPTIERVOLUME24HTO: $tOTALTOPTIERVOLUME24HTO, iMAGEURL: $iMAGEURL}';
	}

}

class CoinDataDISPLAY with JsonConvert<CoinDataDISPLAY> {
	@JSONField(name: "USD")
	CoinDataDISPLAYUSD? uSD;

	@override
  String toString() {
    return 'CoinDataDISPLAY{uSD: $uSD}';
  }
}

class CoinDataDISPLAYUSD with JsonConvert<CoinDataDISPLAYUSD> {
	@JSONField(name: "FROMSYMBOL")
	String? fROMSYMBOL;
	@JSONField(name: "TOSYMBOL")
	String? tOSYMBOL;
	@JSONField(name: "MARKET")
	String? mARKET;
	@JSONField(name: "PRICE")
	String? pRICE;
	@JSONField(name: "LASTUPDATE")
	String? lASTUPDATE;
  @JSONField(name: "LASTVOLUME")
	String? lASTVOLUME;
	@JSONField(name: "LASTVOLUMETO")
	String? lASTVOLUMETO;
	@JSONField(name: "LASTTRADEID")
	String? lASTTRADEID;
	@JSONField(name: "VOLUMEDAY")
	String? vOLUMEDAY;
	@JSONField(name: "VOLUMEDAYTO")
	String? vOLUMEDAYTO;
	@JSONField(name: "VOLUME24HOUR")
	String? vOLUME24HOUR;
	@JSONField(name: "VOLUME24HOURTO")
	String? vOLUME24HOURTO;
	@JSONField(name: "OPENDAY")
	String? oPENDAY;
	@JSONField(name: "HIGHDAY")
	String? hIGHDAY;
	@JSONField(name: "LOWDAY")
	String? lOWDAY;
	@JSONField(name: "OPEN24HOUR")
	String? oPEN24HOUR;
	@JSONField(name: "HIGH24HOUR")
	String? hIGH24HOUR;
	@JSONField(name: "LOW24HOUR")
	String? lOW24HOUR;
	@JSONField(name: "LASTMARKET")
	String? lASTMARKET;
	@JSONField(name: "VOLUMEHOUR")
	String? vOLUMEHOUR;
	@JSONField(name: "VOLUMEHOURTO")
	String? vOLUMEHOURTO;
	@JSONField(name: "OPENHOUR")
	String? oPENHOUR;
	@JSONField(name: "HIGHHOUR")
	String? hIGHHOUR;
	@JSONField(name: "LOWHOUR")
	String? lOWHOUR;
	@JSONField(name: "TOPTIERVOLUME24HOUR")
	String? tOPTIERVOLUME24HOUR;
	@JSONField(name: "TOPTIERVOLUME24HOURTO")
	String? tOPTIERVOLUME24HOURTO;
	@JSONField(name: "CHANGE24HOUR")
	String? cHANGE24HOUR;
	@JSONField(name: "CHANGEPCT24HOUR")
	String? cHANGEPCT24HOUR;
	@JSONField(name: "CHANGEDAY")
	String? cHANGEDAY;
	@JSONField(name: "CHANGEPCTDAY")
	String? cHANGEPCTDAY;
	@JSONField(name: "CHANGEHOUR")
	String? cHANGEHOUR;
	@JSONField(name: "CHANGEPCTHOUR")
	String? cHANGEPCTHOUR;
	@JSONField(name: "CONVERSIONTYPE")
	String? cONVERSIONTYPE;
	@JSONField(name: "CONVERSIONSYMBOL")
	String? cONVERSIONSYMBOL;
	@JSONField(name: "SUPPLY")
	String? sUPPLY;
	@JSONField(name: "MKTCAP")
	String? mKTCAP;
	@JSONField(name: "MKTCAPPENALTY")
	String? mKTCAPPENALTY;
	@JSONField(name: "TOTALVOLUME24H")
	String? tOTALVOLUME24H;
	@JSONField(name: "TOTALVOLUME24HTO")
	String? tOTALVOLUME24HTO;
	@JSONField(name: "TOTALTOPTIERVOLUME24H")
	String? tOTALTOPTIERVOLUME24H;
	@JSONField(name: "TOTALTOPTIERVOLUME24HTO")
	String? tOTALTOPTIERVOLUME24HTO;
	@JSONField(name: "IMAGEURL")
	String? iMAGEURL;

	@override
	String toString() {
		return 'CoinDataDISPLAYUSD{fROMSYMBOL: $fROMSYMBOL, tOSYMBOL: $tOSYMBOL, mARKET: $mARKET, pRICE: $pRICE, lASTUPDATE: $lASTUPDATE, lASTVOLUME: $lASTVOLUME, lASTVOLUMETO: $lASTVOLUMETO, lASTTRADEID: $lASTTRADEID, vOLUMEDAY: $vOLUMEDAY, vOLUMEDAYTO: $vOLUMEDAYTO, vOLUME24HOUR: $vOLUME24HOUR, vOLUME24HOURTO: $vOLUME24HOURTO, oPENDAY: $oPENDAY, hIGHDAY: $hIGHDAY, lOWDAY: $lOWDAY, oPEN24HOUR: $oPEN24HOUR, hIGH24HOUR: $hIGH24HOUR, lOW24HOUR: $lOW24HOUR, lASTMARKET: $lASTMARKET, vOLUMEHOUR: $vOLUMEHOUR, vOLUMEHOURTO: $vOLUMEHOURTO, oPENHOUR: $oPENHOUR, hIGHHOUR: $hIGHHOUR, lOWHOUR: $lOWHOUR, tOPTIERVOLUME24HOUR: $tOPTIERVOLUME24HOUR, tOPTIERVOLUME24HOURTO: $tOPTIERVOLUME24HOURTO, cHANGE24HOUR: $cHANGE24HOUR, cHANGEPCT24HOUR: $cHANGEPCT24HOUR, cHANGEDAY: $cHANGEDAY, cHANGEPCTDAY: $cHANGEPCTDAY, cHANGEHOUR: $cHANGEHOUR, cHANGEPCTHOUR: $cHANGEPCTHOUR, cONVERSIONTYPE: $cONVERSIONTYPE, cONVERSIONSYMBOL: $cONVERSIONSYMBOL, sUPPLY: $sUPPLY, mKTCAP: $mKTCAP, mKTCAPPENALTY: $mKTCAPPENALTY, tOTALVOLUME24H: $tOTALVOLUME24H, tOTALVOLUME24HTO: $tOTALVOLUME24HTO, tOTALTOPTIERVOLUME24H: $tOTALTOPTIERVOLUME24H, tOTALTOPTIERVOLUME24HTO: $tOTALTOPTIERVOLUME24HTO, iMAGEURL: $iMAGEURL}';
	}

}

class CoinRateLimit with JsonConvert<CoinRateLimit> {

}
