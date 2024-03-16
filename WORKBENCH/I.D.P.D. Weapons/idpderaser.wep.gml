#define init
global.sprite = sprite_add_weapon("PopoEraser.png",2,4)

#define weapon_name
	return "I.D.P.D. Eraser";

#define weapon_type
	return 1;

#define weapon_area
	return 10;

#define weapon_cost
	return 10;

#define weapon_load 
	return weapon_get_load(wep_rogue_rifle);
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bShoot Shoot Shoot";

#define weapon_fire
weapon_post(6,-6,12);
sound_play(sndLilHunterSniper);
deldir = random_range(-0,0) * accuracy; //Stolen from IGotGunz
for(i = 0; i < 10; i += 1)
{
	with instance_create(x,y,Bullet1)
	{
		direction = other.gunangle + other.deldir + random_range(-0,0);
		image_angle = direction;
		sprite_index = sprIDPDBullet;
		spr_dead = sprIDPDBulletHit;
		speed = other.i + 9;
		team = other.team;
		creator = other;
	}
}
motion_add(gunangle,-2);