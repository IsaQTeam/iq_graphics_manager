local currentPreset = "balanced"
local activeSettings = {}
local enabled = false

RegisterCommand("graphics", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open", presets = GraphicsPresets })
end)

RegisterNUICallback("close", function(_, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("applyPreset", function(data, cb)
    local preset = GraphicsPresets[data.preset]
    if not preset then return end

    currentPreset = data.preset
    activeSettings = preset
    enabled = true
    SetTimecycleModifier(preset.timecycle or "")
    cb("ok")
end)

-- Update sliders (custom)
RegisterNUICallback("updateCustom", function(data, cb)
    activeSettings = {
        density = tonumber(data.density),
        lod = tonumber(data.lod),
        shadows = data.shadows,
        timecycle = data.timecycle or ""
    }
    SetTimecycleModifier(activeSettings.timecycle)
    currentPreset = "custom"
    cb("ok")
end)

CreateThread(function()
    while true do
        if enabled and activeSettings then
            -- Frame-based adjustments
            SetPedDensityMultiplierThisFrame(activeSettings.density or 1.0)
            SetVehicleDensityMultiplierThisFrame(activeSettings.density or 1.0)
            SetRandomVehicleDensityMultiplierThisFrame(activeSettings.density or 1.0)
            SetParkedVehicleDensityMultiplierThisFrame(activeSettings.density or 1.0)
            SetScenarioPedDensityMultiplierThisFrame(activeSettings.density or 1.0, activeSettings.density or 1.0)
            SetLightsCutoffDistanceTweak((activeSettings.lod or 1.0) * 100.0)

            -- Shadows toggle (doesn't need to repeat every frame)
            if activeSettings._lastShadowState ~= activeSettings.shadows then
                SetArtificialLightsState(not activeSettings.shadows)
                activeSettings._lastShadowState = activeSettings.shadows
            end

            Wait(0)
        else
            Wait(500)
        end
    end
end)

