// Apparently upstream doesn't have an empty subtype for this one
/obj/item/stock_parts/power_store/battery/upgraded/empty
	empty = TRUE

/obj/machinery/power/smes/battery_pack
	name = "stationary battery"
	desc = "An about table-height block of power storage, commonly seen in low storage high output power applications. \
		Smaller units such as these tend to have a respectively <b>smaller energy storage</b>, though also are capable of \
		<b>higher maximum output</b> than some larger units. Most commonly seen being used not for their ability to store \
		power, but rather for use in regulating power input and output."
	icon = 'modular_skyrat/modules/colony_fabricator/icons/power_storage_unit/small_battery.dmi'
	total_capacity = 7.5 * STANDARD_BATTERY_CHARGE
	input_level_max = 400 KILO WATTS
	output_level_max = 400 KILO WATTS
	circuit = null
	obj_flags = parent_type::obj_flags | NO_DEBRIS_AFTER_DECONSTRUCTION
	/// The item we turn into when repacked
	var/repacked_type = /obj/item/flatpacked_machine/station_battery

	// This is dumb but SMES units actually take from/give to their internal cells now so can't just set capacity and be done with it
	// These total 7.5 * STANDARD_BATTERY_CHARGE capacity
	/// Assoc list of (part type = amount) to spawn in the SMES on Initialize, because this type bypasses all standard part stuff
	var/list/included_parts = list(
		/obj/item/stock_parts/power_store/battery/upgraded/empty = 2,
		/obj/item/stock_parts/power_store/battery/empty = 2,
		/obj/item/stock_parts/power_store/battery/crap/empty = 1,
		/obj/item/stock_parts/capacitor = 1,
	)

/obj/machinery/power/smes/battery_pack/Initialize(mapload)
	. = ..()
	component_parts = list()
	for(var/obj/item/part as anything in included_parts)
		for(var/_ in 1 to included_parts[part])
			component_parts += new part(src)

	AddElement(/datum/element/repackable, repacked_type, 5 SECONDS)
	AddElement(/datum/element/manufacturer_examine, COMPANY_FRONTIER)
	if(!mapload)
		flick("smes_deploy", src)

/obj/machinery/power/smes/battery_pack/default_deconstruction_screwdriver(mob/user, icon_state_open, icon_state_closed, obj/item/screwdriver)
	if(screwdriver.tool_behaviour != TOOL_SCREWDRIVER)
		return FALSE

	screwdriver.play_tool_sound(src, 50)
	toggle_panel_open()
	if(panel_open)
		icon_state = icon_state_open
		to_chat(user, span_notice("You open the maintenance hatch of [src]."))
	else
		icon_state = icon_state_closed
		to_chat(user, span_notice("You close the maintenance hatch of [src]."))
	return TRUE

// previously NO_DECONSTRUCTION
/obj/machinery/power/smes/battery_pack/default_deconstruction_crowbar(obj/item/crowbar, ignore_panel, custom_deconstruct)
	return NONE

/obj/machinery/power/smes/battery_pack/default_pry_open(obj/item/crowbar, close_after_pry, open_density, closed_density)
	return NONE

// Block attempts to upgrade parts
/obj/machinery/power/smes/battery_pack/exchange_parts(mob/user, obj/item/storage/part_replacer/replacer_tool)
	return FALSE

// Automatically set themselves to be completely charged on init
/obj/machinery/power/smes/battery_pack/precharged/Initialize(mapload)
	. = ..()
	adjust_charge(INFINITY)

// Item for creating the small battery and carrying it around

/obj/item/flatpacked_machine/station_battery
	name = "flat-packed stationary battery"
	icon_state = "battery_small_packed"
	type_to_deploy = /obj/machinery/power/smes/battery_pack
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 7,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)

// Larger station batteries, hold more but have less in/output

/obj/machinery/power/smes/battery_pack/large
	name = "large stationary battery"
	desc = "A massive block of power storage, commonly seen in high storage low output power applications. \
		Larger units such as these tend to have a respectively <b>larger energy storage</b>, though only capable of \
		<b>low maximum output</b> compared to smaller units. Most commonly seen as large backup batteries, or simply \
		for large power storage where throughput is not a concern."
	icon = 'modular_skyrat/modules/colony_fabricator/icons/power_storage_unit/large_battery.dmi'
	total_capacity = 100 * STANDARD_BATTERY_CHARGE
	input_level_max = 50 KILO WATTS
	output_level_max = 50 KILO WATTS
	repacked_type = /obj/item/flatpacked_machine/large_station_battery
	// These total 100 * STANDARD_BATTERY_CHARGE capacity
	included_parts = list(
		/obj/item/stock_parts/power_store/battery/super/empty = 5,
		/obj/item/stock_parts/capacitor = 1,
	)

// Automatically set themselves to be completely charged on init
/obj/machinery/power/smes/battery_pack/large/precharged/Initialize(mapload)
	. = ..()
	adjust_charge(INFINITY)

/obj/item/flatpacked_machine/large_station_battery
	name = "flat-packed large stationary battery"
	icon_state = "battery_large_packed"
	type_to_deploy = /obj/machinery/power/smes/battery_pack/large
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 12,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT,
	)
