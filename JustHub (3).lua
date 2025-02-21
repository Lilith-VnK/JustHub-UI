local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

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
	},
	Purple = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(28,25,30)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(32,32,32)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(28,25,30))
		}),
		["Color Hub 2"] = Color3.fromRGB(30,30,30),
		["Color Stroke"] = Color3.fromRGB(40,40,40),
		["Color Theme"] = Color3.fromRGB(150,0,255),
		["Color Text"] = Color3.fromRGB(240,240,240),
		["Color Dark Text"] = Color3.fromRGB(180,180,180)
	}
}
JustHub.Info = {Version="1.1.0"}
JustHub.Save = {UISize={550,380},TabSize=160,Theme="Darker"}
JustHub.ConfigData = {}
JustHub.ControlRegistry = {}

local function createInstance(className, props, parent)
	local obj = Instance.new(className)
	if props then
		for k,v in pairs(props) do
			obj[k] = v
		end
	end
	if parent then
		obj.Parent = parent
	end
	return obj
end

local function tweenProperty(obj, propTable, duration)
	local ti = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tw = TweenService:Create(obj, ti, propTable)
	tw:Play()
	return tw
end

local function getCurrentTheme(themeName)
	local name = themeName or JustHub.Save.Theme
	return JustHub.Themes[name] or JustHub.Themes["Darker"]
end

local function clampPosition(pos, screenSize)
	local x = math.clamp(pos.X.Offset, 0, screenSize.X)
	local y = math.clamp(pos.Y.Offset, 0, screenSize.Y)
	return UDim2.new(pos.X.Scale, x, pos.Y.Scale, y)
end

local function addBorder(obj, col, thickness)
	return createInstance("UIStroke",{Color=col,Thickness=thickness}, obj)
end

function JustHub:RegisterControl(key, fn)
	JustHub.ControlRegistry[key] = fn
end

function JustHub:ApplyConfig(cfg)
	for k,v in pairs(cfg) do
		if JustHub.ControlRegistry[k] then
			JustHub.ControlRegistry[k](v)
		end
	end
end

local function ButtonFrame(parent, title, desc, holderSize)
	local theme = getCurrentTheme()
	local frame = createInstance("Frame", {
		Name="Option",
		Size=UDim2.new(1,0,0,25),
		BackgroundTransparency=0.1,
		BackgroundColor3=theme["Color Stroke"],
		ZIndex=2
	}, parent)
	frame.MouseEnter:Connect(function()
		tweenProperty(frame, {BackgroundTransparency=0}, 0.15)
	end)
	frame.MouseLeave:Connect(function()
		tweenProperty(frame, {BackgroundTransparency=0.1}, 0.15)
	end)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)}, frame)
	local labelHolder = createInstance("Frame", {
		Name="LabelHolder",
		Size=holderSize or UDim2.new(1,-20,1,0),
		Position=UDim2.new(0,10,0,0),
		BackgroundTransparency=1,
		ZIndex=2
	}, frame)
	local layout = createInstance("UIListLayout", {
		SortOrder=Enum.SortOrder.LayoutOrder,
		VerticalAlignment=Enum.VerticalAlignment.Center,
		Padding=UDim.new(0,2)
	}, labelHolder)
	local titleLabel = createInstance("TextLabel", {
		Name="Title",
		Text=(title or "Title"),
		Size=UDim2.new(1,0,0,0),
		AutomaticSize=Enum.AutomaticSize.Y,
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=12,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=2
	}, labelHolder)
	local descLabel = createInstance("TextLabel", {
		Name="Description",
		Text=(desc or ""),
		Size=UDim2.new(1,0,0,0),
		AutomaticSize=Enum.AutomaticSize.Y,
		BackgroundTransparency=1,
		TextWrapped=true,
		TextSize=10,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextColor3=theme["Color Dark Text"],
		ZIndex=2
	}, labelHolder)
	local function setTitle(txt)
		titleLabel.Text = txt
	end
	local function setDesc(txt)
		if txt and #txt>0 then
			descLabel.Visible=true
			descLabel.Text=txt
		else
			descLabel.Visible=false
			descLabel.Text=""
		end
	end
	setDesc(desc)
	local labelMethods = {
		SetTitle=setTitle,
		SetDesc=setDesc
	}
	return frame, labelMethods
end

