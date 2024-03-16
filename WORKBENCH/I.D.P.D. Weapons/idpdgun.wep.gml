#define init
global.sprite = sprite_add_weapon("PopoGun.png",2,3)

#define weapon_name
	return "I.D.P.D. Gun";

#define weapon_type
	return 1;

#define weapon_area
	return 1;

#define weapon_cost
	return 1;

#define weapon_load 
	return 4;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bclandestine illegality";

#define weapon_fire 
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,Bullet1)){
		sound_play(sndGruntFire);
		team = other.team;
		creator = other;
		sprite_index = sprIDPDBullet;
		spr_dead = sprIDPDBulletHit;
		direction = other.gunangle + random_range(-5,5) ;
		image_angle = direction;
		speed = 16;}}
		}