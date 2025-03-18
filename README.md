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
5. [Music Player UI](#music-player-ui)  
6. [Notifications](#notifications)  
7. [Window Resizing](#window-resizing)  
8. [Undo/Redo Usage](#undoredo-usage)  
9. [Custom Themes](#custom-themes)  
10. [Localization Setup](#localization-setup)  
11. [Role/Permissions Setup](#rolepermissions-setup)  
12. [License](#license)  

---

## New Update
- **Added:** Background Loading Screen  
- **Added:** Background Sound  
- **Added:** Music Player UI  

---

## Installation

1. **Obtain the Module**  
   Place the `JustHub.lua` file in your desired location within **ReplicatedStorage** or **ServerScriptService**.

2. **Require the Module**  
   ```lua
   local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/refs/heads/main/JustHub%20(2).lua'))()
   ```

3. **Initialize**
   ```lua
   JustHub:InitializeUI({
       Name = "JustHub UI",
       SubTitle = "Version 1.0",
       Theme = "Darker"
   })
   ```

---

## Quick Start

```lua
local JustHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lilith-VnK/JustHub-UI/refs/heads/main/JustHub%20(2).lua'))()

JustHub:InitializeUI({
    Name = "JustHub UI",
    SubTitle = "Version 1.0",
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

## Music Player UI

JustHub now includes a **Music Player UI** located in the **bottom-left corner**. This UI includes:
- A **label** displaying the currently playing song.
- A **Start/Stop button** that syncs with the song state.
- A **Next button** to change to the next song in the list.
- The default state automatically starts playing the first song.

### **Example Implementation**
```lua
local musicUI = JustHub.Window:addSection("Music Player", { Position = "BottomLeft" })
local isPlaying = true
local currentSongIndex = 1
local songList = {
    "rbxassetid://1234567890",
    "rbxassetid://0987654321"
}

local songLabel = musicUI:addLabel({
    Text = "Now Playing: Song 1"
})

local startStopButton = musicUI:addButton({
    Name = "Start/Stop",
    ButtonText = "⏸",
    Callback = function()
        if isPlaying then
            JustHub:StopSound("BackgroundMusic")
            startStopButton:SetText("▶")
        else
            JustHub:PlaySound("BackgroundMusic")
            startStopButton:SetText("⏸")
        end
        isPlaying = not isPlaying
    end
})

local nextButton = musicUI:addButton({
    Name = "Next",
    ButtonText = "⏭",
    Callback = function()
        currentSongIndex = currentSongIndex % #songList + 1
        JustHub:PlaySound(songList[currentSongIndex])
        songLabel:SetText("Now Playing: Song " .. currentSongIndex)
    end
})

JustHub:PlaySound(songList[currentSongIndex])
```

---

## Notifications

```lua
JustHub:Notify({
    Title = "Notification",
    Message = "Your settings have been saved.",
    Duration = 5
})
```

---

## Undo/Redo Usage

```lua
JustHub:Undo()
JustHub:Redo()
```

Adding buttons for undo/redo:
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

---

## Localization Setup

```lua
JustHub.Localization = {
    en = { HELLO = "Hello" },
    fr = { HELLO = "Bonjour" }
}
JustHub:SetLanguage("fr")
print(JustHub:LocalizeText("HELLO")) -- "Bonjour"
```

---

## Role/Permissions Setup

```lua
JustHub:SetUserRole("admin")

section:addToggle({
    Name = "Admin Toggle",
    Role = "admin",
    Callback = function(state) end
})
```

---

## License

This library is **free to use** in your Roblox projects. If you make improvements, consider sharing them with the community.
