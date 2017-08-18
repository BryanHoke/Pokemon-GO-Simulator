//
//  ItemTemplateExamples.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 8/11/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

struct ItemTemplateExamples {
    
    static let pokemon: ItemTemplate = [
        "template_id": "",
        "pokemon_settings": [
            "pokemon_id": "",
            "model_scale": "",
            "type": "POKEMON_TYPE_",
            "type_2": "POKEMON_TYPE_",
            "camera": [
                "disk_radius_m": "",
                "cylinder_radius_m": "",
                "cylinder_height_m": "",
                "shoulder_mode_scale": ""
            ],
            "encounter": [
                "base_capture_rate": "",
                "base_flee_rate": "",
                "collision_radius_m": "",
                "collision_height_m": "",
                "collision_head_radius_m": "",
                "movement_type": "MOVEMENT_",
                "movement_timer_s": "",
                "jump_time_s": "",
                "attack_timer_s": ""
            ],
            "stats": [
                "base_stamina": "",
                "base_attack": "",
                "base_defense": ""
            ],
            "quick_moves": "_FAST",
            "quick_moves": "_FAST",
            "cinematic_moves": "",
            "cinematic_moves": "",
            "cinematic_moves": "",
            "animation_time": "",
            "animation_time": "",
            "animation_time": "",
            "animation_time": "",
            "animation_time": "",
            "animation_time": "",
            "animation_time": "",
            "animation_time": "",
            "evolution_ids": "",
            "evolution_pips": "",
            "pokedex_height_m": "",
            "pokedex_weight_kg": "",
            "height_std_dev": "",
            "weight_std_dev": "",
            "family_id": "FAMILY_",
            "candy_to_evolve": "",
            "km_buddy_distance": "",
            "model_height": "",
            "evolution_branch": [
                "evolution": ""
            ]
        ]
    ]
    
    static let move: ItemTemplate = [
        "template_id": "",
        "move_settings": [
            "movement_id": "",
            "animation_id": "",
            "pokemon_type": "POKEMON_TYPE_",
            "power": "",
            "accuracy_chance": "",
            "critical_chance": "",
            "stamina_loss_scalar": "",
            "trainer_level_min": "",
            "trainer_level_max": "",
            "vfx_name": "",
            "duration_ms": "",
            "damage_window_start_ms": "",
            "damage_window_end_ms": "",
            "energy_delta": ""
        ]
    ]
    
    static let bulbasaur: ItemTemplate = [
        "template_id": "\"V0001_POKEMON_BULBASAUR\"",
        "pokemon_settings": [
            "pokemon_id": "BULBASAUR",
            "model_scale": "1.09",
            "type": "POKEMON_TYPE_GRASS",
            "type_2": "POKEMON_TYPE_POISON",
            "camera": [
                "disk_radius_m": "0.5723",
                "cylinder_radius_m": "0.5",
                "cylinder_height_m": "0.763",
                "shoulder_mode_scale": "0.5"
            ],
            "encounter": [
                "base_capture_rate": "0.2",
                "base_flee_rate": "0.1",
                "collision_radius_m": "0.3815",
                "collision_height_m": "0.654",
                "collision_head_radius_m": "0.2725",
                "movement_type": "MOVEMENT_JUMP",
                "movement_timer_s": "10",
                "jump_time_s": "1.15",
                "attack_timer_s": "29"
            ],
            "stats": [
                "base_stamina": "90",
                "base_attack": "118",
                "base_defense": "118"
            ],
            "quick_moves": "VINE_WHIP_FAST",
            "quick_moves": "TACKLE_FAST",
            "cinematic_moves": "SLUDGE_BOMB",
            "cinematic_moves": "SEED_BOMB",
            "cinematic_moves": "POWER_WHIP",
            "animation_time": "1.6667",
            "animation_time": "0.6667",
            "animation_time": "1.6667",
            "animation_time": "1.8333",
            "animation_time": "0",
            "animation_time": "2.1667",
            "animation_time": "1.4",
            "animation_time": "1.4666671",
            "evolution_ids": "IVYSAUR",
            "evolution_pips": "1",
            "pokedex_height_m": "0.7",
            "pokedex_weight_kg": "6.9",
            "height_std_dev": "0.0875",
            "weight_std_dev": "0.8625",
            "family_id": "FAMILY_BULBASAUR",
            "candy_to_evolve": "25",
            "km_buddy_distance": "3",
            "model_height": "0.7",
            "evolution_branch": [
                "evolution": "IVYSAUR"
            ]
        ]
    ]
    
    static let wrap: ItemTemplate = [
        "template_id": "\"V0013_MOVE_WRAP\"",
        "move_settings": [
            "movement_id": "WRAP",
            "animation_id": "5",
            "pokemon_type": "POKEMON_TYPE_NORMAL",
            "power": "60",
            "accuracy_chance": "1",
            "critical_chance": "0.05",
            "stamina_loss_scalar": "0.06",
            "trainer_level_min": "1",
            "trainer_level_max": "100",
            "vfx_name": "\"wrap\"",
            "duration_ms": "2900",
            "damage_window_start_ms": "2050",
            "damage_window_end_ms": "2700",
            "energy_delta": "-33"
        ]
    ]
}
