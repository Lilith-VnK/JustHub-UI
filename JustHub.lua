local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local JustHub = {}

JustHub.Themes = {
	Darker = {["Color Hub 1"] = Color3.fromRGB(20, 20, 25), ["Color Hub 2"] = Color3.fromRGB(30, 30, 35), ["Color Stroke"] = Color3.fromRGB(50, 50, 55), ["Color Theme"] = Color3.fromRGB(100, 255, 150), ["Color Text"] = Color3.fromRGB(240, 240, 245), ["Color Dark Text"] = Color3.fromRGB(160, 160, 170)},
	Dark = {["Color Hub 1"] = Color3.fromRGB(35, 35, 40), ["Color Hub 2"] = Color3.fromRGB(45, 45, 50), ["Color Stroke"] = Color3.fromRGB(70, 70, 80), ["Color Theme"] = Color3.fromRGB(80, 200, 255), ["Color Text"] = Color3.fromRGB(245, 245, 250), ["Color Dark Text"] = Color3.fromRGB(170, 170, 180)},
	Purple = {["Color Hub 1"] = Color3.fromRGB(30, 25, 40), ["Color Hub 2"] = Color3.fromRGB(40, 35, 50), ["Color Stroke"] = Color3.fromRGB(60, 50, 75), ["Color Theme"] = Color3.fromRGB(150, 100, 255), ["Color Text"] = Color3.fromRGB(240, 240, 245), ["Color Dark Text"] = Color3.fromRGB(170, 160, 190)},
	Light = {["Color Hub 1"] = Color3.fromRGB(220, 220, 225), ["Color Hub 2"] = Color3.fromRGB(235, 235, 240), ["Color Stroke"] = Color3.fromRGB(190, 190, 200), ["Color Theme"] = Color3.fromRGB(0, 140, 255), ["Color Text"] = Color3.fromRGB(40, 40, 45), ["Color Dark Text"] = Color3.fromRGB(90, 90, 100)},
	Neon = {["Color Hub 1"] = Color3.fromRGB(5, 5, 10), ["Color Hub 2"] = Color3.fromRGB(10, 10, 15), ["Color Stroke"] = Color3.fromRGB(0, 255, 255), ["Color Theme"] = Color3.fromRGB(0, 255, 100), ["Color Text"] = Color3.fromRGB(255, 255, 255), ["Color Dark Text"] = Color3.fromRGB(200, 255, 255)},
	Forest = {["Color Hub 1"] = Color3.fromRGB(0, 40, 20), ["Color Hub 2"] = Color3.fromRGB(0, 55, 25), ["Color Stroke"] = Color3.fromRGB(0, 90, 40), ["Color Theme"] = Color3.fromRGB(50, 205, 50), ["Color Text"] = Color3.fromRGB(230, 255, 230), ["Color Dark Text"] = Color3.fromRGB(170, 200, 170)},
	Aqua = {["Color Hub 1"] = Color3.fromRGB(0, 90, 100), ["Color Hub 2"] = Color3.fromRGB(0, 120, 130), ["Color Stroke"] = Color3.fromRGB(0, 190, 210), ["Color Theme"] = Color3.fromRGB(0, 230, 255), ["Color Text"] = Color3.fromRGB(250, 255, 255), ["Color Dark Text"] = Color3.fromRGB(200, 230, 240)},
	Crimson = {["Color Hub 1"] = Color3.fromRGB(50, 0, 10), ["Color Hub 2"] = Color3.fromRGB(80, 0, 15), ["Color Stroke"] = Color3.fromRGB(140, 0, 30), ["Color Theme"] = Color3.fromRGB(255, 50, 80), ["Color Text"] = Color3.fromRGB(255, 240, 240), ["Color Dark Text"] = Color3.fromRGB(220, 180, 180)},
	Solar = {["Color Hub 1"] = Color3.fromRGB(255, 210, 0), ["Color Hub 2"] = Color3.fromRGB(255, 200, 0), ["Color Stroke"] = Color3.fromRGB(255, 130, 0), ["Color Theme"] = Color3.fromRGB(255, 80, 0), ["Color Text"] = Color3.fromRGB(30, 30, 30), ["Color Dark Text"] = Color3.fromRGB(70, 70, 70)},
	Pastel = {["Color Hub 1"] = Color3.fromRGB(220, 200, 230), ["Color Hub 2"] = Color3.fromRGB(245, 230, 255), ["Color Stroke"] = Color3.fromRGB(190, 170, 210), ["Color Theme"] = Color3.fromRGB(170, 210, 240), ["Color Text"] = Color3.fromRGB(70, 70, 70), ["Color Dark Text"] = Color3.fromRGB(110, 110, 110)},
	Cyber = {["Color Hub 1"] = Color3.fromRGB(5, 5, 20), ["Color Hub 2"] = Color3.fromRGB(15, 15, 35), ["Color Stroke"] = Color3.fromRGB(0, 220, 255), ["Color Theme"] = Color3.fromRGB(0, 180, 255), ["Color Text"] = Color3.fromRGB(250, 255, 255), ["Color Dark Text"] = Color3.fromRGB(190, 230, 255)},
	Ocean = {["Color Hub 1"] = Color3.fromRGB(0, 25, 50), ["Color Hub 2"] = Color3.fromRGB(0, 45, 90), ["Color Stroke"] = Color3.fromRGB(0, 100, 180), ["Color Theme"] = Color3.fromRGB(0, 150, 255), ["Color Text"] = Color3.fromRGB(230, 245, 255), ["Color Dark Text"] = Color3.fromRGB(180, 210, 230)},
	Desert = {["Color Hub 1"] = Color3.fromRGB(200, 170, 130), ["Color Hub 2"] = Color3.fromRGB(220, 180, 130), ["Color Stroke"] = Color3.fromRGB(150, 80, 40), ["Color Theme"] = Color3.fromRGB(220, 150, 30), ["Color Text"] = Color3.fromRGB(50, 40, 30), ["Color Dark Text"] = Color3.fromRGB(90, 80, 70)},
	Galaxy = {["Color Hub 1"] = Color3.fromRGB(10, 0, 40), ["Color Hub 2"] = Color3.fromRGB(20, 0, 50), ["Color Stroke"] = Color3.fromRGB(90, 0, 150), ["Color Theme"] = Color3.fromRGB(140, 0, 255), ["Color Text"] = Color3.fromRGB(245, 245, 255), ["Color Dark Text"] = Color3.fromRGB(200, 200, 230)},
	Vintage = {["Color Hub 1"] = Color3.fromRGB(140, 110, 80), ["Color Hub 2"] = Color3.fromRGB(150, 120, 90), ["Color Stroke"] = Color3.fromRGB(110, 80, 60), ["Color Theme"] = Color3.fromRGB(190, 150, 120), ["Color Text"] = Color3.fromRGB(70, 50, 40), ["Color Dark Text"] = Color3.fromRGB(100, 90, 80)},
	Rainbow = {["Color Hub 1"] = Color3.fromRGB(255, 0, 0), ["Color Hub 2"] = Color3.fromRGB(230, 230, 230), ["Color Stroke"] = Color3.fromRGB(50, 50, 50), ["Color Theme"] = Color3.fromRGB(255, 100, 100), ["Color Text"] = Color3.fromRGB(30, 30, 30), ["Color Dark Text"] = Color3.fromRGB(90, 90, 90)},
	Midnight = {["Color Hub 1"] = Color3.fromRGB(0, 0, 30), ["Color Hub 2"] = Color3.fromRGB(5, 5, 40), ["Color Stroke"] = Color3.fromRGB(0, 0, 100), ["Color Theme"] = Color3.fromRGB(50, 50, 255), ["Color Text"] = Color3.fromRGB(250, 250, 255), ["Color Dark Text"] = Color3.fromRGB(190, 190, 220)}
}

JustHub.Info = {Version = "2.2.0"}
JustHub.Save = {UISize = {620, 440}, TabSize = 135, Theme = "Darker"}
JustHub.ConfigData = {}
JustHub.ControlRegistry = {}
JustHub.Localization = {}
JustHub.CurrentLang = "en"
JustHub.UserRole = "member"
JustHub.UndoStack = {}
JustHub.RedoStack = {}
JustHub.Sounds = {ButtonClick = 0, SliderMove = 0}

JustHub.ChromaEnabled = false
JustHub.ChromaObjects = {}

