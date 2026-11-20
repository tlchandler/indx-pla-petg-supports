-- INDX PLA with PETG supports: a Print Goal for the Prusa CORE One INDX.
-- PLA parts (single or multi-colour) on a PETG support interface.
-- Adapted from Prusa's built-in "Breakaway interface supports" print goal (AGPL-3.0).

info = {
    id = "indx_pla_petg_supports",
    type = "print.print_mode",
    title = "INDX PLA with PETG supports",
    condition = "printer.model =~ /.*INDX.*/",
    params = {
        {name = "interface_extruder", label = "INDX PETG tool (support interface)", type = "int", default = 2},
        {name = "support_extruder", label = "PLA tool for support body (0 = PLA already printing; set one if using a raft)", type = "int", default = 0},
        {name = "interface_layers", label = "Interface layers (top and bottom)", type = "int", default = 5},
        {name = "interface_loop", label = "Interface loop around the PETG", type = "bool", default = true}
    }
}

function execute(opts)
    local config = api.config
    local petg = opts.interface_extruder
    local support = math.max(opts.support_extruder, 0)
    local layers = math.max(opts.interface_layers, 2)

    -- Replace organic supports with snug; keep grid or snug.
    local style = config:value("support_material_style")
    if type(style) == "table" then
        style = style[support > 0 and support or 1]
    end

    return {
        -- Support body 0 = the first non-soluble (PLA) tool already printing on the layer.
        -- The part's own tools are not changed.
        support_material_extruder = support,
        support_material_interface_extruder = petg,
        bed_temperature_extruder = (support > 0) and support or nil,

        -- Each INDX tool has its own nozzle.
        wipe_tower = false,

        support_material = "everywhere",
        support_material_style = (style == "organic") and "snug" or nil,

        -- PLA and PETG do not bond: no gap needed.
        support_material_contact_distance = 0,
        support_material_bottom_contact_distance = 0,
        support_material_interface_spacing = 0,
        support_material_interface_layers = layers,
        support_material_bottom_interface_layers = layers,
        support_material_interface_contact_loops = opts.interface_loop,

        -- With contact distance 0 this makes the lower interface layers solid PLA,
        -- and keeps the automatic support tool off the PETG.
        filament_soluble = {[petg] = true}
    }
end
