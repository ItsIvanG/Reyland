#define init
global.sprite = sprite_add_weapon("PopoPlasmaMinigun.png",2,5)

#define weapon_name
	return "I.D.P.D. Plasma Minigun";

#define weapon_type
	return 5;

#define weapon_area
	return 15;

#define weapon_cost
	return 7;

#define weapon_load
	return 30;

#define weapon_swap
	return sndSwapEnergy;

#define weapon_auto
	return true;

#define weapon_sprt
	return global.sprite;

#define weapon_text
	return "@bUnstoppable";

#define weapon_fire
repeat 5
{if instance_exists(self)
	weapon_post(4,-4,4);
	{with(instance_create(x,y,PlasmaBall)){
		sound_play(sndEliteShielderFire);
		team = other.team;
		creator = other;
		sprite_index = sprPopoPlasma;
		direction = other.gunangle + random_range(-12,12) ;
		image_angle = direction;
		wait 4;}}}