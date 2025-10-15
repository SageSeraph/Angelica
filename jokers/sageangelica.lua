SMODS.Joker{ --Sage (Angelica)
    key = "sageangelica",
    config = {
        extra = {
            echips = 1.27,
            emult = 1.27
        }
    },
    loc_txt = {
        ['name'] = 'Sage (Angelica)',
        ['text'] = {
            [1] = '{C:gold}The Seraph.{}',
            [2] = 'Scored {C:dark_edition}Polychrome{} {C:attention}Lucky{} Aces give {C:dark_edition}^1.27 Chips and Mult{}.',
            [3] = 'Always spawns as {C:dark_edition}Polychrome{}.',
            [4] = '{s:0.85,C:inactive}Art by Astro{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 666,
    rarity = "angelica_angelic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and context.other_card.edition and context.other_card.edition.key == "e_polychrome" and SMODS.get_enhancements(context.other_card)["m_lucky"] == true) then
                return {
                    e_chips = card.ability.extra.echips,
                    extra = {
                        e_mult = card.ability.extra.emult,
                        colour = G.C.DARK_EDITION
                        }
                }
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_angelica_sageangelica" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_angelica_sageangelica" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end