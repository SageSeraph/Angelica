SMODS.Joker{ --Heart of the Cards
    key = "heartofthecards",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Heart of the Cards',
        ['text'] = {
            [1] = 'Create a randomized card with the {C:hearts}Hearts{} suit whenever a {C:attention}Wild{} card is scored.',
            [2] = '{s:0.85,C:inactive}Art by EverSoNitro{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                local card_front = pseudorandom_element({G.P_CARDS.H_2, G.P_CARDS.H_3, G.P_CARDS.H_4, G.P_CARDS.H_5, G.P_CARDS.H_6, G.P_CARDS.H_7, G.P_CARDS.H_8, G.P_CARDS.H_9, G.P_CARDS.H_T, G.P_CARDS.H_J, G.P_CARDS.H_Q, G.P_CARDS.H_K, G.P_CARDS.H_A}, pseudoseed('add_card_rank'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_enhancement'))
                }, G.discard, true, false, nil, true)
            base_card:set_seal(pseudorandom_element({"Gold", "Red", "Blue", "Purple"}, pseudoseed('add_card_seal')), true)
            base_card:set_edition(pseudorandom_element({"e_foil", "e_holo", "e_polychrome", "e_negative"}, pseudoseed('add_card_edition')), true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Added Card!"
                }
            end
        end
    end
}