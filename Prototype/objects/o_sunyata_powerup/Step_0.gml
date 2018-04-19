/// @description

if move_up
	y -= .1;
else y += .1;

if y > ystart + 5 || y < ystart - 5
	move_up = !move_up
	
// set the emitter region
part_emitter_region(global.ps, first_emitter,
	x - sprite_width / 2, x + sprite_width / 2,
	y - sprite_height / 2, y + sprite_height / 2,
	ps_shape_diamond, ps_distr_invgaussian);
	
if place_meeting(x, y, global.player) {
		
}