JustHub.Icons = (function()
	local iconData = {
		{"accessibility", 10709751939}, {"activity", 10709752035}, {"airvent", 10709752131}, {"airplay", 10709752254}, {"alarmcheck", 10709752405}, {"alarmclock", 10709752630}, {"alarmclockoff", 10709752508}, {"alarmminus", 10709752732}, {"alarmplus", 10709752825}, {"album", 10709752906}, {"alertcircle", 10709752996}, {"alertoctagon", 10709753064}, {"alerttriangle", 10709753149}, {"aligncenter", 10709753570}, {"aligncenterhorizontal", 10709753272}, {"aligncentervertical", 10709753421}, {"alignendhorizontal", 10709753692}, {"alignendvertical", 10709753808}, {"alignhorizontaldistributecenter", 10747779791}, {"alignhorizontaldistributeend", 10747784534}, {"alignhorizontaldistributestart", 10709754118}, {"alignhorizontaljustifycenter", 10709754204}, {"alignhorizontaljustifyend", 10709754317}, {"alignhorizontaljustifystart", 10709754436}, {"alignhorizontalspacearound", 10709754590}, {"alignhorizontalspacebetween", 10709754749}, {"alignjustify", 10709759610}, {"alignleft", 10709759764}, {"alignright", 10709759895}, {"alignstarthorizontal", 10709760051}, {"alignstartvertical", 10709760244}, {"alignverticaldistributecenter", 10709760351}, {"alignverticaldistributeend", 10709760434}, {"alignverticaldistributestart", 10709760612}, {"alignverticaljustifycenter", 10709760814}, {"alignverticaljustifyend", 10709761003}, {"alignverticaljustifystart", 10709761176}, {"alignverticalspacearound", 10709761324}, {"alignverticalspacebetween", 10709761434}, {"anchor", 10709761530}, {"angry", 10709761629}, {"annoyed", 10709761722}, {"aperture", 10709761813}, {"apple", 10709761889}, {"archive", 10709762233}, {"archiverestore", 10709762058}, {"armchair", 10709762327}, {"arrowbigdown", 10747796644}, {"arrowbigleft", 10709762574}, {"arrowbigright", 10709762727}, {"arrowbigup", 10709762879}, {"arrowdown", 10709767827}, {"arrowdowncircle", 10709763034}, {"arrowdownleft", 10709767656}, {"arrowdownright", 10709767750}, {"arrowleft", 10709768114}, {"arrowleftcircle", 10709767936}, {"arrowleftright", 10709768019}, {"arrowright", 10709768347}, {"arrowrightcircle", 10709768226}, {"arrowup", 10709768939}, {"arrowupcircle", 10709768432}, {"arrowupdown", 10709768538}, {"arrowupleft", 10709768661}, {"arrowupright", 10709768787}, {"asterisk", 10709769095}, {"atsign", 10709769286}, {"award", 10709769406}, {"axe", 10709769508}, {"axis3d", 10709769598}, {"baby", 10709769732}, {"backpack", 10709769841}, {"baggageclaim", 10709769935}, {"banana", 10709770005}, {"banknote", 10709770178}, {"barchart", 10709773755}, {"barchart2", 10709770317}, {"barchart3", 10709770431}, {"barchart4", 10709770560}, {"barcharthorizontal", 10709773669}, {"barcode", 10747360675}, {"baseline", 10709773863}, {"bath", 10709773963}, {"battery", 10709774640}, {"batterycharging", 10709774068}, {"batteryfull", 10709774206}, {"batterylow", 10709774370}, {"batterymedium", 10709774513}, {"beaker", 10709774756}, {"bed", 10709775036}, {"beddouble", 10709774864}, {"bedsingle", 10709774968}, {"beer", 10709775167}, {"bell", 10709775704}, {"bellminus", 10709775241}, {"belloff", 10709775320}, {"bellplus", 10709775448}, {"bellring", 10709775560}, {"bike", 10709775894}, {"binary", 10709776050}, {"bitcoin", 10709776126}, {"bluetooth", 10709776655}, {"bluetoothconnected", 10709776240}, {"bluetoothoff", 10709776344}, {"bluetoothsearching", 10709776501}, {"bold", 10747813908}, {"bomb", 10709781460}, {"bone", 10709781605}, {"book", 10709781824}, {"bookopen", 10709781717}, {"bookmark", 10709782154}, {"bookmarkminus", 10709781919}, {"bookmarkplus", 10709782044}, {"bot", 10709782230}, {"box", 10709782497}, {"boxselect", 10709782342}, {"boxes", 10709782582}, {"briefcase", 10709782662}, {"brush", 10709782758}, {"bug", 10709782845}, {"building", 10709783051}, {"building2", 10709782939}, {"bus", 10709783137}, {"cake", 10709783217}, {"calculator", 10709783311}, {"calendar", 10709789505}, {"calendarcheck", 10709783474}, {"calendarcheck2", 10709783392}, {"calendarclock", 10709783577}, {"calendardays", 10709783673}, {"calendarheart", 10709783835}, {"calendarminus", 10709783959}, {"calendaroff", 10709788784}, {"calendarplus", 10709788937}, {"calendarrange", 10709789053}, {"calendarsearch", 10709789200}, {"calendarx", 10709789407}, {"calendarx2", 10709789329}, {"camera", 10709789686}, {"cameraoff", 10747822677}, {"car", 10709789810}, {"carrot", 10709789960}, {"cast", 10709790097}, {"charge", 10709790202}, {"check", 10709790644}, {"checkcircle", 10709790387}, {"checkcircle2", 10709790298}, {"checksquare", 10709790537}, {"chefhat", 10709790757}, {"cherry", 10709790875}, {"chevrondown", 10709790948}, {"chevronfirst", 10709791015}, {"chevronlast", 10709791130}, {"chevronleft", 10709791281}, {"chevronright", 10709791437}, {"chevronup", 10709791523}, {"chevronsdown", 10709796864}, {"chevronsdownup", 10709791632}, {"chevronsleft", 10709797151}, {"chevronsleftright", 10709797006}, {"chevronsright", 10709797382}, {"chevronsrightleft", 10709797274}, {"chevronsup", 10709797622}, {"chevronsupdown", 10709797508}, {"chrome", 10709797725}, {"circle", 10709798174}, {"circledot", 10709797837}, {"circleellipsis", 10709797985}, {"circleslashed", 10709798100}, {"citrus", 10709798276}, {"clapperboard", 10709798350}, {"clipboard", 10709799288}, {"clipboardcheck", 10709798443}, {"clipboardcopy", 10709798574}, {"clipboardedit", 10709798682}, {"clipboardlist", 10709798792}, {"clipboardsignature", 10709798890}, {"clipboardtype", 10709798999}, {"clipboardx", 10709799124}, {"clock", 10709805144}, {"clock1", 10709799535}, {"clock10", 10709799718}, {"clock11", 10709799818}, {"clock12", 10709799962}, {"clock2", 10709803876}, {"clock3", 10709803989}, {"clock4", 10709804164}, {"clock5", 10709804291}, {"clock6", 10709804435}, {"clock7", 10709804599}, {"clock8", 10709804784}, {"clock9", 10709804996}, {"cloud", 10709806740}, {"cloudcog", 10709805262}, {"clouddrizzle", 10709805371}, {"cloudfog", 10709805477}, {"cloudhail", 10709805596}, {"cloudlightning", 10709805727}, {"cloudmoon", 10709805942}, {"cloudmoonrain", 10709805838}, {"cloudoff", 10709806060}, {"cloudrain", 10709806277}, {"cloudrainwind", 10709806166}, {"cloudsnow", 10709806374}, {"cloudsun", 10709806631}, {"cloudsunrain", 10709806475}, {"cloudy", 10709806859}, {"clover", 10709806995}, {"code", 10709810463}, {"code2", 10709807111}, {"codepen", 10709810534}, {"codesandbox", 10709810676}, {"coffee", 10709810814}, {"cog", 10709810948}, {"coins", 10709811110}, {"columns", 10709811261}, {"command", 10709811365}, {"compass", 10709811445}, {"component", 10709811595}, {"conciergebell", 10709811706}, {"connection", 10747361219}, {"contact", 10709811834}, {"contrast", 10709811939}, {"cookie", 10709812067}, {"copy", 10709812159}, {"copyleft", 10709812251}, {"copyright", 10709812311}, {"cornerdownleft", 10709812396}, {"cornerdownright", 10709812485}, {"cornerleftdown", 10709812632}, {"cornerleftup", 10709812784}, {"cornerrightdown", 10709812939}, {"cornerrightup", 10709813094}, {"cornerupleft", 10709813185}, {"cornerupright", 10709813281}, {"cpu", 10709813383}, {"croissant", 10709818125}, {"crop", 10709818245}, {"cross", 10709818399}, {"diamond", 10709819149}, {"dice1", 10709819266}, {"dice2", 10709819361}, {"dice3", 10709819508}, {"dice4", 10709819670}, {"dice5", 10709819801}, {"dice6", 10709819896}, {"dices", 10723343321}, {"diff", 10723343416}, {"disc", 10723343537}, {"divide", 10723343805}, {"dividecircle", 10723343636}, {"dividesquare", 10723343737}, {"dollarsign", 10723343958}, {"download", 10723344270}, {"downloadcloud", 10723344088}, {"droplet", 10723344432}, {"droplets", 10734883356}, {"drumstick", 10723344737}, {"edit", 10734883598}, {"edit2", 10723344885}, {"edit3", 10723345088}, {"egg", 10723345518}, {"eggfried", 10723345347}, {"electricity", 10723345749}, {"electricityoff", 10723345643}, {"equal", 10723345990}, {"equalnot", 10723345866}, {"eraser", 10723346158}, {"euro", 10723346372}, {"expand", 10723346553}, {"externallink", 10723346684}, {"eye", 10723346959}, {"eyeoff", 10723346871}, {"factory", 10723347051}, {"fan", 10723354359}, {"fastforward", 10723354521}, {"feather", 10723354671}, {"figma", 10723354801}, {"file", 10723374641}, {"filearchive", 10723354921}, {"fileaudio", 10723355148}, {"fileaudio2", 10723355026}, {"fileaxis3d", 10723355272}, {"filebadge", 10723355622}, {"filebadge2", 10723355451}, {"filebarchart", 10723355887}, {"filebarchart2", 10723355746}, {"filebox", 10723355989}, {"filecheck", 10723356210}, {"filecheck2", 10723356100}, {"fileclock", 10723356329}, {"filecode", 10723356507}, {"filecog", 10723356830}, {"filecog2", 10723356676}, {"filediff", 10723357039}, {"filedigit", 10723357151}, {"filedown", 10723357322}, {"fileedit", 10723357495}, {"fileheart", 10723357637}, {"fileimage", 10723357790}, {"fileinput", 10723357933}, {"filejson", 10723364435}, {"filejson2", 10723364361}, {"filekey", 10723364605}, {"filekey2", 10723364515}, {"filelinechart", 10723364725}, {"filelock", 10723364957}, {"filelock2", 10723364861}, {"fileminus", 10723365254}, {"fileminus2", 10723365086}, {"fileoutput", 10723365457}, {"filepiechart", 10723365598}, {"fileplus", 10723365877}, {"fileplus2", 10723365766}, {"filequestion", 10723365987}, {"filescan", 10723366167}, {"filesearch", 10723366550}, {"filesearch2", 10723366340}, {"filesignature", 10723366741}, {"filespreadsheet", 10723366962}, {"filesymlink", 10723367098}, {"fileterminal", 10723367244}, {"filetext", 10723367380}, {"filetype", 10723367606}, {"filetype2", 10723367509}, {"fileup", 10723367734}, {"filevideo", 10723373884}, {"filevideo2", 10723367834}, {"filevolume", 10723374172}, {"filevolume2", 10723374030}, {"filewarning", 10723374276}, {"filex", 10723374544}, {"filex2", 10723374378}, {"files", 10723374759}, {"film", 10723374981}, {"filter", 10723375128}, {"fingerprint", 10723375250}, {"flag", 10723375890}, {"flagoff", 10723375443}, {"flagtriangleleft", 10723375608}, {"flagtriangleright", 10723375727}, {"flame", 10723376114}, {"flashlight", 10723376471}, {"flashlightoff", 10723376365}, {"flaskconical", 10734883986}, {"flaskround", 10723376614}, {"fliphorizontal", 10723376884}, {"fliphorizontal2", 10723376745}, {"flipvertical", 10723377138}, {"flipvertical2", 10723377026}, {"flower", 10747830374}, {"flower2", 10723377305}, {"focus", 10723377537}, {"folder", 10723387563}, {"folderarchive", 10723384478}, {"foldercheck", 10723384605}, {"folderclock", 10723384731}, {"folderclosed", 10723384893}, {"foldercog", 10723385213}, {"foldercog2", 10723385036}, {"folderdown", 10723385338}, {"folderedit", 10723385445}, {"folderheart", 10723385545}, {"folderinput", 10723385721}, {"folderkey", 10723385848}, {"folderlock", 10723386005}, {"folderminus", 10723386127}, {"folderopen", 10723386277}, {"folderoutput", 10723386386}, {"folderplus", 10723386531}, {"foldersearch", 10723386787}, {"foldersearch2", 10723386674}, {"foldersymlink", 10723386930}, {"foldertree", 10723387085}, {"folderup", 10723387265}, {"folderx", 10723387448}, {"folders", 10723387721}, {"forminput", 10723387841}, {"forward", 10723388016}, {"frame", 10723394389}, {"framer", 10723394565}, {"frown", 10723394681}, {"fuel", 10723394846}, {"functionsquare", 10723395041}, {"gamepad", 10723395457}, {"gamepad2", 10723395215}, {"gauge", 10723395708}, {"gavel", 10723395896}, {"gem", 10723396000}, {"ghost", 10723396107}, {"gift", 10723396402}, {"giftcard", 10723396225}, {"gitbranch", 10723396676}, {"gitbranchplus", 10723396542}, {"gitcommit", 10723396812}, {"gitcompare", 10723396954}, {"gitfork", 10723397049}, {"gitmerge", 10723397165}, {"gitpullrequest", 10723397431}, {"gitpullrequestclosed", 10723397268}, {"gitpullrequestdraft", 10734884302}, {"glass", 10723397788}, {"glass2", 10723397529}, {"glasswater", 10723397678}, {"glasses", 10723397895}, {"globe", 10723404337}, {"globe2", 10723398002}, {"grab", 10723404472}, {"graduationcap", 10723404691}, {"grape", 10723404822}, {"grid", 10723404936}, {"griphorizontal", 10723405089}, {"gripvertical", 10723405236}, {"hammer", 10723405360}, {"hand", 10723405649}
	}
	local icons = {}
	for _, pair in ipairs(iconData) do
		icons[pair[1]] = "rbxassetid://" .. tostring(pair[2])
	end
	return icons
end)()

