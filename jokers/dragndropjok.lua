SMODS.Joker{ --Drag n Drop
    key = "dragndropjok",
    config = {
        extra = {
            Xmult = 0.13,
            odds = 128,
            odds2 = 16,
            angelic = 0
        }
    },
    loc_txt = {
        ['name'] = 'Drag n Drop',
        ['text'] = {
            [1] = '{X:red,C:white}x0.13{} Mult.',
            [2] = '{C:green}#4# in #5# {}chance of creating a',
            [3] = 'random Negative {C:legendary}Legendary{} Joker and destroying self.',
            [4] = '{C:green}#2# in #3# {}chance of creating a',
            [5] = 'random Negative {C:gold}Angelic{} Joker and destroying self.',
            [6] = '{s:0.85,C:inactive}Art by gfsgfsgfs{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_angelica_dragndropjok')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_angelica_dragndropjok')
        return {vars = {card.ability.extra.angelic, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Dragged!"
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_95571883', 1, card.ability.extra.odds, 'j_angelica_dragndropjok', false) then
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'angelica_angelic' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                        SMODS.calculate_effect({func = function()
                card:undefined()
                return true
            end}, card)
          end
                    if SMODS.pseudorandom_probability(card, 'group_1_43edd851', 1, card.ability.extra.odds2, 'j_angelica_dragndropjok', false) then
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                        SMODS.calculate_effect({func = function()
                card:undefined()
                return true
            end}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}