#define init
global.sprite = sprite_add_weapon("PopoBouncerShotgun.png",2,5)
global.bullet = sprite_add("PopoBouncerBullet.png", 2,8,8)

#define weapon_name
	return "I.D.P.D. Bouncer Shotgun";

#define weapon_type
	return 1;

#define weapon_area
	return 9;

#define weapon_cost
	return 10;

#define weapon_load 
	return weapon_get_load(wep_bouncer_shotgun);
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bFail and disappear";

#define weapon_fire
weapon_post(6,-6,12);
sound_play(sndLilHunterBouncer);
for(i = -20; i < 30; i += 4.8)
{
	with instance_create(x,y,BouncerBullet)
	{
	direction = other.gunangle + (other.i * other.accuracy);
	image_angle = direction;
	sprite_index = global.bullet;
	spr_dead = sprIDPDBulletHit;
	speed = 6;
	team = other.team;
	creator = other;}
}