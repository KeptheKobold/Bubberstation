/datum/supply_pack/security/armory/wt551
	name = "WT-551 Autorifle Crate"
	desc = "Contains a pair of WT-551 Autorifles pre-loaded with less-lethal rubber-tipped rounds. Additional ammo sold seperately. Backwards-compatible with WT-550 magazines. Nanotrasen reminds you that the other weapon is for a friend, and not for going guns akimbo."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/gun/ballistic/automatic/wt550/security/rubber = 2)
	crate_name = "wt-550 autorifle crate"

/datum/supply_pack/security/armory/wt550_ammo_rubber
	name = "WT-550/WT-551 Autorifle Ammo Crate (Rubber-Tipped)"
	desc = "Contains 4 magazines with less-lethal rubber-tipped rounds for the WT-551."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/ammo_box/magazine/wt550m9/rubber = 4)
	crate_name = "wt-550 magazine crate (rubber-tipped)"

/datum/supply_pack/security/armory/wt550_ammo_flat
	name = "WT-550/WT-551 Autorifle Ammo Crate (Flat-Tipped)"
	desc = "Contains 3 magazines with lethal flat-tipped rounds for the WT-551."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/ammo_box/magazine/wt550m9/flathead = 4)
	crate_name = "wt-550 magazine crate (flat-tipped)"

/datum/supply_pack/security/armory/wt550_ammo_regular
	name = "WT-550/WT-551 Autorifle Ammo Crate (Regular)"
	desc = "Contains 3 magazines with lethal regular rounds for the WT-551."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/ammo_box/magazine/wt550m9 = 4)
	crate_name = "wt-550 magazine crate (regular)"

/datum/supply_pack/security/ammo
	contains = list(/obj/item/ammo_box/advanced/s12gauge/bean = 3,
					/obj/item/ammo_box/advanced/s12gauge/rubber = 3,
					/obj/item/ammo_box/c38/trac,
					/obj/item/ammo_box/c38/hotshot,
					/obj/item/ammo_box/c38/iceblox,
				)
	special = FALSE
//This makes the Security ammo crate use the cool advanced ammo boxes instead of the old ones


/datum/supply_pack/security/secmed_technician
	name = "Security Medic Kit Crate - Technician"
	crate_name = "security medic crate"
	desc = "Contains a medical technician kit."
	access = ACCESS_SECURITY
	cost = CARGO_CRATE_VALUE * 7.125
	contains = list(
		/obj/item/storage/backpack/duffelbag/deforest_paramedic/stocked,
	)

/datum/supply_pack/security/secmed_surgical
	name = "Security Medic Kit Crate - Surgical"
	crate_name = "security medic crate"
	desc = "Contains a first responder surgical kit."
	access = ACCESS_SECURITY
	cost = CARGO_CRATE_VALUE * 3.9
	contains = list(
		/obj/item/storage/backpack/duffelbag/deforest_surgical/stocked,
	)

/datum/supply_pack/security/secmed_medical
	name = "Security Medic Kit Crate - Medical"
	crate_name = "security medic crate"
	desc = "Contains a large satchel medical kit."
	access = ACCESS_SECURITY
	cost = CARGO_CRATE_VALUE * 7.125
	contains = list(
		/obj/item/storage/backpack/duffelbag/deforest_medkit/stocked,
	)

/datum/supply_pack/security/plasma_marksman
	name = "Gwiazda Plasma Sharpshooter Single-Pack"
	crate_name = "Gwiadza Plasma Sharpshooter Crate"
	desc = "Contains a Gwiazda Plasma Sharpshooter and one plasma battery for it."
	contains = list(/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = 1,
	/obj/item/ammo_box/magazine/recharge/plasma_battery = 1)
	cost = CARGO_CRATE_VALUE * 10
	access = ACCESS_SECURITY

/datum/supply_pack/security/miecz
	name = "Miecz Submachine Gun Single-Pack"
	crate_name = "Miecz submachinegun crate"
	desc = "Contains a Miecz submachinegun and a spare magazine for it."
	contains = list(/obj/item/gun/ballistic/automatic/miecz = 1,
	/obj/item/ammo_box/magazine/miecz = 1)
	cost = CARGO_CRATE_VALUE * 10
	access = ACCESS_SECURITY

/datum/supply_pack/security/armory/swat
	desc = "Contains two fullbody sets of tough, fireproof suits designed in a joint \
		effort by IS-ERI and Nanotrasen. Each set contains a suit, helmet, mask, combat belt, a pepperball gun, \
		and gorilla gloves."

/datum/supply_pack/security/armory/swat/New()
	. = ..()
	contains += list(/obj/item/storage/toolbox/guncase/skyrat/pistol/pepperball = 2)

/datum/supply_pack/security/armory/mechthermal
	access = FALSE
	access_any = list(ACCESS_SECURITY, ACCESS_ROBOTICS)
	access_view = FALSE

/datum/supply_pack/security/pepperballguns
	name = "Pepperball Gun Crate"
	desc = "Contains three pepperball guns, a non-lethal weapon that fires pepper-filled projectiles."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/storage/toolbox/guncase/skyrat/pistol/pepperball = 3)
	access = ACCESS_SECURITY

/datum/supply_pack/security/Tasers
	name = "Taser Crate"
	desc = "Contains three hybrid tasers, a non-lethal weapon that fires electric projectiles and features a secondary disabler."
	cost = CARGO_CRATE_VALUE * 5.5
	contains = list(/obj/item/gun/energy/e_gun/advtaser = 3)
	access = ACCESS_SECURITY