local function createInstance(className, props, parent)
	local obj = Instance.new(className)
	if props then
		for key, value in pairs(props) do
			obj[key] = value
		end
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

local function getCurrentTheme(themeName)
	if type(themeName) == "table" then
		return themeName
	else
		return JustHub.Themes[themeName or JustHub.Save.Theme] or JustHub.Themes["Darker"]
	end
end

local function addBorder(obj, color, thickness)
	return createInstance("UIStroke", {Color = color, Thickness = thickness}, obj)
end

local function registerChroma(obj, property)
	table.insert(JustHub.ChromaObjects, {Instance = obj, Property = property})
end

RunService.RenderStepped:Connect(function()
	if JustHub.ChromaEnabled then
		local hue = (tick() % 5) / 5
		local color = Color3.fromHSV(hue, 1, 1)
		for i = #JustHub.ChromaObjects, 1, -1 do
			local data = JustHub.ChromaObjects[i]
			if data.Instance and data.Instance.Parent then
				data.Instance[data.Property] = color
			else
				table.remove(JustHub.ChromaObjects, i)
			end
		end
	end
end)

function JustHub:ToggleChroma(state)
	self.ChromaEnabled = state
	if not state then
		local theme = getCurrentTheme(self.Save.Theme)
		for _, data in ipairs(self.ChromaObjects) do
			if data.Instance and data.Instance.Parent then
				data.Instance[data.Property] = theme["Color Theme"]
			end
		end
	end
end

function JustHub:RegisterControl(key, updateFunc)
	JustHub.ControlRegistry[key] = updateFunc
end

function JustHub:ApplyConfig(configData)
	for key, val in pairs(configData) do
		if JustHub.ControlRegistry[key] then
			JustHub.ControlRegistry[key](val)
		end
	end
end

function JustHub:SetUserRole(roleName)
	self.UserRole = roleName
end

function JustHub:CheckRole(requiredRole)
	return self.UserRole == requiredRole
end

function JustHub:AddUndo(controlKey, oldValue, newValue)
	table.insert(self.UndoStack, {key = controlKey, old = oldValue, new = newValue})
end

