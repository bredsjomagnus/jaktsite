INSERT INTO `jaktsite`.`areas`(
    `id`,
    `area_name`,
    `notes`,
    `created_at`,
    `updated_at`,
    `deleted_at`
)
SELECT
    `id`,
    `areaname`,
    `notes`,
    `created`,
    `updated`,
    `deleted`
FROM
    `smaris`.`srarea`;