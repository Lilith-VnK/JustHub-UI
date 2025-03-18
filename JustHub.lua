local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local JustHub = {}

JustHub.Themes = {
	Darker = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(32, 32, 32)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
		}),
		["Color Hub 2"] = Color3.fromRGB(30, 30, 30),
		["Color Stroke"] = Color3.fromRGB(40, 40, 40),
		["Color Theme"] = Color3.fromRGB(88, 101, 242),
		["Color Text"] = Color3.fromRGB(243, 243, 243),
		["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
	},
	Dark = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(47, 47, 47)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
		}),
		["Color Hub 2"] = Color3.fromRGB(45, 45, 45),
		["Color Stroke"] = Color3.fromRGB(65, 65, 65),
		["Color Theme"] = Color3.fromRGB(65, 150, 255),
		["Color Text"] = Color3.fromRGB(245, 245, 245),
		["Color Dark Text"] = Color3.fromRGB(190, 190, 190)
	},
	Purple = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 25, 30)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(32, 32, 32)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 25, 30))
		}),
		["Color Hub 2"] = Color3.fromRGB(30, 30, 30),
		["Color Stroke"] = Color3.fromRGB(40, 40, 40),
		["Color Theme"] = Color3.fromRGB(150, 0, 255),
		["Color Text"] = Color3.fromRGB(240, 240, 240),
		["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
	},
	Light = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(245, 245, 245)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 230, 230))
		}),
		["Color Hub 2"] = Color3.fromRGB(240, 240, 240),
		["Color Stroke"] = Color3.fromRGB(200, 200, 200),
		["Color Theme"] = Color3.fromRGB(0, 120, 255),
		["Color Text"] = Color3.fromRGB(30, 30, 30),
		["Color Dark Text"] = Color3.fromRGB(80, 80, 80)
	},
	Neon = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 10)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 200, 200)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10))
		}),
		["Color Hub 2"] = Color3.fromRGB(15, 15, 15),
		["Color Stroke"] = Color3.fromRGB(0, 255, 255),
		["Color Theme"] = Color3.fromRGB(0, 255, 0),
		["Color Text"] = Color3.fromRGB(255, 255, 255),
		["Color Dark Text"] = Color3.fromRGB(200, 200, 200)
	},
	Forest = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 50, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 80, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 50, 0))
		}),
		["Color Hub 2"] = Color3.fromRGB(0, 60, 0),
		["Color Stroke"] = Color3.fromRGB(0, 80, 0),
		["Color Theme"] = Color3.fromRGB(0, 120, 0),
		["Color Text"] = Color3.fromRGB(220, 220, 220),
		["Color Dark Text"] = Color3.fromRGB(160, 160, 160)
	},
	Aqua = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 100)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 150, 150)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 100))
		}),
		["Color Hub 2"] = Color3.fromRGB(0, 110, 110),
		["Color Stroke"] = Color3.fromRGB(0, 180, 180),
		["Color Theme"] = Color3.fromRGB(0, 220, 220),
		["Color Text"] = Color3.fromRGB(255, 255, 255),
		["Color Dark Text"] = Color3.fromRGB(200, 200, 200)
	},
	Crimson = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 0, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 0, 0))
		}),
		["Color Hub 2"] = Color3.fromRGB(100, 0, 0),
		["Color Stroke"] = Color3.fromRGB(150, 0, 0),
		["Color Theme"] = Color3.fromRGB(220, 20, 60),
		["Color Text"] = Color3.fromRGB(255, 255, 255),
		["Color Dark Text"] = Color3.fromRGB(200, 200, 200)
	},
	Solar = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 223, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 165, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 223, 0))
		}),
		["Color Hub 2"] = Color3.fromRGB(255, 215, 0),
		["Color Stroke"] = Color3.fromRGB(255, 140, 0),
		["Color Theme"] = Color3.fromRGB(255, 69, 0),
		["Color Text"] = Color3.fromRGB(0, 0, 0),
		["Color Dark Text"] = Color3.fromRGB(80, 80, 80)
	},
	Pastel = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 210, 240)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(240, 230, 250)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 210, 240))
		}),
		["Color Hub 2"] = Color3.fromRGB(250, 240, 255),
		["Color Stroke"] = Color3.fromRGB(200, 180, 210),
		["Color Theme"] = Color3.fromRGB(180, 220, 240),
		["Color Text"] = Color3.fromRGB(80, 80, 80),
		["Color Dark Text"] = Color3.fromRGB(120, 120, 120)
	},
	Cyber = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 30)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 150, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 30))
		}),
		["Color Hub 2"] = Color3.fromRGB(20, 20, 50),
		["Color Stroke"] = Color3.fromRGB(0, 255, 255),
		["Color Theme"] = Color3.fromRGB(0, 150, 255),
		["Color Text"] = Color3.fromRGB(255, 255, 255),
		["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
	},
	Ocean = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 30, 60)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 70, 140)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 30, 60))
		}),
		["Color Hub 2"] = Color3.fromRGB(0, 50, 100),
		["Color Stroke"] = Color3.fromRGB(0, 80, 150),
		["Color Theme"] = Color3.fromRGB(0, 120, 200),
		["Color Text"] = Color3.fromRGB(230, 240, 255),
		["Color Dark Text"] = Color3.fromRGB(180, 190, 210)
	},
	Desert = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(210, 180, 140)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(244, 164, 96)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 180, 140))
		}),
		["Color Hub 2"] = Color3.fromRGB(222, 184, 135),
		["Color Stroke"] = Color3.fromRGB(160, 82, 45),
		["Color Theme"] = Color3.fromRGB(218, 165, 32),
		["Color Text"] = Color3.fromRGB(50, 50, 50),
		["Color Dark Text"] = Color3.fromRGB(80, 80, 80)
	},
	Galaxy = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 0, 30)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 0, 100)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 0, 30))
		}),
		["Color Hub 2"] = Color3.fromRGB(20, 0, 40),
		["Color Stroke"] = Color3.fromRGB(80, 0, 120),
		["Color Theme"] = Color3.fromRGB(120, 0, 200),
		["Color Text"] = Color3.fromRGB(240, 240, 255),
		["Color Dark Text"] = Color3.fromRGB(200, 200, 220)
	},
	Vintage = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 120, 90)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 140, 110)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 120, 90))
		}),
		["Color Hub 2"] = Color3.fromRGB(160, 130, 100),
		["Color Stroke"] = Color3.fromRGB(120, 90, 70),
		["Color Theme"] = Color3.fromRGB(200, 160, 130),
		["Color Text"] = Color3.fromRGB(80, 60, 40),
		["Color Dark Text"] = Color3.fromRGB(100, 80, 60)
	},
	Rainbow = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		}),
		["Color Hub 2"] = Color3.fromRGB(230, 230, 230),
		["Color Stroke"] = Color3.fromRGB(0, 0, 0),
		["Color Theme"] = Color3.fromRGB(255, 127, 80),
		["Color Text"] = Color3.fromRGB(0, 0, 0),
		["Color Dark Text"] = Color3.fromRGB(100, 100, 100)
	},
	Midnight = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 50)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 100)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 50))
		}),
		["Color Hub 2"] = Color3.fromRGB(10, 10, 30),
		["Color Stroke"] = Color3.fromRGB(0, 0, 80),
		["Color Theme"] = Color3.fromRGB(0, 0, 120),
		["Color Text"] = Color3.fromRGB(255, 255, 255),
		["Color Dark Text"] = Color3.fromRGB(180, 180, 180)
	}
}
JustHub.Info = {Version="2.0.1"}
JustHub.Save = {UISize={550,380},TabSize=100,Theme="Darker"}
JustHub.ConfigData = {}
JustHub.ControlRegistry = {}
JustHub.Localization = {}
JustHub.CurrentLang = "en"
JustHub.UserRole = "member"
JustHub.UndoStack = {}
JustHub.RedoStack = {}
JustHub.Sounds = {
	ButtonClick = 0,
	SliderMove = 0
}
JustHub.Icons = (function()
	local iconData = {
		{"accessibility", 10709751939},
		{"activity", 10709752035},
		{"airvent", 10709752131},
		{"airplay", 10709752254},
		{"alarmcheck", 10709752405},
		{"alarmclock", 10709752630},
		{"alarmclockoff", 10709752508},
		{"alarmminus", 10709752732},
		{"alarmplus", 10709752825},
		{"album", 10709752906},
		{"alertcircle", 10709752996},
		{"alertoctagon", 10709753064},
		{"alerttriangle", 10709753149},
		{"aligncenter", 10709753570},
		{"aligncenterhorizontal", 10709753272},
		{"aligncentervertical", 10709753421},
		{"alignendhorizontal", 10709753692},
		{"alignendvertical", 10709753808},
		{"alignhorizontaldistributecenter", 10747779791},
		{"alignhorizontaldistributeend", 10747784534},
		{"alignhorizontaldistributestart", 10709754118},
		{"alignhorizontaljustifycenter", 10709754204},
		{"alignhorizontaljustifyend", 10709754317},
		{"alignhorizontaljustifystart", 10709754436},
		{"alignhorizontalspacearound", 10709754590},
		{"alignhorizontalspacebetween", 10709754749},
		{"alignjustify", 10709759610},
		{"alignleft", 10709759764},
		{"alignright", 10709759895},
		{"alignstarthorizontal", 10709760051},
		{"alignstartvertical", 10709760244},
		{"alignverticaldistributecenter", 10709760351},
		{"alignverticaldistributeend", 10709760434},
		{"alignverticaldistributestart", 10709760612},
		{"alignverticaljustifycenter", 10709760814},
		{"alignverticaljustifyend", 10709761003},
		{"alignverticaljustifystart", 10709761176},
		{"alignverticalspacearound", 10709761324},
		{"alignverticalspacebetween", 10709761434},
		{"anchor", 10709761530},
		{"angry", 10709761629},
		{"annoyed", 10709761722},
		{"aperture", 10709761813},
		{"apple", 10709761889},
		{"archive", 10709762233},
		{"archiverestore", 10709762058},
		{"armchair", 10709762327},
		{"arrowbigdown", 10747796644},
		{"arrowbigleft", 10709762574},
		{"arrowbigright", 10709762727},
		{"arrowbigup", 10709762879},
		{"arrowdown", 10709767827},
		{"arrowdowncircle", 10709763034},
		{"arrowdownleft", 10709767656},
		{"arrowdownright", 10709767750},
		{"arrowleft", 10709768114},
		{"arrowleftcircle", 10709767936},
		{"arrowleftright", 10709768019},
		{"arrowright", 10709768347},
		{"arrowrightcircle", 10709768226},
		{"arrowup", 10709768939},
		{"arrowupcircle", 10709768432},
		{"arrowupdown", 10709768538},
		{"arrowupleft", 10709768661},
		{"arrowupright", 10709768787},
		{"asterisk", 10709769095},
		{"atsign", 10709769286},
		{"award", 10709769406},
		{"axe", 10709769508},
		{"axis3d", 10709769598},
		{"baby", 10709769732},
		{"backpack", 10709769841},
		{"baggageclaim", 10709769935},
		{"banana", 10709770005},
		{"banknote", 10709770178},
		{"barchart", 10709773755},
		{"barchart2", 10709770317},
		{"barchart3", 10709770431},
		{"barchart4", 10709770560},
		{"barcharthorizontal", 10709773669},
		{"barcode", 10747360675},
		{"baseline", 10709773863},
		{"bath", 10709773963},
		{"battery", 10709774640},
		{"batterycharging", 10709774068},
		{"batteryfull", 10709774206},
		{"batterylow", 10709774370},
		{"batterymedium", 10709774513},
		{"beaker", 10709774756},
		{"bed", 10709775036},
		{"beddouble", 10709774864},
		{"bedsingle", 10709774968},
		{"beer", 10709775167},
		{"bell", 10709775704},
		{"bellminus", 10709775241},
		{"belloff", 10709775320},
		{"bellplus", 10709775448},
		{"bellring", 10709775560},
		{"bike", 10709775894},
		{"binary", 10709776050},
		{"bitcoin", 10709776126},
		{"bluetooth", 10709776655},
		{"bluetoothconnected", 10709776240},
		{"bluetoothoff", 10709776344},
		{"bluetoothsearching", 10709776501},
		{"bold", 10747813908},
		{"bomb", 10709781460},
		{"bone", 10709781605},
		{"book", 10709781824},
		{"bookopen", 10709781717},
		{"bookmark", 10709782154},
		{"bookmarkminus", 10709781919},
		{"bookmarkplus", 10709782044},
		{"bot", 10709782230},
		{"box", 10709782497},
		{"boxselect", 10709782342},
		{"boxes", 10709782582},
		{"briefcase", 10709782662},
		{"brush", 10709782758},
		{"bug", 10709782845},
		{"building", 10709783051},
		{"building2", 10709782939},
		{"bus", 10709783137},
		{"cake", 10709783217},
		{"calculator", 10709783311},
		{"calendar", 10709789505},
		{"calendarcheck", 10709783474},
		{"calendarcheck2", 10709783392},
		{"calendarclock", 10709783577},
		{"calendardays", 10709783673},
		{"calendarheart", 10709783835},
		{"calendarminus", 10709783959},
		{"calendaroff", 10709788784},
		{"calendarplus", 10709788937},
		{"calendarrange", 10709789053},
		{"calendarsearch", 10709789200},
		{"calendarx", 10709789407},
		{"calendarx2", 10709789329},
		{"camera", 10709789686},
		{"cameraoff", 10747822677},
		{"car", 10709789810},
		{"carrot", 10709789960},
		{"cast", 10709790097},
		{"charge", 10709790202},
		{"check", 10709790644},
		{"checkcircle", 10709790387},
		{"checkcircle2", 10709790298},
		{"checksquare", 10709790537},
		{"chefhat", 10709790757},
		{"cherry", 10709790875},
		{"chevrondown", 10709790948},
		{"chevronfirst", 10709791015},
		{"chevronlast", 10709791130},
		{"chevronleft", 10709791281},
		{"chevronright", 10709791437},
		{"chevronup", 10709791523},
		{"chevronsdown", 10709796864},
		{"chevronsdownup", 10709791632},
		{"chevronsleft", 10709797151},
		{"chevronsleftright", 10709797006},
		{"chevronsright", 10709797382},
		{"chevronsrightleft", 10709797274},
		{"chevronsup", 10709797622},
		{"chevronsupdown", 10709797508},
		{"chrome", 10709797725},
		{"circle", 10709798174},
		{"circledot", 10709797837},
		{"circleellipsis", 10709797985},
		{"circleslashed", 10709798100},
		{"citrus", 10709798276},
		{"clapperboard", 10709798350},
		{"clipboard", 10709799288},
		{"clipboardcheck", 10709798443},
		{"clipboardcopy", 10709798574},
		{"clipboardedit", 10709798682},
		{"clipboardlist", 10709798792},
		{"clipboardsignature", 10709798890},
		{"clipboardtype", 10709798999},
		{"clipboardx", 10709799124},
		{"clock", 10709805144},
		{"clock1", 10709799535},
		{"clock10", 10709799718},
		{"clock11", 10709799818},
		{"clock12", 10709799962},
		{"clock2", 10709803876},
		{"clock3", 10709803989},
		{"clock4", 10709804164},
		{"clock5", 10709804291},
		{"clock6", 10709804435},
		{"clock7", 10709804599},
		{"clock8", 10709804784},
		{"clock9", 10709804996},
		{"cloud", 10709806740},
		{"cloudcog", 10709805262},
		{"clouddrizzle", 10709805371},
		{"cloudfog", 10709805477},
		{"cloudhail", 10709805596},
		{"cloudlightning", 10709805727},
		{"cloudmoon", 10709805942},
		{"cloudmoonrain", 10709805838},
		{"cloudoff", 10709806060},
		{"cloudrain", 10709806277},
		{"cloudrainwind", 10709806166},
		{"cloudsnow", 10709806374},
		{"cloudsun", 10709806631},
		{"cloudsunrain", 10709806475},
		{"cloudy", 10709806859},
		{"clover", 10709806995},
		{"code", 10709810463},
		{"code2", 10709807111},
		{"codepen", 10709810534},
		{"codesandbox", 10709810676},
		{"coffee", 10709810814},
		{"cog", 10709810948},
		{"coins", 10709811110},
		{"columns", 10709811261},
		{"command", 10709811365},
		{"compass", 10709811445},
		{"component", 10709811595},
		{"conciergebell", 10709811706},
		{"connection", 10747361219},
		{"contact", 10709811834},
		{"contrast", 10709811939},
		{"cookie", 10709812067},
		{"copy", 10709812159},
		{"copyleft", 10709812251},
		{"copyright", 10709812311},
		{"cornerdownleft", 10709812396},
		{"cornerdownright", 10709812485},
		{"cornerleftdown", 10709812632},
		{"cornerleftup", 10709812784},
		{"cornerrightdown", 10709812939},
		{"cornerrightup", 10709813094},
		{"cornerupleft", 10709813185},
		{"cornerupright", 10709813281},
		{"cpu", 10709813383},
		{"croissant", 10709818125},
		{"crop", 10709818245},
		{"cross", 10709818399},
		{"diamond", 10709819149},
		{"dice1", 10709819266},
		{"dice2", 10709819361},
		{"dice3", 10709819508},
		{"dice4", 10709819670},
		{"dice5", 10709819801},
		{"dice6", 10709819896},
		{"dices", 10723343321},
		{"diff", 10723343416},
		{"disc", 10723343537},
		{"divide", 10723343805},
		{"dividecircle", 10723343636},
		{"dividesquare", 10723343737},
		{"dollarsign", 10723343958},
		{"download", 10723344270},
		{"downloadcloud", 10723344088},
		{"droplet", 10723344432},
		{"droplets", 10734883356},
		{"drumstick", 10723344737},
		{"edit", 10734883598},
		{"edit2", 10723344885},
		{"edit3", 10723345088},
		{"egg", 10723345518},
		{"eggfried", 10723345347},
		{"electricity", 10723345749},
		{"electricityoff", 10723345643},
		{"equal", 10723345990},
		{"equalnot", 10723345866},
		{"eraser", 10723346158},
		{"euro", 10723346372},
		{"expand", 10723346553},
		{"externallink", 10723346684},
		{"eye", 10723346959},
		{"eyeoff", 10723346871},
		{"factory", 10723347051},
		{"fan", 10723354359},
		{"fastforward", 10723354521},
		{"feather", 10723354671},
		{"figma", 10723354801},
		{"file", 10723374641},
		{"filearchive", 10723354921},
		{"fileaudio", 10723355148},
		{"fileaudio2", 10723355026},
		{"fileaxis3d", 10723355272},
		{"filebadge", 10723355622},
		{"filebadge2", 10723355451},
		{"filebarchart", 10723355887},
		{"filebarchart2", 10723355746},
		{"filebox", 10723355989},
		{"filecheck", 10723356210},
		{"filecheck2", 10723356100},
		{"fileclock", 10723356329},
		{"filecode", 10723356507},
		{"filecog", 10723356830},
		{"filecog2", 10723356676},
		{"filediff", 10723357039},
		{"filedigit", 10723357151},
		{"filedown", 10723357322},
		{"fileedit", 10723357495},
		{"fileheart", 10723357637},
		{"fileimage", 10723357790},
		{"fileinput", 10723357933},
		{"filejson", 10723364435},
		{"filejson2", 10723364361},
		{"filekey", 10723364605},
		{"filekey2", 10723364515},
		{"filelinechart", 10723364725},
		{"filelock", 10723364957},
		{"filelock2", 10723364861},
		{"fileminus", 10723365254},
		{"fileminus2", 10723365086},
		{"fileoutput", 10723365457},
		{"filepiechart", 10723365598},
		{"fileplus", 10723365877},
		{"fileplus2", 10723365766},
		{"filequestion", 10723365987},
		{"filescan", 10723366167},
		{"filesearch", 10723366550},
		{"filesearch2", 10723366340},
		{"filesignature", 10723366741},
		{"filespreadsheet", 10723366962},
		{"filesymlink", 10723367098},
		{"fileterminal", 10723367244},
		{"filetext", 10723367380},
		{"filetype", 10723367606},
		{"filetype2", 10723367509},
		{"fileup", 10723367734},
		{"filevideo", 10723373884},
		{"filevideo2", 10723367834},
		{"filevolume", 10723374172},
		{"filevolume2", 10723374030},
		{"filewarning", 10723374276},
		{"filex", 10723374544},
		{"filex2", 10723374378},
		{"files", 10723374759},
		{"film", 10723374981},
		{"filter", 10723375128},
		{"fingerprint", 10723375250},
		{"flag", 10723375890},
		{"flagoff", 10723375443},
		{"flagtriangleleft", 10723375608},
		{"flagtriangleright", 10723375727},
		{"flame", 10723376114},
		{"flashlight", 10723376471},
		{"flashlightoff", 10723376365},
		{"flaskconical", 10734883986},
		{"flaskround", 10723376614},
		{"fliphorizontal", 10723376884},
		{"fliphorizontal2", 10723376745},
		{"flipvertical", 10723377138},
		{"flipvertical2", 10723377026},
		{"flower", 10747830374},
		{"flower2", 10723377305},
		{"focus", 10723377537},
		{"folder", 10723387563},
		{"folderarchive", 10723384478},
		{"foldercheck", 10723384605},
		{"folderclock", 10723384731},
		{"folderclosed", 10723384893},
		{"foldercog", 10723385213},
		{"foldercog2", 10723385036},
		{"folderdown", 10723385338},
		{"folderedit", 10723385445},
		{"folderheart", 10723385545},
		{"folderinput", 10723385721},
		{"folderkey", 10723385848},
		{"folderlock", 10723386005},
		{"folderminus", 10723386127},
		{"folderopen", 10723386277},
		{"folderoutput", 10723386386},
		{"folderplus", 10723386531},
		{"foldersearch", 10723386787},
		{"foldersearch2", 10723386674},
		{"foldersymlink", 10723386930},
		{"foldertree", 10723387085},
		{"folderup", 10723387265},
		{"folderx", 10723387448},
		{"folders", 10723387721},
		{"forminput", 10723387841},
		{"forward", 10723388016},
		{"frame", 10723394389},
		{"framer", 10723394565},
		{"frown", 10723394681},
		{"fuel", 10723394846},
		{"functionsquare", 10723395041},
		{"gamepad", 10723395457},
		{"gamepad2", 10723395215},
		{"gauge", 10723395708},
		{"gavel", 10723395896},
		{"gem", 10723396000},
		{"ghost", 10723396107},
		{"gift", 10723396402},
		{"giftcard", 10723396225},
		{"gitbranch", 10723396676},
		{"gitbranchplus", 10723396542},
		{"gitcommit", 10723396812},
		{"gitcompare", 10723396954},
		{"gitfork", 10723397049},
		{"gitmerge", 10723397165},
		{"gitpullrequest", 10723397431},
		{"gitpullrequestclosed", 10723397268},
		{"gitpullrequestdraft", 10734884302},
		{"glass", 10723397788},
		{"glass2", 10723397529},
		{"glasswater", 10723397678},
		{"glasses", 10723397895},
		{"globe", 10723404337},
		{"globe2", 10723398002},
		{"grab", 10723404472},
		{"graduationcap", 10723404691},
		{"grape", 10723404822},
		{"grid", 10723404936},
		{"griphorizontal", 10723405089},
		{"gripvertical", 10723405236},
		{"hammer", 10723405360},
		{"hand", 10723405649}
	}
	local icons = {}
	for _, pair in ipairs(iconData) do
		icons[pair[1]] = "rbxassetid://" .. tostring(pair[2])
	end
	return icons
end)()

