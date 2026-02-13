--[[
    ═══════════════════════════════════════════════════════════════════════════════
    NYA SERVER LOGO - CONFIGURATION
    Fully Standalone | Compatible with All Frameworks
    ═══════════════════════════════════════════════════════════════════════════════
]]

Config = {}

--[[
    ═══════════════════════════════════════════════════════════════════════════════
    GENERAL SETTINGS
    ═══════════════════════════════════════════════════════════════════════════════
]]

-- Enable/disable the entire logo system
Config.Enabled = true

-- Allow players to toggle their logo visibility using a command
Config.EnableToggleCommand = true

-- Command to toggle logo visibility (without the /)
Config.ToggleCommand = 'logo'

-- Logo visible by default when players join the server
Config.DefaultState = true

--[[
    ═══════════════════════════════════════════════════════════════════════════════
    LOGO POSITION & STYLE SETTINGS
    ═══════════════════════════════════════════════════════════════════════════════
    Control where the logo appears on screen and how it looks.
    
    Available Positions:
    - 'top-left'       - Upper left corner
    - 'top-right'      - Upper right corner 
    - 'top-center'     - Top center of screen
    - 'bottom-left'    - Lower left corner
    - 'bottom-right'   - Lower right corner
    - 'bottom-center'  - Bottom center of screen
    - 'center'         - Dead center of screen
]]

Config.Logo = {
    position = 'top-right',
    
    size = {
        width = 256,    -- Logo width in pixels
        height = 256,   -- Logo height in pixels
    },
    
    offset = {
        x = 20,         -- Distance from screen edge (horizontal)
        y = 20          -- Distance from screen edge (vertical)
    },
    
    opacity = 1.0,      -- Transparency (0.0 = invisible, 1.0 = solid)
}

--[[
    ═══════════════════════════════════════════════════════════════════════════════
    MAP INTEGRATION SETTINGS
    ═══════════════════════════════════════════════════════════════════════════════
    Smart detection for when players open the pause menu/map.
]]

Config.MapIntegration = {
    enabled = true,             -- Enable smart map detection
    hideOnMap = true,           -- Auto-hide logo when player opens map
    fadeOnMapToggle = true      -- Smooth fade effect when map opens/closes
}

--[[
    ═══════════════════════════════════════════════════════════════════════════════
    ANIMATION SETTINGS
    ═══════════════════════════════════════════════════════════════════════════════
    Control how smoothly the logo appears and disappears.
]]

Config.Animations = {
    fadeIn = true,              -- Smooth fade in when logo appears
    fadeOut = true,             -- Smooth fade out when logo disappears
    duration = 300,             -- Animation duration in milliseconds
    easing = 'ease-in-out'      -- Animation style: ease-in-out, ease-in, ease-out, linear
}

--[[
    ═══════════════════════════════════════════════════════════════════════════════
    PERFORMANCE SETTINGS
    ═══════════════════════════════════════════════════════════════════════════════
    Adjust script performance and responsiveness.
    
    ⚠️ WARNING: Lower values increase responsiveness but use more resources.
]]

Config.Performance = {
    updateInterval = 100        -- Map check interval in milliseconds
}
