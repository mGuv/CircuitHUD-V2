local flib_gui = require("__flib__.gui-beta")

local const = require("lib.constants")

local function get_settings_root_frame(player_index)
	return get_hud_ref(player_index, const.HUD_NAMES.settings_root_frame)
end

function create_settings_gui(player_index)
	if get_settings_root_frame(player_index) then
		return
	end
	local player = get_player(player_index)

	local refs =
		flib_gui.build(
		player.gui.screen,
		{
			{
				type = "frame",
				style_mods = {
					minimal_width = 500,
					maximal_width = 500
				},
				ref = {
					const.HUD_NAMES.settings_root_frame
				},
				direction = "vertical",
				children = {
					-- Titlebar
					{
						type = "flow",
						ref = {"titlebar_flow"},
						style = "flib_titlebar_flow",
						children = {
							{
								-- add the title label
								type = "label",
								style = "frame_title",
								caption = "Settings",
								ignored_by_interaction = true
							},
							{
								-- add a pusher (so the close button becomes right-aligned)
								type = "empty-widget",
								style = "flib_titlebar_drag_handle",
								ignored_by_interaction = true
							},
							{
								type = "sprite-button",
								style = "frame_action_button",
								sprite = "utility/close_white",
								actions = {
									on_click = {
										gui = const.GUI_TYPES.settings,
										action = const.GUI_ACTIONS.close
									}
								}
							}
						}
					},
					{
						type = "frame",
						style = "ch_settings_category_frame",
						direction = "vertical",
						children = {
							{
								type = "label",
								style = "caption_label",
								caption = {"chv2_settings_gui.hud_settings"},
								tooltip = {"chv2_settings_gui_tooltips.hud_settings"}
							},
							{
								type = "checkbox",
								caption = {"chv2_settings_gui.hide_header"},
								state = false,
								actions = {
									on_click = {
										gui = const.GUI_TYPES.settings,
										action = "update_setting"
									}
								}
							}
						}
					}
				}
			}
		}
	)

	local root_frame = refs[const.HUD_NAMES.settings_root_frame]
	refs.titlebar_flow.drag_target = root_frame

	set_hud_element_ref(player_index, const.HUD_NAMES.settings_root_frame, root_frame)
	-- We need to overwrite the "to be opened GUI" with our own GUI
	player.opened = root_frame
	player.opened.force_auto_center()
end

function handle_settings_gui_events(player_index, action)
	if action.action == const.GUI_ACTIONS.close then
		destroy_settings_gui(player_index)
		return
	end
end

function destroy_settings_gui(player_index)
	local root_frame = get_settings_root_frame(player_index)
	if root_frame then
		root_frame.destroy()
		destroy_hud_ref(player_index, const.HUD_NAMES.settings_root_frame)
	end
end
