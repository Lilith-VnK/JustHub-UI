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
		return {
			["accessibility"] = "rbxassetid://10709751939",
			["activity"] = "rbxassetid://10709752035",
			["airvent"] = "rbxassetid://10709752131",
			["airplay"] = "rbxassetid://10709752254",
			["alarmcheck"] = "rbxassetid://10709752405",
			["alarmclock"] = "rbxassetid://10709752630",
			["alarmclockoff"] = "rbxassetid://10709752508",
			["alarmminus"] = "rbxassetid://10709752732",
			["alarmplus"] = "rbxassetid://10709752825",
			["album"] = "rbxassetid://10709752906",
			["alertcircle"] = "rbxassetid://10709752996",
			["alertoctagon"] = "rbxassetid://10709753064",
			["alerttriangle"] = "rbxassetid://10709753149",
			["aligncenter"] = "rbxassetid://10709753570",
			["aligncenterhorizontal"] = "rbxassetid://10709753272",
			["aligncentervertical"] = "rbxassetid://10709753421",
			["alignendhorizontal"] = "rbxassetid://10709753692",
			["alignendvertical"] = "rbxassetid://10709753808",
			["alignhorizontaldistributecenter"] = "rbxassetid://10747779791",
			["alignhorizontaldistributeend"] = "rbxassetid://10747784534",
			["alignhorizontaldistributestart"] = "rbxassetid://10709754118",
			["alignhorizontaljustifycenter"] = "rbxassetid://10709754204",
			["alignhorizontaljustifyend"] = "rbxassetid://10709754317",
			["alignhorizontaljustifystart"] = "rbxassetid://10709754436",
			["alignhorizontalspacearound"] = "rbxassetid://10709754590",
			["alignhorizontalspacebetween"] = "rbxassetid://10709754749",
			["alignjustify"] = "rbxassetid://10709759610",
			["alignleft"] = "rbxassetid://10709759764",
			["alignright"] = "rbxassetid://10709759895",
			["alignstarthorizontal"] = "rbxassetid://10709760051",
			["alignstartvertical"] = "rbxassetid://10709760244",
			["alignverticaldistributecenter"] = "rbxassetid://10709760351",
			["alignverticaldistributeend"] = "rbxassetid://10709760434",
			["alignverticaldistributestart"] = "rbxassetid://10709760612",
			["alignverticaljustifycenter"] = "rbxassetid://10709760814",
			["alignverticaljustifyend"] = "rbxassetid://10709761003",
			["alignverticaljustifystart"] = "rbxassetid://10709761176",
			["alignverticalspacearound"] = "rbxassetid://10709761324",
			["alignverticalspacebetween"] = "rbxassetid://10709761434",
			["anchor"] = "rbxassetid://10709761530",
			["angry"] = "rbxassetid://10709761629",
			["annoyed"] = "rbxassetid://10709761722",
			["aperture"] = "rbxassetid://10709761813",
			["apple"] = "rbxassetid://10709761889",
			["archive"] = "rbxassetid://10709762233",
			["archiverestore"] = "rbxassetid://10709762058",
			["armchair"] = "rbxassetid://10709762327",
			["arrowbigdown"] = "rbxassetid://10747796644",
			["arrowbigleft"] = "rbxassetid://10709762574",
			["arrowbigright"] = "rbxassetid://10709762727",
			["arrowbigup"] = "rbxassetid://10709762879",
			["arrowdown"] = "rbxassetid://10709767827",
			["arrowdowncircle"] = "rbxassetid://10709763034",
			["arrowdownleft"] = "rbxassetid://10709767656",
			["arrowdownright"] = "rbxassetid://10709767750",
			["arrowleft"] = "rbxassetid://10709768114",
			["arrowleftcircle"] = "rbxassetid://10709767936",
			["arrowleftright"] = "rbxassetid://10709768019",
			["arrowright"] = "rbxassetid://10709768347",
			["arrowrightcircle"] = "rbxassetid://10709768226",
			["arrowup"] = "rbxassetid://10709768939",
			["arrowupcircle"] = "rbxassetid://10709768432",
			["arrowupdown"] = "rbxassetid://10709768538",
			["arrowupleft"] = "rbxassetid://10709768661",
			["arrowupright"] = "rbxassetid://10709768787",
			["asterisk"] = "rbxassetid://10709769095",
			["atsign"] = "rbxassetid://10709769286",
			["award"] = "rbxassetid://10709769406",
			["axe"] = "rbxassetid://10709769508",
			["axis3d"] = "rbxassetid://10709769598",
			["baby"] = "rbxassetid://10709769732",
			["backpack"] = "rbxassetid://10709769841",
			["baggageclaim"] = "rbxassetid://10709769935",
			["banana"] = "rbxassetid://10709770005",
			["banknote"] = "rbxassetid://10709770178",
			["barchart"] = "rbxassetid://10709773755",
			["barchart2"] = "rbxassetid://10709770317",
			["barchart3"] = "rbxassetid://10709770431",
			["barchart4"] = "rbxassetid://10709770560",
			["barcharthorizontal"] = "rbxassetid://10709773669",
			["barcode"] = "rbxassetid://10747360675",
			["baseline"] = "rbxassetid://10709773863",
			["bath"] = "rbxassetid://10709773963",
			["battery"] = "rbxassetid://10709774640",
			["batterycharging"] = "rbxassetid://10709774068",
			["batteryfull"] = "rbxassetid://10709774206",
			["batterylow"] = "rbxassetid://10709774370",
			["batterymedium"] = "rbxassetid://10709774513",
			["beaker"] = "rbxassetid://10709774756",
			["bed"] = "rbxassetid://10709775036",
			["beddouble"] = "rbxassetid://10709774864",
			["bedsingle"] = "rbxassetid://10709774968",
			["beer"] = "rbxassetid://10709775167",
			["bell"] = "rbxassetid://10709775704",
			["bellminus"] = "rbxassetid://10709775241",
			["belloff"] = "rbxassetid://10709775320",
			["bellplus"] = "rbxassetid://10709775448",
			["bellring"] = "rbxassetid://10709775560",
			["bike"] = "rbxassetid://10709775894",
			["binary"] = "rbxassetid://10709776050",
			["bitcoin"] = "rbxassetid://10709776126",
			["bluetooth"] = "rbxassetid://10709776655",
			["bluetoothconnected"] = "rbxassetid://10709776240",
			["bluetoothoff"] = "rbxassetid://10709776344",
			["bluetoothsearching"] = "rbxassetid://10709776501",
			["bold"] = "rbxassetid://10747813908",
			["bomb"] = "rbxassetid://10709781460",
			["bone"] = "rbxassetid://10709781605",
			["book"] = "rbxassetid://10709781824",
			["bookopen"] = "rbxassetid://10709781717",
			["bookmark"] = "rbxassetid://10709782154",
			["bookmarkminus"] = "rbxassetid://10709781919",
			["bookmarkplus"] = "rbxassetid://10709782044",
			["bot"] = "rbxassetid://10709782230",
			["box"] = "rbxassetid://10709782497",
			["boxselect"] = "rbxassetid://10709782342",
			["boxes"] = "rbxassetid://10709782582",
			["briefcase"] = "rbxassetid://10709782662",
			["brush"] = "rbxassetid://10709782758",
			["bug"] = "rbxassetid://10709782845",
			["building"] = "rbxassetid://10709783051",
			["building2"] = "rbxassetid://10709782939",
			["bus"] = "rbxassetid://10709783137",
			["cake"] = "rbxassetid://10709783217",
			["calculator"] = "rbxassetid://10709783311",
			["calendar"] = "rbxassetid://10709789505",
			["calendarcheck"] = "rbxassetid://10709783474",
			["calendarcheck2"] = "rbxassetid://10709783392",
			["calendarclock"] = "rbxassetid://10709783577",
			["calendardays"] = "rbxassetid://10709783673",
			["calendarheart"] = "rbxassetid://10709783835",
			["calendarminus"] = "rbxassetid://10709783959",
			["calendaroff"] = "rbxassetid://10709788784",
			["calendarplus"] = "rbxassetid://10709788937",
			["calendarrange"] = "rbxassetid://10709789053",
			["calendarsearch"] = "rbxassetid://10709789200",
			["calendarx"] = "rbxassetid://10709789407",
			["calendarx2"] = "rbxassetid://10709789329",
			["camera"] = "rbxassetid://10709789686",
			["cameraoff"] = "rbxassetid://10747822677",
			["car"] = "rbxassetid://10709789810",
			["carrot"] = "rbxassetid://10709789960",
			["cast"] = "rbxassetid://10709790097",
			["charge"] = "rbxassetid://10709790202",
			["check"] = "rbxassetid://10709790644",
			["checkcircle"] = "rbxassetid://10709790387",
			["checkcircle2"] = "rbxassetid://10709790298",
			["checksquare"] = "rbxassetid://10709790537",
			["chefhat"] = "rbxassetid://10709790757",
			["cherry"] = "rbxassetid://10709790875",
			["chevrondown"] = "rbxassetid://10709790948",
			["chevronfirst"] = "rbxassetid://10709791015",
			["chevronlast"] = "rbxassetid://10709791130",
			["chevronleft"] = "rbxassetid://10709791281",
			["chevronright"] = "rbxassetid://10709791437",
			["chevronup"] = "rbxassetid://10709791523",
			["chevronsdown"] = "rbxassetid://10709796864",
			["chevronsdownup"] = "rbxassetid://10709791632",
			["chevronsleft"] = "rbxassetid://10709797151",
			["chevronsleftright"] = "rbxassetid://10709797006",
			["chevronsright"] = "rbxassetid://10709797382",
			["chevronsrightleft"] = "rbxassetid://10709797274",
			["chevronsup"] = "rbxassetid://10709797622",
			["chevronsupdown"] = "rbxassetid://10709797508",
			["chrome"] = "rbxassetid://10709797725",
			["circle"] = "rbxassetid://10709798174",
			["circledot"] = "rbxassetid://10709797837",
			["circleellipsis"] = "rbxassetid://10709797985",
			["circleslashed"] = "rbxassetid://10709798100",
			["citrus"] = "rbxassetid://10709798276",
			["clapperboard"] = "rbxassetid://10709798350",
			["clipboard"] = "rbxassetid://10709799288",
			["clipboardcheck"] = "rbxassetid://10709798443",
			["clipboardcopy"] = "rbxassetid://10709798574",
			["clipboardedit"] = "rbxassetid://10709798682",
			["clipboardlist"] = "rbxassetid://10709798792",
			["clipboardsignature"] = "rbxassetid://10709798890",
			["clipboardtype"] = "rbxassetid://10709798999",
			["clipboardx"] = "rbxassetid://10709799124",
			["clock"] = "rbxassetid://10709805144",
			["clock1"] = "rbxassetid://10709799535",
			["clock10"] = "rbxassetid://10709799718",
			["clock11"] = "rbxassetid://10709799818",
			["clock12"] = "rbxassetid://10709799962",
			["clock2"] = "rbxassetid://10709803876",
			["clock3"] = "rbxassetid://10709803989",
			["clock4"] = "rbxassetid://10709804164",
			["clock5"] = "rbxassetid://10709804291",
			["clock6"] = "rbxassetid://10709804435",
			["clock7"] = "rbxassetid://10709804599",
			["clock8"] = "rbxassetid://10709804784",
			["clock9"] = "rbxassetid://10709804996",
			["cloud"] = "rbxassetid://10709806740",
			["cloudcog"] = "rbxassetid://10709805262",
			["clouddrizzle"] = "rbxassetid://10709805371",
			["cloudfog"] = "rbxassetid://10709805477",
			["cloudhail"] = "rbxassetid://10709805596",
			["cloudlightning"] = "rbxassetid://10709805727",
			["cloudmoon"] = "rbxassetid://10709805942",
			["cloudmoonrain"] = "rbxassetid://10709805838",
			["cloudoff"] = "rbxassetid://10709806060",
			["cloudrain"] = "rbxassetid://10709806277",
			["cloudrainwind"] = "rbxassetid://10709806166",
			["cloudsnow"] = "rbxassetid://10709806374",
			["cloudsun"] = "rbxassetid://10709806631",
			["cloudsunrain"] = "rbxassetid://10709806475",
			["cloudy"] = "rbxassetid://10709806859",
			["clover"] = "rbxassetid://10709806995",
			["code"] = "rbxassetid://10709810463",
			["code2"] = "rbxassetid://10709807111",
			["codepen"] = "rbxassetid://10709810534",
			["codesandbox"] = "rbxassetid://10709810676",
			["coffee"] = "rbxassetid://10709810814",
			["cog"] = "rbxassetid://10709810948",
			["coins"] = "rbxassetid://10709811110",
			["columns"] = "rbxassetid://10709811261",
			["command"] = "rbxassetid://10709811365",
			["compass"] = "rbxassetid://10709811445",
			["component"] = "rbxassetid://10709811595",
			["conciergebell"] = "rbxassetid://10709811706",
			["connection"] = "rbxassetid://10747361219",
			["contact"] = "rbxassetid://10709811834",
			["contrast"] = "rbxassetid://10709811939",
			["cookie"] = "rbxassetid://10709812067",
			["copy"] = "rbxassetid://10709812159",
			["copyleft"] = "rbxassetid://10709812251",
			["copyright"] = "rbxassetid://10709812311",
			["cornerdownleft"] = "rbxassetid://10709812396",
			["cornerdownright"] = "rbxassetid://10709812485",
			["cornerleftdown"] = "rbxassetid://10709812632",
			["cornerleftup"] = "rbxassetid://10709812784",
			["cornerrightdown"] = "rbxassetid://10709812939",
			["cornerrightup"] = "rbxassetid://10709813094",
			["cornerupleft"] = "rbxassetid://10709813185",
			["cornerupright"] = "rbxassetid://10709813281",
			["cpu"] = "rbxassetid://10709813383",
			["croissant"] = "rbxassetid://10709818125",
			["crop"] = "rbxassetid://10709818245",
			["cross"] = "rbxassetid://10709818399",
			["crosshair"] = "rbxassetid://10709818534",
			["crown"] = "rbxassetid://10709818626",
			["cupsoda"] = "rbxassetid://10709818763",
			["curlybraces"] = "rbxassetid://10709818847",
			["currency"] = "rbxassetid://10709818931",
			["database"] = "rbxassetid://10709818996",
			["delete"] = "rbxassetid://10709819059",
			["diamond"] = "rbxassetid://10709819149",
			["dice1"] = "rbxassetid://10709819266",
			["dice2"] = "rbxassetid://10709819361",
			["dice3"] = "rbxassetid://10709819508",
			["dice4"] = "rbxassetid://10709819670",
			["dice5"] = "rbxassetid://10709819801",
			["dice6"] = "rbxassetid://10709819896",
			["dices"] = "rbxassetid://10723343321",
			["diff"] = "rbxassetid://10723343416",
			["disc"] = "rbxassetid://10723343537",
			["divide"] = "rbxassetid://10723343805",
			["dividecircle"] = "rbxassetid://10723343636",
			["dividesquare"] = "rbxassetid://10723343737",
			["dollarsign"] = "rbxassetid://10723343958",
			["download"] = "rbxassetid://10723344270",
			["downloadcloud"] = "rbxassetid://10723344088",
			["droplet"] = "rbxassetid://10723344432",
			["droplets"] = "rbxassetid://10734883356",
			["drumstick"] = "rbxassetid://10723344737",
			["edit"] = "rbxassetid://10734883598",
			["edit2"] = "rbxassetid://10723344885",
			["edit3"] = "rbxassetid://10723345088",
			["egg"] = "rbxassetid://10723345518",
			["eggfried"] = "rbxassetid://10723345347",
			["electricity"] = "rbxassetid://10723345749",
			["electricityoff"] = "rbxassetid://10723345643",
			["equal"] = "rbxassetid://10723345990",
			["equalnot"] = "rbxassetid://10723345866",
			["eraser"] = "rbxassetid://10723346158",
			["euro"] = "rbxassetid://10723346372",
			["expand"] = "rbxassetid://10723346553",
			["externallink"] = "rbxassetid://10723346684",
			["eye"] = "rbxassetid://10723346959",
			["eyeoff"] = "rbxassetid://10723346871",
			["factory"] = "rbxassetid://10723347051",
			["fan"] = "rbxassetid://10723354359",
			["fastforward"] = "rbxassetid://10723354521",
			["feather"] = "rbxassetid://10723354671",
			["figma"] = "rbxassetid://10723354801",
			["file"] = "rbxassetid://10723374641",
			["filearchive"] = "rbxassetid://10723354921",
			["fileaudio"] = "rbxassetid://10723355148",
			["fileaudio2"] = "rbxassetid://10723355026",
			["fileaxis3d"] = "rbxassetid://10723355272",
			["filebadge"] = "rbxassetid://10723355622",
			["filebadge2"] = "rbxassetid://10723355451",
			["filebarchart"] = "rbxassetid://10723355887",
			["filebarchart2"] = "rbxassetid://10723355746",
			["filebox"] = "rbxassetid://10723355989",
			["filecheck"] = "rbxassetid://10723356210",
			["filecheck2"] = "rbxassetid://10723356100",
			["fileclock"] = "rbxassetid://10723356329",
			["filecode"] = "rbxassetid://10723356507",
			["filecog"] = "rbxassetid://10723356830",
			["filecog2"] = "rbxassetid://10723356676",
			["filediff"] = "rbxassetid://10723357039",
			["filedigit"] = "rbxassetid://10723357151",
			["filedown"] = "rbxassetid://10723357322",
			["fileedit"] = "rbxassetid://10723357495",
			["fileheart"] = "rbxassetid://10723357637",
			["fileimage"] = "rbxassetid://10723357790",
			["fileinput"] = "rbxassetid://10723357933",
			["filejson"] = "rbxassetid://10723364435",
			["filejson2"] = "rbxassetid://10723364361",
			["filekey"] = "rbxassetid://10723364605",
			["filekey2"] = "rbxassetid://10723364515",
			["filelinechart"] = "rbxassetid://10723364725",
			["filelock"] = "rbxassetid://10723364957",
			["filelock2"] = "rbxassetid://10723364861",
			["fileminus"] = "rbxassetid://10723365254",
			["fileminus2"] = "rbxassetid://10723365086",
			["fileoutput"] = "rbxassetid://10723365457",
			["filepiechart"] = "rbxassetid://10723365598",
			["fileplus"] = "rbxassetid://10723365877",
			["fileplus2"] = "rbxassetid://10723365766",
			["filequestion"] = "rbxassetid://10723365987",
			["filescan"] = "rbxassetid://10723366167",
			["filesearch"] = "rbxassetid://10723366550",
			["filesearch2"] = "rbxassetid://10723366340",
			["filesignature"] = "rbxassetid://10723366741",
			["filespreadsheet"] = "rbxassetid://10723366962",
			["filesymlink"] = "rbxassetid://10723367098",
			["fileterminal"] = "rbxassetid://10723367244",
			["filetext"] = "rbxassetid://10723367380",
			["filetype"] = "rbxassetid://10723367606",
			["filetype2"] = "rbxassetid://10723367509",
			["fileup"] = "rbxassetid://10723367734",
			["filevideo"] = "rbxassetid://10723373884",
			["filevideo2"] = "rbxassetid://10723367834",
			["filevolume"] = "rbxassetid://10723374172",
			["filevolume2"] = "rbxassetid://10723374030",
			["filewarning"] = "rbxassetid://10723374276",
			["filex"] = "rbxassetid://10723374544",
			["filex2"] = "rbxassetid://10723374378",
			["files"] = "rbxassetid://10723374759",
			["film"] = "rbxassetid://10723374981",
			["filter"] = "rbxassetid://10723375128",
			["fingerprint"] = "rbxassetid://10723375250",
			["flag"] = "rbxassetid://10723375890",
			["flagoff"] = "rbxassetid://10723375443",
			["flagtriangleleft"] = "rbxassetid://10723375608",
			["flagtriangleright"] = "rbxassetid://10723375727",
			["flame"] = "rbxassetid://10723376114",
			["flashlight"] = "rbxassetid://10723376471",
			["flashlightoff"] = "rbxassetid://10723376365",
			["flaskconical"] = "rbxassetid://10734883986",
			["flaskround"] = "rbxassetid://10723376614",
			["fliphorizontal"] = "rbxassetid://10723376884",
			["fliphorizontal2"] = "rbxassetid://10723376745",
			["flipvertical"] = "rbxassetid://10723377138",
			["flipvertical2"] = "rbxassetid://10723377026",
			["flower"] = "rbxassetid://10747830374",
			["flower2"] = "rbxassetid://10723377305",
			["focus"] = "rbxassetid://10723377537",
			["folder"] = "rbxassetid://10723387563",
			["folderarchive"] = "rbxassetid://10723384478",
			["foldercheck"] = "rbxassetid://10723384605",
			["folderclock"] = "rbxassetid://10723384731",
			["folderclosed"] = "rbxassetid://10723384893",
			["foldercog"] = "rbxassetid://10723385213",
			["foldercog2"] = "rbxassetid://10723385036",
			["folderdown"] = "rbxassetid://10723385338",
			["folderedit"] = "rbxassetid://10723385445",
			["folderheart"] = "rbxassetid://10723385545",
			["folderinput"] = "rbxassetid://10723385721",
			["folderkey"] = "rbxassetid://10723385848",
			["folderlock"] = "rbxassetid://10723386005",
			["folderminus"] = "rbxassetid://10723386127",
			["folderopen"] = "rbxassetid://10723386277",
			["folderoutput"] = "rbxassetid://10723386386",
			["folderplus"] = "rbxassetid://10723386531",
			["foldersearch"] = "rbxassetid://10723386787",
			["foldersearch2"] = "rbxassetid://10723386674",
			["foldersymlink"] = "rbxassetid://10723386930",
			["foldertree"] = "rbxassetid://10723387085",
			["folderup"] = "rbxassetid://10723387265",
			["folderx"] = "rbxassetid://10723387448",
			["folders"] = "rbxassetid://10723387721",
			["forminput"] = "rbxassetid://10723387841",
			["forward"] = "rbxassetid://10723388016",
			["frame"] = "rbxassetid://10723394389",
			["framer"] = "rbxassetid://10723394565",
			["frown"] = "rbxassetid://10723394681",
			["fuel"] = "rbxassetid://10723394846",
			["functionsquare"] = "rbxassetid://10723395041",
			["gamepad"] = "rbxassetid://10723395457",
			["gamepad2"] = "rbxassetid://10723395215",
			["gauge"] = "rbxassetid://10723395708",
			["gavel"] = "rbxassetid://10723395896",
			["gem"] = "rbxassetid://10723396000",
			["ghost"] = "rbxassetid://10723396107",
			["gift"] = "rbxassetid://10723396402",
			["giftcard"] = "rbxassetid://10723396225",
			["gitbranch"] = "rbxassetid://10723396676",
			["gitbranchplus"] = "rbxassetid://10723396542",
			["gitcommit"] = "rbxassetid://10723396812",
			["gitcompare"] = "rbxassetid://10723396954",
			["gitfork"] = "rbxassetid://10723397049",
			["gitmerge"] = "rbxassetid://10723397165",
			["gitpullrequest"] = "rbxassetid://10723397431",
			["gitpullrequestclosed"] = "rbxassetid://10723397268",
			["gitpullrequestdraft"] = "rbxassetid://10734884302",
			["glass"] = "rbxassetid://10723397788",
			["glass2"] = "rbxassetid://10723397529",
			["glasswater"] = "rbxassetid://10723397678",
			["glasses"] = "rbxassetid://10723397895",
			["globe"] = "rbxassetid://10723404337",
			["globe2"] = "rbxassetid://10723398002",
			["grab"] = "rbxassetid://10723404472",
			["graduationcap"] = "rbxassetid://10723404691",
			["grape"] = "rbxassetid://10723404822",
			["grid"] = "rbxassetid://10723404936",
			["griphorizontal"] = "rbxassetid://10723405089",
			["gripvertical"] = "rbxassetid://10723405236",
			["hammer"] = "rbxassetid://10723405360",
			["hand"] = "rbxassetid://10723405649",
			["handmetal"] = "rbxassetid://10723405508",
			["harddrive"] = "rbxassetid://10723405749",
			["hardhat"] = "rbxassetid://10723405859",
			["hash"] = "rbxassetid://10723405975",
			["haze"] = "rbxassetid://10723406078",
			["headphones"] = "rbxassetid://10723406165",
			["heart"] = "rbxassetid://10723406885",
			["heartcrack"] = "rbxassetid://10723406299",
			["hearthandshake"] = "rbxassetid://10723406480",
			["heartoff"] = "rbxassetid://10723406662",
			["heartpulse"] = "rbxassetid://10723406795",
			["helpcircle"] = "rbxassetid://10723406988",
			["hexagon"] = "rbxassetid://10723407092",
			["highlighter"] = "rbxassetid://10723407192",
			["history"] = "rbxassetid://10723407335",
			["home"] = "rbxassetid://10723407389",
			["hourglass"] = "rbxassetid://10723407498",
			["icecream"] = "rbxassetid://10723414308",
			["image"] = "rbxassetid://10723415040",
			["imageminus"] = "rbxassetid://10723414487",
			["imageoff"] = "rbxassetid://10723414677",
			["imageplus"] = "rbxassetid://10723414827",
			["import"] = "rbxassetid://10723415205",
			["inbox"] = "rbxassetid://10723415335",
			["indent"] = "rbxassetid://10723415494",
			["indianrupee"] = "rbxassetid://10723415642",
			["infinity"] = "rbxassetid://10723415766",
			["info"] = "rbxassetid://10723415903",
			["inspect"] = "rbxassetid://10723416057",
			["italic"] = "rbxassetid://10723416195",
			["japaneseyen"] = "rbxassetid://10723416363",
			["joystick"] = "rbxassetid://10723416527",
			["key"] = "rbxassetid://10723416652",
			["keyboard"] = "rbxassetid://10723416765",
			["lamp"] = "rbxassetid://10723417513",
			["lampceiling"] = "rbxassetid://10723416922",
			["lampdesk"] = "rbxassetid://10723417016",
			["lampfloor"] = "rbxassetid://10723417131",
			["lampwalldown"] = "rbxassetid://10723417240",
			["lampwallup"] = "rbxassetid://10723417356",
			["landmark"] = "rbxassetid://10723417608",
			["languages"] = "rbxassetid://10723417703",
			["laptop"] = "rbxassetid://10723423881",
			["laptop2"] = "rbxassetid://10723417797",
			["lasso"] = "rbxassetid://10723424235",
			["lassoselect"] = "rbxassetid://10723424058",
			["laugh"] = "rbxassetid://10723424372",
			["layers"] = "rbxassetid://10723424505",
			["layout"] = "rbxassetid://10723425376",
			["layoutdashboard"] = "rbxassetid://10723424646",
			["layoutgrid"] = "rbxassetid://10723424838",
			["layoutlist"] = "rbxassetid://10723424963",
			["layouttemplate"] = "rbxassetid://10723425187",
			["leaf"] = "rbxassetid://10723425539",
			["library"] = "rbxassetid://10723425615",
			["lifebuoy"] = "rbxassetid://10723425685",
			["lightbulb"] = "rbxassetid://10723425852",
			["lightbulboff"] = "rbxassetid://10723425762",
			["linechart"] = "rbxassetid://10723426393",
			["link"] = "rbxassetid://10723426722",
			["link2"] = "rbxassetid://10723426595",
			["link2off"] = "rbxassetid://10723426513",
			["list"] = "rbxassetid://10723433811",
			["listchecks"] = "rbxassetid://10734884548",
			["listend"] = "rbxassetid://10723426886",
			["listminus"] = "rbxassetid://10723426986",
			["listmusic"] = "rbxassetid://10723427081",
			["listordered"] = "rbxassetid://10723427199",
			["listplus"] = "rbxassetid://10723427334",
			["liststart"] = "rbxassetid://10723427494",
			["listvideo"] = "rbxassetid://10723427619",
			["listx"] = "rbxassetid://10723433655",
			["loader"] = "rbxassetid://10723434070",
			["loader2"] = "rbxassetid://10723433935",
			["locate"] = "rbxassetid://10723434557",
			["locatefixed"] = "rbxassetid://10723434236",
			["locateoff"] = "rbxassetid://10723434379",
			["lock"] = "rbxassetid://10723434711",
			["login"] = "rbxassetid://10723434830",
			["logout"] = "rbxassetid://10723434906",
			["luggage"] = "rbxassetid://10723434993",
			["magnet"] = "rbxassetid://10723435069",
			["mail"] = "rbxassetid://10734885430",
			["mailcheck"] = "rbxassetid://10723435182",
			["mailminus"] = "rbxassetid://10723435261",
			["mailopen"] = "rbxassetid://10723435342",
			["mailplus"] = "rbxassetid://10723435443",
			["mailquestion"] = "rbxassetid://10723435515",
			["mailsearch"] = "rbxassetid://10734884739",
			["mailwarning"] = "rbxassetid://10734885015",
			["mailx"] = "rbxassetid://10734885247",
			["mails"] = "rbxassetid://10734885614",
			["map"] = "rbxassetid://10734886202",
			["mappin"] = "rbxassetid://10734886004",
			["mappinoff"] = "rbxassetid://10734885803",
			["maximize"] = "rbxassetid://10734886735",
			["maximize2"] = "rbxassetid://10734886496",
			["medal"] = "rbxassetid://10734887072",
			["megaphone"] = "rbxassetid://10734887454",
			["megaphoneoff"] = "rbxassetid://10734887311",
			["meh"] = "rbxassetid://10734887603",
			["menu"] = "rbxassetid://10734887784",
			["messagecircle"] = "rbxassetid://10734888000",
			["messagesquare"] = "rbxassetid://10734888228",
			["mic"] = "rbxassetid://10734888864",
			["mic2"] = "rbxassetid://10734888430",
			["micoff"] = "rbxassetid://10734888646",
			["microscope"] = "rbxassetid://10734889106",
			["microwave"] = "rbxassetid://10734895076",
			["milestone"] = "rbxassetid://10734895310",
			["minimize"] = "rbxassetid://10734895698",
			["minimize2"] = "rbxassetid://10734895530",
			["minus"] = "rbxassetid://10734896206",
			["minuscircle"] = "rbxassetid://10734895856",
			["minussquare"] = "rbxassetid://10734896029",
			["monitor"] = "rbxassetid://10734896881",
			["monitoroff"] = "rbxassetid://10734896360",
			["monitorspeaker"] = "rbxassetid://10734896512",
			["moon"] = "rbxassetid://10734897102",
			["morehorizontal"] = "rbxassetid://10734897250",
			["morevertical"] = "rbxassetid://10734897387",
			["mountain"] = "rbxassetid://10734897956",
			["mountainsnow"] = "rbxassetid://10734897665",
			["mouse"] = "rbxassetid://10734898592",
			["mousepointer"] = "rbxassetid://10734898476",
			["mousepointer2"] = "rbxassetid://10734898194",
			["mousepointerclick"] = "rbxassetid://10734898355",
			["move"] = "rbxassetid://10734900011",
			["move3d"] = "rbxassetid://10734898756",
			["movediagonal"] = "rbxassetid://10734899164",
			["movediagonal2"] = "rbxassetid://10734898934",
			["movehorizontal"] = "rbxassetid://10734899414",
			["movevertical"] = "rbxassetid://10734899821",
			["music"] = "rbxassetid://10734905958",
			["music2"] = "rbxassetid://10734900215",
			["music3"] = "rbxassetid://10734905665",
			["music4"] = "rbxassetid://10734905823",
			["navigation"] = "rbxassetid://10734906744",
			["navigation2"] = "rbxassetid://10734906332",
			["navigation2off"] = "rbxassetid://10734906144",
			["navigationoff"] = "rbxassetid://10734906580",
			["network"] = "rbxassetid://10734906975",
			["newspaper"] = "rbxassetid://10734907168",
			["octagon"] = "rbxassetid://10734907361",
			["option"] = "rbxassetid://10734907649",
			["outdent"] = "rbxassetid://10734907933",
			["package"] = "rbxassetid://10734909540",
			["package2"] = "rbxassetid://10734908151",
			["packagecheck"] = "rbxassetid://10734908384",
			["packageminus"] = "rbxassetid://10734908626",
			["packageopen"] = "rbxassetid://10734908793",
			["packageplus"] = "rbxassetid://10734909016",
			["packagesearch"] = "rbxassetid://10734909196",
			["packagex"] = "rbxassetid://10734909375",
			["paintbucket"] = "rbxassetid://10734909847",
			["paintbrush"] = "rbxassetid://10734910187",
			["paintbrush2"] = "rbxassetid://10734910030",
			["palette"] = "rbxassetid://10734910430",
			["palmtree"] = "rbxassetid://10734910680",
			["paperclip"] = "rbxassetid://10734910927",
			["partypopper"] = "rbxassetid://10734918735",
			["pause"] = "rbxassetid://10734919336",
			["pausecircle"] = "rbxassetid://10735024209",
			["pauseoctagon"] = "rbxassetid://10734919143",
			["pentool"] = "rbxassetid://10734919503",
			["pencil"] = "rbxassetid://10734919691",
			["percent"] = "rbxassetid://10734919919",
			["personstanding"] = "rbxassetid://10734920149",
			["phone"] = "rbxassetid://10734921524",
			["phonecall"] = "rbxassetid://10734920305",
			["phoneforwarded"] = "rbxassetid://10734920508",
			["phoneincoming"] = "rbxassetid://10734920694",
			["phonemissed"] = "rbxassetid://10734920845",
			["phoneoff"] = "rbxassetid://10734921077",
			["phoneoutgoing"] = "rbxassetid://10734921288",
			["piechart"] = "rbxassetid://10734921727",
			["piggybank"] = "rbxassetid://10734921935",
			["pin"] = "rbxassetid://10734922324",
			["pinoff"] = "rbxassetid://10734922180",
			["pipette"] = "rbxassetid://10734922497",
			["pizza"] = "rbxassetid://10734922774",
			["plane"] = "rbxassetid://10734922971",
			["play"] = "rbxassetid://10734923549",
			["playcircle"] = "rbxassetid://10734923214",
			["plus"] = "rbxassetid://10734924532",
			["pluscircle"] = "rbxassetid://10734923868",
			["plussquare"] = "rbxassetid://10734924219",
			["podcast"] = "rbxassetid://10734929553",
			["pointer"] = "rbxassetid://10734929723",
			["poundsterling"] = "rbxassetid://10734929981",
			["power"] = "rbxassetid://10734930466",
			["poweroff"] = "rbxassetid://10734930257",
			["printer"] = "rbxassetid://10734930632",
			["puzzle"] = "rbxassetid://10734930886",
			["quote"] = "rbxassetid://10734931234",
			["radio"] = "rbxassetid://10734931596",
			["radioreceiver"] = "rbxassetid://10734931402",
			["rectanglehorizontal"] = "rbxassetid://10734931777",
			["rectanglevertical"] = "rbxassetid://10734932081",
			["recycle"] = "rbxassetid://10734932295",
			["redo"] = "rbxassetid://10734932822",
			["redo2"] = "rbxassetid://10734932586",
			["refreshccw"] = "rbxassetid://10734933056",
			["refreshcw"] = "rbxassetid://10734933222",
			["refrigerator"] = "rbxassetid://10734933465",
			["regex"] = "rbxassetid://10734933655",
			["repeat"] = "rbxassetid://10734933966",
			["repeat1"] = "rbxassetid://10734933826",
			["reply"] = "rbxassetid://10734934252",
			["replyall"] = "rbxassetid://10734934132",
			["rewind"] = "rbxassetid://10734934347",
			["rocket"] = "rbxassetid://10734934585",
			["rockingchair"] = "rbxassetid://10734939942",
			["rotate3d"] = "rbxassetid://10734940107",
			["rotateccw"] = "rbxassetid://10734940376",
			["rotatecw"] = "rbxassetid://10734940654",
			["rss"] = "rbxassetid://10734940825",
			["ruler"] = "rbxassetid://10734941018",
			["russianruble"] = "rbxassetid://10734941199",
			["sailboat"] = "rbxassetid://10734941354",
			["save"] = "rbxassetid://10734941499",
			["scale"] = "rbxassetid://10734941912",
			["scale3d"] = "rbxassetid://10734941739",
			["scaling"] = "rbxassetid://10734942072",
			["scan"] = "rbxassetid://10734942565",
			["scanface"] = "rbxassetid://10734942198",
			["scanline"] = "rbxassetid://10734942351",
			["scissors"] = "rbxassetid://10734942778",
			["screenshare"] = "rbxassetid://10734943193",
			["screenshareoff"] = "rbxassetid://10734942967",
			["scroll"] = "rbxassetid://10734943448",
			["search"] = "rbxassetid://10734943674",
			["send"] = "rbxassetid://10734943902",
			["separatorhorizontal"] = "rbxassetid://10734944115",
			["separatorvertical"] = "rbxassetid://10734944326",
			["server"] = "rbxassetid://10734949856",
			["servercog"] = "rbxassetid://10734944444",
			["servercrash"] = "rbxassetid://10734944554",
			["serveroff"] = "rbxassetid://10734944668",
			["settings"] = "rbxassetid://10734950309",
			["settings2"] = "rbxassetid://10734950020",
			["share"] = "rbxassetid://10734950813",
			["share2"] = "rbxassetid://10734950553",
			["sheet"] = "rbxassetid://10734951038",
			["shield"] = "rbxassetid://10734951847",
			["shieldalert"] = "rbxassetid://10734951173",
			["shieldcheck"] = "rbxassetid://10734951367",
			["shieldclose"] = "rbxassetid://10734951535",
			["shieldoff"] = "rbxassetid://10734951684",
			["shirt"] = "rbxassetid://10734952036",
			["shoppingbag"] = "rbxassetid://10734952273",
			["shoppingcart"] = "rbxassetid://10734952479",
			["shovel"] = "rbxassetid://10734952773",
			["showerhead"] = "rbxassetid://10734952942",
			["shrink"] = "rbxassetid://10734953073",
			["shrub"] = "rbxassetid://10734953241",
			["shuffle"] = "rbxassetid://10734953451",
			["sidebar"] = "rbxassetid://10734954301",
			["sidebarclose"] = "rbxassetid://10734953715",
			["sidebaropen"] = "rbxassetid://10734954000",
			["sigma"] = "rbxassetid://10734954538",
			["signal"] = "rbxassetid://10734961133",
			["signalhigh"] = "rbxassetid://10734954807",
			["signallow"] = "rbxassetid://10734955080",
			["signalmedium"] = "rbxassetid://10734955336",
			["signalzero"] = "rbxassetid://10734960878",
			["siren"] = "rbxassetid://10734961284",
			["skipback"] = "rbxassetid://10734961526",
			["skipforward"] = "rbxassetid://10734961809",
			["skull"] = "rbxassetid://10734962068",
			["slack"] = "rbxassetid://10734962339",
			["slash"] = "rbxassetid://10734962600",
			["slice"] = "rbxassetid://10734963024",
			["sliders"] = "rbxassetid://10734963400",
			["slidershorizontal"] = "rbxassetid://10734963191",
			["smartphone"] = "rbxassetid://10734963940",
			["smartphonecharging"] = "rbxassetid://10734963671",
			["smile"] = "rbxassetid://10734964441",
			["smileplus"] = "rbxassetid://10734964188",
			["snowflake"] = "rbxassetid://10734964600",
			["sofa"] = "rbxassetid://10734964852",
			["sortasc"] = "rbxassetid://10734965115",
			["sortdesc"] = "rbxassetid://10734965287",
			["speaker"] = "rbxassetid://10734965419",
			["sprout"] = "rbxassetid://10734965572",
			["square"] = "rbxassetid://10734965702",
			["star"] = "rbxassetid://10734966248",
			["starhalf"] = "rbxassetid://10734965897",
			["staroff"] = "rbxassetid://10734966097",
			["stethoscope"] = "rbxassetid://10734966384",
			["sticker"] = "rbxassetid://10734972234",
			["stickynote"] = "rbxassetid://10734972463",
			["stopcircle"] = "rbxassetid://10734972621",
			["stretchhorizontal"] = "rbxassetid://10734972862",
			["stretchvertical"] = "rbxassetid://10734973130",
			["strikethrough"] = "rbxassetid://10734973290",
			["subscript"] = "rbxassetid://10734973457",
			["sun"] = "rbxassetid://10734974297",
			["sundim"] = "rbxassetid://10734973645",
			["sunmedium"] = "rbxassetid://10734973778",
			["sunmoon"] = "rbxassetid://10734973999",
			["sunsnow"] = "rbxassetid://10734974130",
			["sunrise"] = "rbxassetid://10734974522",
			["sunset"] = "rbxassetid://10734974689",
			["superscript"] = "rbxassetid://10734974850",
			["swissfranc"] = "rbxassetid://10734975024",
			["switchcamera"] = "rbxassetid://10734975214",
			["sword"] = "rbxassetid://10734975486",
			["swords"] = "rbxassetid://10734975692",
			["syringe"] = "rbxassetid://10734975932",
			["table"] = "rbxassetid://10734976230",
			["table2"] = "rbxassetid://10734976097",
			["tablet"] = "rbxassetid://10734976394",
			["tag"] = "rbxassetid://10734976528",
			["tags"] = "rbxassetid://10734976739",
			["target"] = "rbxassetid://10734977012",
			["tent"] = "rbxassetid://10734981750",
			["terminal"] = "rbxassetid://10734982144",
			["terminalsquare"] = "rbxassetid://10734981995",
			["textcursor"] = "rbxassetid://10734982395",
			["textcursorinput"] = "rbxassetid://10734982297",
			["thermometer"] = "rbxassetid://10734983134",
			["thermometersnowflake"] = "rbxassetid://10734982571",
			["thermometersun"] = "rbxassetid://10734982771",
			["thumbsdown"] = "rbxassetid://10734983359",
			["thumbsup"] = "rbxassetid://10734983629",
			["ticket"] = "rbxassetid://10734983868",
			["timer"] = "rbxassetid://10734984606",
			["timeroff"] = "rbxassetid://10734984138",
			["timerreset"] = "rbxassetid://10734984355",
			["toggleleft"] = "rbxassetid://10734984834",
			["toggleright"] = "rbxassetid://10734985040",
			["tornado"] = "rbxassetid://10734985247",
			["toybrick"] = "rbxassetid://10747361919",
			["train"] = "rbxassetid://10747362105",
			["trash"] = "rbxassetid://10747362393",
			["trash2"] = "rbxassetid://10747362241",
			["treedeciduous"] = "rbxassetid://10747362534",
			["treepine"] = "rbxassetid://10747362748",
			["trees"] = "rbxassetid://10747363016",
			["trendingdown"] = "rbxassetid://10747363205",
			["trendingup"] = "rbxassetid://10747363465",
			["triangle"] = "rbxassetid://10747363621",
			["trophy"] = "rbxassetid://10747363809",
			["truck"] = "rbxassetid://10747364031",
			["tv"] = "rbxassetid://10747364593",
			["tv2"] = "rbxassetid://10747364302",
			["type"] = "rbxassetid://10747364761",
			["umbrella"] = "rbxassetid://10747364971",
			["underline"] = "rbxassetid://10747365191",
			["undo"] = "rbxassetid://10747365484",
			["undo2"] = "rbxassetid://10747365359",
			["unlink"] = "rbxassetid://10747365771",
			["unlink2"] = "rbxassetid://10747397871",
			["unlock"] = "rbxassetid://10747366027",
			["upload"] = "rbxassetid://10747366434",
			["uploadcloud"] = "rbxassetid://10747366266",
			["usb"] = "rbxassetid://10747366606",
			["user"] = "rbxassetid://10747373176",
			["usercheck"] = "rbxassetid://10747371901",
			["usercog"] = "rbxassetid://10747372167",
			["userminus"] = "rbxassetid://10747372346",
			["userplus"] = "rbxassetid://10747372702",
			["userx"] = "rbxassetid://10747372992",
			["users"] = "rbxassetid://10747373426",
			["utensils"] = "rbxassetid://10747373821",
			["utensilscrossed"] = "rbxassetid://10747373629",
			["venetianmask"] = "rbxassetid://10747374003",
			["verified"] = "rbxassetid://10747374131",
			["vibrate"] = "rbxassetid://10747374489",
			["vibrateoff"] = "rbxassetid://10747374269",
			["video"] = "rbxassetid://10747374938",
			["videooff"] = "rbxassetid://10747374721",
			["view"] = "rbxassetid://10747375132",
			["voicemail"] = "rbxassetid://10747375281",
			["volume"] = "rbxassetid://10747376008",
			["volume1"] = "rbxassetid://10747375450",
			["volume2"] = "rbxassetid://10747375679",
			["volumex"] = "rbxassetid://10747375880",
			["wallet"] = "rbxassetid://10747376205",
			["wand"] = "rbxassetid://10747376565",
			["wand2"] = "rbxassetid://10747376349",
			["watch"] = "rbxassetid://10747376722",
			["waves"] = "rbxassetid://10747376931",
			["webcam"] = "rbxassetid://10747381992",
			["wifi"] = "rbxassetid://10747382504",
			["wifioff"] = "rbxassetid://10747382268",
			["wind"] = "rbxassetid://10747382750",
			["wraptext"] = "rbxassetid://10747383065",
			["wrench"] = "rbxassetid://10747383470",
			["x"] = "rbxassetid://10747384394",
			["xcircle"] = "rbxassetid://10747383819",
			["xoctagon"] = "rbxassetid://10747384037",
			["xsquare"] = "rbxassetid://10747384217",
			["zoomin"] = "rbxassetid://10747384552",
			["zoomout"] = "rbxassetid://10747384679"
		}
	end)()
}

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
	local mi = o.Min or 0
	local ma = o.Max or 100
	local df = o.Default or mi
	if JustHub.ConfigData[n] ~= nil then
		df = JustHub.ConfigData[n]
	else
		JustHub.ConfigData[n] = df
	end
	local cb = o.Callback or function(x) end
	local f = createInstance("Frame", {Name = n.."Slider", Size = UDim2.new(1,0,0,25), BackgroundTransparency = 1}, self.Content)
	addBorder(f, getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], 1)
	local l = createInstance("TextLabel", {
		Name = "Label",
		Text = n,
		Size = UDim2.new(0.7,0,1,0),
		Position = UDim2.new(0,0,0,0),
		BackgroundTransparency = 1,
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		Font = Enum.Font.Gotham,
		TextSize = 10
	}, f)
	local sep = createInstance("Frame", {
		Size = UDim2.new(0,2,1,0),
		Position = UDim2.new(0.7,0,0,0),
		BackgroundColor3 = Color3.fromRGB(255,255,255)
	}, f)
	createInstance("UICorner", {CornerRadius = UDim.new(0,1)}, sep)
	local sc = createInstance("Frame", {
		Name = "SliderContainer",
		Size = UDim2.new(0.3,0,1,0),
		Position = UDim2.new(0.7,0,0,0),
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
	local sh = createInstance("Frame", {
		Name = "SliderHandle",
		Size = UDim2.new(0,12,0,12),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Theme"],
		Position = UDim2.new(defaultRatio, -6, 0.5, -6)
	}, sb)
	createInstance("UICorner", {CornerRadius = UDim.new(0,4)}, sh)
	local drag = false
	sh.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			drag = true
		end
	end)
	sh.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			drag = false
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local bp = sb.AbsolutePosition.X
			local bw = sb.AbsoluteSize.X
			local rp = math.clamp((i.Position.X - bp) / bw, 0, 1)
			sh.Position = UDim2.new(rp, -6, sh.Position.Y.Scale, sh.Position.Y.Offset)
			local val = mi + rp * (ma - mi)
			JustHub.ConfigData[n] = val
			cb(val)
		end
	end)
	JustHub:RegisterControl(n, function(sv)
		local nr = (sv - mi) / (ma - mi)
		sh.Position = UDim2.new(nr, -6, 0.5, -6)
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
	o=o or {}
	local t=o.Name or "Dropdown"
	local df=o.Default or ""
	local it=o.Items or {}
	local cb=o.Callback or function(x)end
	local ch=20
	local oh=ch+(#it*20+((#it-1)*2))
	local f=createInstance("Frame",{Name=t.."Dropdown",BackgroundTransparency=1},self.Content)
	f.Size=UDim2.new(1,0,0,ch)
	addBorder(f,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],1)
	local l=createInstance("TextLabel",{Name="Label",Text=t,Size=UDim2.new(0.7,0,0,ch),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.Gotham,TextSize=10},f)
	local b=createInstance("TextButton",{Name="DropdownButton",Text=(df~="" and (df.." ▼") or "Select ▼"),Size=UDim2.new(0.3,0,0,ch),Position=UDim2.new(0.7,0,0,0),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],Font=Enum.Font.GothamBold,TextSize=10},f)
	local lf=createInstance("Frame",{Name="DropdownList",BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Hub 2"],Visible=false,Position=UDim2.new(0,0,0,ch)},f)
	lf.Size=UDim2.new(1,0,0,#it*20+((#it-1)*2))
	createInstance("UIListLayout",{Padding=UDim.new(0,2),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Left},lf)
	local dt=false
	b.MouseButton1Click:Connect(function()
		if dt then
			tweenProperty(f,{Size=UDim2.new(1,0,0,ch)},0.2)
			tweenProperty(b,{TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"]},0.2)
			tweenProperty(lf,{Position=UDim2.new(0,0,0,ch-10)},0.2)
			wait(0.2)
			lf.Visible=false
		else
			lf.Position=UDim2.new(0,0,0,ch-10)
			lf.Visible=true
			tweenProperty(f,{Size=UDim2.new(1,0,0,oh)},0.2)
			tweenProperty(b,{TextColor3=Color3.fromRGB(0,255,0)},0.2)
			tweenProperty(lf,{Position=UDim2.new(0,0,0,ch)},0.2)
		end
		dt=not dt
	end)
	for _,op in ipairs(it) do
		local btn=createInstance("TextButton",{Size=UDim2.new(1,0,0,20),Text=op,TextColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Font=Enum.Font.Gotham,TextSize=10},lf)
		btn.MouseButton1Click:Connect(function()
			l.Text=t.." - "..op
			JustHub.ConfigData[t]=op
			pcall(cb,op)
			tweenProperty(f,{Size=UDim2.new(1,0,0,ch)},0.2)
			dt=false
			wait(0.2)
			lf.Visible=false
		end)
	end
	JustHub.ConfigData[t]=df
	JustHub:RegisterControl(t,function(sv)
		l.Text=t.." - "..sv
	end)
	local upd={}
	function upd:Clear()
		for i,v in pairs(lf:GetChildren()) do
			if v:IsA("TextButton") then
				v:Destroy()
				dt=false
				l.Text=t
				tweenProperty(f,{Size=UDim2.new(1,0,0,ch)},0.2)
			end
		end
	end
	function upd:Refresh(nl)
		nl=nl or {}
		for i,v in pairs(nl) do
			local btn=createInstance("TextButton",{Size=UDim2.new(1,0,0,25),Text=v,TextColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Font=Enum.Font.SourceSansSemibold,TextSize=12},lf)
			btn.MouseButton1Click:Connect(function()
				dt=false
				l.Text=t.." - "..v
				pcall(cb,v)
				tweenProperty(f,{Size=UDim2.new(1,0,0,ch)},0.2)
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

function JustHub:addSection(sn, sh)
	sn = sn or "Section"
	sh = sh or 100
	local sf = createInstance("Frame", {
		Name = sn,
		Size = UDim2.new(1, 0, 0, sh),
		BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Hub 2"],
		BackgroundTransparency = 0
	}, nil)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, sf)
	local st = createInstance("TextLabel", {
		Name = "SectionTitle",
		Text = sn,
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundTransparency = 1,
		TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left
	}, sf)
	local sc = createInstance("Frame", {
		Name = "SectionContent",
		Size = UDim2.new(1, 0, 1, -30),
		Position = UDim2.new(0, 0, 0, 30),
		BackgroundTransparency = 1
	}, sf)
	createInstance("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Left
	}, sc)
	local so = {Frame = sf, Title = st, Content = sc}
	setmetatable(so, {__index = SectionMethods})
	return so
end

function JustHub:CreateWindow(o)
	o = o or {}
	local wn = o.Name or "JustHub Window"
	local th = getCurrentTheme(o.Theme)
	local subTitle = o.SubTitle or "SubTitle"
	local ft = wn .. " - " .. subTitle
	local pl = Players.LocalPlayer
	local pg = pl:WaitForChild("PlayerGui")
	local sg = createInstance("ScreenGui", {Name = "JustHub", ResetOnSpawn = false}, pg)
	self.ScreenGui = sg
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
			Size = UDim2.new(1, -180, 1, 0),
			Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1,
			Text = ft,
			TextColor3 = th["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 18,
			TextXAlignment = Enum.TextXAlignment.Left
		}, tb)
		addBorder(tl, th["Color Stroke"], 1)
		local resetBtn = createInstance("TextButton", {
			Name = "ResetButton",
			Text = "Reset",
			Size = UDim2.new(0, 50, 0, 30),
			Position = UDim2.new(0, 10, 0, -29),
			BackgroundColor3 = th["Color Hub 2"],
			TextColor3 = th["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			BackgroundTransparency = 0.2
		}, tb)
		addBorder(resetBtn, th["Color Stroke"], 1)
		local lockBtn = createInstance("TextButton", {
			Name = "LockButton",
			Text = "Lock",
			Size = UDim2.new(0, 50, 0, 30),
			Position = UDim2.new(0, 70, 0, -29),
			BackgroundColor3 = th["Color Hub 2"],
			TextColor3 = th["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			BackgroundTransparency = 0.2
		}, tb)
		addBorder(lockBtn, th["Color Stroke"], 1)
		return tb, resetBtn, lockBtn
	end
	local tb, resetBtn, lockBtn = initTopBar()
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
	RunService.Heartbeat:Connect(function(d)
		local fps = math.floor(1 / d)
		fl.Text = "FPS: " .. fps
	end)
	local windowTween = TweenService:Create(mf, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)})
	windowTween:Play()
	local originalSize = mf.Size
	local originalPosition = mf.Position
	local isLocked = false
	local minimized = false
	local maximized = false
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
			local showBtn = createControlButton("ShowUIButton", "Show UI", UDim2.new(0.5, -75, 0, -20))
			showBtn.Parent = showUI
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
	local dragging = false
	local dragStart, startPos
	mf.InputBegan:Connect(function(inp)
		if (inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch) and not isLocked then
			dragging = true
			dragStart = inp.Position
			startPos = mf.Position
		end
	end)
	mf.InputChanged:Connect(function(inp)
		if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
			local delta = inp.Position - dragStart
			local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			newPos = clampPosition(newPos, Vector2.new(sg.AbsoluteSize.X, sg.AbsoluteSize.Y))
			mf.Position = newPos
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
	local resizeGrip = Instance.new("Frame")
	resizeGrip.Name = "ResizeGrip"
	resizeGrip.Size = UDim2.new(0, 20, 0, 20)
	resizeGrip.Position = UDim2.new(1, -20, 1, -20)
	resizeGrip.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	resizeGrip.BackgroundTransparency = 0.3
	resizeGrip.BorderSizePixel = 0
	resizeGrip.Parent = mf
	local resizeCorner = Instance.new("UICorner", resizeGrip)
	resizeCorner.CornerRadius = UDim.new(0, 5)
	local resizing = false
	local startSize
	resizeGrip.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
			resizing = true
			dragStart = inp.Position
			startSize = mf.Size
		end
	end)
	resizeGrip.InputChanged:Connect(function(inp)
		if resizing and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
			local delta = inp.Position - dragStart
			local newW = math.max(300, startSize.X.Offset + delta.X)
			local newH = math.max(200, startSize.Y.Offset + delta.Y)
			mf.Size = UDim2.new(0, newW, 0, newH)
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
			resizing = false
		end
	end)
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
		local b = createControlButton(tn .. "Button", tn, UDim2.new(0, 0, 0, 0))
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
			addBorder(sframe, th["Color Stroke"], 2)
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

function JustHub:ShowLoadingScreen(d, cb)
	d = d or 5
	cb = cb or function() end
	local pl = Players.LocalPlayer
	local pg = pl:WaitForChild("PlayerGui")
	local lg = createInstance("ScreenGui", {Name = "LoadingScreen", ResetOnSpawn = false, IgnoreGuiInset = true}, pg)
	local bg = createInstance("Frame", {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), BackgroundColor3 = Color3.new(0, 0, 0), BackgroundTransparency = 0.5, BorderSizePixel = 0}, lg)
	local tl = createInstance("TextLabel", {Text = "JustHub Library", Font = Enum.Font.SourceSansSemibold, TextSize = 20, TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"], BackgroundTransparency = 1, Size = UDim2.new(0, 200, 0, 50), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, -50)}, lg)
	local wl = createInstance("TextLabel", {Text = "Welcome, " .. pl.Name, Font = Enum.Font.SourceSansSemibold, TextSize = 16, TextColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Text"], BackgroundTransparency = 1, Size = UDim2.new(0, 200, 0, 30), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0.5, 10)}, lg)
	local pbc = createInstance("Frame", {Size = UDim2.new(0.5, 0, 0, 20), Position = UDim2.new(0.5, 0, 0.5, 50), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Stroke"], BackgroundTransparency = 0.5, BorderSizePixel = 0}, lg)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, pbc)
	local pbf = createInstance("Frame", {Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = getCurrentTheme(JustHub.Save.Theme)["Color Theme"], BorderSizePixel = 0}, pbc)
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
		StarterGui:SetCore("SendNotification", {Title = "Save Config", Text = "Config berhasil disimpan ke " .. f, Duration = 5})
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