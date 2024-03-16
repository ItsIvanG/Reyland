#define weapon_name
	return "I.D.P.D. Rifle";

#define weapon_type
	return 1;

#define weapon_area
	return 1;

#define weapon_cost
	return 2;

#define weapon_load 
	return weapon_get_load(wep_rogue_rifle);
	
#define weapon_sprt
	return sprRogueRifle;

#define weapon_text
	return "@bsystem renegade";

#define weapon_fire
repeat(2)
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