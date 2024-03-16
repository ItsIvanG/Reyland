#define init
global.sprite = sprite_add_weapon("PopoSuperRocketLauncher.png",6,6)

#define weapon_name
	return "I.D.P.D. Super Rocket Launcher";

#define weapon_type
	return 4;

#define weapon_area
	return 14;

#define weapon_cost
	return 5;

#define weapon_load 
	return 50;

#define weapon_swap

	return sndSwapExplosive;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bMulti fleeting";

#define weapon_fire 
	weapon_post(4,-4,4);
	for(i = -20; i < 30; i += 10)
	{with(instance_create(x,y,PopoRocket)){
	sound_play_pitchvol(sndEliteGruntRocketFire,0.5,1);
	team = other.team;
	creator = other;
	sprite_index = sprPopoRocket;
	damage = 16;
	direction = other.gunangle + (other.i * other.accuracy);
	image_angle = direction;
	speed = 12;}}