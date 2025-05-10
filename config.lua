--[[
====================================================================
    GraphicsPresets Configuration
    -------------------------------------
    This file defines graphic presets focused on FPS & performance
    optimization by dynamically adjusting in-game settings.

    ⚡ Key Settings:
    - density: Controls NPC & vehicle spawn rates (lower = less CPU/GPU load)
    - lod: Level of Detail scaling (lower = simpler models at distance)
    - shadows: Disabling shadows gives significant FPS boost
    - timecycle: Visual filter to reduce post-processing or improve clarity
====================================================================
]]

GraphicsPresets = {

    --================================================================
    ["ultra"] = {
        name = "Ultra Realism",

        -- High density for immersion (heavy on CPU/GPU)
        density = 0.9,

        -- Increased LOD for detailed distant objects
        lod = 1.2,

        -- Shadows ON for full graphical fidelity
        shadows = true,

        -- 'tunnel_01': A sharp, contrast-heavy timecycle often used 
        -- to enhance lighting depth (adds visual weight but no FPS boost)
        timecycle = "tunnel_01"
    },

    --================================================================
    ["balanced"] = {
        name = "Balanced",

        -- Medium density for a lively world without overloading performance
        density = 0.5,

        -- Moderate LOD to balance visuals & FPS
        lod = 0.8,

        -- Keep shadows for decent visuals
        shadows = true,

        -- 'cinema': A flat, neutral filter reducing harsh lighting & 
        -- post-processing effects, offering minor FPS improvement
        timecycle = "cinema"
    },

    --================================================================
    ["pvp"] = {
        name = "PvP Mode",

        -- Minimal NPCs & vehicles to avoid distractions & improve CPU usage
        density = 0.1,

        -- Reduced LOD to simplify world detail for faster rendering
        lod = 0.5,

        -- Shadows OFF to drastically improve FPS in combat scenarios
        shadows = false,

        -- 'hint_cam': A clean, flat timecycle removing unnecessary lighting 
        -- effects for maximum clarity (perfect for PvP visibility & FPS)
        timecycle = "hint_cam"
    },

    --================================================================
    ["potato"] = {
        name = "Potato Mode",

        -- Zero density: No NPCs or cars for ultimate CPU/GPU relief
        density = 0.0,

        -- Lowest acceptable LOD for maximum performance (world looks basic)
        lod = 0.3,

        -- Shadows OFF (huge FPS gain on low-end PCs)
        shadows = false,

        -- 'NoAmbient': Strips ambient lighting & post-processing, creating 
        -- a raw look but offering serious FPS gains
        timecycle = "NoAmbient"
    },

    --================================================================
    ["custom"] = {
        name = "Custom"
        -- Values set dynamically via UI sliders & toggles
    }

}