function JustHub:Undo()
	local last = self.UndoStack[#self.UndoStack]
	if not last then return end
	self.UndoStack[#self.UndoStack] = nil
	if self.ControlRegistry[last.key] then
		self.ControlRegistry[last.key](last.old)
		table.insert(self.RedoStack, last)
	end
end

function JustHub:Redo()
	local last = self.RedoStack[#self.RedoStack]
	if not last then return end
	self.RedoStack[#self.RedoStack] = nil
	if self.ControlRegistry[last.key] then
		self.ControlRegistry[last.key](last.new)
		table.insert(self.UndoStack, last)
	end
end

function JustHub:RegisterTheme(name, definition)
	self.Themes[name] = definition
end

function JustHub:PlaySound(name)
	if self.Sounds[name] and self.Sounds[name] ~= 0 then
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. tostring(self.Sounds[name])
		s.Volume = 1
		s.PlayOnRemove = true
		s.Parent = workspace
		s:Destroy()
	end
end

function JustHub:SetLanguage(lang)
	self.CurrentLang = lang
end

function JustHub:LocalizeText(textKey)
	if self.Localization[self.CurrentLang] and self.Localization[self.CurrentLang][textKey] then
		return self.Localization[self.CurrentLang][textKey]
	end
	return textKey
end

local SectionMethods = {}

function SectionMethods:addMenu(name)
	local menuName = (name ~= nil) and tostring(name) or "Menu"
	local theme = getCurrentTheme(JustHub.Save.Theme)
	
	local frame = createInstance("Frame", {
		Name = menuName,
		Size = UDim2.new(1, 0, 0, 44),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 10)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local gradient = createInstance("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, theme["Color Hub 2"]),
			ColorSequenceKeypoint.new(1, theme["Color Hub 1"])
		}),
		Rotation = 90
	}, frame)

	local label = createInstance("TextLabel", {
		Name = "MenuLabel",
		Text = menuName,
		Size = UDim2.new(1, -16, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 2
	}, frame)
	
	return frame
end

function SectionMethods:addChromaToggle()
	return self:addToggle({
		Name = "Rainbow Chroma Mode",
		Default = JustHub.ChromaEnabled,
		Callback = function(state)
			JustHub:ToggleChroma(state)
		end
	})
end

function SectionMethods:addToggle(options)
	options = options or {}
	local title = options.Name or "Toggle"
	local default = options.Default or false
	local callback = options.Callback or function() end
	local role = options.Role or nil
	local theme = getCurrentTheme(JustHub.Save.Theme)
	
	if role and not JustHub:CheckRole(role) then
		return createInstance("Frame", {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, self.Content)
	end
	
	local frame = createInstance("Frame", {
		Name = title .. "Toggle",
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Size = UDim2.new(0.7, -8, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local switchBg = createInstance("Frame", {
		Size = UDim2.new(0, 44, 0, 22),
		Position = UDim2.new(1, -54, 0.5, -11),
		BackgroundColor3 = default and theme["Color Theme"] or theme["Color Hub 1"],
		BorderSizePixel = 0,
		Active = true,
		Selectable = true
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, switchBg)
	addBorder(switchBg, theme["Color Stroke"], 1)

	local circle = createInstance("Frame", {
		Size = UDim2.new(0, 18, 0, 18),
		Position = default and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	}, switchBg)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, circle)

	registerChroma(switchBg, "BackgroundColor3")

	local state = default
	if default then callback(true) else callback(false) end
	JustHub.ConfigData[title] = state

	local function toggleVisuals(isActive)
		local goalPos = isActive and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
		local goalCol = isActive and theme["Color Theme"] or theme["Color Hub 1"]
		tweenProperty(circle, {Position = goalPos}, 0.25)
		
		if JustHub.ChromaEnabled and isActive then
		else
			tweenProperty(switchBg, {BackgroundColor3 = goalCol}, 0.25)
		end
	end

	JustHub:RegisterControl(title, function(val)
		local old = state
		state = val
		toggleVisuals(state)
		JustHub:AddUndo(title, old, state)
	end)

	switchBg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local old = state
			state = not state
			JustHub.ConfigData[title] = state
			toggleVisuals(state)
			callback(state)
			JustHub:AddUndo(title, old, state)
		end
	end)
	
	return frame
end

function SectionMethods:addSlider(options)
	options = options or {}
	local title = options.Name or "Slider"
	local minVal = options.Min or 0
	local maxVal = options.Max or 100
	local default = options.Default or minVal
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	if JustHub.ConfigData[title] ~= nil then
		default = JustHub.ConfigData[title]
	else
		JustHub.ConfigData[title] = default
	end

	local frame = createInstance("Frame", {
		Name = title .. "Slider",
		Size = UDim2.new(1, 0, 0, 42),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(0.5, -10, 0, 20),
		Position = UDim2.new(0, 10, 0, 2),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local valBox = createInstance("TextBox", {
		Size = UDim2.new(0, 40, 0, 16),
		Position = UDim2.new(1, -50, 0, 4),
		BackgroundColor3 = theme["Color Hub 1"],
		Text = tostring(math.floor(default)),
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 11,
		ClearTextOnFocus = false
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, valBox)
	addBorder(valBox, theme["Color Stroke"], 1)

	local trackArea = createInstance("TextButton", {
		Size = UDim2.new(1, -20, 0, 14),
		Position = UDim2.new(0, 10, 0, 24),
		BackgroundTransparency = 1,
		Text = ""
	}, frame)

	local track = createInstance("Frame", {
		Size = UDim2.new(1, 0, 0, 4),
		Position = UDim2.new(0, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = theme["Color Hub 1"]
	}, trackArea)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, track)

	local ratio = math.clamp((default - minVal) / (maxVal - minVal), 0, 1)
	local fill = createInstance("Frame", {
		Size = UDim2.new(ratio, 0, 1, 0),
		BackgroundColor3 = theme["Color Theme"]
	}, track)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, fill)
	registerChroma(fill, "BackgroundColor3")

	local handle = createInstance("Frame", {
		Size = UDim2.new(0, 12, 0, 12),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	}, fill)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, handle)

	local dragging = false

	local function updateSlider(input)
		local x = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
		local val = math.floor(minVal + (x * (maxVal - minVal)))
		valBox.Text = tostring(val)
		tweenProperty(fill, {Size = UDim2.new(x, 0, 1, 0)}, 0.1)
		JustHub.ConfigData[title] = val
		pcall(callback, val)
	end

	trackArea.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			tweenProperty(handle, {Size = UDim2.new(0, 16, 0, 16)}, 0.15)
			updateSlider(input)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			updateSlider(input)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragging = false
			tweenProperty(handle, {Size = UDim2.new(0, 12, 0, 12)}, 0.15)
		end
	end)

	valBox.FocusLost:Connect(function()
		local num = tonumber(valBox.Text)
		if num then
			num = math.clamp(math.floor(num), minVal, maxVal)
			valBox.Text = tostring(num)
			JustHub.ConfigData[title] = num
			local r = (num - minVal) / (maxVal - minVal)
			tweenProperty(fill, {Size = UDim2.new(r, 0, 1, 0)}, 0.25)
			pcall(callback, num)
		else
			valBox.Text = tostring(JustHub.ConfigData[title] or default)
		end
	end)

	JustHub:RegisterControl(title, function(setVal)
		local nr = math.clamp((setVal - minVal) / (maxVal - minVal), 0, 1)
		valBox.Text = tostring(math.floor(setVal))
		tweenProperty(fill, {Size = UDim2.new(nr, 0, 1, 0)}, 0.25)
	end)

	return frame
end

function SectionMethods:addLabel(options)
	options = type(options) == "string" and {Text = options} or options or {}
	local txt = options.Text or options.Name or "Label"
	local align = options.Align or "Left"
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = "LabelContainer",
		Size = UDim2.new(1, 0, 0, 26),
		BackgroundTransparency = 1
	}, self.Content)

	local labelObj = createInstance("TextLabel", {
		Name = "LabelText",
		Text = txt,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = (align == "Center" and Enum.TextXAlignment.Center) or (align == "Right" and Enum.TextXAlignment.Right) or Enum.TextXAlignment.Left
	}, frame)

	if align == "Left" then
		createInstance("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)}, labelObj)
	end

	return {
		SetText = function(self, newText)
			labelObj.Text = newText
		end
	}
end

function SectionMethods:addTextBox(options)
	options = options or {}
	local title = options.Name or "TextBox"
	local default = options.Default or ""
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "TextBox",
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(0.4, -10, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local inputBox = createInstance("TextBox", {
		Text = default,
		Size = UDim2.new(0.6, -20, 0, 24),
		Position = UDim2.new(0.4, 10, 0.5, -12),
		BackgroundColor3 = theme["Color Hub 1"],
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.Gotham,
		TextSize = 12,
		ClearTextOnFocus = false,
		PlaceholderText = "Input here...",
		PlaceholderColor3 = theme["Color Dark Text"],
		TextWrapped = true
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 6)}, inputBox)
	addBorder(inputBox, theme["Color Stroke"], 1)

	inputBox.Focused:Connect(function()
		tweenProperty(inputBox, {BackgroundColor3 = theme["Color Hub 2"]}, 0.2)
	end)

	inputBox.FocusLost:Connect(function()
		tweenProperty(inputBox, {BackgroundColor3 = theme["Color Hub 1"]}, 0.2)
		JustHub.ConfigData[title] = inputBox.Text
		callback(inputBox.Text)
	end)

	JustHub:RegisterControl(title, function(setVal)
		inputBox.Text = setVal
	end)

	return frame
end

function SectionMethods:addDropdown(options)
	options = options or {}
	local title = options.Name or "Dropdown"
	local default = options.Default or ""
	local items = options.Items or {}
	local presets = options.Presets or {}
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "Dropdown",
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		ClipsDescendants = true,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local headerBtn = createInstance("TextButton", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundTransparency = 1,
		Text = ""
	}, frame)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(0.5, -10, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, headerBtn)

	local selectedLabel = createInstance("TextLabel", {
		Text = default ~= "" and default or "Select...",
		Size = UDim2.new(0.5, -25, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Right
	}, headerBtn)

	local arrow = createInstance("TextLabel", {
		Text = "▼",
		Size = UDim2.new(0, 15, 1, 0),
		Position = UDim2.new(1, -20, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Right
	}, headerBtn)

	local body = createInstance("Frame", {
		Size = UDim2.new(1, 0, 0, 130),
		Position = UDim2.new(0, 0, 0, 36),
		BackgroundTransparency = 1,
		Visible = false
	}, frame)

	local scroll = createInstance("ScrollingFrame", {
		Size = UDim2.new(1, -20, 1, -10),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = theme["Color Stroke"],
		BorderSizePixel = 0,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	}, body)
	createInstance("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}, scroll)

	local isOpen = false

	local function closeDropdown()
		isOpen = false
		tweenProperty(frame, {Size = UDim2.new(1, 0, 0, 36)}, 0.25)
		tweenProperty(arrow, {Rotation = 0}, 0.25)
		task.delay(0.25, function() body.Visible = false end)
	end

	local function createItem(name, isPreset)
		local btn = createInstance("TextButton", {
			Name = name,
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundColor3 = theme["Color Hub 1"],
			Text = "  " .. name,
			TextColor3 = isPreset and theme["Color Theme"] or theme["Color Text"],
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutoButtonColor = false
		}, scroll)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, btn)

		if isPreset then registerChroma(btn, "TextColor3") end

		btn.MouseEnter:Connect(function() tweenProperty(btn, {BackgroundColor3 = theme["Color Stroke"]}, 0.15) end)
		btn.MouseLeave:Connect(function() tweenProperty(btn, {BackgroundColor3 = theme["Color Hub 1"]}, 0.15) end)

		btn.MouseButton1Click:Connect(function()
			selectedLabel.Text = name
			JustHub.ConfigData[title] = name
			pcall(callback, name)
			closeDropdown()
		end)
	end

	local function renderItems()
		for _, v in ipairs(scroll:GetChildren()) do
			if v:IsA("TextButton") then v:Destroy() end
		end
		for _, p in ipairs(presets) do createItem("★ " .. p, true) end
		for _, i in ipairs(items) do createItem(i, false) end
	end
	renderItems()

	headerBtn.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		if isOpen then
			body.Visible = true
			tweenProperty(frame, {Size = UDim2.new(1, 0, 0, 166)}, 0.3)
			tweenProperty(arrow, {Rotation = 180}, 0.3)
		else
			closeDropdown()
		end
	end)

	JustHub.ConfigData[title] = default
	JustHub:RegisterControl(title, function(val) selectedLabel.Text = val end)

	return {
		Refresh = function(self, newList)
			items = newList or {}
			renderItems()
		end,
		Clear = function(self)
			items = {}
			renderItems()
			selectedLabel.Text = "Select..."
			closeDropdown()
		end
	}
end

function SectionMethods:addMultiDropdown(options)
	options = options or {}
	local title = options.Name or "Multi Dropdown"
	local default = options.Default or {}
	local items = options.Items or {}
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "MultiDropdown",
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		ClipsDescendants = true,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local headerBtn = createInstance("TextButton", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundTransparency = 1,
		Text = ""
	}, frame)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(0.5, -10, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, headerBtn)

	local selectedLabel = createInstance("TextLabel", {
		Text = #default > 0 and table.concat(default, ", ") or "Select...",
		Size = UDim2.new(0.5, -25, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextTruncate = Enum.TextTruncate.AtEnd
	}, headerBtn)

	local arrow = createInstance("TextLabel", {
		Text = "▼",
		Size = UDim2.new(0, 15, 1, 0),
		Position = UDim2.new(1, -20, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Right
	}, headerBtn)

	local body = createInstance("Frame", {
		Size = UDim2.new(1, 0, 0, 130),
		Position = UDim2.new(0, 0, 0, 36),
		BackgroundTransparency = 1,
		Visible = false
	}, frame)

	local scroll = createInstance("ScrollingFrame", {
		Size = UDim2.new(1, -20, 1, -10),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = theme["Color Stroke"],
		BorderSizePixel = 0,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	}, body)
	createInstance("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}, scroll)

	local isOpen = false
	local activeItems = {}
	for _, v in ipairs(default) do activeItems[v] = true end
	JustHub.ConfigData[title] = default

	local function closeDropdown()
		isOpen = false
		tweenProperty(frame, {Size = UDim2.new(1, 0, 0, 36)}, 0.25)
		tweenProperty(arrow, {Rotation = 0}, 0.25)
		task.delay(0.25, function() body.Visible = false end)
	end

	local function updateLabel()
		local sel = {}
		for k, v in pairs(activeItems) do if v then table.insert(sel, k) end end
		selectedLabel.Text = #sel > 0 and table.concat(sel, ", ") or "Select..."
		JustHub.ConfigData[title] = sel
		pcall(callback, sel)
	end

	local function createItem(name)
		local btn = createInstance("TextButton", {
			Name = name,
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundColor3 = theme["Color Hub 1"],
			Text = "      " .. name,
			TextColor3 = theme["Color Text"],
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutoButtonColor = false
		}, scroll)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, btn)

		local check = createInstance("Frame", {
			Size = UDim2.new(0, 14, 0, 14),
			Position = UDim2.new(0, 6, 0.5, -7),
			BackgroundColor3 = activeItems[name] and theme["Color Theme"] or theme["Color Hub 2"],
			BorderSizePixel = 0
		}, btn)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 3)}, check)
		addBorder(check, theme["Color Stroke"], 1)

		if activeItems[name] then registerChroma(check, "BackgroundColor3") end

		btn.MouseEnter:Connect(function() tweenProperty(btn, {BackgroundColor3 = theme["Color Stroke"]}, 0.15) end)
		btn.MouseLeave:Connect(function() tweenProperty(btn, {BackgroundColor3 = theme["Color Hub 1"]}, 0.15) end)

		btn.MouseButton1Click:Connect(function()
			activeItems[name] = not activeItems[name]
			if activeItems[name] then
				tweenProperty(check, {BackgroundColor3 = theme["Color Theme"]}, 0.15)
				registerChroma(check, "BackgroundColor3")
			else
				tweenProperty(check, {BackgroundColor3 = theme["Color Hub 2"]}, 0.15)
			end
			updateLabel()
		end)
	end

	local function renderItems()
		for _, v in ipairs(scroll:GetChildren()) do
			if v:IsA("TextButton") then v:Destroy() end
		end
		for _, i in ipairs(items) do createItem(i) end
	end
	renderItems()

	headerBtn.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		if isOpen then
			body.Visible = true
			tweenProperty(frame, {Size = UDim2.new(1, 0, 0, 166)}, 0.3)
			tweenProperty(arrow, {Rotation = 180}, 0.3)
		else
			closeDropdown()
		end
	end)

	JustHub:RegisterControl(title, function(val)
		if type(val) == "table" then
			activeItems = {}
			for _, v in ipairs(val) do activeItems[v] = true end
			updateLabel()
			renderItems()
		end
	end)

	return {
		Refresh = function(self, newList)
			items = newList or {}
			renderItems()
		end
	}
end

function SectionMethods:addColorPicker(options)
	options = options or {}
	local title = options.Name or "ColorPicker"
	local default = options.Default or Color3.fromRGB(255, 255, 255)
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "ColorPicker",
		Size = UDim2.new(1, 0, 0, 56),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(1, -20, 0, 24),
		Position = UDim2.new(0, 10, 0, 2),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local preview = createInstance("Frame", {
		Size = UDim2.new(0, 40, 0, 20),
		Position = UDim2.new(1, -50, 0, 4),
		BackgroundColor3 = default,
		BorderSizePixel = 0
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, preview)
	addBorder(preview, theme["Color Stroke"], 1)

	local rBox = createInstance("TextBox", {Text = tostring(math.floor(default.R * 255)), Size = UDim2.new(0, 40, 0, 22), Position = UDim2.new(0, 10, 0, 28), BackgroundColor3 = theme["Color Hub 1"], TextColor3 = Color3.fromRGB(255, 100, 100), Font = Enum.Font.GothamMedium, TextSize = 11}, frame)
	local gBox = createInstance("TextBox", {Text = tostring(math.floor(default.G * 255)), Size = UDim2.new(0, 40, 0, 22), Position = UDim2.new(0, 55, 0, 28), BackgroundColor3 = theme["Color Hub 1"], TextColor3 = Color3.fromRGB(100, 255, 100), Font = Enum.Font.GothamMedium, TextSize = 11}, frame)
	local bBox = createInstance("TextBox", {Text = tostring(math.floor(default.B * 255)), Size = UDim2.new(0, 40, 0, 22), Position = UDim2.new(0, 100, 0, 28), BackgroundColor3 = theme["Color Hub 1"], TextColor3 = Color3.fromRGB(100, 150, 255), Font = Enum.Font.GothamMedium, TextSize = 11}, frame)

	for _, box in ipairs({rBox, gBox, bBox}) do
		createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, box)
		addBorder(box, theme["Color Stroke"], 1)
	end

	local function updateColor()
		local rr = math.clamp(tonumber(rBox.Text) or 0, 0, 255)
		local gg = math.clamp(tonumber(gBox.Text) or 0, 0, 255)
		local bb = math.clamp(tonumber(bBox.Text) or 0, 0, 255)
		local c3 = Color3.fromRGB(rr, gg, bb)
		preview.BackgroundColor3 = c3
		JustHub.ConfigData[title] = c3
		pcall(callback, c3)
	end

	rBox.FocusLost:Connect(updateColor)
	gBox.FocusLost:Connect(updateColor)
	bBox.FocusLost:Connect(updateColor)

	JustHub:RegisterControl(title, function(val)
		if typeof(val) == "Color3" then
			rBox.Text = tostring(math.floor(val.R * 255))
			gBox.Text = tostring(math.floor(val.G * 255))
			bBox.Text = tostring(math.floor(val.B * 255))
			preview.BackgroundColor3 = val
		end
	end)

	return frame
end

function SectionMethods:addScriptBox(options)
	options = options or {}
	local title = options.Name or "ScriptBox"
	local default = options.Default or ""
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "ScriptBox",
		Size = UDim2.new(1, 0, 0, 90),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(1, -10, 0, 20),
		Position = UDim2.new(0, 10, 0, 4),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local inputBox = createInstance("TextBox", {
		Text = default,
		Size = UDim2.new(1, -70, 0, 50),
		Position = UDim2.new(0, 10, 0, 30),
		BackgroundColor3 = theme["Color Hub 1"],
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.Code,
		TextSize = 12,
		ClearTextOnFocus = false,
		MultiLine = true,
		TextWrapped = true,
		PlaceholderText = "Paste script here...",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 6)}, inputBox)
	addBorder(inputBox, theme["Color Stroke"], 1)

	local runBtn = createInstance("TextButton", {
		Text = "Run",
		Size = UDim2.new(0, 45, 0, 30),
		Position = UDim2.new(1, -55, 0, 40),
		BackgroundColor3 = theme["Color Theme"],
		TextColor3 = Color3.fromRGB(20, 20, 20),
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		AutoButtonColor = false
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 6)}, runBtn)
	registerChroma(runBtn, "BackgroundColor3")

	runBtn.MouseEnter:Connect(function() tweenProperty(runBtn, {BackgroundTransparency = 0.2}, 0.15) end)
	runBtn.MouseLeave:Connect(function() tweenProperty(runBtn, {BackgroundTransparency = 0}, 0.15) end)
	runBtn.MouseButton1Click:Connect(function() pcall(callback, inputBox.Text) end)

	JustHub:RegisterControl(title, function(val) inputBox.Text = val end)

	return frame
