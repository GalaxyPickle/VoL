/// @description setup all audio

// enable audio debug
audio_debug(true);

// set the fallof model to be (i think) normalish
audio_falloff_set_model(audio_falloff_exponent_distance);
// default audio channel number
audio_channel_num(128);

audio_master_gain(1);

