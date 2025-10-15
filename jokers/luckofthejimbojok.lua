SMODS.Joker{ --Luck of the Jimbo
    key = "luckofthejimbojok",
    config = {
        extra = {
            repetitions = 1,
            emult = 1.07
        }
    },
    loc_txt = {
        ['name'] = 'Luck of the Jimbo',
        ['text'] = {
            [1] = '{X:legendary,C:white}^1.7{} Mult and Retrigger when {C:attention}Lucky{} Card is triggered.',
            [2] = 'Turns all non-{C:attention}Lucky{} Cards into {C:attention}Lucky{} Cards.{C:dark_edition}{}',
            [3] = '{s:0.85,C:inactive}Art by SageSeraph{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 77,
    rarity = "angelica_angelic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
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

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    e_mult = card.ability.extra.emult
                }
            else
                context.other_card:set_ability(G.P_CENTERS.m_lucky)
                return {
                    message = "Lucked!"
                }
            end
        end
    end
}