end

function SectionMethods:addBind(options)
	options = options or {}
	local title = options.Name or "KeyBind"
	local default = options.Default or "RightShift"
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "BindControl",
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(0.6, -10, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local inputBox = createInstance("TextBox", {
		Text = default,
		Size = UDim2.new(0.4, -20, 0, 24),
		Position = UDim2.new(0.6, 10, 0.5, -12),
		BackgroundColor3 = theme["Color Hub 1"],
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		ClearTextOnFocus = false
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, inputBox)
	addBorder(inputBox, theme["Color Stroke"], 1)

	local currentKey
	local conn

	local function setKey(kName)
		for _, kEnum in pairs(Enum.KeyCode:GetEnumItems()) do
			if kEnum.Name:lower() == kName:lower() then
				if conn then conn:Disconnect() end
				currentKey = kEnum
				conn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
					if not gameProcessed and input.KeyCode == currentKey then pcall(callback) end
				end)
				JustHub.ConfigData[title] = kEnum.Name
				inputBox.Text = kEnum.Name
				return
			end
		end
	end

	setKey(default)

	inputBox.FocusLost:Connect(function()
		setKey(inputBox.Text)
	end)

	JustHub:RegisterControl(title, function(val) setKey(val) end)

	return frame
end

function SectionMethods:addButton(options)
	options = options or {}
	local title = options.Name or "Button"
	local btnText = options.ButtonText or "Click"
	local callback = options.Callback or function() end
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = title .. "ButtonControl",
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local label = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(0.6, -10, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left
	}, frame)

	local btn = createInstance("TextButton", {
		Text = btnText,
		Size = UDim2.new(0.4, -20, 0, 24),
		Position = UDim2.new(0.6, 10, 0.5, -12),
		BackgroundColor3 = theme["Color Hub 1"],
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		AutoButtonColor = false
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, btn)
	addBorder(btn, theme["Color Stroke"], 1)

	btn.MouseEnter:Connect(function() tweenProperty(btn, {BackgroundColor3 = theme["Color Stroke"]}, 0.15) end)
	btn.MouseLeave:Connect(function() tweenProperty(btn, {BackgroundColor3 = theme["Color Hub 1"]}, 0.15) end)
	btn.MouseButton1Down:Connect(function() tweenProperty(btn, {Size = UDim2.new(0.4, -22, 0, 22)}, 0.1) end)
	btn.MouseButton1Up:Connect(function()
		tweenProperty(btn, {Size = UDim2.new(0.4, -20, 0, 24)}, 0.1)
		pcall(callback)
	end)

	return frame
end

function SectionMethods:addConfigManager()
	local theme = getCurrentTheme(JustHub.Save.Theme)

	local frame = createInstance("Frame", {
		Name = "ConfigManager",
		Size = UDim2.new(1, 0, 0, 75),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0
	}, self.Content)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, frame)
	addBorder(frame, theme["Color Stroke"], 1)

	local inputBox = createInstance("TextBox", {
		Text = "DefaultConfig",
		Size = UDim2.new(1, -20, 0, 26),
		Position = UDim2.new(0, 10, 0, 10),
		BackgroundColor3 = theme["Color Hub 1"],
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.Gotham,
		TextSize = 12,
		ClearTextOnFocus = false,
		PlaceholderText = "Config Name...",
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, inputBox)
	addBorder(inputBox, theme["Color Stroke"], 1)

	local saveBtn = createInstance("TextButton", {
		Text = "Save Profile",
		Size = UDim2.new(0.48, 0, 0, 26),
		Position = UDim2.new(0, 10, 0, 42),
		BackgroundColor3 = theme["Color Theme"],
		TextColor3 = Color3.fromRGB(20, 20, 20),
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		AutoButtonColor = false
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, saveBtn)
	registerChroma(saveBtn, "BackgroundColor3")

	local loadBtn = createInstance("TextButton", {
		Text = "Load Profile",
		Size = UDim2.new(0.48, 0, 0, 26),
		Position = UDim2.new(0.52, -10, 0, 42),
		BackgroundColor3 = theme["Color Hub 1"],
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		AutoButtonColor = false
	}, frame)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, loadBtn)
	addBorder(loadBtn, theme["Color Stroke"], 1)

	saveBtn.MouseButton1Click:Connect(function()
		local name = inputBox.Text
		if name ~= "" then JustHub:SaveConfig(name .. ".json") end
	end)

	loadBtn.MouseButton1Click:Connect(function()
		local name = inputBox.Text
		if name ~= "" then JustHub:LoadConfig(name .. ".json") end
	end)

	return frame
end

function JustHub:CreateWindow(options)
	options = options or {}
	local winName = options.Name or "JustHub Window"
	local themeName = options.Theme or "Darker"
	local subTitle = options.SubTitle or "SubTitle"
	
	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local screenGui = createInstance("ScreenGui", {Name = "JustHub", ResetOnSpawn = false}, playerGui)
	self.ScreenGui = screenGui

	JustHub.Save.Theme = themeName
	local theme = getCurrentTheme(themeName)

	local mainFrame = createInstance("Frame", {
		Name = "MainFrame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, JustHub.Save.UISize[1], 0, JustHub.Save.UISize[2]),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true
	}, screenGui)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, mainFrame)
	local mainBorder = addBorder(mainFrame, theme["Color Stroke"], 1)
	registerChroma(mainBorder, "Color")

	local topBar = createInstance("Frame", {
		Name = "TopBar",
		Size = UDim2.new(1, 0, 0, 45),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}, mainFrame)

	local titleLabel = createInstance("TextLabel", {
		Name = "TitleLabel",
		Text = winName,
		Size = UDim2.new(0.5, 0, 1, 0),
		Position = UDim2.new(0, 20, 0, -5),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	}, topBar)

	local subtitleLabel = createInstance("TextLabel", {
		Name = "SubtitleLabel",
		Text = subTitle,
		Size = UDim2.new(0.5, 0, 1, 0),
		Position = UDim2.new(0, 20, 0, 10),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left
	}, topBar)

	local btnContainer = createInstance("Frame", {
		Name = "ButtonContainer",
		Size = UDim2.new(0, 70, 1, 0),
		Position = UDim2.new(1, -15, 0, 0),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1
	}, topBar)
	createInstance("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder
	}, btnContainer)

	local function createWinBtn(name, color, order)
		local btn = createInstance("TextButton", {
			Name = name,
			Text = "",
			Size = UDim2.new(0, 14, 0, 14),
			BackgroundColor3 = color,
			LayoutOrder = order,
			AutoButtonColor = false,
			BorderSizePixel = 0
		}, btnContainer)
		createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, btn)
		btn.MouseEnter:Connect(function() tweenProperty(btn, {BackgroundTransparency = 0.2}, 0.2) end)
		btn.MouseLeave:Connect(function() tweenProperty(btn, {BackgroundTransparency = 0}, 0.2) end)
		return btn
	end

	local hideBtn = createWinBtn("HideBtn", Color3.fromRGB(255, 189, 46), 1)
	local maxBtn = createWinBtn("MaxBtn", Color3.fromRGB(39, 201, 63), 2)
	local closeBtn = createWinBtn("CloseBtn", Color3.fromRGB(255, 96, 92), 3)

	local headerSep = createInstance("Frame", {
		Size = UDim2.new(1, -40, 0, 1),
		Position = UDim2.new(0, 20, 0, 44),
		BackgroundColor3 = theme["Color Stroke"],
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0
	}, mainFrame)

	local profileFrame = createInstance("Frame", {
		Name = "ProfileFrame",
		Size = UDim2.new(0, JustHub.Save.TabSize, 0, 50),
		Position = UDim2.new(0, 20, 0, 55),
		BackgroundTransparency = 1
	}, mainFrame)
	
	local avatarImg = createInstance("ImageLabel", {
		Size = UDim2.new(0, 36, 0, 36),
		Position = UDim2.new(0, 0, 0.5, -18),
		BackgroundColor3 = theme["Color Hub 1"],
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, profileFrame)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, avatarImg)
	
	local pcallSuccess, thumb = pcall(function()
		return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	end)
	if pcallSuccess then avatarImg.Image = thumb end

	local profileName = createInstance("TextLabel", {
		Text = player.DisplayName,
		Size = UDim2.new(1, -46, 1, 0),
		Position = UDim2.new(0, 46, 0, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	}, profileFrame)

	local sidebar = createInstance("Frame", {
		Name = "Sidebar",
		Size = UDim2.new(0, JustHub.Save.TabSize, 1, -135),
		Position = UDim2.new(0, 20, 0, 115),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}, mainFrame)
	createInstance("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}, sidebar)

	local contentContainer = createInstance("Frame", {
		Name = "ContentContainer",
		Size = UDim2.new(1, -(JustHub.Save.TabSize + 50), 1, -75),
		Position = UDim2.new(0, JustHub.Save.TabSize + 30, 0, 55),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}, mainFrame)

	local footer = createInstance("Frame", {
		Name = "Footer",
		Size = UDim2.new(1, 0, 0, 20),
		Position = UDim2.new(0, 0, 1, -20),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}, mainFrame)

	local fpsLabel = createInstance("TextLabel", {
		Name = "FPSLabel",
		Text = "FPS: --",
		Size = UDim2.new(0, 100, 1, 0),
		Position = UDim2.new(1, -20, 0, 0),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Right
	}, footer)

	local lastTime = os.clock()
	local frameCount = 0
	RunService.RenderStepped:Connect(function()
		frameCount = frameCount + 1
		local currentTime = os.clock()
		if currentTime - lastTime >= 1 then
			if fpsLabel and fpsLabel.Parent then
				fpsLabel.Text = "FPS: " .. frameCount
			end
			frameCount = 0
			lastTime = currentTime
		end
	end)

	tweenProperty(mainFrame, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.6, Enum.EasingStyle.Exponential)

	local minimized, maximized = false, false
	local prevSize, prevPos

	hideBtn.MouseButton1Click:Connect(function()
		minimized = not minimized
		if minimized then
			prevSize = mainFrame.Size
			tweenProperty(mainFrame, {Size = UDim2.new(0, prevSize.X.Offset, 0, 45)}, 0.4, Enum.EasingStyle.Exponential)
			sidebar.Visible = false
			contentContainer.Visible = false
			footer.Visible = false
			headerSep.Visible = false
			profileFrame.Visible = false
		else
			tweenProperty(mainFrame, {Size = prevSize}, 0.4, Enum.EasingStyle.Exponential)
			task.wait(0.2)
			sidebar.Visible = true
			contentContainer.Visible = true
			footer.Visible = true
			headerSep.Visible = true
			profileFrame.Visible = true
		end
	end)

	maxBtn.MouseButton1Click:Connect(function()
		maximized = not maximized
		if maximized then
			prevSize, prevPos = mainFrame.Size, mainFrame.Position
			tweenProperty(mainFrame, {Size = UDim2.new(1, -40, 1, -40), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.4, Enum.EasingStyle.Exponential)
		else
			tweenProperty(mainFrame, {Size = prevSize, Position = prevPos}, 0.4, Enum.EasingStyle.Exponential)
		end
	end)

	closeBtn.MouseButton1Click:Connect(function()
		local t = tweenProperty(mainFrame, {Position = UDim2.new(0.5, 0, -0.5, 0), BackgroundTransparency = 1}, 0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
		t.Completed:Connect(function()
			mainFrame.Visible = false
			local showUI = createInstance("ScreenGui", {Name = "ShowUI", ResetOnSpawn = false}, playerGui)
			local showBtn = createInstance("TextButton", {
				Name = "ShowUIButton",
				Size = UDim2.new(0, 40, 0, 40),
				Position = UDim2.new(0.5, -20, 0, 10),
				BackgroundColor3 = theme["Color Hub 2"],
				Text = "UI",
				TextColor3 = theme["Color Text"],
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				AutoButtonColor = false
			}, showUI)
			createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, showBtn)
			addBorder(showBtn, theme["Color Stroke"], 1)

			showBtn.MouseButton1Click:Connect(function()
				mainFrame.Visible = true
				tweenProperty(mainFrame, {Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0.15}, 0.5, Enum.EasingStyle.Exponential)
				showUI:Destroy()
			end)
		end)
	end)

	local function enableDrag(frame, trigger)
		local dragging, dragInput, dragStart, startPos
		trigger.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then dragging = false end
				end)
			end
		end)
		trigger.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - dragStart
				tweenProperty(frame, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}, 0.1)
			end
		end)
	end
	enableDrag(mainFrame, topBar)

	local resizeGrip = createInstance("TextButton", {
		Name = "ResizeGrip",
		Size = UDim2.new(0, 20, 0, 20),
		Position = UDim2.new(1, -20, 1, -20),
		BackgroundTransparency = 1,
		Text = "⌟",
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 14
	}, mainFrame)

	local function enableResize(frame, grip)
		local resizing, dragStart, startSize
		grip.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				resizing = true
				dragStart = input.Position
				startSize = frame.Size
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then resizing = false end
				end)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local delta = input.Position - dragStart
				tweenProperty(frame, {Size = UDim2.new(0, math.max(500, startSize.X.Offset + delta.X), 0, math.max(350, startSize.Y.Offset + delta.Y))}, 0.1)
			end
		end)
	end
	enableResize(mainFrame, resizeGrip)

	local notiContainer = createInstance("Frame", {
		Name = "NotificationContainer",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -20, 1, -20),
		Size = UDim2.new(0, 280, 1, -40),
		BackgroundTransparency = 1
	}, screenGui)
	createInstance("UIListLayout", {
		Padding = UDim.new(0, 12),
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		SortOrder = Enum.SortOrder.LayoutOrder
	}, notiContainer)
	self.NotificationContainer = notiContainer

	local windowObj = {ScreenGui = screenGui, MainFrame = mainFrame, TopBar = topBar, Sidebar = sidebar, ContentContainer = contentContainer, Tabs = {}}

	function windowObj:addTab(tabName, iconName)
		tabName = tabName or "Tab"
		local currentTheme = getCurrentTheme(JustHub.Save.Theme)
		
		local btn = createInstance("TextButton", {
			Name = tabName .. "Button",
			Text = "",
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundColor3 = currentTheme["Color Hub 1"],
			BackgroundTransparency = 1,
			AutoButtonColor = false
		}, sidebar)
		createInstance("UICorner", {CornerRadius = UDim.new(0, 6)}, btn)

		local btnLayout = createInstance("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 8)
		}, btn)
		createInstance("UIPadding", {PaddingLeft = UDim.new(0, 10)}, btn)

		local tabIcon
		if iconName and JustHub.Icons[iconName] then
			tabIcon = createInstance("ImageLabel", {
				Size = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				Image = JustHub.Icons[iconName],
				ImageColor3 = currentTheme["Color Dark Text"]
			}, btn)
		end

		local tabText = createInstance("TextLabel", {
			Text = tabName,
			Size = UDim2.new(1, -24, 1, 0),
			BackgroundTransparency = 1,
			TextColor3 = currentTheme["Color Dark Text"],
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left
		}, btn)

		local tabContent = createInstance("ScrollingFrame", {
			Name = tabName .. "Content",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = currentTheme["Color Stroke"],
			BorderSizePixel = 0,
			Visible = false
		}, contentContainer)
		createInstance("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 10),
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}, tabContent)

		local tabObj = {Name = tabName, Button = btn, Content = tabContent, Sections = {}}
		table.insert(windowObj.Tabs, tabObj)

		local function updateTabs()
			for _, t in ipairs(windowObj.Tabs) do
				local active = (t == tabObj)
				t.Content.Visible = active
				tweenProperty(t.Button, {BackgroundTransparency = active and 0 or 1}, 0.3)
				
				local textObj = t.Button:FindFirstChildOfClass("TextLabel")
				local imgObj = t.Button:FindFirstChildOfClass("ImageLabel")
				
				if textObj then
					tweenProperty(textObj, {TextColor3 = active and currentTheme["Color Text"] or currentTheme["Color Dark Text"]}, 0.3)
				end
				if imgObj then
					tweenProperty(imgObj, {ImageColor3 = active and currentTheme["Color Text"] or currentTheme["Color Dark Text"]}, 0.3)
				end
			end
		end

		btn.MouseButton1Click:Connect(updateTabs)

		if #windowObj.Tabs == 1 then updateTabs() end

		function tabObj:addSection(sectionName)
			sectionName = sectionName or "Section"
			local ct = getCurrentTheme(JustHub.Save.Theme)
			
			local secFrame = createInstance("Frame", {
				Name = sectionName,
				Size = UDim2.new(1, -4, 0, 0),
				BackgroundColor3 = ct["Color Hub 1"],
				BackgroundTransparency = 0.4,
				AutomaticSize = Enum.AutomaticSize.Y
			}, tabContent)
			createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, secFrame)
			addBorder(secFrame, ct["Color Stroke"], 1)

			local secTitle = createInstance("TextLabel", {
				Name = "SectionTitle",
				Text = "  " .. sectionName,
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundTransparency = 1,
				TextColor3 = ct["Color Text"],
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Left
			}, secFrame)

			local secContent = createInstance("Frame", {
				Name = "SectionContent",
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0, 0, 0, 30),
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y
			}, secFrame)

			createInstance("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}, secContent)
			createInstance("UIPadding", {
				PaddingBottom = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 2),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			}, secContent)

			local secObj = {Frame = secFrame, Title = secTitle, Content = secContent}
			table.insert(tabObj.Sections, secObj)
			setmetatable(secObj, {__index = SectionMethods})
			return secObj
		end

		return tabObj
	end

	return windowObj
