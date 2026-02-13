local isVisible = Config.DefaultState
local isMapOpen = false
local isInitialized = false

local function toggleLogo(state)
    if not isInitialized then return end
    
    isVisible = state ~= nil and state or not isVisible
    
    SendNUIMessage({
        action = 'toggle',
        visible = isVisible and Config.Enabled,
        animate = Config.Animations.fadeIn or Config.Animations.fadeOut
    })
end

local function initializeLogo()
    if isInitialized then return end
    
    SetNuiFocus(false, false)
    
    SendNUIMessage({
        action = 'setup',
        position = Config.Logo.position,
        width = Config.Logo.size.width,
        height = Config.Logo.size.height,
        offsetX = Config.Logo.offset.x,
        offsetY = Config.Logo.offset.y,
        opacity = Config.Logo.opacity,
        duration = Config.Animations.duration,
        easing = Config.Animations.easing
    })
    
    Wait(50)
    
    isInitialized = true
    
    if Config.Enabled and isVisible then
        toggleLogo(true)
    end
end

CreateThread(function()
    Wait(1000)
    initializeLogo()
end)

CreateThread(function()
    if not Config.MapIntegration.enabled then return end
    
    while not isInitialized do
        Wait(100)
    end
    
    while true do
        Wait(Config.Performance.updateInterval)
        
        local pauseMenuState = IsPauseMenuActive()
        
        if pauseMenuState ~= isMapOpen then
            isMapOpen = pauseMenuState
            
            if Config.MapIntegration.hideOnMap then
                SendNUIMessage({
                    action = 'visibility',
                    visible = not isMapOpen and isVisible and Config.Enabled,
                    animate = Config.MapIntegration.fadeOnMapToggle
                })
            end
        end
    end
end)

if Config.EnableToggleCommand then
    RegisterCommand(Config.ToggleCommand, function()
        toggleLogo()
    end, false)
end
