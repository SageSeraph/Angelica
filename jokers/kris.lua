SMODS.Joker{ --Kris
    key = "kris",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Kris',
        ['text'] = {
            [1] = 'Copy {C:red}discarded{} cards to {C:blue}hand{}.',
            [2] = 'Last {C:red}discard{} creates a {C:dark_edition}Polychrome{} {C:attention}Lucky{} Jack of {C:spades}Spades{} with a random {C:attention}Seal{}.',
            [3] = '{s:0.85,C:inactive}Art by SageSeraph{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 0
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
        if context.discard  then
                return {
                    func = function()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                        copied_card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copied_card)
                        G.hand:emplace(copied_card)
                        copied_card.states.visible = nil
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                copied_card:start_materialize()
                                return true
                            end
                        }))
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({ playing_card_added = true, cards = { copied_card } })
                                return true
                            end
                        }))
                    end,
                    message = "your choices dont matter"
                }
        end
        if context.pre_discard  then
            if G.GAME.current_round.discards_left <= 1 then
                return {
                    func = function()
                local card_front = G.P_CARDS.S_J
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_lucky
                }, G.discard, true, false, nil, true)
            new_card:set_seal(pseudorandom_element({"Gold", "Red", "Blue", "Purple"}, pseudoseed('add_card_hand_seal')), true)
            new_card:set_edition("e_polychrome", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "Lancered"
                }
            end
        end
    end
}