end

function JustHub:ShowLoadingScreen(duration, callback)
	duration = duration or 5
	callback = callback or function() end
	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local theme = getCurrentTheme(JustHub.Save.Theme)
	
	local loadGui = createInstance("ScreenGui", {Name = "LoadingScreen", ResetOnSpawn = false, IgnoreGuiInset = true}, playerGui)
	
	local bgOverlay = createInstance("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0,
		BorderSizePixel = 0
	}, loadGui)

	local titleLabel = createInstance("TextLabel", {
		Text = "JustHub Library",
		Font = Enum.Font.GothamBold,
		TextSize = 24,
		TextColor3 = theme["Color Text"],
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, -50)
	}, loadGui)

	local barContainer = createInstance("Frame", {
		Size = UDim2.new(0, 300, 0, 10),
		Position = UDim2.new(0.5, 0, 0.5, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = theme["Color Hub 1"],
		BorderSizePixel = 0
	}, loadGui)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, barContainer)
	addBorder(barContainer, theme["Color Stroke"], 1)

	local barFill = createInstance("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = theme["Color Theme"],
		BorderSizePixel = 0
	}, barContainer)
	createInstance("UICorner", {CornerRadius = UDim.new(1, 0)}, barFill)

	local tween = tweenProperty(barFill, {Size = UDim2.new(1, 0, 1, 0)}, duration)
	
	task.spawn(function()
		while tween.PlaybackState == Enum.PlaybackState.Playing do
			tweenProperty(titleLabel, {TextTransparency = 0.5}, 0.5)
			task.wait(0.5)
			tweenProperty(titleLabel, {TextTransparency = 0}, 0.5)
			task.wait(0.5)
		end
	end)

	tween.Completed:Connect(function()
		task.wait(0.5)
		local fade = tweenProperty(bgOverlay, {BackgroundTransparency = 1}, 0.5)
		tweenProperty(titleLabel, {TextTransparency = 1}, 0.5)
		tweenProperty(barContainer, {BackgroundTransparency = 1}, 0.5)
		tweenProperty(barFill, {BackgroundTransparency = 1}, 0.5)
		fade.Completed:Connect(function()
			loadGui:Destroy()
			callback()
		end)
	end)
