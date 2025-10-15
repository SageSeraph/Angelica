SMODS.Joker{ --Astro (Angelica)
    key = "astroangelica",
    config = {
        extra = {
            echips = 1.33
        }
    },
    loc_txt = {
        ['name'] = 'Astro (Angelica)',
        ['text'] = {
            [1] = '{X:blue,C:white}^1.33{} Chips when a {C:spades}Spade{} is scored.',
            [2] = '{s:0.85,C:inactive}Art by Astro{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 69,
    rarity = "angelica_angelic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["angelica_angelica_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 0
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                return {
                    e_chips = card.ability.extra.echips
                }
            end
        end
    end
}