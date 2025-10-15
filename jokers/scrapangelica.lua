SMODS.Joker{ --Scrap (Angelica)
    key = "scrapangelica",
    config = {
        extra = {
            emult = 1.33
        }
    },
    loc_txt = {
        ['name'] = 'Scrap (Angelica)',
        ['text'] = {
            [1] = '{X:red,C:white}^1.33{} Mult when a {C:hearts}Heart{} is scored.',
            [2] = '{s:0.85,C:inactive}Art by Astro{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
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
        x = 6,
        y = 1
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
    end
}