end

function JustHub:InitializeUI(options)
	self:ShowLoadingScreen(3, function()
		self.Window = self:CreateWindow(options)
	end)
end

function JustHub:SaveConfig(fileName)
	fileName = fileName or "JustHub_Config.json"
	local success, err = pcall(function()
		if writefile then
			local json = HttpService:JSONEncode(JustHub.ConfigData)
			writefile(fileName, json)
			StarterGui:SetCore("SendNotification", {Title = "Save Config", Text = "Success save at " .. fileName, Duration = 5})
		else
			warn("Saving config not supported.")
		end
	end)
	if not success then warn("Save error: " .. err) end
end

function JustHub:LoadConfig(fileName)
	fileName = fileName or "JustHub_Config.json"
	local config = {}
	local success, err = pcall(function()
		if readfile then
			local data = readfile(fileName)
			config = HttpService:JSONDecode(data)
			JustHub.ConfigData = config
			JustHub:ApplyConfig(config)
			StarterGui:SetCore("SendNotification", {Title = "Load Config", Text = "Success load from " .. fileName, Duration = 5})
		else
			warn("Loading config not supported.")
		end
	end)
	if not success then warn("Load error: " .. err) end
	return config
end

function JustHub:UpdateTheme(newTheme)
	JustHub.Save.Theme = newTheme
	local themeData = getCurrentTheme(newTheme)
	if self.Window then
		local mf = self.Window.MainFrame
		mf.BackgroundColor3 = themeData["Color Hub 2"]
		self.Window.TopBar.BackgroundColor3 = themeData["Color Hub 2"]
		self.Window.Sidebar.BackgroundColor3 = themeData["Color Hub 2"]
		self.Window.ContentContainer.BackgroundColor3 = themeData["Color Hub 2"]
	end
