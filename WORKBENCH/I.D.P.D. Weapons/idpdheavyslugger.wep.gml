#define init
global.sprite = sprite_add_weapon("PopoHeavySlugger.png",2,3)
global.shell = sprite_add("PopoHeavyShell.png", 2,17,17);

#define weapon_name
return "I.D.P.D. Heavy Slugger";

#define weapon_type
	return 2;

#define weapon_area
	return 10;

#define weapon_cost
	return 2;

#define weapon_load 
	return 8;
	
#define weapon_swap
	return sndSwapShotgun;

#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bPulse";

#define weapon_fire
weapon_post(6,-6,12);
sound_play(sndRogueRifle);
for(i = 0; i < 1; i += 1)
{
	with instance_create(x,y,HeavySlug)
	{
	direction = other.gunangle + random_range(-3,3);
	image_angle = direction;
	sound_play_pitchvol(sndHeavySlugger,0.6,1)
	speed += (5 * skill_get(15));
	sprite_index = global.shell;
	spr_dead = global.shell;
	damage = 30;
	speed = 18;
	team = other.team;
	creator = other;
	}
}