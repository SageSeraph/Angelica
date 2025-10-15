SMODS.Voucher {
    key = 'anything',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_size_value = 1,
        hands_value = 1,
        discards_value = 1,
        voucher_slots_value = 1,
        joker_slots_value = 1,
        booster_slots_value = 1,
        Edited_booster = 1,
        rellors_value = 1
    } },
    loc_txt = {
        name = 'Anything',
        text = {
        [1] = '+1.'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
        ease_hands_played(1)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_discard(1)
            G.hand:change_size(1)
        
            
        SMODS.change_play_limit(1)
        
            
        SMODS.change_discard_limit(1)
        
            
         G.E_MANAGER:add_event(Event({
            func = function()
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        SMODS.change_voucher_limit(1)
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        SMODS.change_booster_limit(1)
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) +1
                return true
            end
        }))
        
            SMODS.change_free_rerolls(1)
    end
}