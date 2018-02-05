/// @description setup all audio

// enable audio debug
//audio_debug(true);

// set the fallof model to be (i think) normalish
audio_falloff_set_model(audio_falloff_exponent_distance);
// default audio channel number
audio_channel_num(128);

audio_master_gain(1);

// load FX & music
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_FX);

// set listener orientation to hear right sounds from right, etc
audio_listener_orientation(0, 0, -1000, 0, 1, 0);

// music master index
global.music = 0;