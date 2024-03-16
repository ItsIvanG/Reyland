#define init
global.sprite = sprite_add_weapon("PopoEliteGun.png",2,5)

#define weapon_name
	return "I.D.P.D. Elite Gun";

#define weapon_type
	return 1;

#define weapon_area
	return 5;

#define weapon_cost
	return 3;

#define weapon_load 
	return weapon_get_load(wep_rogue_rifle);
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bPromoted";

#define weapon_fire
repeat(3)
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,Bullet1)){
		sound_play(sndRogueRifle);
		team = other.team;
		creator = other;
		sprite_index = sprIDPDBullet;
		spr_dead = sprIDPDBulletHit;
		direction = other.gunangle + random_range(-5,5) ;
		image_angle = direction;
		speed = 16;}}
			wait 2;
		}