local SectionMethods = {}

function SectionMethods:addToggle(opts)
	opts=opts or {}
	local name=opts.Name or "Toggle"
	local desc=opts.Desc or opts.Description or ""
	local default=opts.Default or false
	local callback=opts.Callback or function()end
	local frame, labelFunc = ButtonFrame(self.Content, name, desc, UDim2.new(1,-38,1,0))
	local theme = getCurrentTheme()
	local toggleHolder = createInstance("Frame", {
		Size=UDim2.new(0,35,0,18),
		Position=UDim2.new(1,-10,0.5),
		AnchorPoint=Vector2.new(1,0.5),
		BackgroundColor3=theme["Color Theme"],
		ZIndex=3
	}, frame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,9)}, toggleHolder)
	local toggleCircle = createInstance("Frame", {
		Size=UDim2.new(0,14,0,14),
		Position=default and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7),
		BackgroundColor3=Color3.fromRGB(255,255,255),
		BorderSizePixel=0,
		ZIndex=3
	}, toggleHolder)
	createInstance("UICorner",{CornerRadius=UDim.new(1,0)}, toggleCircle)
	local state=default
	local function setToggle(val)
		state=val
		if state then
			tweenProperty(toggleCircle, {Position=UDim2.new(1,-16,0.5,-7)}, 0.2)
			tweenProperty(toggleHolder, {BackgroundColor3=Color3.fromRGB(0,200,0)}, 0.2)
		else
			tweenProperty(toggleCircle, {Position=UDim2.new(0,2,0.5,-7)}, 0.2)
			tweenProperty(toggleHolder, {BackgroundColor3=theme["Color Theme"]}, 0.2)
		end
		callback(state)
	end
	setToggle(default)
	frame.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			setToggle(not state)
		end
	end)
	local toggleObj={}
	function toggleObj:Set(val)
		if type(val)=="boolean" then
			setToggle(val)
		elseif type(val)=="string" then
			labelFunc.SetTitle(val)
		end
	end
	function toggleObj:SetDesc(txt)
		labelFunc.SetDesc(txt)
	end
	function toggleObj:Callback(fn)
		callback=fn
	end
	function toggleObj:Destroy()
		frame:Destroy()
	end
	return toggleObj
end

function SectionMethods:addSlider(opts)
	opts=opts or {}
	local name=opts.Name or "Slider"
	local desc=opts.Desc or opts.Description or ""
	local min=opts.Min or 0
	local max=opts.Max or 100
	local default=opts.Default or min
	local callback=opts.Callback or function()end
	local frame, labelFunc = ButtonFrame(self.Content, name, desc, UDim2.new(1,-180,1,0))
	local theme=getCurrentTheme()
	local sliderHolder = createInstance("Frame", {
		Size=UDim2.new(0,150,0,18),
		Position=UDim2.new(1,-10,0.5),
		AnchorPoint=Vector2.new(1,0.5),
		BackgroundColor3=theme["Color Stroke"],
		ZIndex=3
	}, frame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, sliderHolder)
	local sliderBar = createInstance("Frame", {
		Size=UDim2.new(0.8,-10,0,4),
		Position=UDim2.new(0,10,0.5,-2),
		BackgroundColor3=theme["Color Stroke"],
		AnchorPoint=Vector2.new(0,0.5),
		ZIndex=3
	}, sliderHolder)
	createInstance("UICorner",{CornerRadius=UDim.new(0,2)}, sliderBar)
	local fill = createInstance("Frame", {
		Size=UDim2.new(0,(default-min)/(max-min)*sliderBar.AbsoluteSize.X,1,0),
		BackgroundColor3=theme["Color Theme"],
		BorderSizePixel=0,
		ZIndex=3
	}, sliderBar)
	createInstance("UICorner",{CornerRadius=UDim.new(0,2)}, fill)
	local handle = createInstance("Frame", {
		Size=UDim2.new(0,6,0,12),
		Position=UDim2.new((default-min)/(max-min),-3,0.5,-6),
		BackgroundColor3=Color3.fromRGB(220,220,220),
		BorderSizePixel=0,
		AnchorPoint=Vector2.new(0,0.5),
		ZIndex=3
	}, sliderBar)
	createInstance("UICorner",{CornerRadius=UDim.new(0,3)}, handle)
	local valLabel = createInstance("TextLabel", {
		Size=UDim2.new(0.2,0,1,0),
		Position=UDim2.new(0,0,0,0),
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		TextSize=10,
		Font=Enum.Font.GothamBold,
		Text=tostring(default),
		TextXAlignment=Enum.TextXAlignment.Right,
		ZIndex=3
	}, sliderHolder)
	local function setValue(x)
		local ratio=math.clamp(x,0,1)
		local value=math.floor((min+ratio*(max-min)))
		valLabel.Text=tostring(value)
		tweenProperty(fill,{Size=UDim2.new(ratio,0,1,0)},0.05)
		tweenProperty(handle,{Position=UDim2.new(ratio,-3,0.5,-6)},0.05)
		callback(value)
	end
	local dragging=false
	handle.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			dragging=true
		end
	end)
	handle.InputEnded:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			dragging=false
		end
	end)
	sliderHolder.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			dragging=true
			local pos=input.Position.X - sliderBar.AbsolutePosition.X
			local ratio=pos/sliderBar.AbsoluteSize.X
			setValue(ratio)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement) then
			local pos=input.Position.X - sliderBar.AbsolutePosition.X
			local ratio=pos/sliderBar.AbsoluteSize.X
			setValue(ratio)
		end
	end)
	setValue((default-min)/(max-min))
	local sliderObj={}
	function sliderObj:Set(val)
		if type(val)=="number" then
			local ratio=(val-min)/(max-min)
			setValue(ratio)
		elseif type(val)=="string" then
			labelFunc.SetTitle(val)
		end
	end
	function sliderObj:SetDesc(txt)
		labelFunc.SetDesc(txt)
	end
	function sliderObj:Callback(fn)
		callback=fn
	end
	function sliderObj:Destroy()
		frame:Destroy()
	end
	return sliderObj
