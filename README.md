# JustHub UI Library

**JustHub** is a versatile, highly-optimized, and elegant UI library for Roblox that provides a modern, glassmorphism-inspired interface with zero memory leaks.

## Features

- **[NEW]** Leak-Free Memory Management (:Destroy() method)
- **[NEW]** Dynamic Theme Engine 2.0 (Instantly updates all UI elements)
- ​Glassmorphism-inspired visual design
- ​Dynamic user profile panels
- ​Global Z-Index Dropdowns (No more clipping)
- ​Advanced Color Pickers (RGB & HEX support)
- ​Float/Decimal support for Sliders
- ​Smart KeyBinds with System Key Blacklist
- ​Role-based permissions
- ​Undo/redo system
- ​And more

---

## Table of Contents

- [New Update (Version 2.5.0)](#new-update-version-250)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Core Concepts](#core-concepts)
- [Available Controls](#available-controls)
- [Notifications](#notifications)
- [Window Resizing & Memory Cleanup](#window-resizing--memory-cleanup)
- [Advanced Example](#advanced-example)

---

## New Update (Version 2.5.0)

### 🚀 Performance & Memory

- Complete Memory Leak Protection: Introduced JustHub:Destroy() to safely disconnect all RenderStepped, InputBegan, and InputChanged events.
-​Cleaned up internal redundancies for max FPS stability.

### ​🎨 Visual & UX Upgrade

- `Theme Engine 2.0: Calling JustHub:SetTheme() now dynamically updates all existing UI elements (buttons, toggles, strokes) instantly, not just the background.`
- `Global Dropdowns: Fixed Z-Index issues. Dropdowns now correctly overlap all other UI elements below them.`

### ⚙️ Component Enhancements

- Sliders: Now support decimal/float values via the Step parameter (e.g., Step = 0.1).
- Color Picker: Added a built-in HEX code text box alongside RGB inputs.
- KeyBind: Upgraded with a "Press Key..." capture mode and a strict blacklist to prevent binding movement keys (W, A, S, D, Space).

### Cleanup

- Removed comments  
- Reduced redundancy (DRY)  

---

## Installation

### 1. Place Module

Put `JustHub.lua` inside:

- `ReplicatedStorage`  
- or `ServerScriptService`  

### 2. Load via Web (Recommended)

```lua
local JustHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua"))()
```

---

## Quick Start

```lua
local JustHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua"))()

-- [1] CLEANUP PREVIOUS INSTANCE
if getgenv().JustHubInstance then
    getgenv().JustHubInstance:Destroy()
end

-- [2] SAVE NEW INSTANCE TO GLOBAL
getgenv().JustHubInstance = JustHub

-- [3] INITIALIZE
JustHub:InitializeUI({
    Name = "JustHub UI",
    SubTitle = "Version 3.0.0",
    Theme = "Darker"
})

task.spawn(function()
    while not JustHub.Window do task.wait() end

    local window = JustHub.Window
    local tab = window:addTab("Main", "home")
    local section = tab:addSection("Settings")

    section:addChromaToggle()

    section:addToggle({
        Name = "Enable Feature X",
        Default = true,
        Callback = function(state)
            print("Feature X:", state)
        end
    })

    JustHub:Notify({
        Title = "UI Loaded",
        Message = "Welcome to JustHub V3!",
        Duration = 5,
        ShowProgress = true
    })
end)
```

---

## Core Concepts

### Themes & Glassmorphism

Available themes:

`Darker, Dark, Purple, Light, Neon, Forest, Aqua, Crimson, Solar, Pastel, Cyber, Ocean, Desert, Vintage, Rainbow, Midnight`

```lua
JustHub:SetTheme("Cyber")
```

---

### User Profile Panel

- Auto fetch headshot & DisplayName  
- No setup required  

---

### Tabs & Icons

```lua
local homeTab = window:addTab("Home", "home")
local settingsTab = window:addTab("Settings", "cog")
```

---

### Role-Based Permissions

```lua
JustHub:SetUserRole("member")

section:addToggle({
    Name = "Admin Feature",
    Role = "admin", -- Only renders if UserRole is "admin"
    Callback = function(state) end
})
```

---

### Undo / Redo

```lua
JustHub:Undo()
JustHub:Redo()
```

---

### Localization

```lua
JustHub.Localization = {
    en = { HELLO = "Hello" },
    id = { HELLO = "Halo" }
}

JustHub:SetLanguage("id")
print(JustHub:LocalizeText("HELLO"))
```

---

## Available Controls

### Menu

```lua
section:addMenu("Menu Title")
```

### Config Manager

```lua
section:addConfigManager()
```

### Chroma Toggle

```lua
section:addChromaToggle()
```

### Toggle

```lua
section:addToggle({
    Name = "God Mode",
    Default = false,
    Callback = function(state) end
})
```

### Slider

```lua
section:addSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Step = 0.5, -- Use decimals for precise control
    Default = 16,
    Callback = function(value) end
})
```

### TextBox

```lua
section:addTextBox({
    Name = "Player Name",
    Default = "",
    Callback = function(text) end
})
```

### Dropdown

```lua
section:addDropdown({
    Name = "ESP Mode",
    Items = {"Box", "Skeleton", "Chams"},
    Default = "Box",
    Callback = function(choice) end
})
```

### Dropdown (Global Z-Index)

```
section:addDropdown({
    Name = "ESP Mode",
    Items = {"Box", "Skeleton", "Chams"},
    Presets = {"All"}, -- Highlights in theme color
    Default = "Box",
    Callback = function(choice) end
})
```

### Multi Dropdown

```lua
section:addMultiDropdown({
    Name = "Aura",
    Items = {"Fire", "Water", "Lightning"},
    Default = {"Fire"},
    Callback = function(selected) end
})
```

### Button

```lua
section:addButton({
    Name = "Execute",
    ButtonText = "Run",
    Callback = function() end
})
```

### KeyBind (Smart Capture & Blacklisted System Keys)

```lua
section:addBind({
    Name = "Toggle UI",
    Default = "RightShift",
    Callback = function()
        JustHub:ToggleUIVisibility()
    end
})
```

### Color Picker (RGB & HEX)

```lua
section:addColorPicker({
    Name = "Accent",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(color) 
        -- color is a Color3 value
    end
})
```

### ScriptBox

```lua
section:addScriptBox({
    Name = "Executor",
    Default = "print('Hello World')",
    Callback = function(code) end
})
```

---

## Notifications

```lua
JustHub:Notify({
    Title = "Warning",
    Message = "Experimental feature",
    Duration = 5,
    ShowProgress = true
})
```

---

## Window Resizing & Memory Cleanup

​Resize: Drag the bottom-right corner. Size is clamped to prevent breaking UI.
​Drag: Drag via the top bar.
​Cleanup: Always use :Destroy() when closing or reloading the script to maintain perfect game FPS.

---

## Advanced Example

```lua
local JustHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua"))()

if getgenv().JustHubInstance then getgenv().JustHubInstance:Destroy() end
getgenv().JustHubInstance = JustHub

JustHub:SetUserRole("admin")

JustHub:InitializeUI({
    Name = "Hero Hub UI",
    SubTitle = "v3.0.0",
    Theme = "Darker"
})

task.spawn(function()
    while not JustHub.Window do task.wait() end

    local window = JustHub.Window

    local heroTab = window:addTab("Hero", "award")
    local settingsTab = window:addTab("Settings", "cog")

    local power = heroTab:addSection("Powers")
    local util = heroTab:addSection("Utilities")
    local config = settingsTab:addSection("Config")

    power:addSlider({
        Name = "Flight Speed",
        Min = 10,
        Max = 200,
        Step = 1.5,
        Default = 50,
        Callback = function(val) print(val) end
    })

    power:addMultiDropdown({
        Name = "Abilities",
        Items = {"Flight", "Laser", "Invisibility"},
        Default = {"Flight"},
        Callback = function(sel)
            print(table.concat(sel, ", "))
        end
    })

    util:addChromaToggle()
    util:addConfigManager()

    JustHub:Notify({
        Title = "Ready",
        Message = "System initialized safely.",
        Duration = 5,
        ShowProgress = true
    })
end)
```
