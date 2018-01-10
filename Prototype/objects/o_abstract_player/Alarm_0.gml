/// @description delete item in buffer after 1 second

if !ds_queue_empty(input_queue)
	ds_queue_dequeue(input_queue);