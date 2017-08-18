//
//  GameMasterExamples.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 8/11/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

struct GameMasterExamples {
    
    static let example1 = """
item_templates {
  template_id: "V0001_POKEMON_BULBASAUR"
  pokemon_settings {
    pokemon_id: BULBASAUR
    model_scale: 1.09
    type: POKEMON_TYPE_GRASS
    type_2: POKEMON_TYPE_POISON
    camera {
      disk_radius_m: 0.5723
      cylinder_radius_m: 0.5
      cylinder_height_m: 0.763
      shoulder_mode_scale: 0.5
    }
    encounter {
      base_capture_rate: 0.2
      base_flee_rate: 0.1
      collision_radius_m: 0.3815
      collision_height_m: 0.654
      collision_head_radius_m: 0.2725
      movement_type: MOVEMENT_JUMP
      movement_timer_s: 10
      jump_time_s: 1.15
      attack_timer_s: 29
    }
    stats {
      base_stamina: 90
      base_attack: 118
      base_defense: 118
    }
    quick_moves: VINE_WHIP_FAST
    quick_moves: TACKLE_FAST
    cinematic_moves: SLUDGE_BOMB
    cinematic_moves: SEED_BOMB
    cinematic_moves: POWER_WHIP
    animation_time: 1.6667
    animation_time: 0.6667
    animation_time: 1.6667
    animation_time: 1.8333
    animation_time: 0
    animation_time: 2.1667
    animation_time: 1.4
    animation_time: 1.4666671
    evolution_ids: IVYSAUR
    evolution_pips: 1
    pokedex_height_m: 0.7
    pokedex_weight_kg: 6.9
    height_std_dev: 0.0875
    weight_std_dev: 0.8625
    family_id: FAMILY_BULBASAUR
    candy_to_evolve: 25
    km_buddy_distance: 3
    model_height: 0.7
    evolution_branch {
      evolution: IVYSAUR
    }
  }
}
item_templates {
  template_id: "V0013_MOVE_WRAP"
  move_settings {
    movement_id: WRAP
    animation_id: 5
    pokemon_type: POKEMON_TYPE_NORMAL
    power: 60
    accuracy_chance: 1
    critical_chance: 0.05
    stamina_loss_scalar: 0.06
    trainer_level_min: 1
    trainer_level_max: 100
    vfx_name: "wrap"
    duration_ms: 2900
    damage_window_start_ms: 2050
    damage_window_end_ms: 2700
    energy_delta: -33
  }
}
"""
    
}
