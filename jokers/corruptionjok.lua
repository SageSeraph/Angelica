SMODS.Joker{ --Corruption
    key = "corruptionjok",
    config = {
        extra = {
            echips = 1.25,
            emult = 1.25,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Corruption',
        ['text'] = {
            [1] = '{X:legendary,C:white}^1.25{} Chips & Mult.',
            [2] = '{C:uncommon}#1# in #2#{} chance to destroy a random Joker.',
            [3] = 'Always appears as Eternal and Rental.',
            [4] = '{C:inactive,s:0.85}\"Seriously, for the love of god, install Source.\"{}',
            [5] = '{s:0.85,C:inactive}Art by EasternFarmer{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_angelica_corruptionjok') 
        return {vars = {new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    e_chips = card.ability.extra.echips,
                    extra = {
                        e_mult = card.ability.extra.emult,
                        colour = G.C.DARK_EDITION
                        }
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_e65ed9ba', 1, card.ability.extra.odds, 'j_angelica_corruptionjok', false) then
              local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Corrupted!", colour = G.C.RED})
                end
                        
          end
                        return true
                    end
                }
            end
        end
    end
}