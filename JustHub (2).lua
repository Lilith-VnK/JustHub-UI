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
			ColorSequenceKeypoint.new(0, Color3.fromRGB(25,25,25)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(32,32,32)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(25,25,25))
		}),
		["Color Hub 2"] = Color3.fromRGB(30,30,30),
		["Color Stroke"] = Color3.fromRGB(40,40,40),
		["Color Theme"] = Color3.fromRGB(88,101,242),
		["Color Text"] = Color3.fromRGB(243,243,243),
		["Color Dark Text"] = Color3.fromRGB(180,180,180)
	},
	Dark = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,40)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(47,47,47)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(40,40,40))
		}),
		["Color Hub 2"] = Color3.fromRGB(45,45,45),
		["Color Stroke"] = Color3.fromRGB(65,65,65),
		["Color Theme"] = Color3.fromRGB(65,150,255),
		["Color Text"] = Color3.fromRGB(245,245,245),
		["Color Dark Text"] = Color3.fromRGB(190,190,190)
	}
}
JustHub.Info = {Version="1.1.0"}
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
	n=n or "Menu"
	local f=createInstance("Frame",{Name=n,Size=UDim2.new(1,0,0,40),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],BackgroundTransparency=0.3},self.Content)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)},f)
	createInstance("TextLabel",{Name="MenuLabel",Text=n,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.GothamBold,TextSize=16},f)
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

