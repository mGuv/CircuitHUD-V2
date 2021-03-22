local Event = require("__stdlib__/stdlib/event/event")
local const = require("lib.constants")

local event_handler = {}

function event_handler.reset_hud_all_players()
	Event.dispatch(
		{
			input_name = Event.generate_event_name(const.EVENTS.gui_hud_reset_all_players)
		}
	)
end

function event_handler.gui_combinator_create(player_index, unit_number)
	Event.dispatch(
		{
			input_name = Event.generate_event_name(const.EVENTS.gui_combinator_create),
			player_index = player_index,
			unit_number = unit_number
		}
	)
end

function event_handler.gui_hud_create(player_index)
	Event.dispatch(
		{
			input_name = Event.generate_event_name(const.EVENTS.gui_hud_create),
			player_index = player_index
		}
	)
end

function event_handler.gui_settings_create(player_index)
	Event.dispatch(
		{
			input_name = Event.generate_event_name(const.EVENTS.gui_settings_create),
			player_index = player_index
		}
	)
end

function event_handler.gui_hud_collapse(player_index, state)
	Event.dispatch(
		{
			input_name = Event.generate_event_name(const.EVENTS.collapse_hud),
			player_index = player_index,
			state = state
		}
	)
end

return event_handler
