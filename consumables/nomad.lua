SMODS.Consumable {
    key = 'nomad',
    set = 'heavenly',
    pos = { x = 1, y = 0 },
    config = { extra = {
        double_limit = 1234567890
    } },
    loc_txt = {
        name = 'Nomad',
        text = {
        [1] = 'Quadruples {C:money}money{}.',
        [2] = '{s:0.85,C:inactive}Currently uses placeholder art by cebeedrawz{}'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    local double_amount = math.min(G.GAME.dollars, 1234567890)
                    ease_dollars(double_amount, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    local double_amount = math.min(G.GAME.dollars, 1234567890)
                    ease_dollars(double_amount, true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}