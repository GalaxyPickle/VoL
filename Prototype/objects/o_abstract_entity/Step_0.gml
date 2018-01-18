/// @description keep stat array up to date

// 1. deal with collision and physics 
step_setup();

// 2. deal with stats and regen
step_stats();

// 3. deal with nearest enemy list
step_combat();

// 4. ???