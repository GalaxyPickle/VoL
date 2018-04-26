/// @description setup vars

interactable = true;
interact_text = "Interact";

move_arrow = false;
sight_range = 200;
close_range = 50;

interacting = false;
dialogue_read = false;
start_interaction = true;

interaction_arrow = s_arrow_default;
sprite_portrait = s_empty;

message = global.message_default;

// current message to display
message_current = 0;
message_current_finished = false;
timer = 0;
cutoff = 0;

t = 0
increment = 1;
done_interacting = false;

outline_init();

message_sound = a_empty;