function JustHub:addSection(sn,sh)
	sn=sn or "Section"
	sh=sh or 100
	local sf=createInstance("Frame",{Name=sn,Size=UDim2.new(1,0,0,sh),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Hub 2"],BackgroundTransparency=0},nil)
	addBorder(sf,getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],2)
	createInstance("UICorner",{CornerRadius=UDim.new(0,8)},sf)
	local st=createInstance("TextLabel",{Name="SectionTitle",Text=sn,Size=UDim2.new(1,0,0,30),BackgroundTransparency=1,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],Font=Enum.Font.GothamBold,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left},sf)
	local sc=createInstance("Frame",{Name="SectionContent",Size=UDim2.new(1,0,1,-30),Position=UDim2.new(0,0,0,30),BackgroundTransparency=1},sf)
	createInstance("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Left},sc)
	local so={Frame=sf,Title=st,Content=sc}
	setmetatable(so,{__index=SectionMethods})
	return so
end

function JustHub:CreateWindow(o)
	o=o or {}
	local wn=o.Name or "JustHub Window"
	local th=getCurrentTheme(o.Theme)
	local gid=HttpService:GenerateGUID(false)
	local ft=wn.." ["..gid.."]"
	local pl=Players.LocalPlayer
	local pg=pl:WaitForChild("PlayerGui")
	local sg=createInstance("ScreenGui",{Name="JustHub",ResetOnSpawn=false},pg)
	self.ScreenGui=sg
	local uw=JustHub.Save.UISize[1]
	local uh=JustHub.Save.UISize[2]
	local mf=createInstance("Frame",{Name="MainFrame",AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,-0.5,0),Size=UDim2.new(0,uw,0,uh),BackgroundColor3=th["Color Hub 2"]},sg)
	createInstance("UICorner",{CornerRadius=UDim.new(0,12)},mf)
	addBorder(mf,th["Color Stroke"],2)
	local tb=createInstance("Frame",{Name="TopBar",Size=UDim2.new(1,0,0,60),BackgroundColor3=th["Color Hub 2"]},mf)
	createInstance("UICorner",{CornerRadius=UDim.new(0,12)},tb)
	local tl=createInstance("TextLabel",{Name="TitleLabel",Size=UDim2.new(1,-180,1,0),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Text=ft,TextColor3=th["Color Text"],Font=Enum.Font.GothamBold,TextSize=18,TextXAlignment=Enum.TextXAlignment.Left},tb)
	local wl=createInstance("TextLabel",{Name="WelcomeLabel",Size=UDim2.new(0,150,0,20),AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,10,1,-30),BackgroundTransparency=1,Text="Welcome, "..pl.Name,TextColor3=th["Color Text"],Font=Enum.Font.GothamBold,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left},mf)
	local function ccb(n,s,p)
		local b=createInstance("TextButton",{Name=n,Text=s,Size=UDim2.new(0,40,0,40),Position=p,BackgroundTransparency=1,TextColor3=th["Color Text"],Font=Enum.Font.GothamBold,TextSize=24},tb)
		return b
	end
	local hb=ccb("HideButton","–",UDim2.new(1,-110,0,10))
	local xb=ccb("MaxButton","□",UDim2.new(1,-70,0,10))
	local closeb=ccb("CloseButton","X",UDim2.new(1,-30,0,10))
	local sw=JustHub.Save.TabSize
	local sb=createInstance("Frame",{Name="Sidebar",Size=UDim2.new(0,sw,1,-60),Position=UDim2.new(0,0,0,60),BackgroundColor3=th["Color Hub 2"]},mf)
	createInstance("UICorner",{CornerRadius=UDim.new(0,10)},sb)
	createInstance("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,10),HorizontalAlignment=Enum.HorizontalAlignment.Center,VerticalAlignment=Enum.VerticalAlignment.Top},sb)
	local cc=createInstance("Frame",{Name="ContentContainer",Size=UDim2.new(1,-sw,1,-60),Position=UDim2.new(0,sw,0,60),BackgroundColor3=th["Color Hub 2"]},mf)
	createInstance("UICorner",{CornerRadius=UDim.new(0,10)},cc)
	local sf=createInstance("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,ScrollBarThickness=8,BorderSizePixel=0},cc)
	createInstance("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,10),HorizontalAlignment=Enum.HorizontalAlignment.Left},sf)
	local fl=createInstance("TextLabel",{Name="FPSLabel",Size=UDim2.new(0,100,0,20),AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-10,1,-10),BackgroundTransparency=1,TextColor3=th["Color Text"],Font=Enum.Font.Gotham,TextSize=14,Text="FPS: Calculating..."},mf)
	RunService.Heartbeat:Connect(function(d)
		local fps=math.floor(1/d)
		fl.Text="FPS: "..fps
	end)
	local iin=TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
	local tin=TweenService:Create(mf,iin,{Position=UDim2.new(0.5,0,0.5,0)})
	tin:Play()
	local minimized=false
	local maximized=false
	local osz=mf.Size
	local op=mf.Position
	hb.MouseButton1Click:Connect(function()
		if not minimized then
			tweenProperty(mf,{Size=UDim2.new(osz.X.Scale,osz.X.Offset,0,60)},0.3)
			wl.Visible=false
			sb.Visible=false
			cc.Visible=false
			fl.Visible=false
			minimized=true
		else
			tweenProperty(mf,{Size=osz},0.3)
			wait(0.3)
			wl.Visible=true
			sb.Visible=true
			cc.Visible=true
			fl.Visible=true
			minimized=false
		end
	end)
	xb.MouseButton1Click:Connect(function()
		if not maximized then
			tweenProperty(mf,{Size=UDim2.new(1,0,1,0),Position=UDim2.new(0.5,0,0.5,0)},0.3)
			maximized=true
		else
			tweenProperty(mf,{Size=osz,Position=op},0.3)
			maximized=false
		end
	end)
	closeb.MouseButton1Click:Connect(function()
		local tout=TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.In)
		local ctw=TweenService:Create(mf,tout,{Position=UDim2.new(0.5,0,-0.5,0)})
		ctw:Play()
		ctw.Completed:Connect(function()
			mf.Visible=false
			local p=Players.LocalPlayer
			local pg2=p:WaitForChild("PlayerGui")
			local sg2=Instance.new("ScreenGui")
			sg2.Name="ShowUI"
			sg2.ResetOnSpawn=false
			sg2.Parent=pg2
			local showBtn=Instance.new("TextButton")
			showBtn.Name="ShowUIButton"
			showBtn.Size=UDim2.new(0,150,0,50)
			showBtn.Position=UDim2.new(0.5,-75,0,0)
			showBtn.BackgroundColor3=th["Color Hub 2"]
			showBtn.Text="Show UI"
			showBtn.TextColor3=Color3.fromRGB(128,0,128)
			showBtn.Font=Enum.Font.GothamBold
			showBtn.TextSize=20
			createInstance("UICorner",{CornerRadius=UDim.new(0,25)},showBtn)
			createInstance("UIStroke",{Color=th["Color Theme"],Thickness=1},showBtn)
			showBtn.Parent=sg2
			showBtn.MouseButton1Click:Connect(function()
				mf.Visible=true
				tweenProperty(mf,{Position=UDim2.new(0.5,0,0.5,0)},0.5)
				sg2:Destroy()
			end)
		end)
	end)
	mf.Active=true
	local dragging=false
	local dragStart,startPos
	mf.InputBegan:Connect(function(inp)
		if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
			dragging=true
			dragStart=inp.Position
			startPos=mf.Position
		end
	end)
	mf.InputChanged:Connect(function(inp)
		if dragging and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
			local delta=inp.Position-dragStart
			local np=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
			np=clampPosition(np,Vector2.new(sg.AbsoluteSize.X,sg.AbsoluteSize.Y))
			mf.Position=np
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
			dragging=false
		end
	end)
	local resizeGrip=Instance.new("Frame")
	resizeGrip.Name="ResizeGrip"
	resizeGrip.Size=UDim2.new(0,20,0,20)
	resizeGrip.Position=UDim2.new(1,-20,1,-20)
	resizeGrip.BackgroundColor3=Color3.fromRGB(50,50,50)
	resizeGrip.BackgroundTransparency=0.3
	resizeGrip.BorderSizePixel=0
	resizeGrip.Parent=mf
	local resizeCorner=Instance.new("UICorner",resizeGrip)
	resizeCorner.CornerRadius=UDim.new(0,5)
	local resizing=false
	local startSize
	resizeGrip.InputBegan:Connect(function(inp)
		if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
			resizing=true
			dragStart=inp.Position
			startSize=mf.Size
		end
	end)
	resizeGrip.InputChanged:Connect(function(inp)
		if resizing and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
			local delta=inp.Position-dragStart
			local newW=startSize.X.Offset+delta.X
			local newH=startSize.Y.Offset+delta.Y
			newW=math.max(300,newW)
			newH=math.max(200,newH)
			mf.Size=UDim2.new(0,newW,0,newH)
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
			resizing=false
		end
	end)
	local notiContainer=createInstance("Frame",{Name="NotificationContainer",AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-10,1,-10),Size=UDim2.new(0,300,1,-20),BackgroundTransparency=1},sg)
	local notiLayout=createInstance("UIListLayout",{Padding=UDim.new(0,8),HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.VerticalAlignment.Bottom,SortOrder=Enum.SortOrder.LayoutOrder},notiContainer)
	self.NotificationContainer=notiContainer
	local wObj={ScreenGui=sg,MainFrame=mf,TopBar=tb,Sidebar=sb,ContentContainer=cc,Tabs={}}
	function wObj:addTab(tn)
		tn=tn or "Tab"
		local b=createInstance("TextButton",{Name=tn.."Button",Text=tn,Size=UDim2.new(1,0,0,20),BackgroundColor3=th["Color Stroke"],TextColor3=Color3.fromRGB(128,0,128),Font=Enum.Font.GothamBold,TextSize=12},sb)
		createInstance("UICorner",{CornerRadius=UDim.new(0,10)},b)
		createInstance("UIStroke",{Color=th["Color Theme"],Thickness=1},b)
		local tc=createInstance("Frame",{Name=tn.."Content",Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false},sf)
		local tObj={Name=tn,Button=b,Content=tc,Sections={}}
		table.insert(wObj.Tabs,tObj)
		b.MouseButton1Click:Connect(function()
			for _,tt in ipairs(wObj.Tabs) do
				tt.Content.Visible=false
			end
			tObj.Content.Visible=true
		end)
		if #wObj.Tabs==1 then
			tObj.Content.Visible=true
		end
		function tObj:addSection(sn,sh)
			sn=sn or "Section"
			sh=sh or 80
			local sframe=createInstance("Frame",{Name=sn,Size=UDim2.new(1,0,0,sh),BackgroundColor3=th["Color Hub 2"],BackgroundTransparency=0.0},tc)
			createInstance("UICorner",{CornerRadius=UDim.new(0,8)},sframe)
			addBorder(sframe,th["Color Stroke"],2)
			local st=createInstance("TextLabel",{Name="SectionTitle",Text=sn,Size=UDim2.new(1,0,0,30),BackgroundTransparency=1,TextColor3=th["Color Text"],Font=Enum.Font.GothamBold,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left},sframe)
			local sc=createInstance("Frame",{Name="SectionContent",Size=UDim2.new(1,0,1,-30),Position=UDim2.new(0,0,0,30),BackgroundTransparency=1},sframe)
			createInstance("UIListLayout",{FillDirection=Enum.FillDirection.Vertical,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Left},sc)
			local sObj={Frame=sframe,Title=st,Content=sc}
			table.insert(tObj.Sections,sObj)
			setmetatable(sObj,{__index=SectionMethods})
			return sObj
		end
		return tObj
	end
	return wObj
