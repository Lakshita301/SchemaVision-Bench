-- Recovery evidence only; MySQL source fragments, not PostgreSQL conversion.
-- These declarations are absent from the extracted SQL and Tier 1 diagram.
-- Do not promote into ground truth without rebuilding/reviewing paired diagrams.
-- Pinned source inspected 1 October 2026:
-- https://raw.githubusercontent.com/Brampaap/polytech_BD_project/c008783dabf8546398edafbff45371f5406834dd/backup/std_1257_18.05.20.sql
-- Only the omitted PK clauses are reproduced here; other upstream changes
-- include ordinary indexes and AUTO_INCREMENT alterations not included here.
ALTER TABLE `access_levels` ADD PRIMARY KEY (`id`);
ALTER TABLE `bonus` ADD PRIMARY KEY (`id_pr`);
ALTER TABLE `contacts` ADD PRIMARY KEY (`id`);
ALTER TABLE `courier_in_order` ADD PRIMARY KEY (`id`);
ALTER TABLE `delivery` ADD PRIMARY KEY (`id`);
ALTER TABLE `details` ADD PRIMARY KEY (`id`);
ALTER TABLE `orders` ADD PRIMARY KEY (`id`);
ALTER TABLE `product` ADD PRIMARY KEY (`id`);
ALTER TABLE `product_in_restaurants` ADD PRIMARY KEY (`id`);
ALTER TABLE `prod_and_deliv_in_order` ADD PRIMARY KEY (`id`);
ALTER TABLE `Restaurants` ADD PRIMARY KEY (`id`);
ALTER TABLE `social_networks` ADD PRIMARY KEY (`id_pr`);
ALTER TABLE `userdata` ADD PRIMARY KEY (`id`);
ALTER TABLE `users` ADD PRIMARY KEY (`id_user`);
ALTER TABLE `users_order` ADD PRIMARY KEY (`id`);
ALTER TABLE `user_in_data` ADD PRIMARY KEY (`id`);
ALTER TABLE `user_in_level` ADD PRIMARY KEY (`id`);
