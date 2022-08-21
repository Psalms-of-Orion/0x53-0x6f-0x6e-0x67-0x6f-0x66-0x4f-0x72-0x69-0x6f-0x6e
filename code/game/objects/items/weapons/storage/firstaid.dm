/* First aid storage
 * Contains:
 *		First Aid Kits
 * 		Pill Bottles
 *		Portable Freezer
 */

/*
 * First Aid Kits
 */
/obj/item/storage/firstaid
	name = "first-aid kit"
	desc = "An emergency medical kit for those serious boo-boos."
	icon_state = "firstaid"
	throw_speed = 2
	throw_range = 8
	rarity_value = 10
	spawn_tags = SPAWN_TAG_FIRSTAID
	bad_type = /obj/item/storage/firstaid
	var/initial_amount = 0
	var/spawn_type
	var/empty = 0


/obj/item/storage/firstaid/fire
	name = "fire first-aid kit"
	desc = "An emergency medical kit for when the toxins lab <i>-spontaneously-</i> burns down."
	icon_state = "ointment"
	item_state = "firstaid-ointment"
	rarity_value = 15
	initial_amount = 2
	spawn_type = /obj/item/stack/medical/ointment

/obj/item/storage/firstaid/fire/populate_contents()
	icon_state = pick("ointment","firefirstaid")

	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/storage/pill_bottle/small/kelotane(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline2(src)
	new /obj/item/device/scanner/health(src)


/obj/item/storage/firstaid/regular
	icon_state = "firstaid"
	rarity_value = 10
	initial_amount = 3
	spawn_type = /obj/item/stack/medical/bruise_pack

/obj/item/storage/firstaid/regular/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/retro
	name = "antiquated first aid kit"
	desc = "An old, odd form of first aid kit of robust construction and marked with long banned and disused medical symbology."
	icon_state = "antitoxin"
	item_state = "firstaid-toxin"
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_STEEL = 5)
	attack_verb = list("robusted")
	rarity_value = 30
	initial_amount = 2
	spawn_type = /obj/item/stack/medical/bruise_pack/retro

/obj/item/storage/firstaid/fire/populate_contents()
	icon_state = pick("bezerk","bezerk2")

	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)

	if(prob(50))
		new /obj/item/storage/fancy/cigarettes/syrette/advanced(src)
	else
		new /obj/item/storage/fancy/cigarettes/syrette(src)
	new /obj/spawner/medical(src)
	new /obj/spawner/medical(src)
	new /obj/item/stack/medical/bruise_pack/retro
	if(prob(65))
		new /obj/item/reagent_containers/hypospray/autoinjector/syrette(src)
	else
		new /obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/serotrotium(src)
	if(prob(50))
		new /obj/item/storage/fancy/cigarettes/pill_box(src)
	else
		new /obj/item/stack/medical/ointment(src)

/obj/item/storage/firstaid/toxin
	name = "toxin first aid kit"
	desc = "A specialized first aid kit for treating toxins, venoms, and septics."
	icon_state = "antitoxin"
	item_state = "firstaid-toxin"
	rarity_value = 15
	initial_amount = 1
	spawn_type = /obj/item/storage/fancy/cigarettes/syrette/toxin

