#define init
global.sprite = sprite_add_weapon("PopoMachinegun.png",2,5)
global.bullet = sprite_add("PopoHeavyBullet.png", 2,12,14)
global.hit = sprite_add("PopoHeavyBulletHit.png",4,9,9)

#define weapon_name
	return "Captian Machinegun";

#define weapon_type
	return 1;

#define weapon_area
	return 9;

#define weapon_cost
	return 1;

#define weapon_auto
	return true;

#define weapon_load 
	return 2;
	
#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bMark your territory";

#define weapon_fire
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,Bullet1)){
		sound_play_pitchvol(sndRogueRifle,1.6,1);
		team = other.team;
		creator = other;
		sprite_index = global.bullet;
		spr_dead = global.hit;
		damage = 4;
		direction = other.gunangle + random_range(-0,0);
		image_angle = direction;
		speed = 16;}}
		}