end

function JustHub:ShowLoadingScreen(d,cb)
	d=d or 5
	cb=cb or function()end
	local pl=Players.LocalPlayer
	local pg=pl:WaitForChild("PlayerGui")
	local lg=createInstance("ScreenGui",{Name="LoadingScreen",ResetOnSpawn=false,IgnoreGuiInset=true},pg)
	local bg=createInstance("Frame",{Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0.5,BorderSizePixel=0},lg)
	local tl=createInstance("TextLabel",{Text="JustHub Library",Font=Enum.Font.SourceSansSemibold,TextSize=20,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],BackgroundTransparency=1,Size=UDim2.new(0,200,0,50),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,-50)},lg)
	local wl=createInstance("TextLabel",{Text="Welcome, "..pl.Name,Font=Enum.Font.SourceSansSemibold,TextSize=16,TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],BackgroundTransparency=1,Size=UDim2.new(0,200,0,30),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0.5,10)},lg)
	local pbc=createInstance("Frame",{Size=UDim2.new(0.5,0,0,20),Position=UDim2.new(0.5,0,0.5,50),AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],BackgroundTransparency=0.5,BorderSizePixel=0},lg)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)},pbc)
	local pbf=createInstance("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Theme"],BorderSizePixel=0},pbc)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)},pbf)
	local tinfo=TweenInfo.new(d,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	local pt=TweenService:Create(pbf,tinfo,{Size=UDim2.new(1,0,1,0)})
	pt:Play()
	spawn(function()
		while pt.PlaybackState==Enum.PlaybackState.Playing do
			tweenProperty(tl,{TextTransparency=0.5},0.5)
			wait(0.5)
			tweenProperty(tl,{TextTransparency=0},0.5)
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
	self:ShowLoadingScreen(5,function()
		local w=self:CreateWindow(o)
		self.Window=w
	end)
end

function JustHub:SaveConfig(f)
	f=f or "JustHub_Config.json"
	if writefile then
		local j=HttpService:JSONEncode(JustHub.ConfigData)
		writefile(f,j)
		StarterGui:SetCore("SendNotification",{Title="Save Config",Text="Config berhasil disimpan ke "..f,Duration=5})
	else
		warn("Saving config is not supported in this environment.")
	end
end

function JustHub:LoadConfig(f)
	f=f or "JustHub_Config.json"
	if readfile then
		local d=readfile(f)
		local c=HttpService:JSONDecode(d)
		JustHub.ConfigData=c
		JustHub:ApplyConfig(c)
		StarterGui:SetCore("SendNotification",{Title="Load Config",Text="Config berhasil dimuat dari "..f,Duration=5})
		return c
	else
		warn("Loading config is not supported in this environment.")
		return {}
	end
end

function JustHub:UpdateTheme(nt)
	JustHub.Save.Theme=nt
	local th=getCurrentTheme(nt)
	if self.Window then
		local mf=self.Window.MainFrame
		mf.BackgroundColor3=th["Color Hub 2"]
		local tb=self.Window.TopBar
		tb.BackgroundColor3=th["Color Hub 2"]
		local tl=tb:FindFirstChild("TitleLabel")
		if tl then tl.TextColor3=th["Color Text"] end
		local sb=self.Window.Sidebar
		sb.BackgroundColor3=th["Color Hub 2"]
		local cc=self.Window.ContentContainer
		cc.BackgroundColor3=th["Color Hub 2"]
		for _,tab in ipairs(self.Window.Tabs) do
			if tab.Button then
				tab.Button.BackgroundColor3=th["Color Stroke"]
				tab.Button.TextColor3=th["Color Text"]
			end
		end
		local fl=mf:FindFirstChild("FPSLabel",true)
		if fl then
			fl.TextColor3=th["Color Text"]
		end
	end
end

function JustHub:RegisterTheme(name,definition)
	self.Themes[name]=definition
end

function JustHub:SetTheme(nt)
	self:UpdateTheme(nt)
end

function JustHub:ToggleUIVisibility()
	if self.ScreenGui and self.ScreenGui.Parent then
		self.ScreenGui.Enabled=not self.ScreenGui.Enabled
	end
end

function JustHub:Notify(o)
	o=o or {}
	local t=o.Title or ""
	local m=o.Message or ""
	local d=o.Duration or 5
	local showProgress=o.ShowProgress or false
	local theme=getCurrentTheme(JustHub.Save.Theme)
	if not self.NotificationContainer then
		return
	end
	local nf=createInstance("Frame",{Size=UDim2.new(0,300,0,0),BackgroundTransparency=0,ClipsDescendants=true},self.NotificationContainer)
	local corner=createInstance("UICorner",{CornerRadius=UDim.new(0,8)},nf)
	local stroke=addBorder(nf,theme["Color Stroke"],2)
	local grad=createInstance("UIGradient",{Color=theme["Color Hub 1"]},nf)
	local tLabel=createInstance("TextLabel",{Text=t,Size=UDim2.new(1,-10,0,20),Position=UDim2.new(0,5,0,5),BackgroundTransparency=1,TextColor3=theme["Color Text"],Font=Enum.Font.GothamBold,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left},nf)
	local mLabel=createInstance("TextLabel",{Text=m,Size=UDim2.new(1,-10,0,0),Position=UDim2.new(0,5,0,25),BackgroundTransparency=1,TextColor3=theme["Color Text"],Font=Enum.Font.Gotham,TextSize=12,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left},nf)
	mLabel.Size=UDim2.new(1,-10,0,mLabel.TextBounds.Y+5)
	local fullHeight=mLabel.AbsolutePosition.Y+mLabel.AbsoluteSize.Y-nf.AbsolutePosition.Y+10
	local progressFrame
	if showProgress then
		progressFrame=createInstance("Frame",{Size=UDim2.new(1,0,0,5),Position=UDim2.new(0,0,1,-5),BackgroundColor3=theme["Color Theme"]},nf)
		createInstance("UICorner",{CornerRadius=UDim.new(0,3)},progressFrame)
		fullHeight=fullHeight+5
	end
	nf.Size=UDim2.new(0,300,0,fullHeight)
	nf.BackgroundColor3=theme["Color Hub 2"]
	nf.BackgroundTransparency=0.1
	nf.Position=UDim2.new(1,0,1,0)
	local inTween=TweenService:Create(nf,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,300,0,fullHeight)})
	inTween:Play()
	spawn(function()
		inTween.Completed:Wait()
		if showProgress and progressFrame then
			local tw=TweenService:Create(progressFrame,TweenInfo.new(d,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size=UDim2.new(0,0,0,5)})
			tw:Play()
		end
		wait(d)
		local outTween=TweenService:Create(nf,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundTransparency=1,Size=UDim2.new(0,300,0,0)})
		outTween:Play()
		outTween.Completed:Wait()
		nf:Destroy()
	end)
end

return JustHub
