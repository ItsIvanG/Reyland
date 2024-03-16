#define init
global.sprite = sprite_add_weapon("PopoHeavyGun.png",2,5)

#define weapon_name
	return "I.D.P.D. Heavy Gun";

#define weapon_type
	return 1;

#define weapon_area
	return 1;

#define weapon_cost
	return 1;

#define weapon_auto
	return true;

#define weapon_load 
	return 3.5;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@rserious @bclandestine illegality";

#define weapon_fire 
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,Bullet1)){
		sound_play(sndRogueRifle);
		team = other.team;
		creator = other;
		sprite_index = sprIDPDBullet;
		spr_dead = sprIDPDBulletHit;
		direction = other.gunangle + random_range(-3,3) ;
		image_angle = direction;
		speed = 16;}}
		}