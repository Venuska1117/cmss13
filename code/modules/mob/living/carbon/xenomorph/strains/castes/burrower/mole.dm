/datum/xeno_strain/mole
	name = BURROWER_MOLE
	description = "Test"
	flavor_description = "Sharp claws melt trough rocks soil like claws trough soft flesh, This ground obay your rules."
	icon_state_prefix = "Mole"

	actions_to_remove = list(
		/datum/action/xeno_action/onclick/place_trap,
		/datum/action/xeno_action/activable/burrow,
		/datum/action/xeno_action/onclick/tremor,
		/datum/action/xeno_action/active_toggle/toggle_meson_vision,
		/datum/action/xeno_action/onclick/tacmap,
	)
	actions_to_add = list(
//		/datum/action/xeno_action/onclick/place_acid_pool,
		/datum/action/xeno_action/activable/burrow/submerge,
		/datum/action/xeno_action/active_toggle/toggle_meson_vision,
		/datum/action/xeno_action/onclick/tacmap,
	)

	behavior_delegate_type = /datum/behavior_delegate/burrower_mole

/datum/xeno_strain/mole/apply_strain(mob/living/carbon/xenomorph/burrower/mole)
	mole.small_explosives_stun = FALSE
	mole.claw_type = CLAW_TYPE_SHARP

	mole.recalculate_everything()

/mob/living/carbon/xenomorph/burrower/ex_act(severity)
	if(HAS_TRAIT(src, TRAIT_ABILITY_SUBMERGED))
		return
	..()

/mob/living/carbon/xenomorph/burrower/attack_hand()
	if(HAS_TRAIT(src, TRAIT_ABILITY_SUBMERGED))
		return
	..()

/mob/living/carbon/xenomorph/burrower/attackby()
	if(HAS_TRAIT(src, TRAIT_ABILITY_SUBMERGED))
		return
	..()

/mob/living/carbon/xenomorph/burrower/get_projectile_hit_chance()
	. = ..()
	if(HAS_TRAIT(src, TRAIT_ABILITY_BURROWED))
		return 0

/datum/behavior_delegate/burrower_mole
	name = "Mole Burrower Behavior Delegate"