end

function JustHub:SetTheme(newTheme)
	self:UpdateTheme(newTheme)
end

function JustHub:ToggleUIVisibility()
	if self.ScreenGui and self.ScreenGui.Parent then
		self.ScreenGui.Enabled = not self.ScreenGui.Enabled
	end
end

function JustHub:Notify(options)
	options = options or {}
	local title = options.Title or ""
	local message = options.Message or ""
	local duration = options.Duration or 5
	local showProgress = options.ShowProgress or false
	local theme = getCurrentTheme(JustHub.Save.Theme)

	if not self.NotificationContainer then return end

	local notifFrame = createInstance("Frame", {
		Size = UDim2.new(0, 300, 0, 0),
		BackgroundColor3 = theme["Color Hub 2"],
		BackgroundTransparency = 0.15,
		ClipsDescendants = true
	}, self.NotificationContainer)
	createInstance("UICorner", {CornerRadius = UDim.new(0, 8)}, notifFrame)
	addBorder(notifFrame, theme["Color Stroke"], 1)

	local titleLabel = createInstance("TextLabel", {
		Text = title,
		Size = UDim2.new(1, -20, 0, 20),
		Position = UDim2.new(0, 10, 0, 10),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	}, notifFrame)

	local msgLabel = createInstance("TextLabel", {
		Text = message,
		Size = UDim2.new(1, -20, 0, 0),
		Position = UDim2.new(0, 10, 0, 35),
		BackgroundTransparency = 1,
		TextColor3 = theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	}, notifFrame)
	
	msgLabel.Size = UDim2.new(1, -20, 0, msgLabel.TextBounds.Y + 10)
	local fullHeight = msgLabel.Position.Y.Offset + msgLabel.Size.Y.Offset + 15
	local progressFrame

	if showProgress then
		progressFrame = createInstance("Frame", {
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = theme["Color Theme"],
			BorderSizePixel = 0
		}, notifFrame)
		registerChroma(progressFrame, "BackgroundColor3")
		fullHeight = fullHeight + 4
	end

	notifFrame.Size = UDim2.new(0, 300, 0, fullHeight)
	notifFrame.Position = UDim2.new(1, 0, 1, 0)

	local inTween = tweenProperty(notifFrame, {Position = UDim2.new(0, 0, 0, 0)}, 0.4, Enum.EasingStyle.Exponential)
	
	task.spawn(function()
		inTween.Completed:Wait()
		if showProgress and progressFrame then
			tweenProperty(progressFrame, {Size = UDim2.new(0, 0, 0, 4)}, duration, Enum.EasingStyle.Linear)
		end
		task.wait(duration)
		local outTween = tweenProperty(notifFrame, {BackgroundTransparency = 1, Size = UDim2.new(0, 300, 0, 0)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		outTween.Completed:Wait()
		notifFrame:Destroy()
	end)
end

function JustHub:PromoNotify()
	task.spawn(function()
		while true do
			self:Notify({
				Title = "JustHub UI Promotion",
				Message = "Check out JustHub-UI at:\nhttps://github.com/Lilith-VnK/JustHub-UI/",
				Duration = 3,
				ShowProgress = true
			})
			task.wait(30)
		end
	end)
end

return JustHub