/obj/item/storage/firstaid/toxin/populate_contents()
	icon_state = pick("antitoxin","antitoxfirstaid2","antitoxfirstaid3")

	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/storage/pill_bottle/small/carbon(src)
	new /obj/item/storage/pill_bottle/small/antitox(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline2(src)
	new /obj/item/device/scanner/health(src)


/obj/item/storage/firstaid/o2
	name = "oxygen deprivation first aid kit"
	desc = "A first aid kit used for the treatment of vacuum exposure, lung damage, or lack of blood flow."
	icon_state = "o2"
	item_state = "firstaid-o2"
	rarity_value = 15
	initial_amount = 1
	spawn_type = /obj/item/storage/fancy/cigarettes/syrette/oxloss

/obj/item/storage/firstaid/o2/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/scanner/health(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/emergency_oxygen(src)

/obj/item/storage/firstaid/adv
	name = "advanced first-aid kit"
	desc = "Contains advanced medical treatments."
	icon_state = "advfirstaid"
	item_state = "firstaid-advanced"
	rarity_value = 30
	initial_amount = 3
	spawn_type = /obj/item/stack/medical/advanced/bruise_pack

/obj/item/storage/firstaid/adv/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/device/scanner/health(src)

/obj/item/storage/firstaid/sar
	name = "triage kit"
	desc = "A field aid kit for Search and Rescue operations to stabilize injuries far from care."
	icon_state = "SAR"
	item_state = "firstaid-advanced"
	rarity_value = 50
	initial_amount = 2
	spawn_type = /obj/item/stack/medical/advanced/bruise_pack

/obj/item/storage/firstaid/sar/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/storage/fancy/cigarettes/syrette(src)
	new /obj/item/bodybag/cryobag(src)

/obj/item/storage/firstaid/radiation
	name = "radiation first-aid kit"
	desc = "An emergency medical kit for radiological incidents."
	icon_state = "ointment"
	item_state = "radfirstaid"
	rarity_value = 50
	initial_amount = 2
	spawn_type = /obj/item/stack/medical/ointment

/obj/item/storage/firstaid/radiation/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/storage/fancy/cigarettes/pill_box/radiation(src)
	new /obj/item/reagent_containers/hypospray/autoinjector(src)
	new /obj/item/storage/fancy/cigarettes/syrette/radiation(src)

/obj/item/storage/firstaid/combat
	name = "combat medical kit"
	desc = "Contains advanced medical treatments."
	icon_state = "bezerk"
	item_state = "firstaid-advanced"
	rarity_value = 100
	initial_amount = 1
	spawn_type = /obj/item/stack/medical/splint

/obj/item/storage/firstaid/combat/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/storage/pill_bottle/dexalin_plus(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)

/obj/item/storage/firstaid/surgery
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport."
	icon_state = "surgeon"
	item_state = "firstaid-surgeon"
	rarity_value = 90
	can_hold = list(
		/obj/item/tool/bonesetter,
		/obj/item/tool/cautery,
		/obj/item/tool/saw,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/scalpel,
		/obj/item/tool/surgicaldrill,
		/obj/item/device/scanner,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		)

/obj/item/storage/firstaid/surgery/populate_contents()
	if (empty) return
	new /obj/item/tool/bonesetter(src)
	new /obj/item/tool/cautery(src)
	new /obj/item/tool/saw/circular(src)
	new /obj/item/tool/hemostat(src)
	new /obj/item/tool/retractor(src)
	new /obj/item/tool/scalpel(src)
	new /obj/item/tool/surgicaldrill(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	make_exact_fit()

/obj/item/storage/firstaid/surgery/contractor
	spawn_blacklisted = TRUE

/obj/item/storage/firstaid/surgery/contractor/populate_contents()
	if (empty) return
	icon_state = "surgeon2"
	item_state = "firstaid-surgeon"
	new /obj/item/tool/bonesetter(src)
	new /obj/item/tool/cautery(src)
	new /obj/item/tool/saw/circular/advanced(src)
	new /obj/item/tool/hemostat(src)
	new /obj/item/tool/retractor(src)
	new /obj/item/tool/scalpel/advanced(src)
	new /obj/item/tool/surgicaldrill(src)
	new /obj/item/device/scanner/health(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/storage/pill_bottle/oxycodone(src)
	new /obj/item/storage/pill_bottle/prosurgeon(src)
	make_exact_fit()

/obj/item/storage/firstaid/nt
	name = "NeoTheologian Medkit"
	desc = "A medkit filled with a set of high-end trauma kits and anti-toxins."
	icon_state = "nt_kit"
	item_state = "nt_kit"
	matter = list(MATERIAL_BIOMATTER = 10)
	initial_amount = 2
	spawn_type = /obj/item/stack/medical/advanced/bruise_pack/nt
	spawn_blacklisted = TRUE

/obj/item/storage/firstaid/nt/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/advanced/ointment/nt(src)
	new /obj/item/stack/medical/advanced/ointment/nt(src)
	new /obj/item/reagent_containers/syringe/large/antitoxin(src)
	new /obj/item/reagent_containers/syringe/large/dexalin_plus(src)

/obj/item/storage/firstaid/nt/update_icon()
	if(!contents.len)
		icon_state = "[initial(icon_state)]_empty"
		item_state = "[initial(item_state)]_empty"
	else
		icon_state = "[initial(icon_state)]"
		item_state = "[initial(item_state)]"
	..()

/*
 * Pill Bottles
 */
/obj/item/storage/pill_bottle
	name = "pill bottle"
	desc = "An airtight container for storing medication."
	icon_state = "pill_canister"
	icon = 'icons/obj/chemical.dmi'
	item_state = "contsolid"
	w_class = ITEM_SIZE_SMALL
	can_hold = list(/obj/item/reagent_containers/pill,
		/obj/item/dice,
		/obj/item/paper
		)
	allow_quick_gather = TRUE
	use_to_pickup = TRUE
	use_sound = null
	matter = list(MATERIAL_PLASTIC = 1)
	max_storage_space = 12
	rarity_value = 10
	bad_type = /obj/item/storage/pill_bottle
	spawn_tags = SPAWN_TAG_MEDICINE
	var/pill_type
	var/initial_amt = 7

/obj/item/storage/pill_bottle/antitox
	name = "bottle of Dylovene pills"
	desc = "Contains pills used to counter toxins."
	pill_type = /obj/item/reagent_containers/pill/antitox

/obj/item/storage/pill_bottle/antitox/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/bicaridine
	name = "bottle of Bicaridine pills"
	desc = "Contains pills used to stabilize the severely injured."
	pill_type = /obj/item/reagent_containers/pill/bicaridine

/obj/item/storage/pill_bottle/bicaridine/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/dexalin_plus
	name = "bottle of Dexalin Plus pills"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."
	pill_type = /obj/item/reagent_containers/pill/dexalin_plus

/obj/item/storage/pill_bottle/dexalin_plus/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/dermaline
	name = "bottle of Dermaline pills"
	desc = "Contains pills used to treat burn wounds."
	pill_type = /obj/item/reagent_containers/pill/dermaline

/obj/item/storage/pill_bottle/dermaline/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/dylovene
	name = "bottle of Dylovene pills"
	desc = "Contains pills used to treat toxic substances in the blood."
	pill_type = /obj/item/reagent_containers/pill/dylovene

/obj/item/storage/pill_bottle/dylovene/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/inaprovaline
	name = "bottle of Inaprovaline pills"
	desc = "Contains pills used to stabilize patients."
	pill_type = /obj/item/reagent_containers/pill/inaprovaline

/obj/item/storage/pill_bottle/inaprovaline/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/kelotane
	name = "bottle of Kelotane pills"
	desc = "Contains pills used to treat burns."
	pill_type = /obj/item/reagent_containers/pill/kelotane

/obj/item/storage/pill_bottle/kelotane/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/spaceacillin
	name = "bottle of Spaceacillin pills"
	desc = "A theta-lactam antibiotic. Effective against many diseases likely to be encountered in space."
	pill_type = /obj/item/reagent_containers/pill/spaceacillin

/obj/item/storage/pill_bottle/spaceacillin/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/tramadol
	name = "bottle of Tramadol pills"
	desc = "Contains pills used to relieve pain."
	rarity_value = 15
	pill_type = /obj/item/reagent_containers/pill/tramadol

/obj/item/storage/pill_bottle/tramadol/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/citalopram
	name = "bottle of Citalopram pills"
	desc = "Contains pills used to stabilize a patient's mood."
	pill_type = /obj/item/reagent_containers/pill/citalopram

/obj/item/storage/pill_bottle/citalopram/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/prosurgeon
	name = "bottle of ProSurgeon pills"
	desc = "Contains pills used to reduce hand tremor."
	pill_type = /obj/item/reagent_containers/pill/prosurgeon
	rarity_value = 20

/obj/item/storage/pill_bottle/prosurgeon/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/oxycodone
	name = "bottle of Oxycodone pills"
	desc = "Contains pills used to relieve extreme pain. DO NOT OVERCONSUME."
	spawn_tags = SPAWN_TAG_MEDICINE_CONTRABAND
	pill_type = /obj/item/reagent_containers/pill/oxycodone
	rarity_value = 30

/obj/item/storage/pill_bottle/oxycodone/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/meralyne
	name = "bottle of Meralyne pills"
	desc = "Contains pills used to heal physical harm."
	pill_type = /obj/item/reagent_containers/pill/meralyne
	rarity_value = 20

/obj/item/storage/pill_bottle/meralyne/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

//Songs of Orion
//Small pill bottles
/obj/item/storage/pill_bottle/small
	name = "pill tube"
	desc = "A small airtight container for storing medication."
	icon_state = "pill_tube"
	allow_quick_gather = TRUE
	use_to_pickup = TRUE
	use_sound = null
	matter = list(MATERIAL_PLASTIC = 1)
	max_storage_space = 5
	rarity_value = 10
	bad_type = /obj/item/storage/pill_bottle/small
	spawn_tags = SPAWN_TAG_MEDICINE
	initial_amt = 4

/obj/item/storage/pill_bottle/small/antitox
	name = "tube of anti-toxin pills"
	desc = "Contains pills used to counter toxins."
	icon_state = "pill_tube_green"
	pill_type = /obj/item/reagent_containers/pill/antitox

/obj/item/storage/pill_bottle/small/antitox/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/bicaridine
	name = "tube of Bicaridine pills"
	desc = "Contains pills used to stabilize the severely injured."
	icon_state = "pill_tube_red"
	pill_type = /obj/item/reagent_containers/pill/bicaridine

/obj/item/storage/pill_bottle/small/bicaridine/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/tramadol
	name = "tube of Tramadol pills"
	desc = "Contains pills used to relieve pain."
	icon_state = "pill_tube"
	pill_type = /obj/item/reagent_containers/pill/tramadol

/obj/item/storage/pill_bottle/small/tramadol/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/dexalin_plus
	name = "tube of Dexalin Plus pills"
	icon_state = "pill_tube_blue"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."
	pill_type = /obj/item/reagent_containers/pill/dexalin_plus

/obj/item/storage/pill_bottle/small/dexalin_plus/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/carbon
	name = "tube of charcoal pills"
	icon_state = "pill_tube"
	desc = "Contains pills used to neutralize toxic stomach contents."
	pill_type = /obj/item/reagent_containers/pill/carbon

/obj/item/storage/pill_bottle/small/carbon/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/dermaline
	name = "tube of Dermaline pills"
	desc = "Contains pills used to treat burn wounds."
	icon_state = "pill_tube_orange"
	pill_type = /obj/item/reagent_containers/pill/dermaline

/obj/item/storage/pill_bottle/small/dermaline/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/kelotane
	name = "tube of burn pills"
	desc = "Contains pills used to treat burns."
	icon_state = "pill_tube_yellow"
	pill_type = /obj/item/reagent_containers/pill/kelotane

/obj/item/storage/pill_bottle/small/kelotane/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/paracetamol
	name = "tube of painkiller pills"
	desc = "Contains pills used to relieve pain."
	icon_state = "pill_tube"
	pill_type = /obj/item/reagent_containers/pill/paracetamol

/obj/item/storage/pill_bottle/small/paracetamol/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/inaprovaline
	name = "tube of inaprovaline pills"
	desc = "Contains pills used to relieve pain."
	icon_state = "pill_tube_aqua"
	pill_type = /obj/item/reagent_containers/pill/inaprovaline

/obj/item/storage/pill_bottle/small/inaprovaline/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/dexalin
	name = "tube of Dexalin pills"
	icon_state = "pill_tube_blue"
	desc = "Contains pills used to treat cases of oxygen deprivation."
	pill_type = /obj/item/reagent_containers/pill/dexalin

/obj/item/storage/pill_bottle/small/dexalin/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/hyronalin
	name = "tube of anti-radiation pills"
	icon_state = "pill_tube"
	desc = "Contains pills used to treat cases of radiation exposure."
	pill_type = /obj/item/reagent_containers/pill/hyronalin

/obj/item/storage/pill_bottle/small/hyronalin/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/spaceacillin
	name = "tube of Spaceacillin pills"
	desc = "A theta-lactam antibiotic. Effective against many diseases likely to be encountered in space."
	pill_type = /obj/item/reagent_containers/pill/spaceacillin

/obj/item/storage/pill_bottle/small/spaceacillin/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/storage/pill_bottle/small/inaprovaline2
	name = "tube of synth-inaprovaline pills"
	desc = "A synaptic stimulant and cardiostimulant used to stabilize patients."
	pill_type = /obj/item/reagent_containers/pill/inaprovaline2

/obj/item/storage/pill_bottle/small/inaprovaline2/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)


/*
 * Portable Freezers
 */
/obj/item/storage/freezer
	name = "portable freezer"
	desc = "This nifty shock-resistant device will keep your 'groceries' nice and non-spoiled."
	icon_state = "freezer"
	item_state = "medicalpack"
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2)
	can_hold = list(/obj/item/organ, /obj/item/reagent_containers/food, /obj/item/reagent_containers/glass)
	max_storage_space = DEFAULT_NORMAL_STORAGE
	use_to_pickup = TRUE

/obj/item/storage/freezer/contains_food/populate_contents()
	new /obj/spawner/pizza/low_chance(src)
	new /obj/spawner/soda(src)
	new /obj/spawner/soda/low_chance(src)
	new /obj/spawner/rations/low_chance(src)
	new /obj/spawner/junkfood(src)
	new /obj/spawner/junkfood(src)
	new /obj/spawner/junkfood(src)
	new /obj/spawner/junkfood/low_chance(src)
	new /obj/spawner/junkfood/low_chance(src)
	new /obj/spawner/booze/low_chance(src)

/obj/item/storage/freezer/medical
	name = "organ freezer"
	icon_state = "freezer_red"
	item_state = "medicalpack"
	matter = list(MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 2)
	max_storage_space = DEFAULT_NORMAL_STORAGE * 1.25


//Old First Aid Kits
//These contain old sprites for intentional juxtoposition.
/obj/item/storage/firstaid/regular/old
	name = "uncanny first-aid kit"
	desc = "A simple white first aid kit, yet it clearly should not be here."
	icon_state = "firstaid_old"
	item_state = "firstaid_old"
	spawn_blacklisted = TRUE
	initial_amount = 3
	spawn_type = /obj/item/stack/medical/bruise_pack/old

/obj/item/storage/firstaid/regular/old/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/ointment/old(src)
	new /obj/item/stack/medical/ointment/old(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health/old(src)

/obj/item/storage/firstaid/fire/old
	name = "fire first-aid kit"
	desc = "An emergency medical kit for when the toxins lab <i>-spontaneously-</i> burns down. It appears... uncanny."
	icon_state = "ointment_old"
	item_state = "firstaid-ointment_old"
	spawn_blacklisted = TRUE
	initial_amount = 2
	spawn_type = /obj/item/stack/medical/ointment/old

/obj/item/storage/firstaid/fire/old/populate_contents()
	icon_state = pick("ointment_old","firefirstaid_old")

	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/pill/kelotane(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health/old(src)

/obj/item/storage/firstaid/toxin/old
	name = "toxin first aid"
	desc = "Used to treat when you have a high amoutn of toxins in your body."
	icon_state = "antitoxin_old"
	item_state = "firstaid-toxin_old"
	spawn_blacklisted = TRUE
	initial_amount = 3
	spawn_type = /obj/item/reagent_containers/syringe/antitoxin

/obj/item/storage/firstaid/toxin/old/populate_contents()
	icon_state = pick("antitoxin_old","antitoxfirstaid2_old","antitoxfirstaid3_old")

	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/pill/antitox(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health/old(src)

/obj/item/storage/firstaid/o2/old
	name = "oxygen deprivation first aid"
	desc = "A box full of oxygen goodies."
	icon_state = "o2_old"
	item_state = "firstaid-o2_old"
	spawn_blacklisted = TRUE
	initial_amount = 4
	spawn_type = /obj/item/reagent_containers/pill/dexalin

/obj/item/storage/firstaid/o2/old/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health/old(src)

/obj/item/storage/firstaid/adv/old
	name = "atypical advanced first-aid kit"
	desc = "Contains advanced medical treatments of a forgotten time and place."
	icon_state = "advfirstaid_old"
	item_state = "firstaid-advanced_old"
	spawn_blacklisted = TRUE
	initial_amount = 3
	spawn_type = /obj/item/stack/medical/advanced/bruise_pack/old

/obj/item/storage/firstaid/adv/old/populate_contents()
	if (empty) return
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
	new /obj/item/stack/medical/advanced/ointment/old(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint/old(src)
	new /obj/item/reagent_containers/syringe/inaprovaline(src)
	new /obj/item/device/scanner/health/old(src)

/obj/item/storage/firstaid/combat/old
	name = "combat medical kit"
	desc = "Contains advanced medical treatments."
	icon_state = "bezerk_old"
	item_state = "firstaid-advanced_old"
	spawn_blacklisted = TRUE

/obj/item/storage/firstaid/surgery/old
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport."
	icon_state = "surgeon_old"
	item_state = "firstaid-surgeon_old"
	spawn_blacklisted = TRUE
