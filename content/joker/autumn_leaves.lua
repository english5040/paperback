SMODS.Joker {
  key = "autumn_leaves",
  config = {
    extra = {
      xMult = 1.05,
      xMult_gain = 0.05,
      xMult_base = 1.05,
      suit = "Diamonds",
    }
  },
  rarity = 2,
  pos = { x = 0, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = PB_UTIL.panorama_loc_vars,
  calculate = PB_UTIL.panorama_logic,
  joker_display_def = PB_UTIL.panorama_joker_display_def
}
