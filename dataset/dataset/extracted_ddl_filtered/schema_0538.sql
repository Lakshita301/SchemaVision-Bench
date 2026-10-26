-- Source: https://github.com/tf2td/towerdefense/blob/b0b05666342def62b4ab7a87d04fb1a9e26ed177/addons/sourcemod/schema/tf2td.sql?raw=true
-- Tables detected: 21 | FK/REFERENCES mentions: 23

CREATE TABLE `achievement` (
  `achievement_id` int(11) NOT NULL,
  `name` int(11) NOT NULL COMMENT 'The achievements name.',
  `description` int(11) NOT NULL COMMENT 'The achievements description.',
  `experience` int(11) NOT NULL COMMENT 'Amount of experience gained when achieving this.',
  `image` int(11) NOT NULL COMMENT 'The link to the achievements image.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `config` (
  `config_id` int(11) NOT NULL,
  `variable` varchar(128) NOT NULL COMMENT 'The console variable.',
  `value` varchar(128) NOT NULL COMMENT 'The value to set the variable to.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `map` (
  `map_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'The maps name.',
  `teleport_ground` varchar(128) NOT NULL COMMENT 'Location of ground waves.',
  `teleport_air` varchar(128) NOT NULL COMMENT 'Location of air waves.',
  `teleport_tower` varchar(128) NOT NULL COMMENT 'Location of the tower after bought.',
  `respawn_wave_time` int(11) NOT NULL COMMENT 'Time between waves (in seconds).',
  `player_limit` int(11) NOT NULL DEFAULT '4',
  `wave_start` int(11) NOT NULL COMMENT 'The wave index to start with.',
  `wave_end` int(11) NOT NULL COMMENT 'The wave index to end with.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metalpack` (
  `metalpack_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL COMMENT 'The map.',
  `metalpacktype_id` int(11) NOT NULL COMMENT 'The metalpacks type.',
  `metal` smallint(6) NOT NULL COMMENT 'The amount of metal of the pack.',
  `location` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metalpacktype` (
  `metalpacktype_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL COMMENT 'The metalpack type.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multiplier` (
  `map_id` int(11) NOT NULL COMMENT 'The map.',
  `multipliertype_id` int(11) NOT NULL COMMENT 'The multiplier type.',
  `price` int(11) NOT NULL COMMENT 'The initial price.',
  `increase` int(11) NOT NULL COMMENT 'The amount the price increases each time upgraded.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multipliertype` (
  `multipliertype_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL COMMENT 'The multiplier type.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'The players name.',
  `steamid64` varchar(32) NOT NULL COMMENT 'The players 64-bit SteamID.',
  `ip` varchar(32) NOT NULL COMMENT 'The players IPv4 address.',
  `first_server` int(11) NOT NULL COMMENT 'The first server the player connected to.',
  `last_server` int(11) DEFAULT NULL COMMENT 'The last server the player connected to.',
  `current_server` int(11) DEFAULT NULL COMMENT 'The current server the player is connected to.',
  `experience` int(11) NOT NULL DEFAULT '0' COMMENT 'The players current experience.',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'The players current level.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_achievement` (
  `player_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_ban` (
  `player_ban_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL COMMENT 'The banned player.',
  `banner` varchar(32) NOT NULL COMMENT 'The banners 64-bit SteamID.',
  `reason` varchar(160) NOT NULL COMMENT 'The ban reason.',
  `time` datetime NOT NULL COMMENT 'The time of the ban happened.',
  `expire` datetime NOT NULL COMMENT 'When the ban expires.',
  `active` enum('not active','active') NOT NULL DEFAULT 'active' COMMENT 'If the ban is still actiive.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_config` (
  `player_id` int(11) NOT NULL COMMENT 'The player.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_immunity` (
  `player_id` int(11) NOT NULL,
  `immunity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_stats` (
  `player_id` int(11) NOT NULL COMMENT 'The player.',
  `map_id` int(11) NOT NULL COMMENT 'The map.',
  `kills` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of kills.',
  `assists` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of kill assists.',
  `deaths` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of deaths.',
  `damage` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Amount of damage dealt.',
  `objects_built` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of objects (sentries, etc.) built.',
  `towers_bought` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of bought towers.',
  `metal_pick` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of picked up metal.',
  `metal_drop` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of dropped metal.',
  `waves_played` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of waves played.',
  `wave_reached` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of wave reached.',
  `rounds_played` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of played rounds.',
  `rounds_won` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of rounds won.',
  `playtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Played time (in seconds).',
  `first_connect` datetime NOT NULL COMMENT 'Time of first connection.',
  `last_connect` datetime NOT NULL COMMENT 'Time of last connection.',
  `last_disconnect` datetime NOT NULL COMMENT 'Time of last disconnect.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `server` (
  `server_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL COMMENT 'The servers name.',
  `ip` varchar(32) NOT NULL COMMENT 'The servers IPv4 address.',
  `port` smallint(5) UNSIGNED NOT NULL COMMENT 'The servers port.',
  `version` varchar(32) DEFAULT NULL COMMENT 'The plugin version on this server.',
  `password` varchar(32) DEFAULT NULL COMMENT 'The servers current password.',
  `players` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The current amount of players on the server.',
  `map_id` int(11) DEFAULT NULL COMMENT 'The servers current map.',
  `server_settings_id` int(11) DEFAULT NULL COMMENT 'The servers settings.',
  `reload_map` enum('no reload','reload') NOT NULL DEFAULT 'no reload' COMMENT 'If the map should be reloaded.',
  `created` datetime NOT NULL COMMENT 'The time this entry was created.',
  `updated` datetime NOT NULL COMMENT 'The last time this entry was updated.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `server_settings` (
  `server_settings_id` int(11) NOT NULL,
  `config_start` int(11) DEFAULT NULL COMMENT 'The config index to start with.',
  `config_end` int(11) DEFAULT NULL COMMENT 'The config index to end with.',
  `lockable` enum('not lockable','lockable') NOT NULL DEFAULT 'lockable' COMMENT 'If the server is lockable.',
  `loglevel` enum('None','Error','Warning','Info','Debug','Trace') NOT NULL DEFAULT 'Info' COMMENT 'The servers log level.',
  `logtype` enum('File','Console','File and console') NOT NULL DEFAULT 'File and console' COMMENT 'The servers log type.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `server_stats` (
  `server_id` int(11) NOT NULL,
  `connections` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of connections.',
  `rounds_played` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of played rounds.',
  `rounds_won` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of rounds won.',
  `playtime` int(11) NOT NULL DEFAULT '0' COMMENT 'Total played time (in seconds) on this server.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tower` (
  `tower_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'The towers name.',
  `class` enum('Unknown','Scout','Sniper','Soldier','Demoman','Medic','Heavy','Pyro','Spy','Engineer') NOT NULL COMMENT 'The towers class.',
  `price` int(10) UNSIGNED NOT NULL COMMENT 'The towers price to buy.',
  `damagetype` enum('None','Bullet','Fire','Explosion','Melee','AoE') NOT NULL COMMENT 'The towers damagetype.',
  `description` varchar(1024) DEFAULT NULL COMMENT 'The towers description (use \\n for line breaks).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `towerlevel` (
  `tower_id` int(11) NOT NULL COMMENT 'The tower.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The actual level.',
  `metal` int(10) UNSIGNED NOT NULL DEFAULT '1000' COMMENT 'The metal needed to upgrade to next level.',
  `weapon_id` int(11) NOT NULL COMMENT 'The weapon the tower gets at this level.',
  `attack` enum('None','Primary','Secondary') NOT NULL COMMENT 'The towers attack type.',
  `rotate` enum('no rotate','rotate') NOT NULL DEFAULT 'no rotate' COMMENT 'If the tower should target enemies and rotate to keep them in sight.',
  `pitch` float NOT NULL DEFAULT '0' COMMENT 'The pitch of the tower at this level.',
  `damage` float NOT NULL DEFAULT '1' COMMENT 'The scaling of damage done by the tower at this level.',
  `attackspeed` float NOT NULL DEFAULT '1' COMMENT 'The scaling of the towers attackspeed at this level.',
  `area` float NOT NULL DEFAULT '1' COMMENT 'The scaling of the towers area of effect at this level.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wave` (
  `wave_id` int(11) NOT NULL,
  `wavetype` int(11) NOT NULL COMMENT 'The waves type bit field.',
  `name` varchar(64) NOT NULL COMMENT 'The waves bot names.',
  `class` enum('Unknown','Scout','Sniper','Soldier','Demoman','Medic','Heavy','Pyro','Spy','Engineer') NOT NULL COMMENT 'The waves class.',
  `quantity` tinyint(3) UNSIGNED NOT NULL COMMENT 'Number of bots in this wave.',
  `health` int(11) NOT NULL COMMENT 'The waves bot health.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wavetype` (
  `wavetype_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL COMMENT 'The wave type.',
  `bit_value` int(11) NOT NULL COMMENT 'The wave types binary value.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `weapon` (
  `weapon_id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL COMMENT 'The weapons name.',
  `index` int(10) UNSIGNED NOT NULL COMMENT 'The weapons item index.',
  `slot` enum('Primary','Secondary','Melee','Grenade','Building','PDA','Item1','Item2') NOT NULL COMMENT 'The weapons slot.',
  `level` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The weapons level.',
  `quality` enum('Normal','Genuine','Rarity2','Vintage','Strange','Unusual','Unique','Community','Valve','Self-Made','Costumized') NOT NULL DEFAULT 'Normal' COMMENT 'The weapons quality.',
  `classname` varchar(64) NOT NULL COMMENT 'The weapons classname.',
  `attributes` varchar(512) NOT NULL COMMENT 'The weapons attribute string. (Format: "id1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `map`
  ADD CONSTRAINT `fk_map_wave_end` FOREIGN KEY (`wave_end`) REFERENCES `wave` (`wave_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_map_wave_start` FOREIGN KEY (`wave_start`) REFERENCES `wave` (`wave_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `metalpack`
  ADD CONSTRAINT `fk_metalpack_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_metalpack_metalpacktype` FOREIGN KEY (`metalpacktype_id`) REFERENCES `metalpacktype` (`metalpacktype_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `multiplier`
  ADD CONSTRAINT `fk_multiplier_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_multiplier_multipliertype` FOREIGN KEY (`multipliertype_id`) REFERENCES `multipliertype` (`multipliertype_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player`
  ADD CONSTRAINT `fk_player_server_current` FOREIGN KEY (`current_server`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_player_server_first` FOREIGN KEY (`first_server`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_player_server_last` FOREIGN KEY (`last_server`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player_achievement`
  ADD CONSTRAINT `fk_player_achievement_achievement` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`achievement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_player_achievement_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player_ban`
  ADD CONSTRAINT `fk_player_ban_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player_config`
  ADD CONSTRAINT `fk_player_config_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player_immunity`
  ADD CONSTRAINT `fk_player_immunity_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player_stats`
  ADD CONSTRAINT `fk_player_stats_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_player_stats_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `server`
  ADD CONSTRAINT `fk_server_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_server_server_settings` FOREIGN KEY (`server_settings_id`) REFERENCES `server_settings` (`server_settings_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `server_settings`
  ADD CONSTRAINT `fk_server_config_config_end` FOREIGN KEY (`config_end`) REFERENCES `config` (`config_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_server_config_config_start` FOREIGN KEY (`config_start`) REFERENCES `config` (`config_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `server_stats`
  ADD CONSTRAINT `fk_server_stats_server` FOREIGN KEY (`server_id`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `towerlevel`
  ADD CONSTRAINT `fk_towerlevel_tower` FOREIGN KEY (`tower_id`) REFERENCES `tower` (`tower_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_towerlevel_weapon` FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`weapon_id`) ON DELETE CASCADE ON UPDATE CASCADE;

