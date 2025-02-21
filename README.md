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

## Installation

1. **Obtain the Module**  
   Place the `JustHub.lua` file in your desired location within **ReplicatedStorage** or **ServerScriptService** (commonly `ReplicatedStorage`).

2. **Require the Module**  
   ```lua
   local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/refs/heads/main/JustHub%20(2).lua'))()
   ```
3. **Initialize**
   Call `JustHub:InitializeUI` with your preferred settings (e.g., Name, Theme).

## Quick Start

   Below is the simplest usage example:
   ```lua
   local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/refs/heads/main/JustHub%20(2).lua'))()

JustHub:InitializeUI({
    Name = "My UI Window", 
    Theme = "Darker"
})

wait(6) --Waiting Loading Screen

local window = JustHub.Window
local tab = window:addTab("Main")
local section = tab:addSection("Settings")

section:addToggle({
    Name = "Music",
    Default = true,
    Callback = function(state)
        print("Music toggled:", state)
    end
})

JustHub:Notify({
    Title = "UI Loaded",
    Message = "Welcome to JustHub!",
    Duration = 5
})
```

## Core Concepts

1. **Themes**

   JustHub includes multiple built-in themes (Darker, Dark, Purple, Light, Neon, Forest, Aqua). You can switch them via:
   ```lua
   JustHub:SetTheme("Darker")
   ```
   
   You can also register a custom theme:
   ```lua
   JustHub:RegisterTheme("MyCustomTheme", {
    ["Color Hub 1"] = ColorSequence.new(...),
    ["Color Hub 2"] = Color3.fromRGB(...),
    ["Color Stroke"] = Color3.fromRGB(...),
    ["Color Theme"]  = Color3.fromRGB(...),
    ["Color Text"]   = Color3.fromRGB(...),
    ["Color Dark Text"] = Color3.fromRGB(...)
})

JustHub:SetTheme("MyCustomTheme")
   ```

2. **Sections & Controls**
   After calling `JustHub:InitializeUI`, you have a window object. You can create tabs with `window:addTab("TabName")`. Each tab can have multiple sections (:addSection("SectionName")), and each section can have controls (e.g., toggle, slider, etc.).

3. **Role-Based Permissions**
   Controls can be restricted to a specific role by providing a Role property:
   ```lua
   section:addToggle({
    Name = "Admin Toggle",
    Role = "admin",
    Callback = function(state)
        print("Admin only toggle:", state)
    end
})
```
   If JustHub.UserRole does not match the Role, that control is hidden.

4. **Undo/Redo System**
   Controls like toggles automatically register undo states when changed. You can call:
   ```lua
   JustHub:Undo()
   JustHub:Redo()
   ```
   to revert or re-apply the last change.
  
5. **Localization**
   You can store localized text in JustHub.Localization, specify JustHub.CurrentLang, and call `JustHub:LocalizeText("KEY")` to retrieve a localized string:
   ```lua
   JustHub.Localization = {
    en = { HELLO = "Hello" },
    fr = { HELLO = "Bonjour" }
}
JustHub:SetLanguage("fr")
print(JustHub:LocalizeText("HELLO")) -- "Bonjour"
   ```

6. **Sound Effects**  
   You can define asset IDs in:
   ```lua
   JustHub.Sounds = {
    ButtonClick = 912345678, --Change Your Assets ID
    SliderMove  = 912345679 --Change Your Assets ID
}
   ```
   Then in your control logic, JustHub automatically calls `JustHub:PlaySound("ButtonClick")` or you can call it manually:
   ```lua
   JustHub:PlaySound("ButtonClick")
   ```
   
## Available Controls

1. **Creates a larger header-like menu within a section:**
  ```lua
  local menu = section:addMenu("Menu Title")
  ```
  
2. **addToggle**

   A toggle switch (boolean on/off).
   ```lua
   section:addToggle({
    Name = "Music",
    Default = true,
    Callback = function(state) end,
    Role = "admin" -- optional
})
   ```

