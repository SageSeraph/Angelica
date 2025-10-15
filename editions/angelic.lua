SMODS.Shader({ key = 'gold', path = 'gold.fs' })

SMODS.Edition {
    key = 'angelic',
    shader = 'gold',
    config = {
        extra = {
            exp_mult = 1.666,
            exp_chips = 1.666,
            dollars = 6
        }
    },
    in_shop = false,
    apply_to_float = true,
    badge_colour = HEX('ffc800'),
    sound = { sound = "polychrome1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Angelic',
        label = 'Angelic',
        text = {
        [1] = '{C:gold}^1.666 Mult',
        [2] = '^1.666 Chips',
        [3] = '+$6',
        [4] = '{}{C:gold,s:0.8}(+666 Divinity){}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return { e_mult = card.edition.extra.exp_mult, e_chips = card.edition.extra.exp_chips, dollars = lenient_bignum(card.edition.extra.dollars) }
        end
    end
}