local function createInstance(c,p,par)
	local i=Instance.new(c)
	if p then
		for k,v in pairs(p) do
			i[k]=v
		end
	end
	if par then
		i.Parent=par
	end
	return i
end

local function tweenProperty(o,t,d)
	local ti=TweenInfo.new(d,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	local tw=TweenService:Create(o,ti,t)
	tw:Play()
	return tw
end

local function getCurrentTheme(c)
	if type(c)=="table" then
		return c
	else
		return JustHub.Themes[c or JustHub.Save.Theme]
	end
end

local function clampPosition(pos,sz)
	local x=math.clamp(pos.X.Offset,0,sz.X)
	local y=math.clamp(pos.Y.Offset,0,sz.Y)
	return UDim2.new(pos.X.Scale,x,pos.Y.Scale,y)
end

local function addBorder(o,col,th)
	return createInstance("UIStroke",{Color=col,Thickness=th},o)
end

function JustHub:RegisterControl(k,u)
	JustHub.ControlRegistry[k]=u
end

function JustHub:ApplyConfig(cf)
	for k,v in pairs(cf) do
		if JustHub.ControlRegistry[k] then
			JustHub.ControlRegistry[k](v)
		end
	end
end

function JustHub:SetUserRole(roleName)
	self.UserRole = roleName
end

function JustHub:CheckRole(requiredRole)
	return self.UserRole==requiredRole
end

function JustHub:AddUndo(controlKey,oldValue,newValue)
	table.insert(self.UndoStack,{key=controlKey,old=oldValue,new=newValue})
end

function JustHub:Undo()
	local last=self.UndoStack[#self.UndoStack]
	if not last then return end
	self.UndoStack[#self.UndoStack]=nil
	if self.ControlRegistry[last.key] then
		self.ControlRegistry[last.key](last.old)
		table.insert(self.RedoStack,last)
	end
end

function JustHub:Redo()
	local last=self.RedoStack[#self.RedoStack]
	if not last then return end
	self.RedoStack[#self.RedoStack]=nil
	if self.ControlRegistry[last.key] then
		self.ControlRegistry[last.key](last.new)
		table.insert(self.UndoStack,last)
	end
end

function JustHub:RegisterTheme(name,definition)
	self.Themes[name] = definition
end

function JustHub:PlaySound(name)
	if self.Sounds[name] and self.Sounds[name]~=0 then
		local s=Instance.new("Sound")
		s.SoundId="rbxassetid://"..tostring(self.Sounds[name])
		s.Volume=1
		s.PlayOnRemove=true
		s.Parent=workspace
		s:Destroy()
	end
end

function JustHub:SetLanguage(lang)
	self.CurrentLang=lang
end

function JustHub:LocalizeText(textKey)
	if self.Localization[self.CurrentLang] and self.Localization[self.CurrentLang][textKey] then
		return self.Localization[self.CurrentLang][textKey]
	end
	return textKey
end

local SectionMethods={}

function SectionMethods:addMenu(n)
	n = n or "Menu"
	local f = createInstance("Frame", {
		Name = n,
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],
		BackgroundTransparency = 0.3
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 6)}, f)
	createInstance("UIGradient", {
		Color = getCurrentTheme(JustHub.Save.Theme)["Color Hub 1"]
	}, f)
	local shadow = createInstance("TextLabel", {
		Name = "MenuLabelShadow",
		Text = n,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextColor3 = Color3.new(0, 0, 0),
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2)
	}, f)
	local label = createInstance("TextLabel", {
		Name = "MenuLabel",
		Text = n,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left
	}, f)
	return f
end

function SectionMethods:addToggle(o)
	o=o or {}
	local t=o.Name or "Toggle"
	local d=o.Default or false
	local cb=o.Callback or function(x)end
	local role=o.Role or nil
	if role and not JustHub:CheckRole(role) then
		local hidden=createInstance("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1},self.Content)
		return hidden
	end
	local f=createInstance("Frame",{Name=t.."Toggle",Size=UDim2.new(1,0,0,20),BackgroundColor3=Color3.fromRGB(40,40,40)},self.Content)
	createInstance("UICorner",{CornerRadius=UDim.new(0,20)},f)
	addBorder(f,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],1)
	local l=createInstance("TextLabel",{Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,Text=t,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left},f)
	local sep=createInstance("Frame",{Size=UDim2.new(0,2,1,0),Position=UDim2.new(0.7,0,0,0),BackgroundColor3=Color3.fromRGB(255,255,255)},f)
	createInstance("UICorner",{CornerRadius=UDim.new(0,1)},sep)
	local tc=createInstance("Frame",{Size=UDim2.new(0.3,0,1,0),Position=UDim2.new(0.7,0,0,0),BackgroundTransparency=1},f)
	local sw=createInstance("Frame",{Size=UDim2.new(0,35,0,15),Position=UDim2.new(1,-35,0.5,-7.5),BackgroundColor3=d and Color3.fromRGB(0,200,0) or Color3.fromRGB(100,100,100),BorderSizePixel=0},tc)
	sw.Active=true
	sw.Selectable=true
	createInstance("UICorner",{CornerRadius=UDim.new(0,15)},sw)
	local c=createInstance("Frame",{Size=UDim2.new(0,13,0,13),Position=d and UDim2.new(0,20,0.5,-6.5) or UDim2.new(0,2,0.5,-6.5),BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0},sw)
	createInstance("UICorner",{CornerRadius=UDim.new(1,0)},c)
	local s=d
	if d then cb(true) else cb(false) end
	JustHub.ConfigData[t]=s
	JustHub:RegisterControl(t,function(v)
		local old=s
		s=v
		if s then
			c.Position=UDim2.new(0,20,0.5,-6.5)
			sw.BackgroundColor3=Color3.fromRGB(0,200,0)
			l.TextColor3=Color3.fromRGB(0,255,0)
		else
			c.Position=UDim2.new(0,2,0.5,-6.5)
			sw.BackgroundColor3=Color3.fromRGB(100,100,100)
			l.TextColor3=Color3.fromRGB(255,255,255)
		end
		JustHub:AddUndo(t,old,s)
	end)
	sw.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			JustHub:PlaySound("ButtonClick")
			local old=s
			if not s then
				tweenProperty(c,{Position=UDim2.new(0,20,0.5,-6.5)},0.3)
				tweenProperty(sw,{BackgroundColor3=Color3.fromRGB(0,200,0)},0.3)
				tweenProperty(l,{TextColor3=Color3.fromRGB(0,255,0)},0.3)
			else
				tweenProperty(c,{Position=UDim2.new(0,2,0.5,-6.5)},0.3)
				tweenProperty(sw,{BackgroundColor3=Color3.fromRGB(100,100,100)},0.3)
				tweenProperty(l,{TextColor3=Color3.fromRGB(255,255,255)},0.3)
			end
			s=not s
			JustHub.ConfigData[t]=s
			cb(s)
			JustHub:AddUndo(t,old,s)
		end
	end)
	return f
end

function SectionMethods:addSlider(o)
	o = o or {}
	local n = o.Name or "Slider"
	local mi = o.Min or 16
	local ma = o.Max or 100
	local df = o.Default or mi
	if JustHub.ConfigData[n] ~= nil then
		df = JustHub.ConfigData[n]
	else
		JustHub.ConfigData[n] = df
	end
	local cb = o.Callback or function(x) end
	local TweenService = game:GetService("TweenService")
	local f = createInstance("Frame", {Name = n.."Slider", Size = UDim2.new(1,0,0,25), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40,40,40)}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0,20)}, f)
	addBorder(f, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
	local l = createInstance("TextLabel", {
		Name = "Label",
		Text = n,
		Size = UDim2.new(0.4,0,1,0),
		Position = UDim2.new(0,5,0,0),
		BackgroundTransparency = 1,
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left
	}, f)
	local sc = createInstance("Frame", {
		Name = "SliderContainer",
		Size = UDim2.new(0.45,0,1,0),
		Position = UDim2.new(0.4,5,0,0),
		BackgroundTransparency = 1
	}, f)
	local sb = createInstance("Frame", {
		Name = "SliderBar",
		Size = UDim2.new(1,-20,0,4),
		Position = UDim2.new(0,10,0.5,-2),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Stroke"]
	}, sc)
	createInstance("UICorner", {CornerRadius = UDim.new(0,4)}, sb)
	local defaultRatio = (df - mi) / (ma - mi)
	local progressFill = createInstance("Frame", {
		Name = "ProgressFill",
		Size = UDim2.new(defaultRatio,0,1,0),
		Position = UDim2.new(0,0,0,0),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Theme"],
		BorderSizePixel = 0
	}, sb)
	local sh = createInstance("Frame", {
		Name = "SliderHandle",
		Size = UDim2.new(0,12,0,12),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Theme"],
		Position = UDim2.new(defaultRatio, -6, 0.5, -6)
	}, sb)
	createInstance("UICorner", {CornerRadius = UDim.new(0,4)}, sh)
	local vl = createInstance("TextBox", {
		Name = "ValueBox",
		Text = tostring(math.floor(df)),
		Size = UDim2.new(0.15,0,1,0),
		Position = UDim2.new(0.85,-5,0,0),
		BackgroundTransparency = 0,
		BackgroundColor3 = Color3.fromRGB(50,50,50),
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Center,
		ClearTextOnFocus = false
	}, f)
	local drag = false
	sh.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			drag = true
		end
	end)
	sh.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			drag = false
			local currentValue = JustHub.ConfigData[n]
			local finalRatio = math.clamp((currentValue - mi) / (ma - mi), 0, 1)
			local tween = TweenService:Create(sh, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(finalRatio, -6, 0.5, -6)})
			tween:Play()
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local bp = sb.AbsolutePosition.X
			local bw = sb.AbsoluteSize.X
			local rp = math.clamp((i.Position.X - bp) / bw, 0, 1)
			sh.Position = UDim2.new(rp, -6, 0.5, -6)
			progressFill.Size = UDim2.new(rp, 0, 1, 0)
			local val = mi + rp * (ma - mi)
			vl.Text = tostring(math.floor(val))
			JustHub.ConfigData[n] = val
			cb(val)
		end
	end)
	JustHub:RegisterControl(n, function(sv)
		local nr = math.clamp((sv - mi) / (ma - mi), 0, 1)
		local tween = TweenService:Create(sh, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(nr, -6, 0.5, -6)})
		tween:Play()
		vl.Text = tostring(math.floor(sv))
		local tween2 = TweenService:Create(progressFill, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(nr, 0, 1, 0)})
		tween2:Play()
	end)
	vl.Focused:Connect(function() end)
	vl.FocusLost:Connect(function(enterPressed)
		local newVal = tonumber(vl.Text)
		if newVal then
			newVal = math.clamp(newVal, mi, ma)
			local newRatio = (newVal - mi) / (ma - mi)
			local tween = TweenService:Create(sh, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(newRatio, -6, 0.5, -6)})
			tween:Play()
			local tween2 = TweenService:Create(progressFill, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(newRatio, 0, 1, 0)})
			tween2:Play()
			vl.Text = tostring(math.floor(newVal))
			JustHub.ConfigData[n] = newVal
			cb(newVal)
		else
			vl.Text = tostring(math.floor(JustHub.ConfigData[n]))
		end
	end)
	return f
