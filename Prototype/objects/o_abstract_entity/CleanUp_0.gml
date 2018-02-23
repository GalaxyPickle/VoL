/// @description delete allocated memory

// delete input queue
ds_queue_destroy(input_queue);

// delete sound
audio_emitter_free(s_emit);