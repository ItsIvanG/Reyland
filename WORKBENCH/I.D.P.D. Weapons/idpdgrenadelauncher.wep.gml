#define init
global.sprite = sprite_add_weapon("PopoGrenadeLauncher.png",2,5);
global.sprblink = sprite_add("PopoBlink.png",2,3,3);

#define weapon_name
return "I.D.P.D. Grenade Launcher";

#define weapon_type
	return 4;

#define weapon_area
	return 5;

#define weapon_cost
	return 1;

#define weapon_load 
	return weapon_get_load(wep_heavy_grenade_launcher);

#define weapon_swap

	return sndSwapExplosive;

#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bsecurity @sblast";

#define weapon_fire
weapon_post(4,-3,3);
sound_play_pitchvol(sndGrenade,0.8,1);
with instance_create(x,y,CustomProjectile) //Stolen from IGotGunz
{
	direction = other.gunangle + (random_range(-4,4) * other.accuracy);
	speed = 12;
	team = other.team;
	typ = 1;
	damage = 6;
	creator = other;
	sprite_index = sprPopoNade;
	on_step = script_ref_create(plnadestep);
	on_wall = script_ref_create(plnadewall);
	on_hit = script_ref_create(plnadehit);
	on_destroy = script_ref_create(plnadedestroy);
	pndtimer = 60;
	friction = 0.5;
	image_speed = 0.4;
}

#define plnadestep
image_angle = direction;
pndtimer -= 1;
if pndtimer < 11 sprite_index = global.sprblink;
if pndtimer < 1 instance_destroy();

#define plnadehit
projectile_hit(other,damage,force);
instance_destroy();

#define plnadewall
sound_play_pitchvol(sndGrenadeHitWall,0.8,1);
instance_create(x,y,Dust);
move_bounce_solid(true);
speed -= 4;
if speed < 0 speed = 0;

#define plnadedestroy
sound_play(sndExplosion);
for(i = 0; i < 1; i += 1)
{
	with instance_create(x+lengthdir_x(16,direction+i),y+lengthdir_y(16,direction+i),PopoExplosion)
	{
		team = other.team;
	}
}