end

function SectionMethods:addTextBox(opts)
	opts=opts or {}
	local name=opts.Name or "TextBox"
	local desc=opts.Desc or opts.Description or ""
	local default=opts.Default or ""
	local callback=opts.Callback or function()end
	local frame, labelFunc = ButtonFrame(self.Content, name, desc, UDim2.new(1,-38,1,0))
	local theme=getCurrentTheme()
	local textHolder = createInstance("Frame", {
		Size=UDim2.new(0,150,0,18),
		Position=UDim2.new(1,-10,0.5),
		AnchorPoint=Vector2.new(1,0.5),
		BackgroundColor3=theme["Color Stroke"],
		ZIndex=3
	}, frame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, textHolder)
	local box = createInstance("TextBox", {
		Size=UDim2.new(0.85,0,0.85,0),
		Position=UDim2.new(0.5,0,0.5,0),
		AnchorPoint=Vector2.new(0.5,0.5),
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=12,
		Text=default,
		PlaceholderText="Input",
		ZIndex=4
	}, textHolder)
	box.FocusLost:Connect(function()
		callback(box.Text)
	end)
	local txtObj={}
	function txtObj:Set(val)
		if type(val)=="string" then
			box.Text=val
		else
			labelFunc.SetTitle(tostring(val))
		end
	end
	function txtObj:SetDesc(txt)
		labelFunc.SetDesc(txt)
	end
	function txtObj:Callback(fn)
		callback=fn
	end
	function txtObj:Destroy()
		frame:Destroy()
	end
	return txtObj
end

