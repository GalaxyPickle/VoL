/// @description input buffer clear

if !ds_queue_empty(input_queue)
	ds_queue_dequeue(input_queue);