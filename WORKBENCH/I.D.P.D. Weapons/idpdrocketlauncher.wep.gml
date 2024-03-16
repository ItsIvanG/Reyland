#define init
global.sprite = sprite_add_weapon("PopoRocketLauncher.png",1,5)

#define weapon_name
	return "I.D.P.D. Rocket Launcher";

#define weapon_type
	return 4;

#define weapon_area
	return 8;

#define weapon_cost
	return 1;

#define weapon_load 
	return 38;

#define weapon_swap

	return sndSwapExplosive;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bExplosive impact";

#define weapon_fire 
if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,PopoRocket)){
	sound_play(sndEliteGruntRocketFire);
	team = other.team;
	creator = other;
	sprite_index = sprPopoRocket;
	damage = 16;
	direction = other.gunangle + random_range(-5,5) ;
	image_angle = direction;
	speed = 12;}}