function SectionMethods:addDropdown(opts)
	opts=opts or {}
	local name=opts.Name or "Dropdown"
	local desc=opts.Desc or opts.Description or ""
	local items=opts.Items or {}
	local default=opts.Default or ""
	local callback=opts.Callback or function()end
	local frame, labelFunc = ButtonFrame(self.Content, name, desc, UDim2.new(1,-180,1,0))
	local theme=getCurrentTheme()
	local dropHolder = createInstance("Frame", {
		Size=UDim2.new(0,150,0,18),
		Position=UDim2.new(1,-10,0.5),
		AnchorPoint=Vector2.new(1,0.5),
		BackgroundColor3=theme["Color Stroke"],
		ZIndex=3
	}, frame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, dropHolder)
	local dropBtn = createInstance("TextButton", {
		Text=(default~="" and default or "Select").." ▼",
		Size=UDim2.new(0.85,0,0.85,0),
		Position=UDim2.new(0.5,0,0.5,0),
		AnchorPoint=Vector2.new(0.5,0.5),
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=12,
		ZIndex=4
	}, dropHolder)
	local screenGui=frame:FindFirstAncestorWhichIsA("ScreenGui")
	local listFrame
	if screenGui then
		listFrame=createInstance("ScrollingFrame", {
			Name="DropdownList",
			Size=UDim2.new(0,150,0,0),
			BackgroundColor3=theme["Color Hub 2"],
			Visible=false,
			ClipsDescendants=true,
			ScrollBarThickness=4,
			ZIndex=5
		}, screenGui)
	else
		listFrame=createInstance("ScrollingFrame", {
			Name="DropdownList",
			Size=UDim2.new(0,150,0,0),
			BackgroundColor3=theme["Color Hub 2"],
			Visible=false,
			ClipsDescendants=true,
			ScrollBarThickness=4,
			ZIndex=5
		})
	end
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, listFrame)
	local layout = createInstance("UIListLayout", {
		Padding=UDim.new(0,2),
		SortOrder=Enum.SortOrder.LayoutOrder
	}, listFrame)
	local open=false
	local function showList()
		if open then
			tweenProperty(listFrame,{Size=UDim2.new(0,150,0,0)},0.2)
			wait(0.2)
			listFrame.Visible=false
		else
			listFrame.Visible=true
			local count=#items
			local h=(count*20)+10
			listFrame.Size=UDim2.new(0,150,0,h)
			tweenProperty(listFrame,{Size=UDim2.new(0,150,0,h)},0.2)
		end
		open=not open
	end
	dropBtn.MouseButton1Click:Connect(showList)
	local function updatePos()
		if not listFrame or not listFrame.Visible then return end
		local absPos = dropHolder.AbsolutePosition
		listFrame.Position=UDim2.fromOffset(absPos.X, absPos.Y+dropHolder.AbsoluteSize.Y)
	end
	dropHolder:GetPropertyChangedSignal("AbsolutePosition"):Connect(updatePos)
	dropHolder:GetPropertyChangedSignal("AbsoluteSize"):Connect(updatePos)
	local function refreshList(it)
		for _,c in pairs(listFrame:GetChildren()) do
			if c:IsA("TextButton") then
				c:Destroy()
			end
		end
		items=it
		for _,val in ipairs(items) do
			local btn=createInstance("TextButton", {
				Text=val,
				Size=UDim2.new(1,0,0,20),
				BackgroundColor3=Color3.fromRGB(0,0,0),
				BackgroundTransparency=1,
				TextColor3=Color3.fromRGB(255,255,255),
				Font=Enum.Font.Gotham,
				TextSize=10,
				ZIndex=6
			}, listFrame)
			btn.MouseButton1Click:Connect(function()
				dropBtn.Text=val.." ▼"
				callback(val)
				showList()
			end)
		end
		updatePos()
	end
	refreshList(items)
	local dropObj={}
	function dropObj:Set(val)
		if type(val)=="string" then
			dropBtn.Text=val.." ▼"
		elseif type(val)=="table" then
			refreshList(val)
		end
	end
	function dropObj:SetDesc(txt)
		labelFunc.SetDesc(txt)
	end
	function dropObj:Callback(fn)
		callback=fn
	end
	function dropObj:Destroy()
		frame:Destroy()
		listFrame:Destroy()
	end
	return dropObj
end

function SectionMethods:addButton(opts)
	opts=opts or {}
	local name=opts.Name or "Button"
	local desc=opts.Desc or opts.Description or ""
	local buttonText=opts.ButtonText or "Click"
	local callback=opts.Callback or function()end
	local frame, labelFunc = ButtonFrame(self.Content, name, desc, UDim2.new(1,-20,1,0))
	local theme=getCurrentTheme()
	local actBtn = createInstance("TextButton", {
		Name="ActionButton",
		Text=buttonText,
		Size=UDim2.new(0,60,0,20),
		Position=UDim2.new(1,-65,0.5,-10),
		AnchorPoint=Vector2.new(1,0.5),
		BackgroundColor3=theme["Color Theme"],
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=12,
		ZIndex=4
	}, frame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)}, actBtn)
	actBtn.MouseButton1Click:Connect(function()
		callback()
	end)
	local buttonObj={}
	function buttonObj:Set(val)
		if type(val)=="string" then
			labelFunc.SetTitle(val)
		end
	end
	function buttonObj:SetDesc(txt)
		labelFunc.SetDesc(txt)
	end
	function buttonObj:Callback(fn)
		callback=fn
	end
	function buttonObj:Destroy()
		frame:Destroy()
	end
	return buttonObj
