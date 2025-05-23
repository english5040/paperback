SMODS.Joker {
  key = "gambit",
  config = {
    extra = {
      suit = 'paperback_Crowns',
      triggered = false
    }
  },
  rarity = 2,
  pos = { x = 14, y = 0 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_crowns = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_singular'),
        colours = {
          G.C.SUITS[card.ability.extra.suit] or G.C.PAPERBACK_CROWNS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.destroy_card and context.cardarea == G.hand and not card.ability.extra.triggered then
      if not context.destroy_card:is_suit(card.ability.extra.suit) then
        for _, v in ipairs(context.scoring_hand) do
          if v:is_suit(card.ability.extra.suit) then
            if not context.blueprint then
              card.ability.extra.triggered = true
            end

            v.ability.perma_bonus = (v.ability.perma_bonus or 0) + context.destroy_card:get_chip_bonus()

            return {
              remove = true,
              juice_card = context.blueprint_card or card,
              message_card = v,
              message = localize('k_upgrade_ex'),
              colour = G.C.CHIPS
            }
          end
        end
      end
    end

    if not context.blueprint and context.after and context.main_eval then
      card.ability.extra.triggered = false
    end
  end
}
