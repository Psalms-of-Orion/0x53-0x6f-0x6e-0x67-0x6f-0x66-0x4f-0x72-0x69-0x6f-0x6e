////////////////////////////////////////////////////////////////////////////////
/// HYPOSPRAY
////////////////////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/hypospray
	name = "hypospray"
	desc = "The Moebius Medical department hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients."
	icon = 'icons/obj/syringe.dmi'
	item_state = "hypo"
	icon_state = "hypo"
	amount_per_transfer_from_this = 5
	unacidable = 1
	volume = 40
	possible_transfer_amounts = null
	reagent_flags = OPENCONTAINER
	slot_flags = SLOT_BELT
	preloaded_reagents = list("bicaridine" = 40)
	//spawn_blacklisted = TRUE//antag_item_targets?

/obj/item/reagent_containers/hypospray/attack(mob/living/M as mob, mob/user as mob)
	if(!reagents.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return
	if (!istype(M))
		return
	var/injtime //Injecting through a hardsuit takes long time due to needing to find a port.
	// Handling errors and injection duration
	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/clothing/suit/space/SS = H.get_equipped_item(slot_wear_suit)
		var/obj/item/rig/RIG = H.get_equipped_item(slot_back)
		if((istype(RIG) && RIG.suit_is_deployed()) || istype(SS))
			injtime = 30
			var/obj/item/organ/external/affected = H.get_organ(BP_CHEST)
			if(BP_IS_ROBOTIC(affected))
				to_chat(user, SPAN_WARNING("Injection port on [M]'s suit is refusing your [src]."))
				// I think rig is advanced enough for this, and people will learn what causes this error
				if(RIG)
					playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 1, -3)
					RIG.visible_message("\icon[RIG]\The [RIG] states \"Attention: User of this suit appears to be synthetic origin\".")
				return
		// check without message
		else if(!H.can_inject(user, FALSE))
			// lets check if user is easily fooled
			var/obj/item/organ/external/affected = H.get_organ(user.targeted_organ)
			if(BP_IS_LIFELIKE(affected) && user && user.stats.getStat(STAT_BIO) < STAT_LEVEL_BASIC)
				if(M.reagents)
					var/trans = reagents.remove_any(amount_per_transfer_from_this)
					user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
					to_chat(user, SPAN_NOTICE("[trans] units injected. [reagents.total_volume] units remaining in \the [src]."))
				return
			else
				// if he is not lets show him what actually happened
				H.can_inject(user, TRUE)
				return
	else if(!M.can_inject(user, TRUE))
		return
	// handling injection duration on others
	if(M != user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		if(injtime)
			user.visible_message(SPAN_WARNING("[user] begins hunting for an injection port on [M]'s suit!"), SPAN_WARNING("You begins hunting for an injection port on [M]'s suit!"))
			if(do_mob(user, M, injtime))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
			else
				return
	// handling actual injection
	// on this stage we are sure that everything is alright
	var/contained = reagents.log_list()
	var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, trans)
	to_chat(user, SPAN_NOTICE("[trans] units injected. [reagents.total_volume] units remaining in \the [src]."))
	return

/obj/item/reagent_containers/hypospray/verb/empty()
	set name = "Empty Hypospray"
	set category = "Object"
	set src in usr

	if (alert(usr, "Are you sure you want to empty that?", "Empty Bottle:", "Yes", "No") != "Yes")
		return
	if(isturf(usr.loc))
		to_chat(usr, SPAN_NOTICE("You empty \the [src] onto the floor."))
		reagents.splash(usr.loc, reagents.total_volume)

/obj/item/reagent_containers/hypospray/autoinjector
	name = "autoinjector (inaprovaline)"
	desc = "A rapid and safe way to administer small amounts of drugs by untrained or trained personnel."
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	icon_state = "autoinjector"
	item_state = "autoinjector"
	amount_per_transfer_from_this = 5
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)
	reagent_flags = REFILLABLE | DRAINABLE | AMOUNT_VISIBLE
	volume = 5
	preloaded_reagents = list("inaprovaline" = 5)
	spawn_blacklisted = TRUE

/obj/item/reagent_containers/hypospray/autoinjector/on_reagent_change()
	..()
	if(reagents.total_volume <= 0) //Prevents autoinjectors from being refilled.
		reagent_flags &= ~REFILLABLE

/obj/item/reagent_containers/hypospray/autoinjector/update_icon()
	cut_overlays()
	if(reagents && reagents.total_volume > 0)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