end

function SectionMethods:addTextBox(o)
	o = o or {}
	local n = o.Name or "TextBox"
	local d = o.Default or ""
	local cb = o.Callback or function(x) end
	local f = createInstance("Frame", {Name = n.."TextBox", Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1}, self.Content)
	addBorder(f, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
	local l = createInstance("TextLabel", {Name = "Label", Text = n, Size = UDim2.new(0.7, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1, TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"], Font = Enum.Font.Gotham, TextSize = 10}, f)
	local tb = createInstance("TextBox", {Name = "Input", Text = d, Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0.7, 0, 0, 0), BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"], Font = Enum.Font.Gotham, TextSize = 10, TextWrapped = true}, f)
	tb.FocusLost:Connect(function(e)
		JustHub.ConfigData[n] = tb.Text
		cb(tb.Text)
	end)
	JustHub:RegisterControl(n, function(sv)
		tb.Text = sv
	end)
	return f
end

function SectionMethods:addDropdown(o)
	o = o or {}
	local t = o.Name or "Dropdown"
	local df = o.Default or ""
	local it = o.Items or {}
	local presets = o.Presets or {}
	local cb = o.Callback or function(x) end
	local ch = 20
	local searchH = 25
	local itemsCount = #it
	local itemListHeight = (itemsCount > 0 and (itemsCount * 20 + ((itemsCount - 1) * 2)) or 0)
	local iconsH = 25
	local oh = ch + searchH + itemListHeight + iconsH
	local f = createInstance("Frame", {Name = t.."Dropdown", BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40,40,40)}, self.Content)
	f.Size = UDim2.new(1, 0, 0, ch)
	createInstance("UICorner", {CornerRadius = UDim.new(0,20)}, f)
	addBorder(f, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
	local l = createInstance("TextLabel", {Name = "Label", Text = t, Size = UDim2.new(0.7, 0, 0, ch), Position = UDim2.new(0, 5, 0, 0), BackgroundTransparency = 1, TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"], Font = Enum.Font.GothamBold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left}, f)
	local b = createInstance("TextButton", {Name = "DropdownButton", Text = (df ~= "" and (df .. " ▼") or "Select ▼"), Size = UDim2.new(0.3, 0, 0, ch), Position = UDim2.new(0.7, -5, 0, 0), BackgroundTransparency = 0, BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"]}, f)
	createInstance("UICorner", {CornerRadius = UDim.new(0,20)}, b)
	local lf = createInstance("Frame", {Name = "DropdownList", BackgroundTransparency = 0, BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Hub 2"], Visible = false, Position = UDim2.new(0, 0, 0, ch)}, f)
	lf.Size = UDim2.new(1, 0, 0, oh - ch)
	createInstance("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5)}, lf)
	local dt = false
	b.MouseButton1Click:Connect(function()
		if dt then
			tweenProperty(f, {Size = UDim2.new(1, 0, 0, ch)}, 0.2)
			tweenProperty(b, {TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"]}, 0.2)
			tweenProperty(lf, {Position = UDim2.new(0, 0, 0, ch - 10)}, 0.2)
			wait(0.2)
			lf.Visible = false
		else
			lf.Position = UDim2.new(0, 0, 0, ch - 10)
			lf.Visible = true
			tweenProperty(f, {Size = UDim2.new(1, 0, 0, oh)}, 0.2)
			tweenProperty(b, {TextColor3 = Color3.fromRGB(0, 255, 0)}, 0.2)
			tweenProperty(lf, {Position = UDim2.new(0, 0, 0, ch)}, 0.2)
		end
		dt = not dt
	end)
	local searchBox = createInstance("TextBox", {Name = "SearchBox", Text = "", PlaceholderText = "Search...", Size = UDim2.new(1, -10, 0, searchH), Position = UDim2.new(0, 5, 0, 5), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(30,30,30), TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"], Font = Enum.Font.GothamBold, TextSize = 12, ClearTextOnFocus = false}, lf)
	createInstance("UICorner", {CornerRadius = UDim.new(0,5)}, searchBox)
	local itemsContainer = createInstance("Frame", {Name = "ItemsContainer", Size = UDim2.new(1, 0, 0, itemListHeight), Position = UDim2.new(0, 0, 0, searchH + 10), BackgroundTransparency = 1}, lf)
	createInstance("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Left}, itemsContainer)
	local function populateItems()
		for _, child in ipairs(itemsContainer:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end
		for _, op in ipairs(it) do
			local btn = createInstance("TextButton", {Size = UDim2.new(1, 0, 0, 20), Text = op, TextColor3 = Color3.fromRGB(255,255,255), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40,40,40), Font = Enum.Font.GothamBold, TextSize = 12}, itemsContainer)
			createInstance("UICorner", {CornerRadius = UDim.new(0,5)}, btn)
			addBorder(btn, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
			btn.MouseButton1Click:Connect(function()
				l.Text = t.." - "..op
				JustHub.ConfigData[t] = op
				pcall(cb, op)
				tweenProperty(f, {Size = UDim2.new(1, 0, 0, ch)}, 0.2)
				dt = false
				wait(0.2)
				lf.Visible = false
			end)
		end
	end
	populateItems()
	searchBox:GetPropertyChangedSignal("Text"):Connect(function()
		local filter = string.lower(searchBox.Text)
		for _, btn in ipairs(itemsContainer:GetChildren()) do
			if btn:IsA("TextButton") then
				local txt = string.lower(btn.Text)
				btn.Visible = txt:find(filter) and true or false
			end
		end
	end)
	local iconsContainer = createInstance("Frame", {Name = "IconsContainer", Size = UDim2.new(1, 0, 0, iconsH), Position = UDim2.new(0, 0, 0, searchH + 10 + itemListHeight), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(30,30,30)}, lf)
	local leftIcons = createInstance("Frame", {Name = "LeftIcons", Size = UDim2.new(1, -30, 1, 0), Position = UDim2.new(0, 5, 0, 0), BackgroundTransparency = 1}, iconsContainer)
	createInstance("UIListLayout", {Padding = UDim.new(0, 5), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Left}, leftIcons)
	local rightIcons = createInstance("Frame", {Name = "RightIcons", Size = UDim2.new(0, 25, 1, 0), Position = UDim2.new(1, -30, 0, 0), BackgroundTransparency = 1}, iconsContainer)
	if #presets > 0 then
		for _, preset in ipairs(presets) do
			local pbtn = createInstance("TextButton", {Size = UDim2.new(0,25,1,0), Text = "★", TextColor3 = Color3.fromRGB(255,255,255), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40,40,40), Font = Enum.Font.GothamBold, TextSize = 12}, leftIcons)
			createInstance("UICorner", {CornerRadius = UDim.new(0,5)}, pbtn)
			addBorder(pbtn, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
			pbtn.MouseButton1Click:Connect(function()
				l.Text = t.." - "..preset
				JustHub.ConfigData[t] = preset
				pcall(cb, preset)
				tweenProperty(f, {Size = UDim2.new(1, 0, 0, ch)}, 0.2)
				dt = false
				wait(0.2)
				lf.Visible = false
			end)
		end
	end
	local resetButton = createInstance("TextButton", {Name = "ResetButton", Text = "↺", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40,40,40), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"]}, rightIcons)
	createInstance("UICorner", {CornerRadius = UDim.new(0,5)}, resetButton)
	resetButton.MouseButton1Click:Connect(function()
		l.Text = t.." - "..df
		JustHub.ConfigData[t] = df
		pcall(cb, df)
		tweenProperty(f, {Size = UDim2.new(1, 0, 0, ch)}, 0.2)
		dt = false
		wait(0.2)
		lf.Visible = false
	end)
	JustHub.ConfigData[t] = df
	JustHub:RegisterControl(t, function(sv)
		l.Text = t.." - "..sv
	end)
	local upd = {}
	function upd:Clear()
		for i, v in pairs(lf:GetChildren()) do
			if v:IsA("TextButton") and v.Name ~= "ResetButton" then
				v:Destroy()
				dt = false
				l.Text = t
				tweenProperty(f, {Size = UDim2.new(1, 0, 0, ch)}, 0.2)
			end
		end
	end
	function upd:Refresh(nl)
		nl = nl or {}
		for i, v in pairs(nl) do
			local btn = createInstance("TextButton", {Size = UDim2.new(1, 0, 0, 25), Text = v, TextColor3 = Color3.fromRGB(255,255,255), BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40,40,40), Font = Enum.Font.GothamBold, TextSize = 12}, lf)
			createInstance("UICorner", {CornerRadius = UDim.new(0,5)}, btn)
			addBorder(btn, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
			btn.MouseButton1Click:Connect(function()
				dt = false
				l.Text = t.." - "..v
				pcall(cb, v)
				tweenProperty(f, {Size = UDim2.new(1, 0, 0, ch)}, 0.2)
			end)
		end
	end
	return upd
end

function SectionMethods:addColorPicker(o)
	o=o or {}
	local n=o.Name or "ColorPicker"
	local d=o.Default or Color3.fromRGB(255,255,255)
	local cb=o.Callback or function(x)end
	local role=o.Role or nil
	if role and not JustHub:CheckRole(role) then
		local hidden=createInstance("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1},self.Content)
		return hidden
	end
	local f=createInstance("Frame",{Name=n.."ColorPicker",Size=UDim2.new(1,0,0,50),BackgroundTransparency=1},self.Content)
	addBorder(f,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],1)
	local l=createInstance("TextLabel",{Name="Label",Text=n,Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left},f)
	local preview=createInstance("Frame",{Name="Preview",Size=UDim2.new(0,50,0,20),Position=UDim2.new(1,-60,0,0),BackgroundColor3=d,BorderSizePixel=0},f)
	local r=createInstance("TextBox",{Name="R",Text=tostring(math.floor(d.R*255)),Size=UDim2.new(0,30,0,20),Position=UDim2.new(0,5,0,25),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10},f)
	local g=createInstance("TextBox",{Name="G",Text=tostring(math.floor(d.G*255)),Size=UDim2.new(0,30,0,20),Position=UDim2.new(0,40,0,25),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10},f)
	local b=createInstance("TextBox",{Name="B",Text=tostring(math.floor(d.B*255)),Size=UDim2.new(0,30,0,20),Position=UDim2.new(0,75,0,25),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10},f)
	local function updateColor()
		local rr=tonumber(r.Text) or 255
		local gg=tonumber(g.Text) or 255
		local bb=tonumber(b.Text) or 255
		rr=math.clamp(rr,0,255)
		gg=math.clamp(gg,0,255)
		bb=math.clamp(bb,0,255)
		local c3=Color3.fromRGB(rr,gg,bb)
		preview.BackgroundColor3=c3
		JustHub.ConfigData[n]=c3
		cb(c3)
	end
	r.FocusLost:Connect(function() updateColor() end)
	g.FocusLost:Connect(function() updateColor() end)
	b.FocusLost:Connect(function() updateColor() end)
	JustHub:RegisterControl(n,function(sv)
		if typeof(sv)=="Color3" then
			r.Text=tostring(math.floor(sv.R*255))
			g.Text=tostring(math.floor(sv.G*255))
			b.Text=tostring(math.floor(sv.B*255))
			preview.BackgroundColor3=sv
		end
	end)
	return f
end

function SectionMethods:addScriptBox(o)
	o=o or {}
	local n=o.Name or "ScriptBox"
	local d=o.Default or ""
	local cb=o.Callback or function(scr)end
	local role=o.Role or nil
	if role and not JustHub:CheckRole(role) then
		local hidden=createInstance("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1},self.Content)
		return hidden
	end
	local f=createInstance("Frame",{Name=n.."ScriptBox",Size=UDim2.new(1,0,0,70),BackgroundTransparency=1},self.Content)
	addBorder(f,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],1)
	local l=createInstance("TextLabel",{Name="Label",Text=n,Size=UDim2.new(1,0,0,20),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10},f)
	local tb=createInstance("TextBox",{Name="ScriptInput",Text=d,Size=UDim2.new(1,-10,0,40),Position=UDim2.new(0,5,0,25),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Code,TextSize=12,ClearTextOnFocus=false,MultiLine=true,TextWrapped=false},f)
	local runBtn=createInstance("TextButton",{Name="RunButton",Text="Run",Size=UDim2.new(0,40,0,20),Position=UDim2.new(1,-45,0,25),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Theme"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.GothamBold,TextSize=10},f)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)},runBtn)
	runBtn.MouseButton1Click:Connect(function()
		cb(tb.Text)
	end)
	JustHub:RegisterControl(n,function(sv)
		tb.Text=sv
	end)
	return f
end

function SectionMethods:addBind(o)
	o=o or {}
	local n=o.Name or "KeyBind"
	local d=o.Default or "RightShift"
	local cb=o.Callback or function()end
	local role=o.Role or nil
	if role and not JustHub:CheckRole(role) then
		local hidden=createInstance("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1},self.Content)
		return hidden
	end
	local c=createInstance("Frame",{Name=n.."BindControl",Size=UDim2.new(1,0,0,30),BackgroundTransparency=1},self.Content)
	addBorder(c,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],1)
	local l=createInstance("TextLabel",{Name="Label",Text=n,Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left},c)
	local tb=createInstance("TextBox",{Name="BindInput",Text=d,Size=UDim2.new(0.3,0,1,0),Position=UDim2.new(0.7,0,0,0),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10},c)
	local currentKey
	local conn
	local function parseKey(str)
		for _,k in pairs(Enum.KeyCode:GetEnumItems()) do
			if k.Name:lower()==str:lower() then
				return k
			end
		end
		return nil
	end
	local function setKey(k)
		local kc=parseKey(k)
		if kc then
			if conn then conn:Disconnect() end
			currentKey=kc
			conn=UserInputService.InputBegan:Connect(function(i,g)
				if not g and i.KeyCode==currentKey then
					pcall(cb)
				end
			end)
			JustHub.ConfigData[n]=k
		end
	end
	setKey(d)
	tb.FocusLost:Connect(function(e)
		setKey(tb.Text)
	end)
	JustHub:RegisterControl(n,function(sv)
		tb.Text=sv
		setKey(sv)
	end)
	return c
end

function SectionMethods:addButton(o)
	o=o or {}
	local nm=o.Name or "Button"
	local bt=o.ButtonText or "Click"
	local cb=o.Callback or function()end
	local role=o.Role or nil
	if role and not JustHub:CheckRole(role) then
		local hidden=createInstance("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1},self.Content)
		return hidden
	end
	local c=createInstance("Frame",{Name=nm.."ButtonControl",Size=UDim2.new(1,0,0,30),BackgroundTransparency=1},self.Content)
	addBorder(c,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],1)
	local l=createInstance("TextLabel",{Name="Label",Text=nm,Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left},c)
	local b=createInstance("TextButton",{Name="ActionButton",Text=bt,Size=UDim2.new(0.3,0,0.8,0),Position=UDim2.new(0.7,0,0.1,0),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Theme"],TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.GothamBold,TextSize=10},c)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)},b)
	b.MouseButton1Click:Connect(function()
		JustHub:PlaySound("ButtonClick")
		pcall(cb)
	end)
	return c
end

function JustHub:CreateWindow(o)
	o = o or {}
	local wn = o.Name or "JustHub Window"
	local th = getCurrentTheme(o.Theme)
	local subTitle = o.SubTitle or "SubTitle"
	local pl = Players.LocalPlayer
	local pg = pl:WaitForChild("PlayerGui")
	local sg = createInstance("ScreenGui", {Name = "JustHub", ResetOnSpawn = false}, pg)
	self.ScreenGui = sg

	local bgSound = createInstance("Sound", {
		SoundId = "rbxassetid://673605737",
		Volume = 1,       
		Looped = true
	}, sg)
	bgSound:Play()

	local uw = JustHub.Save.UISize[1]
	local uh = JustHub.Save.UISize[2]
	local mf = createInstance("Frame", {
		Name = "MainFrame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, -0.5, 0),
		Size = UDim2.new(0, uw, 0, uh),
		BackgroundColor3 = th["Color Hub 2"]
	}, sg)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 12)}, mf)
	addBorder(mf, th["Color Stroke"], 2)
	local function initTopBar()
		local tb = createInstance("Frame", {
			Name = "TopBar",
			Size = UDim2.new(1, 0, 0, 60),
			BackgroundColor3 = th["Color Hub 2"]
		}, mf)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 12)}, tb)
		addBorder(tb, th["Color Stroke"], 2)
		local tl = createInstance("TextLabel", {
			Name = "TitleLabel",
			Size = UDim2.new(1, -20, 0.6, 0),
			Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1,
			Text = wn,
			TextColor3 = th["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 18,
			TextXAlignment = Enum.TextXAlignment.Left
		}, tb)
		addBorder(tl, th["Color Stroke"], 1)
		local st = createInstance("TextLabel", {
			Name = "SubtitleLabel",
			Size = UDim2.new(1, -20, 0.4, 0),
			Position = UDim2.new(0, 10, 0.6, 0),
			BackgroundTransparency = 1,
			Text = subTitle,
			TextColor3 = Color3.fromRGB(150, 150, 150),
			Font = Enum.Font.Gotham,
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		}, tb)
		addBorder(st, th["Color Stroke"], 1)
		return tb
	end
	local tb = initTopBar()
	local headerSeparator = createInstance("Frame", {
		Size = UDim2.new(1, 0, 0, 2),
		Position = UDim2.new(0, 0, 0, 60),
		BackgroundColor3 = th["Color Stroke"],
		BorderSizePixel = 0
	}, mf)
	local footerHeight = 30
	local sbWidth = JustHub.Save.TabSize
	local sb = createInstance("Frame", {
		Name = "Sidebar",
		Size = UDim2.new(0, sbWidth, 1, -(60 + footerHeight)),
		Position = UDim2.new(0, 0, 0, 60),
		BackgroundColor3 = th["Color Hub 2"]
	}, mf)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 10)}, sb)
	addBorder(sb, th["Color Stroke"], 2)
	createInstance("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top
	}, sb)
	local verticalSeparator = createInstance("Frame", {
		Size = UDim2.new(0, 2, 1, -(60 + footerHeight)),
		Position = UDim2.new(0, sbWidth, 0, 60),
		BackgroundColor3 = th["Color Stroke"],
		BorderSizePixel = 0
	}, mf)
	local cc = createInstance("Frame", {
		Name = "ContentContainer",
		Size = UDim2.new(1, -sbWidth - 2, 1, -(60 + footerHeight)),
		Position = UDim2.new(0, sbWidth + 2, 0, 60),
		BackgroundColor3 = th["Color Hub 2"]
	}, mf)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 10)}, cc)
	addBorder(cc, th["Color Stroke"], 2)
	local sf = createInstance("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ScrollBarThickness = 8,
		BorderSizePixel = 0
	}, cc)
	createInstance("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10),
		HorizontalAlignment = Enum.HorizontalAlignment.Left
	}, sf)
	local footer = createInstance("Frame", {
		Name = "Footer",
		Size = UDim2.new(1, 0, 0, footerHeight),
		Position = UDim2.new(0, 0, 1, -footerHeight),
		BackgroundColor3 = th["Color Hub 2"]
	}, mf)
	addBorder(footer, th["Color Stroke"], 2)
	local footerSeparator = createInstance("Frame", {
		Size = UDim2.new(1, 0, 0, 2),
		Position = UDim2.new(0, 0, 1, -footerHeight - 2),
		BackgroundColor3 = th["Color Stroke"],
		BorderSizePixel = 0
	}, mf)
	local fl = createInstance("TextLabel", {
		Name = "FPSLabel",
		Size = UDim2.new(0, 100, 1, 0),
		BackgroundTransparency = 1,
		TextColor3 = th["Color Text"],
		Font = Enum.Font.Gotham,
		TextSize = 14,
		Text = "FPS: Calculating..."
	}, footer)
	fl.AnchorPoint = Vector2.new(1, 0.5)
	fl.Position = UDim2.new(1, -10, 0.5, 0)
	local fpsAccumulator = 0
	local fpsCount = 0
	local updateInterval = 0.5
	spawn(function()
		while true do
			wait(updateInterval)
			local avgFPS = fpsCount / fpsAccumulator
			fl.Text = "FPS: " .. math.floor(avgFPS)
			fpsAccumulator = 0
			fpsCount = 0
		end
	end)
	RunService.Heartbeat:Connect(function(d)
		fpsAccumulator = fpsAccumulator + d
		fpsCount = fpsCount + 1
	end)
	local windowTween = TweenService:Create(mf, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)})
	windowTween:Play()
	local originalSize = mf.Size
	local originalPosition = mf.Position
	local isLocked = false
	local minimized = false
	local maximized = false
	local controlButtonSize = UDim2.new(0, 40, 0, 40)
	local buttonSpacing = 10
	local basePosX = -30
	local function createControlButton(name, text, pos)
		return createInstance("TextButton", {
			Name = name,
			Text = text,
			Size = controlButtonSize,
			Position = pos,
			BackgroundTransparency = 1,
			TextColor3 = th["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 24
		}, tb)
	end
	local hb = createControlButton("HideButton", "–", UDim2.new(1, basePosX - (controlButtonSize.X.Offset + buttonSpacing)*2, 0, 10))
	local xb = createControlButton("MaxButton", "□", UDim2.new(1, basePosX - (controlButtonSize.X.Offset + buttonSpacing), 0, 10))
	local closeb = createControlButton("CloseButton", "X", UDim2.new(1, basePosX, 0, 10))
	hb.MouseButton1Click:Connect(function()
		if not minimized then
			tweenProperty(mf, {Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 60 + footerHeight)}, 0.3)
			sb.Visible = false
			cc.Visible = false
			footer.Visible = false
			minimized = true
		else
			tweenProperty(mf, {Size = originalSize}, 0.3)
			wait(0.3)
			sb.Visible = true
			cc.Visible = true
			footer.Visible = true
			minimized = false
		end
	end)
	xb.MouseButton1Click:Connect(function()
		if not maximized then
			tweenProperty(mf, {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.3)
			maximized = true
		else
			tweenProperty(mf, {Size = originalSize, Position = originalPosition}, 0.3)
			maximized = false
		end
	end)
	closeb.MouseButton1Click:Connect(function()
		local closeTween = TweenService:Create(mf, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, -0.5, 0)})
		closeTween:Play()
		closeTween.Completed:Connect(function()
			mf.Visible = false
			local pg2 = Players.LocalPlayer:WaitForChild("PlayerGui")
			local showUI = createInstance("ScreenGui", {Name = "ShowUI", ResetOnSpawn = false}, pg2)
			local showBtn = createInstance("TextButton", {
				Name = "ShowUIButton",
				Size = UDim2.new(0, 100, 0, 30),
				Position = UDim2.new(0.5, -50, 0, 10),
				BackgroundColor3 = th["Color Hub 2"],
				Text = "Show UI",
				TextColor3 = Color3.fromRGB(128, 0, 128),
				Font = Enum.Font.GothamBold,
				TextSize = 20
			}, showUI)
			createInstance("UICorner", {CornerRadius = UDim.new(0, 25)}, showBtn)
			createInstance("UIStroke", {Color = th["Color Theme"], Thickness = 1}, showBtn)
			showBtn.MouseButton1Click:Connect(function()
				mf.Visible = true
				tweenProperty(mf, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.5)
				showUI:Destroy()
			end)
		end)
	end)
	mf.Active = true
	local function enableDrag(frame)
		local isDragging = false
		local dragStartPos, startPos
		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not isLocked then
				isDragging = true
				dragStartPos = input.Position
				startPos = frame.Position
			end
		end)
		frame.InputChanged:Connect(function(input)
			if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local delta = input.Position - dragStartPos
				local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				newPos = clampPosition(newPos, Vector2.new(sg.AbsoluteSize.X, sg.AbsoluteSize.Y))
				frame.Position = newPos
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				isDragging = false
			end
		end)
	end
	enableDrag(mf)
	local function enableResize(frame, grip)
		local isResizing = false
		local dragStartPos, startSize
		grip.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				isResizing = true
				dragStartPos = input.Position
				startSize = frame.Size
			end
		end)
		grip.InputChanged:Connect(function(input)
			if isResizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local delta = input.Position - dragStartPos
				local newWidth = math.max(300, startSize.X.Offset + delta.X)
				local newHeight = math.max(200, startSize.Y.Offset + delta.Y)
				frame.Size = UDim2.new(0, newWidth, 0, newHeight)
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				isResizing = false
			end
		end)
	end
	local resizeGrip = createInstance("Frame", {
		Name = "ResizeGrip",
		Size = UDim2.new(0, 20, 0, 20),
		Position = UDim2.new(1, -20, 1, -20),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0
	}, mf)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 5)}, resizeGrip)
	enableResize(mf, resizeGrip)
	local notiContainer = createInstance("Frame", {
		Name = "NotificationContainer",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -10, 1, -10),
		Size = UDim2.new(0, 300, 1, -20),
		BackgroundTransparency = 1
	}, sg)
	createInstance("UIListLayout", {
		Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		SortOrder = Enum.SortOrder.LayoutOrder
	}, notiContainer)
	self.NotificationContainer = notiContainer
	local wObj = {ScreenGui = sg, MainFrame = mf, TopBar = tb, Sidebar = sb, ContentContainer = cc, Tabs = {}}
	function wObj:addTab(tn)
		tn = tn or "Tab"
		local b = createInstance("TextButton", {
			Name = tn .. "Button",
			Text = tn,
			Size = UDim2.new(1, 0, 0, 20),
			BackgroundColor3 = th["Color Stroke"],
			TextColor3 = Color3.fromRGB(128, 0, 128),
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextScaled = true,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, sb)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 10)}, b)
		createInstance("UIStroke", {Color = th["Color Theme"], Thickness = 1}, b)
		local tc = createInstance("Frame", {
			Name = tn .. "Content",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Visible = false
		}, sf)
		local tObj = {Name = tn, Button = b, Content = tc, Sections = {}}
		table.insert(wObj.Tabs, tObj)
		b.MouseButton1Click:Connect(function()
			for _, tt in ipairs(wObj.Tabs) do
				tt.Content.Visible = false
			end
			tObj.Content.Visible = true
		end)
		if #wObj.Tabs == 1 then
			tObj.Content.Visible = true
		end
		function tObj:addSection(sn, sh)
			sn = sn or "Section"
			sh = sh or 80
			local sframe = createInstance("Frame", {
				Name = sn,
				Size = UDim2.new(1, 0, 0, sh),
				BackgroundColor3 = th["Color Hub 2"],
				BackgroundTransparency = 0
			}, tc)
			createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, sframe)
			local st = createInstance("TextLabel", {
				Name = "SectionTitle",
				Text = sn,
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundTransparency = 1,
				TextColor3 = th["Color Text"],
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left
			}, sframe)
			local sc = createInstance("Frame", {
				Name = "SectionContent",
				Size = UDim2.new(1, 0, 1, -30),
				Position = UDim2.new(0, 0, 0, 30),
				BackgroundTransparency = 1
			}, sframe)
			createInstance("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}, sc)
			local sObj = {Frame = sframe, Title = st, Content = sc}
			table.insert(tObj.Sections, sObj)
			setmetatable(sObj, {__index = SectionMethods})
			return sObj
		end
		return tObj
	end
	return wObj
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local function createInstance(className, props, parent)
	local obj = Instance.new(className)
	for i, v in pairs(props) do
		obj[i] = v
	end
	if parent then
		obj.Parent = parent
	end
	return obj
end

local function tweenProperty(guiObject, goal, time, easingStyle, easingDirection)
	local ti = TweenInfo.new(time, easingStyle or Enum.EasingStyle.Quad, easingDirection or Enum.EasingDirection.Out)
	local tween = TweenService:Create(guiObject, ti, goal)
	tween:Play()
	return tween
end

function JustHub:ShowLoadingScreen(d, cb)
	d = d or 5
	cb = cb or function() end
	local pl = Players.LocalPlayer
	local pg = pl:WaitForChild("PlayerGui")
	local lg = createInstance("ScreenGui", {
		Name = "LoadingScreen",
		ResetOnSpawn = false,
		IgnoreGuiInset = true
	}, pg)
	local bgImage = createInstance("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://81925509834061",
		ScaleType = Enum.ScaleType.Crop
	}, lg)
	local bgOverlay = createInstance("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0
	}, lg)
	local tl = createInstance("TextLabel", {
		Text = "JustHub Library",
		Font = Enum.Font.SourceSansSemibold,
		TextSize = 20,
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, -50)
	}, lg)
	local wl = createInstance("TextLabel", {
		Text = "Welcome, " .. pl.Name,
		Font = Enum.Font.SourceSansSemibold,
		TextSize = 16,
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 30),
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 10)
	}, lg)
	local pbc = createInstance("Frame", {
		Size = UDim2.new(0.5, 0, 0, 20),
		Position = UDim2.new(0.5, 0, 0.5, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0
	}, lg)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, pbc)
	local pbf = createInstance("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Theme"],
		BorderSizePixel = 0
	}, pbc)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, pbf)
	local tinfo = TweenInfo.new(d, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local pt = TweenService:Create(pbf, tinfo, {Size = UDim2.new(1, 0, 1, 0)})
	pt:Play()
	spawn(function()
		while pt.PlaybackState == Enum.PlaybackState.Playing do
			tweenProperty(tl, {TextTransparency = 0.5}, 0.5)
			wait(0.5)
			tweenProperty(tl, {TextTransparency = 0}, 0.5)
			wait(0.5)
		end
	end)
	pt.Completed:Connect(function()
		wait(0.5)
		lg:Destroy()
		cb()
	end)
end

function JustHub:InitializeUI(o)
	self:ShowLoadingScreen(5, function()
		local w = self:CreateWindow(o)
		self.Window = w
	end)
end

function JustHub:SaveConfig(f)
	f = f or "JustHub_Config.json"
	if writefile then
		local j = HttpService:JSONEncode(JustHub.ConfigData)
		writefile(f, j)
		StarterGui:SetCore("SendNotification", {Title = "Save Config", Text = "Config Success Save At " .. f, Duration = 5})
	else
		warn("Saving config is not supported in this environment.")
	end
end

function JustHub:LoadConfig(f)
	f = f or "JustHub_Config.json"
	if readfile then
		local d = readfile(f)
		local c = HttpService:JSONDecode(d)
		JustHub.ConfigData = c
		JustHub:ApplyConfig(c)
		StarterGui:SetCore("SendNotification", {Title = "Load Config", Text = "Config berhasil dimuat dari " .. f, Duration = 5})
		return c
	else
		warn("Loading config is not supported in this environment.")
		return {}
	end
end

function JustHub:UpdateTheme(nt)
	JustHub.Save.Theme = nt
	local th = getCurrentTheme(nt)
	if self.Window then
		local mf = self.Window.MainFrame
		mf.BackgroundColor3 = th["Color Hub 2"]
		local tb = self.Window.TopBar
		tb.BackgroundColor3 = th["Color Hub 2"]
		local tl = tb:FindFirstChild("TitleLabel")
		if tl then tl.TextColor3 = th["Color Text"] end
		local sb = self.Window.Sidebar
		sb.BackgroundColor3 = th["Color Hub 2"]
		local cc = self.Window.ContentContainer
		cc.BackgroundColor3 = th["Color Hub 2"]
		for _, tab in ipairs(self.Window.Tabs) do
			if tab.Button then
				tab.Button.BackgroundColor3 = th["Color Stroke"]
				tab.Button.TextColor3 = th["Color Text"]
			end
		end
		local fl = mf:FindFirstChild("FPSLabel", true)
		if fl then
			fl.TextColor3 = th["Color Text"]
		end
	end
end

function JustHub:SetTheme(nt)
	self:UpdateTheme(nt)
end

function JustHub:ToggleUIVisibility()
	if self.ScreenGui and self.ScreenGui.Parent then
		self.ScreenGui.Enabled = not self.ScreenGui.Enabled
	end
end

function JustHub:Notify(o)
	o = o or {}
	local t = o.Title or ""
	local m = o.Message or ""
	local d = o.Duration or 5
	local showProgress = o.ShowProgress or false
	local theme = getCurrentTheme(JustHub.Save.Theme)
	if not self.NotificationContainer then
		return
	end
	local nf = createInstance("Frame", {Size = UDim2.new(0, 300, 0, 0), BackgroundTransparency = 0, ClipsDescendants = true}, self.NotificationContainer)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, nf)
	addBorder(nf, theme["Color Stroke"], 2)
	createInstance("UIGradient", {Color = theme["Color Hub 1"]}, nf)
	local tLabel = createInstance("TextLabel", {Text = t, Size = UDim2.new(1, -10, 0, 20), Position = UDim2.new(0, 5, 0, 5), BackgroundTransparency = 1, TextColor3 = theme["Color Text"], Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left}, nf)
	local mLabel = createInstance("TextLabel", {Text = m, Size = UDim2.new(1, -10, 0, 0), Position = UDim2.new(0, 5, 0, 25), BackgroundTransparency = 1, TextColor3 = theme["Color Text"], Font = Enum.Font.Gotham, TextSize = 12, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left}, nf)
	mLabel.Size = UDim2.new(1, -10, 0, mLabel.TextBounds.Y + 5)
	local fullHeight = mLabel.AbsolutePosition.Y + mLabel.AbsoluteSize.Y - nf.AbsolutePosition.Y + 10
	local progressFrame
	if showProgress then
		progressFrame = createInstance("Frame", {Size = UDim2.new(1, 0, 0, 5), Position = UDim2.new(0, 0, 1, -5), BackgroundColor3 = theme["Color Theme"]}, nf)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 3)}, progressFrame)
		fullHeight = fullHeight + 5
	end
	nf.Size = UDim2.new(0, 300, 0, fullHeight)
	nf.BackgroundColor3 = theme["Color Hub 2"]
	nf.BackgroundTransparency = 0.1
	nf.Position = UDim2.new(1, 0, 1, 0)
	local inTween = TweenService:Create(nf, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, fullHeight)})
	inTween:Play()
	spawn(function()
		inTween.Completed:Wait()
		if showProgress and progressFrame then
			local tw = TweenService:Create(progressFrame, TweenInfo.new(d, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 5)})
			tw:Play()
		end
		wait(d)
		local outTween = TweenService:Create(nf, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1, Size = UDim2.new(0, 300, 0, 0)})
		outTween:Play()
		outTween.Completed:Wait()
		nf:Destroy()
	end)
end

return JustHub