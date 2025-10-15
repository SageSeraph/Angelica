SMODS.Joker{ --SERAPH (Angelica)
    key = "seraphangelica",
    config = {
        extra = {
            blind_size = 1,
            dollars = 666666,
            joker_slots = 666,
            consumable_slots = 666,
            hyperchips_n = 666,
            hyperchips_arrows = 6,
            hypermult_n = 666,
            hypermult_arrows = 6
        }
    },
    loc_txt = {
        ['name'] = 'SERAPH (Angelica)',
        ['text'] = {
            [1] = '{C:gold}THE SERAPH{}',
            [2] = '{s:0.85,C:inactive}Art by Astro{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6666,
    rarity = "angelica_seraphic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["angelica_angelica_jokers"] = true },
    soul_pos = {
        x = 8,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
            end
                    return true
                end,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    local target_amount = card.ability.extra.dollars
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars), colour = G.C.MONEY})
                    return true
                end,
                            colour = G.C.MONEY
                        }
                        }
                }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Joker Slots set to "..tostring(card.ability.extra.joker_slots), colour = G.C.BLUE})
                G.jokers.config.card_limit = card.ability.extra.joker_slots
                return true
            end,
                    extra = {
                        func = function()
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = card.ability.extra.consumable_slots
                    return true
                end }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.consumable_slots).." Consumable Slots", colour = G.C.BLUE})
                return true
            end,
                        colour = G.C.GREEN
                        }
                }
        end
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_edition("e_angelica_angelic", true)
                return {
                    hyperchips = {
    card.ability.extra.hyperchips_arrows,
    card.ability.extra.hyperchips_n
},
                    extra = {
                        hypermult = {
    card.ability.extra.hypermult_arrows,
    card.ability.extra.hypermult_n
},
                        colour = G.C.DARK_EDITION,
                        extra = {
                            message = "Card Modified!",
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_angelica_seraphangelica" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_angelica_seraphangelica" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end