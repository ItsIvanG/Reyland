#define init
global.sprite = sprite_add_weapon("PopoSuperSlugger.png",5,4)

#define weapon_name
return "I.D.P.D. Super Slugger";

#define weapon_type
	return 2;

#define weapon_area
	return 10;

#define weapon_cost
	return 5;

#define weapon_load 
	return 11;
		
#define weapon_swap
	return sndSwapShotgun;

#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bShoot And Watch";
#define weapon_fire
weapon_post(6,-6,12);
sound_play_pitchvol(sndSuperSlugger,0.5,1);
for(i = -20; i < 30; i += 10)
{
	with instance_create(x,y,Slug)
	{
	direction = other.gunangle + (other.i * other.accuracy);
	image_angle = direction;
	speed += (5 * skill_get(15));
	sprite_index = sprPopoSlug;
	damage = 11;
	speed = 19.5;
	team = other.team;
	creator = other;}
}