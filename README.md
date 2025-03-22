# JustHub UI Library

**JustHub** is a versatile UI library for Roblox that provides a modern interface with numerous features such as theming, notifications with timers, resizing, color pickers, macros/scripting boxes, role-based permissions, undo/redo functionality, and more. This documentation covers all major components and usage instructions in detail.

---

## Table of Contents

1. [Installation](#installation)
2. [Quick Start](#quick-start)
3. [Music Control UI](#music-control-ui)
4. [Core Concepts](#core-concepts)
   - [Themes](#themes)
   - [Sections & Controls](#sections--controls)
   - [Role-Based Permissions](#role-based-permissions)
   - [Undo/Redo System](#undoredo-system)
   - [Localization](#localization)
   - [Sound Effects](#sound-effects)
5. [Available Controls](#available-controls)
6. [Window Resizing](#window-resizing)
7. [Advanced Example](#advanced-example)
8. [License](#license)

## New Update

- **[+] Background Loading Screen**
- **[+] Background Sound**
- **[+] Music Control UI (Play, Stop, Next)**


## Installation

1. **Obtain the Module**

   Place the `JustHub.lua` file in your desired location within **ReplicatedStorage** or **ServerScriptService** (commonly `ReplicatedStorage`).

3. **Require the Module**  

   ```lua
   local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/main/JustHub.lua'))()
   ```

4. Initialize
Call JustHub:InitializeUI with your preferred settings.


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
    ButtonText = "⏵", -- Play icon
    Callback = function()
        JustHub:PlaySound("BackgroundMusic")
    end
})

musicUI:addButton({
    Name = "Stop",
    ButtonText = "⏹", -- Stop icon
    Callback = function()
        JustHub:StopSound("BackgroundMusic")
    end
})

musicUI:addButton({
    Name = "Next",
    ButtonText = "⏭", -- Next icon
    Callback = function()
        JustHub:NextSound("BackgroundMusic")
    end
})
  ```

## Core Concepts

  1.Themes

JustHub includes multiple built-in themes (Darker, Dark, Purple, Light, Neon, Forest, Aqua, Crimson, Solar, Pastel, Cyber, Ocean, Desert, Vintage, Rainbow, Midnight). You can switch themes via:

  ```lua

JustHub:SetTheme("Darker")
  ```

To register a custom theme:

  ```lua
JustHub:RegisterTheme("MyCustomTheme", {
    ["Color Hub 1"]   = ColorSequence.new(...),
    ["Color Hub 2"]   = Color3.fromRGB(...),
    ["Color Stroke"]  = Color3.fromRGB(...),
    ["Color Theme"]   = Color3.fromRGB(...),
    ["Color Text"]    = Color3.fromRGB(...),
    ["Color Dark Text"] = Color3.fromRGB(...)
})
JustHub:SetTheme("MyCustomTheme")
  ```

## Sections & Controls

After calling JustHub:InitializeUI, you obtain a window object. You can create tabs using:

```lua
local tab = window:addTab("TabName")
```

Each tab can contain one or more sections:

```lua
local section = tab:addSection("SectionName")
```

Inside sections, you can add various controls (toggles, sliders, text boxes, etc.).


## Role-Based Permissions

You can restrict controls to specific roles by providing a Role property. For example:

```lua
section:addToggle({
    Name = "Admin Toggle",
    Role = "admin",
    Callback = function(state)
        print("Admin only toggle:", state)
    end
})

If JustHub.UserRole does not match the specified role, the control is hidden.

```

## Undo/Redo System

Controls automatically register undo states when changed. You can call:

```lua
JustHub:Undo()
JustHub:Redo()
```

This allows you to revert or reapply changes. For added convenience, you might include buttons:

```lua
section:addButton({
    Name = "Undo",
    ButtonText = "Undo",
    Callback = function()
        JustHub:Undo()
    end
})

section:addButton({
    Name = "Redo",
    ButtonText = "Redo",
    Callback = function()
        JustHub:Redo()
    end
})
```

## Localization

JustHub supports localization by storing text keys in JustHub.Localization and setting a current language. For example:

```lua
JustHub.Localization = {
    en = { HELLO = "Hello", APPLY = "Apply" },
    fr = { HELLO = "Bonjour", APPLY = "Appliquer" }
}
JustHub:SetLanguage("fr")
print(JustHub:LocalizeText("HELLO"))  -- Outputs "Bonjour"
```

## Sound Effects

Define asset IDs for sound effects in JustHub.Sounds:

```lua
JustHub.Sounds = {
    ButtonClick = 912345678, -- Replace with your asset ID
    SliderMove  = 912345679  -- Replace with your asset ID
} 
```

You can trigger these sounds automatically via control logic or manually:

```lua
JustHub:PlaySound("ButtonClick")
```


---

## Available Controls

1. Menu (Header-like element)

```lua
local menu = section:addMenu("Menu Title")
```


2. Toggle
A boolean switch.

```lua
section:addToggle({
    Name = "Music",
    Default = true,
    Callback = function(state) end,
    Role = "admin" -- Optional
})
```


3. Slider
A numeric slider.

```lua
section:addSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value) end
})
```


4. TextBox
A single-line text input.

```lua
section:addTextBox({
    Name = "Username",
    Default = "Player",
    Callback = function(text) end
})
```


5. Dropdown
A dropdown list. For example, to change themes:

```lua
section:addDropdown({
    Name = "Theme",
    Items = {"Darker", "Dark", "Purple", "Light", "Neon", "Forest", "Aqua"},
    Default = "Darker",
    Callback = function(choice)
        JustHub:SetTheme(choice)
    end
})
```

6. Button
A clickable button.

```lua
section:addButton({
    Name = "SaveConfig",
    ButtonText = "Save",
    Callback = function()
        JustHub:SaveConfig("MyConfig.json")
    end
})
```

7. KeyBind
A control to assign a key to an action.

```lua
section:addBind({
    Name = "UI Key",
    Default = "RightShift",
    Callback = function()
        JustHub:ToggleUIVisibility()
    end
})
```

8. ColorPicker
Allows color selection.

```lua
section:addColorPicker({
    Name = "Background Color",
    Default = Color3.fromRGB(128, 128, 255),
    Callback = function(color3)
        print("Color picked:", color3)
    end
})
```

9. ScriptBox (Macro/Scripting)
A multi-line text input with a run button.

```lua
section:addScriptBox({
    Name = "Macro",
    Default = "-- type script here",
    Callback = function(scriptText)
        print("User typed script:", scriptText)
    end
})
```

10. Notifications
Display notifications using:

```lua
JustHub:Notify({
    Title = "Title",
    Message = "Your settings have been saved.",
    Duration = 5,
    ShowProgress = true
})
```

Parameters:

```
Title: Notification title.
Message: Main text content.
Duration: Time (in seconds) the notification stays on screen.
ShowProgress: Display a progress bar.

```



---

## Window Resizing

The main window can be resized using the small grip in the bottom-right corner. This functionality is built in by default.


---

## Advanced Example

This example demonstrates using multiple features together:

```lua
local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/refs/heads/main/JustHub%20(2).lua'))()

JustHub:SetUserRole("admin")
JustHub:InitializeUI({
    Name = "JustHub UI",
    SubTitle = "Version 1.0",
    Theme = "Rainbow"
})

task.spawn(function()
    while not JustHub.Window do
        task.wait()
    end

    local window = JustHub.Window
    local tab = window:addTab("Main")
    local section = tab:addSection("Admin Settings", 120)

    section:addToggle({
        Name = "GodMode",
        Default = false,
        Role = "admin",
        Callback = function(state)
            print("GodMode changed:", state)
        end
    })

    section:addColorPicker({
        Name = "Ambient Color",
        Default = Color3.fromRGB(128, 128, 128),
        Callback = function(color)
            print("New ambient color:", color)
        end
    })

    section:addScriptBox({
        Name = "Macro Runner",
        Default = "-- script here",
        Callback = function(code)
            print("Running user code:", code)
        end
    })

    section:addBind({
        Name = "UI Key",
        Default = "RightShift",
        Callback = function()
            JustHub:ToggleUIVisibility()
        end
    })

    section:addButton({
        Name = "Undo",
        ButtonText = "Undo",
        Callback = function()
            JustHub:Undo()
        end
    })

    section:addButton({
        Name = "Redo",
        ButtonText = "Redo",
        Callback = function()
            JustHub:Redo()
        end
    })

    JustHub:Notify({
        Title = "Welcome Admin",
        Message = "You have full privileges.",
        Duration = 5,
        ShowProgress = true
    })
end)
```


---

## License

This library is free to use in your Roblox projects.

Enjoy building with JustHub! If you have any questions, feel free to open an issue or submit a pull request.

---
