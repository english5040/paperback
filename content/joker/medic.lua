SMODS.Joker {
  key = "medic",
  config = {
    extra = {
      enhancement = 'm_paperback_bandaged',
    }
  },
  rarity = 2,
  pos = { x = 8, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_enhancements = true,
  },
  enhancement_gate = 'm_paperback_bandaged',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_bandaged

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        }
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.GAME.paperback.bandaged_inc = G.GAME.paperback.bandaged_inc + 1
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.GAME.paperback.bandaged_inc = G.GAME.paperback.bandaged_inc - 1
  end
}
