import 'package:wefinex/generated/json/base/json_convert_content.dart';

class XosoEntity with JsonConvert<XosoEntity> {
	String? name;
	String? icon;
	String? link;

	@override
  String toString() {
    return 'XosoEntity{name: $name, icon: $icon, link: $link}';
  }
}
