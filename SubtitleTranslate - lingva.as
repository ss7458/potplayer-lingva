/*
	real time subtitle translate for PotPlayer using Lingva (Google alternative front-end) API
*/

// void OnInitialize()
// void OnFinalize()
// string GetTitle() 														-> get title for UI
// string GetVersion														-> get version for manage
// string GetDesc()															-> get detail information
// string GetLoginTitle()													-> get title for login dialog
// string GetLoginDesc()													-> get desc for login dialog
// string GetUserText()														-> get user text for login dialog
// string GetPasswordText()													-> get password text for login dialog
// string ServerLogin(string User, string Pass)								-> login
// string ServerLogout()													-> logout
//------------------------------------------------------------------------------------------------
// array<string> GetSrcLangs() 												-> get source language
// array<string> GetDstLangs() 												-> get target language
// string Translate(string Text, string &in SrcLang, string &in DstLang) 	-> do translate !!

string JsonParseV1(string json)
{
	JsonReader Reader;
	JsonValue Root;
	string ret = "";	
	
	if (Reader.parse(json, Root) && Root.isObject()) {
		JsonValue translation = Root["translation"];
		if (translation.isString()) ret = translation.asString();HostPrintUTF8("33333======================ret:"+ret);// for debug print
	}

	return ret;
}

array<string> LangTable = 
{
	"af",
	"sq",
	"am",
	"ar",
	"hy",
	"az",
	"eu",
	"be",
	"bn",
	"bs",
	"bg",
	"my",
	"ca",
	"ceb",
	"ny",
	"zh",
	"zh-CN",
	"zh-TW",
	"co",
	"hr",
	"cs",
	"da",
	"nl",
	"en",
	"eo",
	"et",
	"tl",
	"fi",
	"fr",
	"fy",
	"gl",
	"ka",
	"de",
	"el",
	"gu",
	"ht",
	"ha",
	"haw",
	"iw",
	"hi",
	"hmn",
	"hu",
	"is",
	"ig",
	"id",
	"ga",
	"it",
	"ja",
	"jw",
	"kn",
	"kk",
	"km",
	"ko",
	"ku",
	"ky",
	"lo",
	"la",
	"lv",
	"lt",
	"lb",
	"mk",
	"ms",
	"mg",
	"ml",
	"mt",
	"mi",
	"mr",
	"mn",
	"my",
	"ne",
	"no",
	"ps",
	"fa",
	"pl",
	"pt",
	"pa",
	"ro",
	"romanji",
	"ru",
	"sm",
	"gd",
	"sr",
	"st",
	"sn",
	"sd",
	"si",
	"sk",
	"sl",
	"so",
	"es",
	"su",
	"sw",
	"sv",
	"tg",
	"ta",
	"te",
	"th",
	"tr",
	"uk",
	"ur",
	"uz",
	"vi",
	"cy",
	"xh",
	"yi",
	"yo",
	"zu"
};

string UserAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36";


string GetTitle()
{
	return "{$CP949=링바(구글) 번역$}{$CP950=Lingva(Google) 翻譯$}{$CP0=Lingva(Google) translate$}";
}

string GetVersion()
{
	return "1";
}

string GetDesc()
{
	return "https://github.com/thedaviddelta/lingva-translate";
}

string GetLoginTitle()
{
	return "";
}

string GetLoginDesc()
{
	return "";
}

string GetUserText()
{
	return "Server URL:";
}

string GetPasswordText()
{
	return "";
}

string server_url;
string ServerLogin(string User, string Pass)
{
	//HostOpenConsole();	// for debug
	string text;
	int start_pos;
	server_url = User;
	if (server_url.empty())//Avoid Cloudflare firewall blocking on the main site https://lingva.ml
	{
		server_url = "https://lingva.ml";
		text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.plausibility.cloud";
		text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.alxserver.de";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.abrendan.dev";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.dialectapp.org";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.sphererapids.com";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://salucyr69.synology.me:6455";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translater.perfectpurple.top";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.palmasolutions.net";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://nyc1.lv.ggtyler.dev";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.sharktale.xyz";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.gururaja.in";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.steel77.ddnss.de";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.mnsr.net";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.privacytools.click";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.adminforge.de";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://fanyi.qz.ci";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.seasi.dev";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://lingva.lunar.icu";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.nexo.moe";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
		server_url = "https://translate.ssnc.uk";
		string text = HostUrlGetString(server_url+"/api/v1/en/zh/hello",  UserAgent);
		HostPrintUTF8("4444======================url:"+server_url+"text:"+text);// for debug print
		int start_pos = text.findFirst("translation", 0);
		if (start_pos > 0){
			return "200 ok";
		}
	}
	return "200 ok";
}

void ServerLogout()
{
	server_url = "";
}

array<string> GetSrcLangs()
{
	array<string> ret = LangTable;
	
	ret.insertAt(0, ""); // empty is auto
	return ret;
}

array<string> GetDstLangs()
{
	array<string> ret = LangTable;
	
	return ret;
}

string Translate(string Text, string &in SrcLang, string &in DstLang)
{
		

	if (SrcLang.length() <= 0) SrcLang = "auto";
	SrcLang.MakeLower();

	string enc = HostUrlEncode(Text);

	string url = server_url + "/api/v1/" + SrcLang + "/" + DstLang + "/" + enc;
	HostPrintUTF8("11111======================url:"+url);// for debug print
	
	string text = HostUrlGetString(url, UserAgent);
	HostPrintUTF8("22222======================text:"+text);// for debug print

	string ret = JsonParseV1(text);
	if (ret.length() > 0)
	{
		SrcLang = "UTF8";
		DstLang = "UTF8";
		return ret;
	}

	return ret;
}
