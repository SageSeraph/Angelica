SMODS.Edition {
    key = 'boosted',
    shader = 'booster',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        extra = {
            x_chips = 1.5
        }
    },
    in_shop = false,
    weight = 0.001,
    extra_cost = 2,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Boosted',
        label = 'Boosted',
        text = {
        [1] = '{X:blue,C:white}x1.5{} Chips when scored.'
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
            return { x_chips = card.edition.extra.x_chips }
        end
    end
}