#define init
global.sprite = sprite_add_weapon("PopoSluggerRifle.png",3,3)

#define weapon_name
return "I.D.P.D. Slugger Rifle";

#define weapon_type
	return 2;

#define weapon_area
	return 6;

#define weapon_cost
	return 2;

#define weapon_load 
	return 11;

#define weapon_swap
	return sndSwapShotgun;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bReact";

#define weapon_fire
repeat(2)
{weapon_post(6,-6,12);
sound_play(sndRogueRifle);
for(i = 0; i < 1; i += 1)

	with instance_create(x,y,Slug)
	{
	direction = other.gunangle + random_range(-3,3);
	image_angle = direction;
	speed += (5 * skill_get(15));
	sprite_index = sprPopoSlug;
	damage = 11;
	speed = 18;
	team = other.team;
	creator = other;
	wait 3;}
}