3. **addSlider**
   A slider control for numeric values.
   ```lua
   section:addSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value) 
    end
})
   ```

4. **addTextBox**
   
   A single-line text input.
   ```lua
   section:addTextBox({
    Name = "Username",
    Default = "Player",
    Callback = function(text)
    end
})
  ```

5. **addDropdown + Change Theme**
   
   A dropdown list.
   ```lua
   section:addDropdown({
    Name = "Theme",
    Items = {"Darker","Dark","Purple","Light","Neon","Forest","Aqua"},
    Default = "Darker",
    Callback = function(choice)
        JustHub:SetTheme(choice)
    end
})
```

6. **addButton + Save Config**   
   A simple button with a callback.
   ```lua
   section:addButton({
    Name = "SaveConfig",
    ButtonText = "Save",
    Callback = function()
        JustHub:SaveConfig("MyConfig.json")
    end
})
   ```

7. **addBind (KeyBind)**    
   A keybind that runs a callback when the chosen key is pressed.
   ```lua
    section:addBind({
    Name = "UI Key",
    Default = "RightShift",
    Callback = function()
        JustHub:ToggleUIVisibility()
    end
    })
   ```

8. **addColorPicker**
    
   Allows the user to pick a color by entering R/G/B values.
   ```lua
    section:addColorPicker({
    Name = "Background Color",
    Default = Color3.fromRGB(128,128,255),
    Callback = function(color3)
        print("Color picked:", color3)
    end
    })
   ```

9. **addScriptBox (Macro/Scripting)**

   A multiline TextBox with a “Run” button for user scripts.
   ```lua
   section:addScriptBox({
    Name = "Macro",
    Default = "-- type script here",
    Callback = function(scriptText)
        print("User typed script:", scriptText)
    end
    })
   ```
   
9. **Notifications**
 
   Use `JustHub:Notify(options)` to display a custom notification:
   ```lua
   JustHub:Notify({
    Title = "Title",
    Message = "Your settings have been saved.",
    Duration = 5,
    ShowProgress = true
})

--[[
  Title: The notification's title
  Message: Main text content
  Duration: How long it remains on screen (in seconds)
  ShowProgress: Whether to show a small progress bar at the bottom
  ]]
  ```

## Window Resizing
  The main window can be resized using the small grip in the bottom-right corner. This is built-in by default.

## Undo/Redo Usage
  When a user changes certain controls (like toggles), JustHub automatically records the old and new values in the UndoStack. You can call:
  ```lua
  JustHub:Undo()
  JustHub:Redo()
  ```
  to revert or re-apply the most recent change. For convenience, add buttons:
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

## Localization Setup

1. **Define text keys in multiple languages:**
   ```lua
   JustHub.Localization = {
      en = {
         HELLO = "Hello",
         APPLY = "Apply"
      },
      fr = {
         HELLO = "Bonjour",
         APPLY = "Appliquer"
      }
  }
   ```   
2. **Set the current language:**
  ```lua
  JustHub:SetLanguage("fr")
  ```
3. **Retrieve localized text:**
   ```lua
   local text = JustHub:LocalizeText("HELLO") -- "Bonjour"
   ```

## Role/Permissions Setup

1. **Set the user's role:**
  ```lua
  JustHub:SetUserRole("admin")
  ```
2. **When adding a control:**
  ```lua
  section:addToggle({
    Name = "Admin Toggle",
    Role = "admin",
    Callback = function(state) end
})
```
  If JustHub.UserRole is not "admin", the control will be hidden.

## Advanced Example
  ```lua
  local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/refs/heads/main/JustHub%20(2).lua'))()

JustHub:SetUserRole("admin")
JustHub:InitializeUI({Name="Advanced UI", Theme="Darker"})

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
    Default = Color3.fromRGB(128,128,128),
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
```

## License
  **This library is free to use in your Roblox projects. Please refer to your project’s license or relevant disclaimers for distribution details. If you make improvements or modifications, consider sharing them back to the community**.

  **Enjoy building with JustHub! If you have any questions, feel free to open an issue or submit a pull request.**
