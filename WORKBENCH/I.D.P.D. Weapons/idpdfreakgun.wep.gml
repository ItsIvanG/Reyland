#define init
global.sprite = sprite_add_weapon("PopoFreakGun.png",2,3)

#define weapon_name
	return "I.D.P.D. Freak Gun";

#define weapon_type
	return 1;

#define weapon_area
	return 9;

#define weapon_cost
	return 10;

#define weapon_load 
	return 18;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bwill you join us?";

#define weapon_fire
repeat(15)
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,Bullet1)){
		sound_play(sndRogueRifle);
		team = other.team;
		creator = other;
		sprite_index = sprIDPDBullet;
		spr_dead = sprIDPDBulletHit;
		direction = other.gunangle + random_range(-20,20) ;
		image_angle = direction;
		speed = 5;}}
			wait 1;
		}