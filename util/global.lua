local global_default = {
	hud_collapsed = false,
	hud_size = {width = 250, height = 300},
	hud_location = {x = 0, y = 0},
	root_frame = nil,
	inner_frame = nil,
	toggle_button = nil
}

function initialize_global_for_player(player_index)
	global.players[player_index] = global_default
end

-- Returns the global object for the player with this index
-- Will create a global object if the "player_index" is not yet created
-- @param player_index The index of the player
function get_player_global(player_index)
	local global_player = global.players[player_index]
	if not global_player then
		initialize_global_for_player(player_index)
		debug_log(player_index, "initialize global for player" .. player_index)
	end
	return global.players[player_index]
end

function get_hud_combinators()
	return global.hud_combinators
end

--#region Get Player Properties

function get_hud(player_index)
	return get_player_global(player_index).root_frame
end

function get_hud_inner(player_index)
	return get_player_global(player_index).inner_frame
end

function get_hud_toggle(player_index)
	return get_player_global(player_index).toggle_button
end

function get_hud_collapsed(player_index)
	return get_player_global(player_index).hud_collapsed
end

function get_hud_location(player_index)
	return get_player_global(player_index).hud_location
end

--#endregion

--#region Set Player Properties

function set_hud_location(player_index, location)
	get_player_global(player_index).hud_location = location
end

function set_hud_collapsed(player_index, state)
	get_player_global(player_index).hud_collapsed = state
end

function set_hud_refs(player_index, root_frame, inner_frame)
	get_player_global(player_index).root_frame = root_frame
	get_player_global(player_index).inner_frame = inner_frame
end

function set_toggle_ref(player_index, toggle_button)
	get_player_global(player_index).toggle_button = toggle_button
end

--#endregion

function destroy_hud(player_index)
	local root_frame = get_hud(player_index)
	if root_frame then
		root_frame.destroy()
	end
	local inner_frame = get_hud_inner(player_index)
	if inner_frame then
		inner_frame.destroy()
	end
	set_hud_refs(player_index)
	set_toggle_ref(player_index)
end

function ensure_global_state()
	-- A collection of all players with their individual data
	if (not global.players) then
		global.players = {}
	end

	-- A collection of all HUD Combinators entities in game
	if (not global.hud_combinators) then
		global.hud_combinators = {}
	end

	if (not global.textbox_hud_entity_map) then
		global.textbox_hud_entity_map = {}
	end
end