end

function JustHub:Notify(opts)
	opts=opts or {}
	local title=opts.Title or "Title"
	local msg=opts.Message or "Message"
	local dur=opts.Duration or 5
	local theme=getCurrentTheme()
	if not self.NotificationContainer then
		warn("Notification container not found.")
		return
	end
	local nf=createInstance("Frame", {
		Size=UDim2.new(0,300,0,0),
		BackgroundColor3=theme["Color Hub 2"],
		ClipsDescendants=true,
		ZIndex=100
	}, self.NotificationContainer)
	createInstance("UICorner",{CornerRadius=UDim.new(0,8)}, nf)
	addBorder(nf, theme["Color Stroke"],2)
	local ttl=createInstance("TextLabel", {
		Text=title,
		Size=UDim2.new(1,-10,0,20),
		Position=UDim2.new(0,5,0,5),
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=14,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=101
	}, nf)
	local body=createInstance("TextLabel", {
		Text=msg,
		Size=UDim2.new(1,-10,0,0),
		Position=UDim2.new(0,5,0,25),
		BackgroundTransparency=1,
		TextColor3=theme["Color Dark Text"],
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextXAlignment=Enum.TextXAlignment.Left,
		TextWrapped=true,
		AutomaticSize=Enum.AutomaticSize.Y,
		ZIndex=101
	}, nf)
	RunService.Heartbeat:Wait()
	local totalH=body.AbsolutePosition.Y+body.AbsoluteSize.Y - nf.AbsolutePosition.Y + 10
	nf.Size=UDim2.new(0,300,0,totalH)
	local twIn=TweenService:Create(nf, TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {Size=UDim2.new(0,300,0,totalH)})
	twIn:Play()
	spawn(function()
		wait(dur)
		local twOut=TweenService:Create(nf, TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In), {BackgroundTransparency=1,Size=UDim2.new(0,300,0,0)})
		twOut:Play()
		twOut.Completed:Connect(function()
			nf:Destroy()
		end)
	end)
end

function JustHub:addSection(secName, secHeight)
	local theme=getCurrentTheme()
	local sName=secName or "Section"
	local sHeight=secHeight or 80
	local secFrame=createInstance("Frame", {
		Name=sName,
		Size=UDim2.new(1,0,0,sHeight),
		BackgroundColor3=theme["Color Stroke"],
		BackgroundTransparency=0.2,
		ZIndex=2
	}, nil)
	addBorder(secFrame, theme["Color Stroke"],2)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)}, secFrame)
	local secTitle=createInstance("TextLabel", {
		Name="SectionTitle",
		Text=sName,
		Size=UDim2.new(1,0,0,30),
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=16,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=3
	}, secFrame)
	local secContent=createInstance("Frame", {
		Name="SectionContent",
		Size=UDim2.new(1,0,1,-30),
		Position=UDim2.new(0,0,0,30),
		BackgroundTransparency=1,
		ZIndex=3
	}, secFrame)
	createInstance("UIListLayout", {
		FillDirection=Enum.FillDirection.Vertical,
		Padding=UDim.new(0,5),
		SortOrder=Enum.SortOrder.LayoutOrder
	}, secContent)
	local sObj={Frame=secFrame,Title=secTitle,Content=secContent}
	setmetatable(sObj,{__index=SectionMethods})
	return sObj
end

