# JustHub UI Library

**JustHub** is a versatile UI library for Roblox that provides a modern interface with numerous features such as theming, notifications with timers, resizing, color pickers, macros/scripting boxes, role-based permissions, undo/redo functionality, and more. This documentation covers all major components and usage instructions in detail.

---

## Table of Contents
1. [Installation](#installation)  
2. [Quick Start](#quick-start)  
3. [Core Concepts](#core-concepts)  
   - [Themes](#themes)  
   - [Sections & Controls](#sections--controls)  
   - [Role-Based Permissions](#role-based-permissions)  
   - [Undo/Redo System](#undoredo-system)  
   - [Localization](#localization)  
   - [Sound Effects](#sound-effects)  
4. [Available Controls](#available-controls)  
   - [addMenu](#addmenu)  
   - [addToggle](#addtoggle)  
   - [addSlider](#addslider)  
   - [addTextBox](#addtextbox)  
   - [addDropdown](#adddropdown)  
   - [addButton](#addbutton)  
   - [addBind (KeyBind)](#addbind-keybind)  
   - [addColorPicker](#addcolorpicker)  
   - [addScriptBox (Macro/Scripting)](#addscriptbox-macroscripting)  
5. [Notifications](#notifications)  
6. [Window Resizing](#window-resizing)  
7. [Undo/Redo Usage](#undoredo-usage)  
8. [Custom Themes](#custom-themes)  
9. [Localization Setup](#localization-setup)  
10. [Role/Permissions Setup](#rolepermissions-setup)  
11. [Sound Effects Setup](#sound-effects-setup)  
12. [Advanced Example](#advanced-example)  
13. [License](#license)

---

## New Update

- **[+] Background Loading Screen**  
- **[+] Background Sound**  
- **[+] Music Control UI (Play, Stop, Next)**

---

## Installation

1. **Obtain the Module**  
   Place the `JustHub.lua` file in your desired location within **ReplicatedStorage** or **ServerScriptService** (commonly `ReplicatedStorage`).

2. **Require the Module**  
   ```lua
   local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua'))()
   ```

3. **Initialize**  
   Call `JustHub:InitializeUI` with your preferred settings.

---

## Quick Start

```lua
local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua'))()

JustHub:InitializeUI({
    Name = "JustHub UI",
    SubTitle = "version 1.0",
    Theme = "Darker"
})

task.spawn(function()
    while not JustHub.Window do
        task.wait()
    end

    local window = JustHub.Window
    local tab = window:addTab("Main")
    local section = tab:addSection("Settings")

    section:addToggle({
        Name = "Music",
        Default = true,
        Callback = function(state)
            if state then
                JustHub:PlaySound("BackgroundMusic")
            else
                JustHub:StopSound("BackgroundMusic")
            end
        end
    })

    JustHub:Notify({
        Title = "UI Loaded",
        Message = "Welcome to JustHub!",
        Duration = 5
    })
end)
```

---

## Music Control UI

A music control UI has been added to the bottom left corner. It includes Play, Stop, and Next buttons.

```lua
local musicUI = JustHub.Window:addUIElement({
    Type = "Frame",
    Name = "MusicControl",
    Position = UDim2.new(0, 10, 1, -60),
    Size = UDim2.new(0, 150, 0, 50)
})

musicUI:addButton({
    Name = "Play",
    ButtonText = "â–¶",
    Callback = function()
        JustHub:PlaySound("BackgroundMusic")
    end
})

musicUI:addButton({
    Name = "Stop",
    ButtonText = "â– ",
    Callback = function()
        JustHub:StopSound("BackgroundMusic")
    end
})

musicUI:addButton({
    Name = "Next",
    ButtonText = "â­",
    Callback = function()
        JustHub:NextSound("BackgroundMusic")
    end
})
```

---

## License

**This library is free to use in your Roblox projects.**

Enjoy building with JustHub! If you have any questions, feel free to open an issue or submit a pull request.
