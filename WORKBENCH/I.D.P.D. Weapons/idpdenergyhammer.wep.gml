#define init
global.sprite = sprite_add_weapon("PopoEnergyHammer.png", 0, 4);
global.Slash = sprite_add("PopoHeavyEnergySlash.png", 3, 0, 24);

#define weapon_name
return "I.D.P.D. Energy Hammer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_melee
return true;

#define weapon_load
return weapon_get_load(wep_energy_hammer);

#define weapon_swap
return sndSwapHammer;

#define weapon_cost
return 3;

#define weapon_area
return 5;

#define weapon_text
return "@bFor newbies";

#define weapon_fire
sound_play(sndEliteInspectorFire);
weapon_post(0, 4, 12);
for(i = -0; i <= 0; i += 60)
{
  with instance_create(x+lengthdir_x(skill_get(13)*12,gunangle+(i*accuracy)),y+lengthdir_y(skill_get(13)*12,gunangle+(i*accuracy)),EnergyHammerSlash)
  {
    direction = other.gunangle + (other.i * other.accuracy);
    speed = 2 * (skill_get(13) + 2);
    sprite_index = global.Slash;
    image_angle = direction;
    team = other.team;
    damage = 28;
  }
}
wepangle = -wepangle;
motion_add(gunangle, 5);