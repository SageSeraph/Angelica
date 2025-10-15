SMODS.Voucher {
    key = 'everything',
    pos = { x = 1, y = 0 },
    config = { extra = {
        hand_size_value = 2,
        hands_value = 2,
        discards_value = 2,
        voucher_slots_value = 2,
        joker_slots_value = 2,
        booster_slots_value = 2,
        Edited_booster = 2,
        rellors_value = 2
    } },
    loc_txt = {
        name = 'Everything',
        text = {
        [1] = '+2.'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_anything'},
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
        ease_hands_played(2)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
        ease_discard(2)
            G.hand:change_size(2)
        
            
        SMODS.change_play_limit(2)
        
            
        SMODS.change_discard_limit(2)
        
            
         G.E_MANAGER:add_event(Event({
            func = function()
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 2
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        SMODS.change_voucher_limit(2)
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        SMODS.change_booster_limit(2)
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) +2
                return true
            end
        }))
        
            SMODS.change_free_rerolls(2)
    end
}