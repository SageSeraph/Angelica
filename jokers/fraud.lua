SMODS.Joker{ --Fraud
    key = "fraud",
    config = {
        extra = {
            hand_change = 2,
            discard_change = 6
        }
    },
    loc_txt = {
        ['name'] = 'Fraud',
        ['text'] = {
            [1] = '{C:blue}-2 Hands{}, {C:red}+6 Discards{}.',
            [2] = '{C:inactive,s:0.85}Currently uses placeholder art by doggfly{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - card.ability.extra.hand_change)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_change
    end
}