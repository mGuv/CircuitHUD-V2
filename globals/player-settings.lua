local const = require("lib.constants")

local player_settings = {}

function player_settings.get_setting(player_index, string_path)
	return global.players[player_index]["settings"][string_path]
end

function player_settings.set_setting(player_index, string_path, value)
	if string_path == nil or value == nil then
		return
	end
	global.players[player_index]["settings"][string_path] = value
end

function player_settings.default_player_settings()
	local settings = {}
	settings[const.SETTINGS.hide_hud_header] = false
	settings[const.SETTINGS.hud_title] = "Circuit HUD V2"
	settings[const.SETTINGS.hud_position] = const.HUD_POSITION.bottom_right
	settings[const.SETTINGS.hud_columns] = 8
	settings[const.SETTINGS.hud_max_height] = 600
	settings[const.SETTINGS.hud_refresh_rate] = 60
	settings[const.SETTINGS.uncollapse_hud_on_register_combinator] = true
	settings[const.SETTINGS.debug_mode] = false
	return settings
end

--#region Per User Settings
function player_settings.get_hud_position_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.hud_position)
end

function player_settings.get_hud_position_index_setting(player_index)
	local setting_value = player_settings.get_hud_position_setting(player_index)
	for key, value in pairs(const.HUD_POSITION_INDEX) do
		if setting_value == value then
			return key
		end
	end
	return 0
end

function player_settings.get_hud_columns_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.hud_columns)
end

function player_settings.get_hud_max_height_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.hud_max_height)
end

function player_settings.get_hide_hud_header_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.hide_hud_header)
end

function player_settings.get_hud_title_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.hud_title)
end

function player_settings.get_uncollapse_hud_on_register_combinator_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.uncollapse_hud_on_register_combinator)
end

-- Returns true if mod is in Debug mode
function player_settings.get_debug_mode_setting(player_index)
	return player_settings.get_setting(player_index, const.SETTINGS.debug_mode) == "debug"
end

--#endregion

--#region Set User Settings

function player_settings.set_hud_position_setting(player_index, value)
	player_settings.set_setting(player_index, const.SETTINGS.hud_position, value)
end

function player_settings.set_hud_columns_setting(player_index, value)
	player_settings.set_setting(player_index, const.SETTINGS.hud_columns, value)
end

function player_settings.set_hud_max_height_setting(player_index, value)
	player_settings.set_setting(player_index, const.SETTINGS.hud_max_height, value)
end

function player_settings.set_hide_hud_header_setting(player_index, state)
	player_settings.set_setting(player_index, const.SETTINGS.hide_hud_header, state)
end

function player_settings.set_hud_title_setting(player_index, value)
	player_settings.set_setting(player_index, const.SETTINGS.hud_title, value)
end

function player_settings.set_uncollapse_hud_on_register_combinator_setting(player_index, state)
	player_settings.set_setting(player_index, const.SETTINGS.uncollapse_hud_on_register_combinator, state)
end

function player_settings.set_debug_mode_setting(player_index, state)
	player_settings.set_setting(player_index, const.SETTINGS.debug_mode, state)
end

--#endregion

--#region Map Settings

function player_settings.get_refresh_rate_setting()
	return settings.global[const.SETTINGS.prefix .. const.SETTINGS.hud_refresh_rate].value
end

--#endregion

return player_settings