# JustHub UI Library

**JustHub** is a versatile and elegant UI library for Roblox that provides a modern, glassmorphism-inspired interface.

## Features

- Theming system  
- Dynamic user profile panels  
- Customizable notifications  
- Window resizing  
- Color pickers  
- Script boxes  
- Role-based permissions  
- Undo/redo system  
- And more  

---

## Table of Contents

1. New Update  
2. Installation  
3. Quick Start  
4. Core Concepts  
5. Available Controls  
6. Window Resizing  
7. Advanced Example  
8. License  

---

## New Update (Version 2.2.0)

### Visual & UX Upgrade

- Redesigned UI with gradients, soft shadows, rounded corners, and glassmorphism  
- Dynamic User Profile Panel (auto headshot + display name)  
- Smooth hover & click animations (TweenService)  
- Improved spacing and layout  
- GothamBold font (13–14pt)  

### UI Components

- `addMultiDropdown` **[NEW]**  
- `addChromaToggle` **[NEW]**  
- `addConfigManager` **[NEW]**  
- Improved `addButton`, `addDropdown`, `addTab`  

### Removed

- All sound/music systems removed for performance  
- Deprecated sound-related functions deleted  

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

JustHub:InitializeUI({
    Name = "JustHub UI",
    SubTitle = "Version 2.2",
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
        Message = "Welcome to JustHub!",
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
    Role = "admin",
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

### KeyBind

```lua
section:addBind({
    Name = "Toggle UI",
    Default = "RightShift",
    Callback = function()
        JustHub:ToggleUIVisibility()
    end
})
```

### Color Picker

```lua
section:addColorPicker({
    Name = "Accent",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(color) end
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

## Window Resizing

- Drag bottom-right corner  
- Size is clamped to prevent breaking UI  

---

## Advanced Example

```lua
local JustHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua"))()

JustHub:SetUserRole("admin")

JustHub:InitializeUI({
    Name = "Hero Hub UI",
    SubTitle = "v2.2",
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
        Message = "System initialized",
        Duration = 5,
        ShowProgress = true
    })
end)
```
