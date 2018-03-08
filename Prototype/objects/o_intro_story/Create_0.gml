/// @description setup vars

alarm[0] = room_speed / 6;

interactable = true;

move_arrow = false;
sight_range = 200;
close_range = 50;

interacting = true;
dialogue_read = false;
start_interaction = false;

interaction_arrow = s_arrow_default;
sprite_portrait = s_empty;

message = global.message_intro;

// current message to display
message_current = 0;
message_current_finished = false;
timer = 0;
cutoff = 0;

t = 0
increment = 1;
done_interacting = false;