function JustHub:CreateWindow(options)
	options=options or {}
	local wName=options.Name or "JustHub Window"
	local theme=getCurrentTheme(options.Theme)
	local player=Players.LocalPlayer
	local pg=player:WaitForChild("PlayerGui")
	local sg=createInstance("ScreenGui",{Name="JustHub",ResetOnSpawn=false}, pg)
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	self.ScreenGui=sg
	local uiW=JustHub.Save.UISize[1]
	local uiH=JustHub.Save.UISize[2]
	local mainFrame=createInstance("Frame", {
		Name="MainFrame",
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,0),
		Size=UDim2.new(0,uiW,0,uiH),
		BackgroundColor3=theme["Color Hub 2"],
		ZIndex=1
	}, sg)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)}, mainFrame)
	addBorder(mainFrame, theme["Color Stroke"], 2)
	local topBar=createInstance("Frame", {
		Name="TopBar",
		Size=UDim2.new(1,0,0,28),
		BackgroundColor3=theme["Color Hub 2"],
		ZIndex=2
	}, mainFrame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,6)}, topBar)
	local titleLabel=createInstance("TextLabel", {
		Name="TitleLabel",
		Text=wName,
		Size=UDim2.new(1,-60,1,0),
		Position=UDim2.new(0,10,0,0),
		BackgroundTransparency=1,
		TextColor3=theme["Color Text"],
		Font=Enum.Font.GothamBold,
		TextSize=14,
		TextXAlignment=Enum.TextXAlignment.Left,
		ZIndex=3
	}, topBar)
	local subTitle=createInstance("TextLabel", {
		Name="SubTitle",
		Text=options.SubTitle or "by: MyName",
		Size=UDim2.new(0,100,1,0),
		Position=UDim2.new(1,-110,0,0),
		BackgroundTransparency=1,
		TextColor3=theme["Color Dark Text"],
		Font=Enum.Font.Gotham,
		TextSize=12,
		TextXAlignment=Enum.TextXAlignment.Right,
		ZIndex=3
	}, topBar)
	local function makeBtn(n,txt,pos)
		return createInstance("TextButton", {
			Name=n,
			Text=txt,
			Size=UDim2.new(0,24,0,24),
			Position=pos,
			BackgroundTransparency=1,
			TextColor3=theme["Color Text"],
			Font=Enum.Font.GothamBold,
			TextSize=14,
			ZIndex=4
		}, topBar)
	end
	local closeBtn=makeBtn("CloseBtn","X",UDim2.new(1,-30,0,2))
	local miniBtn=makeBtn("MiniBtn","–",UDim2.new(1,-60,0,2))
	local minimized=false
	local originalSize=mainFrame.Size
	miniBtn.MouseButton1Click:Connect(function()
		if not minimized then
			tweenProperty(mainFrame,{Size=UDim2.new(originalSize.X.Scale,originalSize.X.Offset,0,28)},0.25)
			minimized=true
		else
			tweenProperty(mainFrame,{Size=originalSize},0.25)
			minimized=false
		end
	end)
	closeBtn.MouseButton1Click:Connect(function()
		sg:Destroy()
	end)
	local sideW=JustHub.Save.TabSize
	local sidebar=createInstance("ScrollingFrame", {
		Name="TabScroll",
		Size=UDim2.new(0,sideW,1,-28),
		Position=UDim2.new(0,0,0,28),
		BackgroundColor3=theme["Color Hub 2"],
		ScrollBarThickness=4,
		CanvasSize=UDim2.new(),
		AutomaticCanvasSize=Enum.AutomaticSize.Y,
		ZIndex=2
	}, mainFrame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, sidebar)
	local layoutSide=createInstance("UIListLayout", {
		Padding=UDim.new(0,5),
		SortOrder=Enum.SortOrder.LayoutOrder
	}, sidebar)
	local container=createInstance("Frame", {
		Name="Containers",
		Size=UDim2.new(1,-sideW,1,-28),
		Position=UDim2.new(0,sideW,0,28),
		BackgroundColor3=theme["Color Hub 2"],
		ZIndex=2
	}, mainFrame)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, container)
	local scroller=createInstance("ScrollingFrame", {
		Size=UDim2.new(1,0,1,0),
		ScrollBarThickness=4,
		BackgroundTransparency=1,
		AutomaticCanvasSize=Enum.AutomaticSize.Y,
		ZIndex=2
	}, container)
	local layoutMain=createInstance("UIListLayout", {
		Padding=UDim.new(0,5),
		SortOrder=Enum.SortOrder.LayoutOrder
	}, scroller)
	local dragging=false
	local dragStart, startPos
	topBar.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			dragging=true
			dragStart=input.Position
			startPos=mainFrame.Position
		end
	end)
	topBar.InputChanged:Connect(function(input)
		if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
			local delta=input.Position-dragStart
			local newPos=UDim2.new(startPos.X.Scale, startPos.X.Offset+delta.X, startPos.Y.Scale, startPos.Y.Offset+delta.Y)
			newPos=clampPosition(newPos, Vector2.new(sg.AbsoluteSize.X, sg.AbsoluteSize.Y))
			mainFrame.Position=newPos
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			dragging=false
		end
	end)
	local notiContainer=createInstance("Frame", {
		Name="NotificationContainer",
		AnchorPoint=Vector2.new(1,1),
		Position=UDim2.new(1,-10,1,-10),
		Size=UDim2.new(0,300,1,-20),
		BackgroundTransparency=1,
		ClipsDescendants=false,
		ZIndex=100
	}, sg)
	local notiLayout=createInstance("UIListLayout", {
		Padding=UDim.new(0,8),
		HorizontalAlignment=Enum.HorizontalAlignment.Right,
		VerticalAlignment=Enum.VerticalAlignment.Bottom,
		SortOrder=Enum.SortOrder.LayoutOrder
	}, notiContainer)
	self.NotificationContainer=notiContainer
	local windowObj = {
		ScreenGui=sg,
		MainFrame=mainFrame,
		TopBar=topBar,
		Sidebar=sidebar,
		ContentContainer=scroller,
		Tabs={}
	}
	function windowObj:addTab(tabName, iconId)
		local tName=tabName or "New Tab"
		local tabBtn=createInstance("TextButton", {
			Name=tName.."Button",
			Text="",
			Size=UDim2.new(1,0,0,24),
			BackgroundColor3=theme["Color Stroke"],
			TextColor3=theme["Color Text"],
			Font=Enum.Font.GothamBold,
			TextSize=12,
			AutoButtonColor=false,
			ZIndex=3
		}, self.Sidebar)
		createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, tabBtn)
		local icon
		if iconId and iconId:find("rbxassetid://") then
			icon=createInstance("ImageLabel", {
				Size=UDim2.new(0,18,0,18),
				Position=UDim2.new(0,4,0.5,0),
				AnchorPoint=Vector2.new(0,0.5),
				BackgroundTransparency=1,
				Image=iconId,
				ZIndex=4
			}, tabBtn)
		end
		local tabLabel=createInstance("TextLabel", {
			Name="TabLabel",
			Text=tName,
			Size=UDim2.new(1,(icon and -25 or -10),1,0),
			Position=(icon and UDim2.new(0,24,0,0) or UDim2.new(0,5,0,0)),
			BackgroundTransparency=1,
			TextColor3=theme["Color Text"],
			Font=Enum.Font.GothamBold,
			TextSize=12,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=4
		}, tabBtn)
		local tabContent=createInstance("ScrollingFrame", {
			Name=tName.."Content",
			Size=UDim2.new(1,0,0,0),
			AutomaticCanvasSize=Enum.AutomaticSize.Y,
			ScrollingDirection=Enum.ScrollingDirection.Y,
			BackgroundTransparency=1,
			Visible=false,
			ScrollBarThickness=4,
			ZIndex=2
		}, self.ContentContainer)
		local layoutTab=createInstance("UIListLayout", {
			Padding=UDim.new(0,5),
			SortOrder=Enum.SortOrder.LayoutOrder
		}, tabContent)
		local tabObj={Name=tName,Button=tabBtn,Content=tabContent,Sections={}}
		table.insert(self.Tabs, tabObj)
		tabBtn.MouseButton1Click:Connect(function()
			for _,tb in ipairs(self.Tabs) do
				tb.Content.Visible=false
				tb.Button.BackgroundColor3=theme["Color Stroke"]
			end
			tabContent.Visible=true
			tabBtn.BackgroundColor3=theme["Color Hub 2"]
		end)
		if #self.Tabs==1 then
			tabContent.Visible=true
			tabBtn.BackgroundColor3=theme["Color Hub 2"]
		end
		function tabObj:addSection(secName)
			local sName=secName or "Section"
			local secFrame=createInstance("Frame", {
				Size=UDim2.new(1,0,0,20),
				BackgroundColor3=theme["Color Stroke"],
				BackgroundTransparency=0.2,
				ZIndex=2
			}, tabContent)
			createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, secFrame)
			addBorder(secFrame, theme["Color Stroke"],1)
			local secLabel=createInstance("TextLabel", {
				Text=sName,
				Size=UDim2.new(1,-10,0,20),
				Position=UDim2.new(0,5,0,0),
				BackgroundTransparency=1,
				TextColor3=theme["Color Text"],
				Font=Enum.Font.GothamBold,
				TextSize=14,
				TextXAlignment=Enum.TextXAlignment.Left,
				ZIndex=3
			}, secFrame)
			local secContent=createInstance("Frame", {
				Size=UDim2.new(1,0,0,0),
				Position=UDim2.new(0,0,0,20),
				BackgroundTransparency=1,
				AutomaticSize=Enum.AutomaticSize.Y,
				ZIndex=3
			}, secFrame)
			local layoutSec=createInstance("UIListLayout", {
				Padding=UDim.new(0,4),
				SortOrder=Enum.SortOrder.LayoutOrder
			}, secContent)
			local sObj={Frame=secFrame,Title=secLabel,Content=secContent}
			setmetatable(sObj,{__index=SectionMethods})
			table.insert(tabObj.Sections, sObj)
			return sObj
		end
		return tabObj
	end
	return windowObj
