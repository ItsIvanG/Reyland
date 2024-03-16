#define init
global.sprite = sprite_add_weapon("PopoPlasmaRifle.png",2,3)

#define weapon_name
	return "I.D.P.D. Plasma Rifle";

#define weapon_type
	return 5;

#define weapon_area
	return 8;

#define weapon_cost
	return 4;

#define weapon_load
	return 55;

#define weapon_swap
return sndSwapEnergy;

#define weapon_auto
	return true;

#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bDefense";

#define weapon_fire
repeat 3
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,PlasmaBall)){
		sound_play(sndEliteShielderFire);
		team = other.team;
		creator = other;
		sprite_index = sprPopoPlasma;
		direction = other.gunangle + random_range(-8,8) ;
		image_angle = direction;
		wait 6;}}}