// TRADE
/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline2
	name = "autoinjector (synth-inaprovaline)"
	volume = 10
	amount_per_transfer_from_this = 10
	preloaded_reagents = list("inaprovaline2" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/antitoxin
	name = "autoinjector (anti-toxin)"
	preloaded_reagents = list("anti_toxin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine
	name = "autoinjector (tricordrazine)"
	preloaded_reagents = list("tricordrazine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/kelotane
	name = "autoinjector (kelotane)"
	preloaded_reagents = list("kelotane" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/bicaridine
	name = "autoinjector (bicaridine)"
	preloaded_reagents = list("bicaridine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/antirad
	name = "autoinjector (anti-rad)"
	preloaded_reagents = list("hyronalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dexalin
	name = "autoinjector (dexalin)"
	preloaded_reagents = list("dexalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin
	name = "autoinjector (spaceacillin)"
	preloaded_reagents = list("spaceacillin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/tramadol
	name = "autoinjector (tramadol)"
	preloaded_reagents = list("tramadol" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/polystem
	name = "autoinjector (polystem)"
	preloaded_reagents = list("polystem" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/meralyne
	name = "autoinjector (meralyne)"
	preloaded_reagents = list("meralyne" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dermaline
	name = "autoinjector (dermaline)"
	preloaded_reagents = list("dermaline" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dexalinplus
	name = "autoinjector (dexalin plus)"
	preloaded_reagents = list("dexalinp" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/oxycodone
	name = "autoinjector (oxycodone)"
	preloaded_reagents = list("oxycodone" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/ryetalyn
	name = "autoinjector (ryetalyn)"
	preloaded_reagents = list("ryetalyn" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/hyperzine
	name = "autoinjector (hyperzine)"
	preloaded_reagents = list("hyperzine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/drugs
	name = "autoinjector (drugs)"
	preloaded_reagents = list("space_drugs" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/quickhealbrute
	name = "autoinjector (brute-aid)"
	preloaded_reagents = list("bicaridine" = 1, "meralyne" = 1, "seligitillin" = 1, "tricordrazine" = 1, "polystem" = 1)
	price_tag = 100

/obj/item/reagent_containers/hypospray/autoinjector/quickhealburn
	name = "autoinjector (burn-aid)"
	preloaded_reagents = list("kelotane" = 1.25, "dermaline" = 1.25, "tricordrazine" = 1.25, "polystem" = 1.25)
	price_tag = 100

//Songs of Orion
//A stopgap(?) until Eris finally gets around to adding syrettes.
/obj/item/reagent_containers/hypospray/autoinjector/syrette
	icon_state = "syrette_aqua"
	item_state = "syrette_aqua"
	preloaded_reagents = list("inaprovaline" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/antitoxin/
	desc = "A single-use pre-packed dose of anti-toxins."
	name = "syrette (anti-toxin)"
	icon_state = "syrette_green"
	item_state = "syrette_green"
	volume = 10
	amount_per_transfer_from_this = 10
	preloaded_reagents = list("anti_toxin" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/antirad
	name = "syrette (anti-rad)"
	desc = "A single-use pre-packed dose of anti-radiation medication."
	icon_state = "syrette_rad"
	item_state = "syrette_rad"
	preloaded_reagents = list("hyronalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/bicaridine
	name = "syrette (trauma)"
	desc = "A single-use pre-packed dose of analgesic medication."
	icon_state = "syrette_red"
	item_state = "syrette_red"
	volume = 8
	amount_per_transfer_from_this = 8
	preloaded_reagents = list("bicaridine" = 5, "tramadol" = 3)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/meralyne
	name = "syrette (trauma)"
	desc = "A single-use pre-packed dose of advanced trauma stabilizing medication."
	icon_state = "syrette_red"
	item_state = "syrette_red"
	volume = 6.25
	amount_per_transfer_from_this = 6.25
	preloaded_reagents = list("meralyne" = 5, "oxycodone" = 1.25)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/dermaline
	name = "syrette (dermaline)"
	desc = "A single-use pre-packed dose of burn treatment medicine."
	icon_state = "syrette_orange"
	item_state = "syrette_orange"
	volume = 7
	amount_per_transfer_from_this = 7
	preloaded_reagents = list("dermaline" = 5, "tramadol" = 2)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/kelotane
	name = "syrette (burn)"
	desc = "A single-use pre-packed dose of burn treatment medicine."
	icon_state = "syrette_yellow"
	item_state = "syrette_yellow"
	preloaded_reagents = list("kelotane" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/dexalin
	name = "syrette (oxloss)"
	desc = "A single-use pre-packed dose of oxygen deprivation medication."
	icon_state = "syrette_blue"
	item_state = "syrette_blue"
	preloaded_reagents = list("dexalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/dexalinplus
	name = "syrette (dexalin plus)"
	desc = "A single-use pre-packed dose of extreme oxygen deprivation medication."
	icon_state = "syrette_dex"
	item_state = "syrette_dex"
	preloaded_reagents = list("dexalinp" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/tramadol
	name = "syrette (painkiller)"
	icon_state = "syrette"
	item_state = "syrette"
	preloaded_reagents = list("tramadol" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/tricordrazine
	name = "syrette (tricordrazine)"
	desc = "A single-use pre-packed dose of regenerative stimulants."
	icon_state = "syrette_violet"
	item_state = "syrette_violet"
	preloaded_reagents = list("tricordrazine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/tricord_plus
	name = "syrette (tricord plus)"
	desc = "A single-use pre-packed dose of advanced regenerative stimulants."
	icon_state = "syrette_violet"
	item_state = "syrette_violet"
	volume = 6
	amount_per_transfer_from_this = 6
	preloaded_reagents = list("tricordrazine" = 4, "polystem" = 2)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/spaceacillin
	name = "syrette (spaceacillin)"
	desc = "A single-use pre-packed dose of antibiotics."
	icon_state = "syrette"
	item_state = "syrette"
	preloaded_reagents = list("spaceacillin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/inaprovaline2
	name = "autoinjector (synth-inaprovaline)"
	icon_state = "syrette_aqua"
	item_state = "syrette_aqua"
	preloaded_reagents = list("inaprovaline2" = 5)

//Drugs

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs
	name = "syrette (drugs)"
	desc = "A single-use pre-packed dose unknown drugs."
	icon_state = "syrette_fun"
	item_state = "syrette_fun"
	spawn_blacklisted = FALSE
	preloaded_reagents = list("space_drugs" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/mindbreaker
	preloaded_reagents = list("mindbreaker" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/speed
	volume = 10
	amount_per_transfer_from_this = 10
	preloaded_reagents = list("mindbreaker" = 5, "hyperzine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/sanguinum
	preloaded_reagents = list("sanguinum" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/lethal
	icon_state = "syrette_fun_yellow"
	item_state = "syrette_fun_yellow"
	rarity_value = 50
	volume = 10
	amount_per_transfer_from_this = 10
	preloaded_reagents = list("mindwipe" = 5, "zombiepowder" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/lethal2
	icon_state = "syrette_fun_yellow"
	item_state = "syrette_fun_yellow"
	rarity_value = 100
	volume = 15
	amount_per_transfer_from_this = 15
	preloaded_reagents = list("mindwipe" = 5, "zombiepowder" = 5, "cyanide" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/lethal3
	icon_state = "syrette_fun_orange"
	item_state = "syrette_fun_orange"
	rarity_value = 50
	volume = 10
	amount_per_transfer_from_this = 10
	preloaded_reagents = list("hyperzine" = 5, "lexorin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/mindwipe
	icon_state = "syrette_fun_yellow"
	item_state = "syrette_fun_yellow"
	rarity_value = 20
	preloaded_reagents = list("mindwipe" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/serotrotium
	icon_state = "syrette_fun_blue"
	item_state = "syrette_fun_blue"
	rarity_value = 100
	preloaded_reagents = list("serotrotium" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/cryptobiolin
	icon_state = "syrette_fun_blue"
	item_state = "syrette_fun_blue"
	rarity_value = 10
	preloaded_reagents = list("cryptobiolin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/impedrezene
	icon_state = "syrette_fun_violet"
	item_state = "syrette_fun_violet"
	rarity_value = 20
	preloaded_reagents = list("impedrezene" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/impedrezene_plus
	icon_state = "syrette_fun_violet"
	item_state = "syrette_fun_violet"
	rarity_value = 20
	volume = 10
	amount_per_transfer_from_this = 10
	preloaded_reagents = list("impedrezene" = 5, "alkysine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/syrette/drugs/hyperzine
	icon_state = "syrette_fun_orange"
	item_state = "syrette_fun_orange"
	rarity_value = 50
	preloaded_reagents = list("hyperzine" = 5)