/// @description setup all audio

// enable audio debug
//audio_debug(true);

// set the fallof model to be (i think) normalish
audio_falloff_set_model(audio_falloff_exponent_distance);
// default audio channel number
audio_channel_num(128);

audio_master_gain(1);

// load FX & music
audio_group_load(audiogroup_default);
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_FX);
audio_group_load(audiogroup_ambiance);

// set listener orientation to hear right sounds from right, etc
audio_listener_orientation(0, 0, -1000, 0, 1, 0);

// music master index
global.music = 0;

// preset all audio levels
/*
audio_sound_gain(a_breath_ambiance, .15, 0);
audio_sound_gain(a_song_cavern_exploration, .75, 0);