end

function JustHub:ShowLoadingScreen(d,cb)
	d=d or 5
	cb=cb or function()end
	local pl=Players.LocalPlayer
	local pg=pl:WaitForChild("PlayerGui")
	local lg=createInstance("ScreenGui",{Name="LoadingScreen",ResetOnSpawn=false,IgnoreGuiInset=true}, pg)
	local bg=createInstance("Frame", {
		Size=UDim2.new(1,0,1,0),
		Position=UDim2.new(0,0,0,0),
		BackgroundColor3=Color3.new(0,0,0),
		BackgroundTransparency=0.5
	}, lg)
	local tl=createInstance("TextLabel", {
		Text="JustHub Library",
		Font=Enum.Font.SourceSansSemibold,
		TextSize=20,
		TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		BackgroundTransparency=1,
		Size=UDim2.new(0,200,0,50),
		AnchorPoint=Vector2.new(0.5,0.5),
		Position=UDim2.new(0.5,0,0.5,-50)
	}, lg)
	local wl=createInstance("TextLabel", {
		Text="Welcome, "..pl.Name,
		Font=Enum.Font.SourceSansSemibold,
		TextSize=16,
		TextColor3=getCurrentTheme(JustHub.Save.Theme)["Color Text"],
		BackgroundTransparency=1,
		Size=UDim2.new(0,200,0,30),
		AnchorPoint=Vector2.new(0.5,0),
		Position=UDim2.new(0.5,0,0.5,10)
	}, lg)
	local pbc=createInstance("Frame", {
		Size=UDim2.new(0.5,0,0,20),
		Position=UDim2.new(0.5,0,0.5,50),
		AnchorPoint=Vector2.new(0.5,0.5),
		BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Stroke"],
		BackgroundTransparency=0.5
	}, lg)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, pbc)
	local pbf=createInstance("Frame", {
		Size=UDim2.new(0,0,1,0),
		BackgroundColor3=getCurrentTheme(JustHub.Save.Theme)["Color Theme"]
	}, pbc)
	createInstance("UICorner",{CornerRadius=UDim.new(0,4)}, pbf)
	local tinfo=TweenInfo.new(d,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
	local pt=TweenService:Create(pbf, tinfo, {Size=UDim2.new(1,0,1,0)})
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

function JustHub:InitializeUI(opts)
	self:ShowLoadingScreen(5, function()
		local w=self:CreateWindow(opts)
		self.Window=w
	end)
end

function JustHub:SaveConfig(fname)
	fname=fname or "JustHub_Config.json"
	if writefile then
		local enc=HttpService:JSONEncode(self.ConfigData)
		writefile(fname,enc)
	end
end

function JustHub:LoadConfig(fname)
	fname=fname or "JustHub_Config.json"
	if readfile then
		local data=readfile(fname)
		local dec=HttpService:JSONDecode(data)
		self.ConfigData=dec
		self:ApplyConfig(dec)
	end
end

function JustHub:ToggleUIVisibility()
	if self.ScreenGui and self.ScreenGui.Parent then
		self.ScreenGui.Enabled=not self.ScreenGui.Enabled
	end
end

UserInputService.InputBegan:Connect(function(input, gp)
	if not gp and input.KeyCode==Enum.KeyCode.RightShift then
		JustHub:ToggleUIVisibility()
	end
end)

return JustHub
