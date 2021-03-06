INSERT INTO `jaktsite`.`animals`(
    `id`,
    `user_id`,
    `species`,
    `speciestype`,
    `engspecies`,
    `sex`,
    `age`,
    `live_weight`,
    `aprox_live_weight`,
    `passad_weight`,
    `aprox_passad_weight`,
    `carcass_weight`,
    `aprox_carcass_weight`,
    `cut_weight`,
    `heart_weight`,
    `waste`,
    `wastenotes`,
    `antlers`,
    `points`,
    `created_at`,
    `updated_at`,
    `deleted_at`
)
SELECT
    `id`,
    `actor`,
    `species`,
    `speciestype`,
    `engspecies`,
    `sex`,
    `age`,
    `live_weight`,
    `aprox_live_weight`,
    `passad_weight`,
    `aprox_passad_weight`,
    `carcass_weight`,
    `aprox_carcass_weight`,
    `cut_weight`,
    `heart_weight`,
    `waste`,
    `wastenotes`,
    `antlers`,
    `points`,
    `created`,
    `updated`,
    `deleted`
FROM
    `smaris`.`sranimal`