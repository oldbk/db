-- Дампил ТАРАНТИНО
-- Datetime: 2018-12
-- Host: oldbk-db
-- Database: oldbk

/*!40030 SET NAMES cp1251 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

DROP TABLE IF EXISTS `abil_buy_clans`;
CREATE TABLE `abil_buy_clans` (
  `klan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана',
  `magic_id` int(11) DEFAULT NULL COMMENT 'ид магии которую купили',
  `all_count` int(11) NOT NULL DEFAULT '0' COMMENT 'всего осталось , для перерасчета если надо',
  `findata` int(11) NOT NULL DEFAULT '0' COMMENT 'штамп когда куплили абилку или продилли',
  `klan_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'названия клана надо для джоина адилок',
  UNIQUE KEY `klan_id` (`klan_id`,`magic_id`),
  KEY `klan_id_2` (`klan_id`),
  KEY `findata` (`findata`),
  KEY `klan_name` (`klan_name`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='купленные абилки кланами';

DROP TABLE IF EXISTS `abil_shop`;
CREATE TABLE `abil_shop` (
  `magic` int(11) NOT NULL DEFAULT '0' COMMENT 'ид из магии',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'название',
  `img` varchar(255) NOT NULL DEFAULT '.gif' COMMENT 'картинка',
  `ecost` float(13,2) NOT NULL DEFAULT '0.00' COMMENT 'стоимость на сутки а екрах',
  `open` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0/1 - включено или выключено для покупки',
  `limit` int(11) NOT NULL DEFAULT '0' COMMENT '0- без ограничений, или ограничение в сутки - неиспользуется',
  `allbuy` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько всего купленно для админов',
  UNIQUE KEY `magic` (`magic`),
  KEY `open` (`open`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='магазин абилок';

DROP TABLE IF EXISTS `active_battle`;
CREATE TABLE `active_battle` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `bdate` date NOT NULL DEFAULT '0000-00-00',
  `val` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`bdate`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='активные бои';

DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtype` varchar(255) NOT NULL DEFAULT '' COMMENT 'операция',
  `kto` varchar(255) DEFAULT NULL,
  `komu` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `sdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'когда',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `aligns`;
CREATE TABLE `aligns` (
  `align` varchar(6) NOT NULL DEFAULT '',
  `accses` text NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `align` (`align`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ancients_templ_log`;
CREATE TABLE `ancients_templ_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(15) NOT NULL DEFAULT '0',
  `type` int(15) NOT NULL DEFAULT '0' COMMENT 'тип свечи',
  `count` int(10) NOT NULL DEFAULT '0',
  `used` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Свеча_тип` (`owner`,`type`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=471660 DEFAULT CHARSET=cp1251 COMMENT='лог поставленных свечей';

DROP TABLE IF EXISTS `api_client`;
CREATE TABLE `api_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` text NOT NULL,
  `_token` text,
  `_token_expire` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `art_bonus`;
CREATE TABLE `art_bonus` (
  `itemid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид предмета в инвентаре',
  `blevel` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'уроверь улучшения',
  `info` text NOT NULL COMMENT 'че дает',
  `art_proto` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид прототипа',
  `art_proto_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'название прототипа',
  `art_proto_img` varchar(255) NOT NULL DEFAULT '' COMMENT 'название картинки прототипа',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='бонусы артов';

DROP TABLE IF EXISTS `art_prototype`;
CREATE TABLE `art_prototype` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` int(5) NOT NULL DEFAULT '0',
  `maxdur` int(5) NOT NULL DEFAULT '0',
  `cost` float NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `nlevel` int(2) NOT NULL DEFAULT '0',
  `nsila` int(5) NOT NULL DEFAULT '0',
  `nlovk` int(5) NOT NULL DEFAULT '0',
  `ninta` int(5) NOT NULL DEFAULT '0',
  `nvinos` int(5) NOT NULL DEFAULT '0',
  `nintel` int(5) NOT NULL DEFAULT '0',
  `nmudra` int(5) NOT NULL DEFAULT '0',
  `nnoj` int(2) NOT NULL DEFAULT '0',
  `ntopor` int(2) NOT NULL DEFAULT '0',
  `ndubina` int(2) NOT NULL DEFAULT '0',
  `nmech` int(2) NOT NULL DEFAULT '0',
  `nalign` int(5) NOT NULL DEFAULT '0',
  `minu` int(5) NOT NULL DEFAULT '0',
  `maxu` int(5) NOT NULL DEFAULT '0',
  `gsila` int(5) NOT NULL DEFAULT '0',
  `glovk` int(5) NOT NULL DEFAULT '0',
  `ginta` int(5) NOT NULL DEFAULT '0',
  `gintel` int(5) NOT NULL DEFAULT '0',
  `ghp` int(5) NOT NULL DEFAULT '0',
  `mfkrit` int(5) NOT NULL DEFAULT '0',
  `mfakrit` int(5) NOT NULL DEFAULT '0',
  `mfuvorot` int(5) NOT NULL DEFAULT '0',
  `mfauvorot` int(5) NOT NULL DEFAULT '0',
  `gnoj` int(5) NOT NULL DEFAULT '0',
  `gtopor` int(5) NOT NULL DEFAULT '0',
  `gdubina` int(5) NOT NULL DEFAULT '0',
  `gmech` int(5) NOT NULL DEFAULT '0',
  `img` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(100) NOT NULL DEFAULT '',
  `dressed` tinyint(1) NOT NULL DEFAULT '0',
  `bron1` int(5) NOT NULL DEFAULT '0',
  `bron2` int(5) NOT NULL DEFAULT '0',
  `bron3` int(5) NOT NULL DEFAULT '0',
  `bron4` int(5) NOT NULL DEFAULT '0',
  `dategoden` int(15) NOT NULL DEFAULT '0',
  `magic` int(5) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `present` varchar(50) NOT NULL DEFAULT '',
  `sharped` tinyint(1) NOT NULL DEFAULT '0',
  `massa` float(4,1) NOT NULL DEFAULT '0.0' COMMENT 'масса предмета',
  `goden` int(4) NOT NULL DEFAULT '0',
  `needident` tinyint(1) NOT NULL DEFAULT '0',
  `nfire` int(3) NOT NULL DEFAULT '0',
  `nwater` int(3) NOT NULL DEFAULT '0',
  `nair` int(3) NOT NULL DEFAULT '0',
  `nearth` int(3) NOT NULL DEFAULT '0',
  `nlight` int(3) NOT NULL DEFAULT '0',
  `ngray` int(3) NOT NULL DEFAULT '0',
  `ndark` int(3) NOT NULL DEFAULT '0',
  `gfire` int(3) NOT NULL DEFAULT '0',
  `gwater` int(3) NOT NULL DEFAULT '0',
  `gair` int(3) NOT NULL DEFAULT '0',
  `gearth` int(3) NOT NULL DEFAULT '0',
  `glight` int(3) NOT NULL DEFAULT '0',
  `ggray` int(3) NOT NULL DEFAULT '0',
  `gdark` int(3) NOT NULL DEFAULT '0',
  `letter` text NOT NULL,
  `isrep` tinyint(1) NOT NULL DEFAULT '1',
  `update` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `setsale` float(10,2) NOT NULL DEFAULT '0.00',
  `prototype` int(255) NOT NULL DEFAULT '0',
  `otdel` varchar(5) NOT NULL DEFAULT '',
  `bs` tinyint(1) NOT NULL DEFAULT '0',
  `gmp` int(10) NOT NULL,
  `includemagic` int(11) NOT NULL,
  `includemagicdex` int(11) NOT NULL,
  `includemagicmax` int(11) NOT NULL,
  `includemagicname` varchar(100) NOT NULL,
  `includemagicuses` int(5) NOT NULL,
  `includemagiccost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicekrcost` float NOT NULL DEFAULT '0' COMMENT 'стоимость перезарядки в екрах',
  `gmeshok` int(55) NOT NULL,
  `tradesale` float NOT NULL,
  `karman` tinyint(1) DEFAULT '0',
  `stbonus` int(11) NOT NULL DEFAULT '0',
  `upfree` int(11) NOT NULL DEFAULT '0',
  `ups` int(11) NOT NULL DEFAULT '0',
  `mfbonus` int(11) NOT NULL DEFAULT '0',
  `mffree` int(11) NOT NULL DEFAULT '0',
  `type3_updated` tinyint(1) NOT NULL DEFAULT '0',
  `bs_owner` int(11) DEFAULT '0',
  `nsex` smallint(6) NOT NULL DEFAULT '0',
  `present_text` text,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `labonly` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'не выносится из лабы',
  `labflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'заморозка лабиринта',
  `prokat_idp` int(11) NOT NULL DEFAULT '0' COMMENT 'idp проката',
  `prokat_do` int(11) DEFAULT NULL,
  `arsenal_klan` varchar(60) NOT NULL DEFAULT '',
  `arsenal_owner` int(11) NOT NULL DEFAULT '0' COMMENT 'хозяин сдатоя шмотки',
  `repcost` int(11) NOT NULL DEFAULT '0' COMMENT 'стоимость в репутации',
  `up_level` int(7) NOT NULL DEFAULT '0' COMMENT 'ап шмота на уровень',
  `ecost` float(10,2) NOT NULL DEFAULT '0.00',
  `group` int(5) NOT NULL DEFAULT '0',
  `ekr_up` varchar(20) DEFAULT NULL COMMENT 'рихтовка',
  `unik` int(1) NOT NULL DEFAULT '0' COMMENT 'ставится если уник',
  `add_pick` varchar(30) DEFAULT NULL COMMENT 'картинки',
  `pick_time` int(15) DEFAULT NULL COMMENT 'время жизни картинки',
  `sowner` int(11) NOT NULL DEFAULT '0' COMMENT 'привязана к овнеру',
  `idcity` int(2) NOT NULL DEFAULT '0' COMMENT '0-кепитал',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'для поиска боя/+поле юзается для номера лотереии :)',
  `t_id` int(11) NOT NULL DEFAULT '0' COMMENT 'используется для комка по городам',
  `ab_mf` int(11) NOT NULL DEFAULT '0' COMMENT 'бонус МФ',
  `ab_bron` int(11) NOT NULL DEFAULT '0' COMMENT 'Бонус на бронь',
  `ab_uron` int(11) NOT NULL DEFAULT '0' COMMENT 'бонус на урон',
  `nclass` smallint(5) unsigned NOT NULL DEFAULT '0',
  `art_status` int(11) NOT NULL DEFAULT '0' COMMENT 'в каком статусе заказ арта 0-неоплечено, 1-оплачен, 2-оплачен и установлен',
  `art_zakdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата создания заказа',
  `art_param` varchar(60) NOT NULL DEFAULT '',
  `art_mess` int(11) NOT NULL DEFAULT '0' COMMENT 'отправленно ли утверждение на арт',
  `dil` int(11) DEFAULT NULL COMMENT 'если платили екрами то ид дилера который оплатил',
  `veks_flag` int(11) NOT NULL DEFAULT '0' COMMENT '1-флаг если оплатили векселем 2-авто обмен с модерацией',
  `del_comm` varchar(255) NOT NULL DEFAULT '' COMMENT 'коментарий при отказе статус 100',
  `art_moder` varchar(255) NOT NULL DEFAULT '' COMMENT 'кто утвердил',
  `art_mod_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `olditem` smallint(6) NOT NULL DEFAULT '1' COMMENT 'флаг говорит о том что ар сделан из старого шмота',
  `bankid` int(11) unsigned NOT NULL DEFAULT '0',
  `express_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'дата експресса',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `dressed` (`dressed`),
  KEY `otdel` (`otdel`),
  KEY `bs` (`bs`),
  KEY `ghp` (`ghp`),
  KEY `maxdur` (`maxdur`),
  KEY `duration` (`duration`),
  KEY `dategoden` (`dategoden`),
  KEY `type` (`type`),
  KEY `setsale` (`setsale`),
  KEY `update` (`update`),
  KEY `gmp` (`gmp`),
  KEY `tradesale` (`tradesale`),
  KEY `bs_owner` (`bs_owner`),
  KEY `battle` (`battle`),
  KEY `prototype` (`prototype`),
  KEY `t_id` (`t_id`),
  KEY `prokat_do` (`prokat_do`),
  KEY `arsenal_klan` (`arsenal_klan`),
  KEY `arsenal_owner` (`arsenal_owner`),
  KEY `art_status` (`art_status`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ascrolls`;
CREATE TABLE `ascrolls` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `current_index` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `itemid` int(255) NOT NULL,
  `owner` int(255) NOT NULL,
  `endtime` int(255) unsigned NOT NULL,
  `newowner` int(255) unsigned NOT NULL DEFAULT '0',
  `rate` decimal(10,2) DEFAULT NULL,
  `clan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'покупается в клан арсенал из казны',
  `repcost` int(11) NOT NULL DEFAULT '0' COMMENT '0 цена в екрах / 1 цена в репе /2 цена в ваучерах',
  `starttime` int(11) NOT NULL DEFAULT '0' COMMENT 'время старта лота',
  `shag` int(11) NOT NULL DEFAULT '0' COMMENT 'шаг поднятия для  ставок',
  `st_count` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик ставок',
  `st_date` timestamp NULL DEFAULT NULL COMMENT 'время последней ставки',
  `blic` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'блиц-цена',
  `ismarked` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'выделен ли лот и на сколько',
  `ismarkedupdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время обновления помеченных',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemid` (`itemid`),
  KEY `owner` (`owner`),
  KEY `newowner` (`newowner`),
  KEY `endtime` (`endtime`)
) ENGINE=InnoDB AUTO_INCREMENT=47492 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `autoanswer`;
CREATE TABLE `autoanswer` (
  `id` int(11) NOT NULL DEFAULT '0',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `id` (`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='автоответчик';

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` mediumint(255) NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) NOT NULL DEFAULT '',
  `cr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ekr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `owner` int(255) NOT NULL DEFAULT '0',
  `haos` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'привязка склонки к счету',
  `def` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'счет по умолчанию',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=180070 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `bank_copy`;
CREATE TABLE `bank_copy` (
  `id` mediumint(255) NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) NOT NULL DEFAULT '',
  `cr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ekr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `owner` int(255) NOT NULL DEFAULT '0',
  `haos` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'привязка склонки к счету',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=160917 DEFAULT CHARSET=cp1251 ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `bank_ekr_log`;
CREATE TABLE `bank_ekr_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `kr` float(11,2) NOT NULL DEFAULT '0.00',
  `ekr` float(11,2) NOT NULL DEFAULT '0.00',
  `date` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `owner` (`owner`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=584219 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `bankhistory`;
CREATE TABLE `bankhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(15) NOT NULL DEFAULT '0',
  `text` varchar(150) NOT NULL DEFAULT '',
  `bankid` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bankid` (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=4247055 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `battle`;
CREATE TABLE `battle` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `coment` varchar(255) NOT NULL DEFAULT '',
  `teams` longtext NOT NULL COMMENT 'используется для блокировки боя',
  `timeout` int(2) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT 'Локировка боев - системное поле',
  `t1` longtext NOT NULL,
  `t2` longtext NOT NULL,
  `t3` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `win` int(1) NOT NULL DEFAULT '3',
  `damage` longtext NOT NULL,
  `to1` int(25) NOT NULL DEFAULT '0',
  `to2` int(25) NOT NULL DEFAULT '0',
  `to3` int(25) NOT NULL DEFAULT '0',
  `exp` longtext NOT NULL COMMENT 'используется для данных о склонках',
  `blood` tinyint(1) NOT NULL,
  `t1hist` longtext NOT NULL,
  `t2hist` longtext NOT NULL,
  `t3hist` longtext NOT NULL,
  `status_flag` tinyint(1) NOT NULL DEFAULT '0',
  `t1_dead` longtext NOT NULL,
  `fond` int(8) NOT NULL DEFAULT '0',
  `price` int(8) NOT NULL DEFAULT '0',
  `nomagic` tinyint(1) NOT NULL DEFAULT '0',
  `CHAOS` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-не хаот; 1- хаот;2-хаот с автоударами',
  `war_id` int(25) DEFAULT NULL COMMENT 'ид клан вара',
  `inf` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `win` (`win`),
  KEY `to1` (`to1`),
  KEY `to2` (`to2`),
  KEY `type` (`type`),
  KEY `date` (`date`),
  KEY `t1` (`t1`(10)),
  KEY `t2` (`t2`(10)),
  KEY `war_id` (`war_id`),
  KEY `status` (`status`),
  KEY `status_flag` (`status_flag`),
  KEY `t3` (`t3`(10)),
  KEY `to3` (`to3`)
) ENGINE=InnoDB AUTO_INCREMENT=406912423 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `battle_buket`;
CREATE TABLE `battle_buket` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `bcount` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `battle_dam_exp`;
CREATE TABLE `battle_dam_exp` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `battle` int(11) DEFAULT '0',
  `owner` int(11) DEFAULT '0',
  `damage` int(11) DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `fwin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'флаг отработки',
  `dcount` int(11) NOT NULL DEFAULT '0' COMMENT 'репутация',
  `mag_damage` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'маг урон',
  `dflag` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг занижения для системки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`battle`,`owner`),
  KEY `owner` (`owner`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB AUTO_INCREMENT=6076606916 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `battle_data`;
CREATE TABLE `battle_data` (
  `battle` int(11) NOT NULL DEFAULT '0',
  `baff_717` int(11) NOT NULL DEFAULT '0' COMMENT 'баф 717 время',
  `t1_baff_804` int(11) NOT NULL DEFAULT '0',
  `t2_baff_804` int(11) NOT NULL DEFAULT '0',
  `t3_baff_804` int(11) NOT NULL DEFAULT '0',
  `baff_863` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик ботов защитников в бою',
  `t2_castle` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'для боёв в замке',
  PRIMARY KEY (`battle`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблицы для ограничений в бою, для бафов';

DROP TABLE IF EXISTS `battle_fd`;
CREATE TABLE `battle_fd` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `battle` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `razmen_to` int(11) DEFAULT NULL,
  `to_t` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'команда кому',
  `razmen_from` int(11) DEFAULT NULL,
  `from_t` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'команда от кого',
  `attack` tinyint(3) DEFAULT '0',
  `attack2` tinyint(3) NOT NULL DEFAULT '0',
  `block` tinyint(3) DEFAULT '0',
  `time_blow` int(25) NOT NULL DEFAULT '0',
  `lab` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'флаг разменов в лабе',
  PRIMARY KEY (`id`),
  UNIQUE KEY `razmen_to` (`razmen_to`,`razmen_from`,`battle`),
  KEY `battle` (`battle`),
  KEY `owner` (`owner`),
  KEY `razmen_to_2` (`razmen_to`),
  KEY `razmen_from` (`razmen_from`),
  KEY `time_blow` (`time_blow`),
  KEY `to_t` (`to_t`),
  KEY `from_t` (`from_t`)
) ENGINE=InnoDB AUTO_INCREMENT=143330007 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `battle_hist`;
CREATE TABLE `battle_hist` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL COMMENT 'ид чара',
  `battle_id` bigint(20) DEFAULT NULL,
  `bat_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `bat_date` (`bat_date`)
) ENGINE=InnoDB AUTO_INCREMENT=464670012 DEFAULT CHARSET=cp1251 COMMENT='для поиска завершенок';

DROP TABLE IF EXISTS `battle_hist_hidden`;
CREATE TABLE `battle_hist_hidden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL COMMENT 'ид чара',
  `battle_id` bigint(20) DEFAULT NULL,
  `bat_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `bat_date` (`bat_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1348745 DEFAULT CHARSET=cp1251 COMMENT='для поиска завершенок - неведов';

DROP TABLE IF EXISTS `battle_hist_rist300`;
CREATE TABLE `battle_hist_rist300` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `battle_id` int(11) unsigned NOT NULL DEFAULT '0',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fin_time` timestamp NULL DEFAULT NULL,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_hist` text,
  `bot_id` int(11) unsigned NOT NULL DEFAULT '0',
  `bot_hist` text NOT NULL,
  `win` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hid`),
  KEY `battle` (`battle_id`),
  KEY `win` (`win`)
) ENGINE=InnoDB AUTO_INCREMENT=2906 DEFAULT CHARSET=cp1251 COMMENT='таблица истории для боев в локации restal300.php';

DROP TABLE IF EXISTS `battle_runs_exp`;
CREATE TABLE `battle_runs_exp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battle` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `runs` int(3) NOT NULL DEFAULT '0' COMMENT 'количество рун в бою у перса',
  `battle_flag` smallint(6) NOT NULL DEFAULT '1' COMMENT 'флаг кол.людей в бою 0-меньше 5 ; 1- по умолчанию больше',
  `rkf_bonus` smallint(6) NOT NULL DEFAULT '0' COMMENT 'RKF бонус в процентах',
  `useabil` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'фиксируем использование абилы',
  `usehill` tinyint(3) unsigned DEFAULT '0' COMMENT 'фиксируем использование хила',
  `cure_value_hp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'кол. заюзанного хила',
  `rkm_bonus` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'бонус РКМ для начисления за маг урон',
  PRIMARY KEY (`id`),
  UNIQUE KEY `battle` (`battle`,`owner`),
  KEY `battle_2` (`battle`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=75088464 DEFAULT CHARSET=cp1251 COMMENT='начисление опыта рун';

DROP TABLE IF EXISTS `battle_time_out`;
CREATE TABLE `battle_time_out` (
  `battle` int(11) NOT NULL DEFAULT '0',
  `ttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner` int(11) NOT NULL DEFAULT '0',
  `login` varchar(30) NOT NULL DEFAULT '',
  UNIQUE KEY `battle` (`battle`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `battle_user_time`;
CREATE TABLE `battle_user_time` (
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'ид боя',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `timer1` int(11) NOT NULL DEFAULT '0' COMMENT 'время размена с командой 1',
  `timer2` int(11) NOT NULL DEFAULT '0' COMMENT 'время размена с командой 2',
  `timer3` int(11) NOT NULL DEFAULT '0' COMMENT 'время размена с командой 3',
  PRIMARY KEY (`battle`,`owner`),
  KEY `timer1` (`timer1`),
  KEY `timer2` (`timer2`),
  KEY `timer3` (`timer3`),
  KEY `owner` (`owner`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблица гроз';

DROP TABLE IF EXISTS `battle_vars`;
CREATE TABLE `battle_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battle` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `bexit_count` int(11) DEFAULT '0',
  `bexit_team` tinyint(1) DEFAULT NULL,
  `istok_use` int(11) NOT NULL DEFAULT '0' COMMENT 'кол. юзов источника в бою для чара',
  `colns_use` int(5) NOT NULL DEFAULT '0' COMMENT 'количество выпущеных клонов в бою',
  `napal` int(2) DEFAULT '1' COMMENT 'атрибут - нападения в бою 1 напал 0 -из заявки',
  `unclons_use` int(11) NOT NULL DEFAULT '0' COMMENT 'кол. отюзаного перемана',
  `help_use` int(11) NOT NULL DEFAULT '0' COMMENT 'использование аптечки',
  `help_proto` int(11) NOT NULL DEFAULT '0' COMMENT 'прото заюзаной аптечки',
  `bots_use` int(11) NOT NULL DEFAULT '0' COMMENT 'использование призыва',
  `baf_701_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 701 бафа',
  `baf_702_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 702 бафа',
  `baf_703_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 703 бафа',
  `baf_705_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 705 бафа',
  `baf_706_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 706 бафа',
  `baf_708_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 708 бафа',
  `baf_709_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 709 бафа',
  `baf_711_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'исп 711',
  `baf_712_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'исп. 712',
  `baf_713_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'исп 713',
  `baf_714_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'исп 714',
  `baf_715_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'исп 715',
  `baf_720_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 720 бафа',
  `baf_721_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 721 бафа',
  `baf_722_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 722 бафа',
  `baf_723_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'помощь собрату 723,724,725',
  `baf_805_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 805 бафа',
  `baf_808_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'использование 808 бафа',
  `baf_823_use` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'исп. 823',
  `baf_795_use` int(11) NOT NULL DEFAULT '0' COMMENT '795-синня книга',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`battle`,`owner`),
  KEY `battle` (`battle`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=92461261 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `battle_war`;
CREATE TABLE `battle_war` (
  `battle` int(11) NOT NULL DEFAULT '0',
  `t1` int(11) NOT NULL DEFAULT '0' COMMENT 'вес первой команды',
  `t2` int(11) NOT NULL DEFAULT '0' COMMENT 'вес второй команды',
  `wmax` int(11) NOT NULL DEFAULT '0' COMMENT 'планка максимальный перевес',
  `maxlevel` int(11) NOT NULL DEFAULT '0' COMMENT 'максимальный уровень',
  `count1` int(11) NOT NULL DEFAULT '1' COMMENT 'счетчик людей в т1',
  `count2` int(11) NOT NULL DEFAULT '1' COMMENT 'счет людей в т2',
  `active` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'включена ли эта линейка',
  PRIMARY KEY (`battle`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблица для весов команды в клан варах';

DROP TABLE IF EXISTS `beginers_quest_list`;
CREATE TABLE `beginers_quest_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qname` varchar(50) DEFAULT NULL COMMENT 'название квеста',
  `qdescription` text COMMENT 'Короткое описание квеста.',
  `qdescription_full` text,
  `qalign` int(20) NOT NULL DEFAULT '0' COMMENT 'Склонность квеста. 0- общие',
  `qsteps` int(11) NOT NULL DEFAULT '0' COMMENT 'колво шагов',
  `can_take` tinyint(1) NOT NULL DEFAULT '0',
  `can_take_ava` tinyint(1) NOT NULL DEFAULT '0',
  `aganist` varchar(20) DEFAULT NULL COMMENT 'для перехода между склонками',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=cp1251 COMMENT='список всех квестов для всеъ склонок';

DROP TABLE IF EXISTS `beginers_quests`;
CREATE TABLE `beginers_quests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step` int(11) NOT NULL DEFAULT '1' COMMENT 'Шаг квеста',
  `describe` varchar(50) DEFAULT NULL COMMENT 'название квеста',
  `qname` varchar(50) DEFAULT NULL,
  `qtype` int(11) NOT NULL DEFAULT '0' COMMENT 'тип квеста: 0-диалог; 1-Выбивалка; 2-Собиралка; 3-Убивалка; 4-хар-ки; 5-локации (ID); 6-счет в банке(для нуб квеста)',
  `q_fight_type` int(11) DEFAULT '0' COMMENT 'отслеживаемый тип боя',
  `qstart` text COMMENT 'стартовый диалог',
  `answer_1` tinyint(3) NOT NULL DEFAULT '1',
  `answer_2` tinyint(3) NOT NULL DEFAULT '0',
  `qfin` varchar(255) DEFAULT NULL COMMENT 'Финальный диалог',
  `q_have_to_win` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'надо ли выигрывать бой 1 да 0 нет',
  `qsys_fail` varchar(255) DEFAULT NULL COMMENT 'системка дополнительно',
  `qcondition` varchar(50) DEFAULT NULL COMMENT 'условия выполнения квеста (lovk:50;int:50)-тип4, (22)-комната - тип5. и тд.',
  `q_item` int(25) NOT NULL DEFAULT '0' COMMENT 'id-итема квестового из-магазина',
  `q_item_count` int(11) NOT NULL DEFAULT '0' COMMENT 'нужное количество предметов',
  `q_item2` int(25) DEFAULT NULL,
  `q_item2_count` int(11) DEFAULT NULL,
  `q_item3` int(11) DEFAULT NULL,
  `q_item3_count` int(11) DEFAULT NULL,
  `q_item4` int(25) DEFAULT NULL,
  `q_item4_count` int(11) DEFAULT NULL,
  `q_bot` int(11) DEFAULT NULL,
  `q_bot_count` int(11) DEFAULT NULL,
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT 'награда опыт',
  `kr` int(11) NOT NULL DEFAULT '0' COMMENT 'награда креды',
  `repa` int(11) NOT NULL DEFAULT '0',
  `shop_prize` varchar(50) NOT NULL DEFAULT '0' COMMENT 'ID прототипов из магазина ( 101,102,103) которые дадуться после выполения задания',
  `shop_prize_gift` tinyint(1) NOT NULL DEFAULT '0',
  `eshop_prize` varchar(50) NOT NULL DEFAULT '0' COMMENT 'ID прототипов из Eмагазина ( 101,102,103) которые дадуться после выполения задания',
  `eshop_prize_gift` tinyint(1) NOT NULL DEFAULT '0',
  `effect_prize` varchar(50) DEFAULT NULL COMMENT 'Призы-Ефекты ( премиум, усиления, бонусы, проклятья  и тд), формат: prem:1:4999:1296000;sila:3:123123:36000 - Премиeм id эфекта 4999 +1,  15 дней, сила +3, 10 часов',
  `repeat` int(11) NOT NULL DEFAULT '1' COMMENT 'сколько раз можно выполнить квест',
  `info` text COMMENT 'Служебная информация',
  `nps_img` varchar(30) DEFAULT NULL COMMENT 'Лицо квеста(картинка)',
  PRIMARY KEY (`id`,`step`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=cp1251 COMMENT='Квесты';

DROP TABLE IF EXISTS `beginers_quests_step`;
CREATE TABLE `beginers_quests_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(25) DEFAULT NULL COMMENT 'чар',
  `quest_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид квеста',
  `qtype` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'тип квеста: 0-диалог; 1-Выбивалка; 2-Собиралка; 3-Убивалка; 4-хар-ки; 5-локации (ID); 6-счет в банке(для нуб квеста)',
  `qftype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0 - взят но не выполнен; 1- выполнен',
  `step` tinyint(3) NOT NULL DEFAULT '1' COMMENT 'Шаг квеста',
  `step_f` tinyint(3) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT 'capitalcity',
  `get_date` int(11) DEFAULT NULL COMMENT 'дата когда закончился квест',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT 'количество завершенных раз',
  `quest_count` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `questu` (`owner`,`quest_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=1829528 DEFAULT CHARSET=cp1251 COMMENT='списки квестов чара/ status: 0-невыполнен еще ;1-выполнен';

DROP TABLE IF EXISTS `bilet`;
CREATE TABLE `bilet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  `fsize` varchar(5) NOT NULL DEFAULT '' COMMENT 'размер футболки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251 COMMENT='билеты на 8-и летие олдБК';

DROP TABLE IF EXISTS `bilet_2013`;
CREATE TABLE `bilet_2013` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=cp1251 COMMENT='билеты на 3-х летие олдБК';

DROP TABLE IF EXISTS `bilet_2014`;
CREATE TABLE `bilet_2014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=cp1251 COMMENT='билеты на 4-х летие олдБК';

DROP TABLE IF EXISTS `bilet_2015`;
CREATE TABLE `bilet_2015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=cp1251 COMMENT='билеты на 5-и летие олдБК';

DROP TABLE IF EXISTS `bilet_2016`;
CREATE TABLE `bilet_2016` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=cp1251 COMMENT='билеты на 5-и летие олдБК';

DROP TABLE IF EXISTS `bilet_2017`;
CREATE TABLE `bilet_2017` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=cp1251 COMMENT='билеты на 7-и летие олдБК';

DROP TABLE IF EXISTS `bilet_ukr`;
CREATE TABLE `bilet_ukr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selname` varchar(255) DEFAULT NULL COMMENT 'кто продал',
  `owner_nick` varchar(255) DEFAULT NULL COMMENT 'кто купил',
  `owner` varchar(255) DEFAULT NULL COMMENT 'ид чара кто купил',
  `fio` varchar(255) DEFAULT NULL COMMENT 'ФИО кто купил',
  `vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'вип да/ нет',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT 'цена билета',
  `sdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда продался билет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=cp1251 COMMENT='билеты на 5-и летие олдБК Украина';

DROP TABLE IF EXISTS `bonus_items`;
CREATE TABLE `bonus_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(25) NOT NULL DEFAULT '0' COMMENT 'ид шмотки из Inventory',
  `flag` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'flag - для различных бонусов 1- перезарядка',
  `owner` bigint(20) NOT NULL DEFAULT '0' COMMENT 'whois',
  `finish` bigint(11) NOT NULL DEFAULT '0' COMMENT 'штамп окончания',
  `battle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`flag`,`owner`),
  KEY `owner` (`owner`),
  KEY `battle` (`battle`),
  KEY `item_id_2` (`item_id`,`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=97051 DEFAULT CHARSET=cp1251 COMMENT='бонусные итемы: flag=1-бонусная перезарядка';

DROP TABLE IF EXISTS `bots`;
CREATE TABLE `bots` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `prototype` int(255) NOT NULL DEFAULT '0',
  `battle` int(255) NOT NULL DEFAULT '0',
  `hp` int(15) NOT NULL DEFAULT '0',
  `is_clon` tinyint(1) NOT NULL DEFAULT '0',
  `is_dead` tinyint(1) DEFAULT '0',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `battle_t` tinyint(1) DEFAULT '0' COMMENT 'сторона в бою',
  `lab` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `battle` (`battle`),
  KEY `hp` (`hp`),
  KEY `prototype` (`prototype`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `boxs`;
CREATE TABLE `boxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид итема коробки - если коробка продана',
  `is_open` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'открыт или нет',
  `box_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'тип ларца (1,2,3,4)',
  `i1` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i2` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i3` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i4` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i5` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i6` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i7` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i8` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i9` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i10` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i11` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i12` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i13` int(11) NOT NULL DEFAULT '0' COMMENT 'флаг для билета лото',
  `i14` int(11) NOT NULL DEFAULT '0' COMMENT '0/итем ID',
  `i15` int(11) NOT NULL DEFAULT '0' COMMENT 'ID абилки',
  `i16` int(11) NOT NULL DEFAULT '0' COMMENT 'ID абилки',
  `i17` int(11) NOT NULL DEFAULT '0' COMMENT 'ID абилки',
  `i18` int(11) NOT NULL DEFAULT '0' COMMENT 'ID абилки',
  `i19` int(11) NOT NULL DEFAULT '0' COMMENT 'ID абилки',
  `i20` int(11) NOT NULL DEFAULT '0' COMMENT 'ID абилки',
  `i21` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `box_type` (`box_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5501 DEFAULT CHARSET=cp1251 COMMENT='ларцы';

DROP TABLE IF EXISTS `boxs_history`;
CREATE TABLE `boxs_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `box_type` tinyint(3) unsigned NOT NULL,
  `selldate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`,`box_type`,`selldate`)
) ENGINE=InnoDB AUTO_INCREMENT=1266 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `boxsapril`;
CREATE TABLE `boxsapril` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид итема коробки - если коробка продана',
  `is_open` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'открыт или нет',
  `box_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'тип яйца (1,2)',
  `i1` int(11) NOT NULL DEFAULT '0',
  `i2` int(11) NOT NULL DEFAULT '0',
  `i3` int(11) NOT NULL DEFAULT '0',
  `i4` int(11) NOT NULL DEFAULT '0',
  `i5` int(11) NOT NULL DEFAULT '0',
  `i6` int(11) NOT NULL DEFAULT '0',
  `i7` int(11) NOT NULL DEFAULT '0',
  `i8` int(11) NOT NULL DEFAULT '0',
  `i9` int(11) NOT NULL DEFAULT '0',
  `i10` int(11) NOT NULL DEFAULT '0',
  `i11` int(11) NOT NULL DEFAULT '0',
  `i12` int(11) NOT NULL DEFAULT '0',
  `i13` int(11) NOT NULL DEFAULT '0',
  `i14` int(11) NOT NULL DEFAULT '0',
  `i15` int(11) NOT NULL DEFAULT '0',
  `i16` int(11) NOT NULL DEFAULT '0',
  `i17` int(11) NOT NULL DEFAULT '0',
  `i18` int(11) NOT NULL DEFAULT '0',
  `i19` int(11) NOT NULL DEFAULT '0',
  `i20` int(11) NOT NULL DEFAULT '0',
  `i21` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `box_type` (`box_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5001 DEFAULT CHARSET=cp1251 COMMENT='яйца';

DROP TABLE IF EXISTS `boxsapril_history`;
CREATE TABLE `boxsapril_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `box_type` tinyint(3) unsigned NOT NULL,
  `selldate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`,`box_type`,`selldate`)
) ENGINE=InnoDB AUTO_INCREMENT=4431 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `browser_cache`;
CREATE TABLE `browser_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text COMMENT 'profile_data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='заголовки и версии броузеров.';

DROP TABLE IF EXISTS `castles`;
CREATE TABLE `castles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'номер замка',
  `nlevel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'необходимый уровень для замка',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'статус свободен/есть заявка/идёт бой',
  `dayofweek` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'день недели когда замок освобождается',
  `hourofday` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'час когда замок освобождается',
  `timeouta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'во сколько начало боя при заявке и статусе = 1',
  `clanshort` varchar(50) NOT NULL DEFAULT '' COMMENT 'клан владелец. если пусто - мобы',
  `clanashort1` varchar(25) NOT NULL DEFAULT '' COMMENT 'первый атакующий клан',
  `clanashort2` varchar(50) NOT NULL DEFAULT '' COMMENT 'второй нападающий клан',
  `lastpagegen` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время последней генерации страницы',
  `lastcoingen` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время последней генерации монетки',
  `pagenum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'номер страницы для генерации',
  `pagecolor` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'цвет страницы',
  `battle` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'номер боя, если бой идёт за замок',
  `tur_log` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'текущий лог турнира за замок',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `timeouta` (`timeouta`),
  KEY `clanshort` (`clanshort`),
  KEY `battle` (`battle`),
  KEY `clanashort1` (`clanashort1`),
  KEY `clanashort2` (`clanashort2`),
  KEY `dayofweek` (`dayofweek`),
  KEY `hourofday` (`hourofday`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `castles_history`;
CREATE TABLE `castles_history` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `castle_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `castle_id` (`castle_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=13355 DEFAULT CHARSET=cp1251 COMMENT='история замков';

DROP TABLE IF EXISTS `castles_inventory`;
CREATE TABLE `castles_inventory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `team` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=56353 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `castles_osada`;
CREATE TABLE `castles_osada` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nextosada` int(11) unsigned NOT NULL DEFAULT '0',
  `osadaend` int(11) unsigned NOT NULL DEFAULT '0',
  `score` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `castles_osada_uses`;
CREATE TABLE `castles_osada_uses` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `owner` (`owner`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `castles_profile`;
CREATE TABLE `castles_profile` (
  `owner` int(15) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `prof` int(11) NOT NULL DEFAULT '0' COMMENT 'поле номера комплекта. В состоянии 0 держит реальные вещи для комнаты оружейки',
  `pname` varchar(255) DEFAULT NULL COMMENT 'название профиля',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'профиль выбран по умолчанию',
  `sila` int(4) NOT NULL DEFAULT '0',
  `lovk` int(4) NOT NULL DEFAULT '0',
  `inta` int(4) NOT NULL DEFAULT '0',
  `vinos` int(4) NOT NULL DEFAULT '0',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `maxhp` int(6) NOT NULL DEFAULT '0',
  `hp` int(6) NOT NULL DEFAULT '0',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `stats` int(5) NOT NULL DEFAULT '0',
  `master` int(5) NOT NULL DEFAULT '0',
  `nakidka` int(55) NOT NULL DEFAULT '0' COMMENT 'накидка',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `bpbonushp` int(11) NOT NULL DEFAULT '0' COMMENT 'был ли бонуc на хп призапоминании',
  `rubashka` int(55) NOT NULL DEFAULT '0' COMMENT 'рубашка',
  `runa1` int(11) NOT NULL DEFAULT '0',
  `runa2` int(11) NOT NULL DEFAULT '0',
  `runa3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`prof`),
  UNIQUE KEY `owner` (`owner`,`prof`,`pname`),
  UNIQUE KEY `owner_2` (`owner`,`pname`),
  KEY `prof` (`prof`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='состояние чара для оружейки замков';

DROP TABLE IF EXISTS `castles_realchars`;
CREATE TABLE `castles_realchars` (
  `owner` int(255) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `stats` int(15) NOT NULL,
  `master` int(5) NOT NULL,
  `bpbonussila` int(5) NOT NULL DEFAULT '0',
  `bpbonushp` int(5) NOT NULL DEFAULT '0',
  `noj` int(5) NOT NULL,
  `mec` int(5) NOT NULL,
  `topor` int(5) NOT NULL,
  `dubina` int(5) NOT NULL,
  `mfire` int(5) NOT NULL,
  `mwater` int(5) NOT NULL,
  `mair` int(5) NOT NULL,
  `mearth` int(5) NOT NULL,
  `mlight` int(5) NOT NULL,
  `mgray` int(5) NOT NULL,
  `mdark` int(5) NOT NULL,
  `mana` int(10) unsigned NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `castles_start`;
CREATE TABLE `castles_start` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `castle_id` int(10) unsigned NOT NULL,
  `klan` varchar(50) NOT NULL,
  `ownerklan` varchar(50) NOT NULL,
  `users` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `castle_id` (`castle_id`,`klan`)
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `castles_tur`;
CREATE TABLE `castles_tur` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL,
  `data` text NOT NULL,
  `log` text NOT NULL,
  `winners` text NOT NULL,
  `castle_id` int(11) unsigned NOT NULL DEFAULT '0',
  `lastround` int(11) unsigned NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13689 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `chanels`;
CREATE TABLE `chanels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klan` varchar(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  `user` int(255) NOT NULL,
  `mname` varchar(255) NOT NULL DEFAULT '',
  `filt_name` varchar(255) DEFAULT NULL,
  `filt_mname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `klan` (`klan`,`user`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=155075 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` longtext NOT NULL,
  `city` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0- все города, 1-кеп , 2-авалон',
  `room` int(11) NOT NULL DEFAULT '-1',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'овнер-ид того кто написал,  пишется только если сообщение добавил человек',
  PRIMARY KEY (`id`),
  KEY `cdate` (`cdate`),
  KEY `city` (`city`),
  KEY `room` (`room`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=427825423 DEFAULT CHARSET=cp1251 COMMENT='чат )';

DROP TABLE IF EXISTS `chat_chanels`;
CREATE TABLE `chat_chanels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clan1` varchar(255) DEFAULT '',
  `clan2` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `active` smallint(6) DEFAULT '0',
  `chanel` int(11) DEFAULT NULL,
  `chanel2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clan1` (`clan1`),
  KEY `clan2` (`clan2`),
  KEY `chanel` (`chanel`),
  KEY `chanel2` (`chanel2`),
  KEY `active` (`active`),
  KEY `clan1_2` (`clan1`,`clan2`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=967 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `chat_hist`;
CREATE TABLE `chat_hist` (
  `id` int(11) NOT NULL,
  `cdate` timestamp NULL DEFAULT NULL,
  `text` longtext NOT NULL,
  `city` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0- все города, 1-кеп , 2-авалон',
  `room` int(11) NOT NULL DEFAULT '-1',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'овнер-ид того кто написал,  пишется только если сообщение добавил человек',
  PRIMARY KEY (`id`),
  KEY `cdate` (`cdate`),
  KEY `city` (`city`),
  KEY `room` (`room`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='чат )';

DROP TABLE IF EXISTS `church`;
CREATE TABLE `church` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `scroll_img` varchar(255) DEFAULT NULL,
  `scroll_owner` bigint(255) DEFAULT NULL,
  `user_text` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `finish` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='для сбора свитков';

DROP TABLE IF EXISTS `church2`;
CREATE TABLE `church2` (
  `resid` int(11) NOT NULL DEFAULT '0',
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `rescount` int(10) DEFAULT NULL,
  PRIMARY KEY (`resid`,`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='ресурсы на храм';

DROP TABLE IF EXISTS `city_trap`;
CREATE TABLE `city_trap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(25) DEFAULT NULL,
  `target` int(25) DEFAULT NULL,
  `room` int(15) DEFAULT NULL,
  `timer` int(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `1target 1owner` (`target`,`room`,`owner`),
  KEY `owner` (`owner`),
  KEY `target` (`target`),
  KEY `room` (`room`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clan_quest`;
CREATE TABLE `clan_quest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clan` varchar(255) NOT NULL DEFAULT '',
  `quest_id` int(11) NOT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `is_cancel` tinyint(1) DEFAULT '0',
  `is_end` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `ended_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_quest_part`;
CREATE TABLE `clan_quest_part` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clan_quest_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `quest_part_id` int(11) NOT NULL,
  `clan` varchar(255) NOT NULL DEFAULT '',
  `is_finished` tinyint(1) DEFAULT '0',
  `is_started` tinyint(1) DEFAULT '0',
  `started_at` int(11) DEFAULT '0',
  `ended_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clan_status_log`;
CREATE TABLE `clan_status_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `who` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'кто поменял',
  `owner` int(1) unsigned NOT NULL DEFAULT '0' COMMENT 'кому поменял',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT 'что поставили',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'когда',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11620 DEFAULT CHARSET=cp1251 COMMENT='лог изменения статусов в клане';

DROP TABLE IF EXISTS `clan_tournament`;
CREATE TABLE `clan_tournament` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_type` varchar(255) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `team_count` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `is_end` tinyint(1) DEFAULT '0',
  `ended_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_group`;
CREATE TABLE `clan_tournament_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `team1_clan` varchar(255) NOT NULL DEFAULT '',
  `team2_clan` varchar(255) NOT NULL DEFAULT '',
  `team1_value` int(11) DEFAULT '0',
  `team2_value` int(11) DEFAULT '0',
  `win` tinyint(1) DEFAULT '0',
  `need_finish` tinyint(1) DEFAULT '0',
  `is_end` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_history`;
CREATE TABLE `clan_tournament_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `battle_id` int(11) DEFAULT NULL,
  `location_y` int(11) DEFAULT NULL,
  `location_x` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_map_items`;
CREATE TABLE `clan_tournament_map_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `owner_team_id` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `item_type` varchar(255) NOT NULL DEFAULT '',
  `location_y` int(11) NOT NULL,
  `location_x` int(11) NOT NULL,
  `is_removed` tinyint(1) DEFAULT '0',
  `is_taken` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_request`;
CREATE TABLE `clan_tournament_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_type` varchar(255) NOT NULL DEFAULT '',
  `liga_type` tinyint(1) NOT NULL,
  `tournament_id` int(11) DEFAULT NULL,
  `comment` text,
  `created_at` int(11) DEFAULT '0',
  `started_at` int(11) NOT NULL DEFAULT '0',
  `is_end` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2413 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_request_user`;
CREATE TABLE `clan_tournament_request_user` (
  `request_id` int(11) NOT NULL,
  `tournament_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `clan` varchar(255) NOT NULL DEFAULT '',
  `is_removed` tinyint(1) DEFAULT '0',
  `joined_at` int(11) DEFAULT '0',
  PRIMARY KEY (`request_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_smoke`;
CREATE TABLE `clan_tournament_smoke` (
  `tournament_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `location_y` int(11) NOT NULL,
  `location_x` int(11) NOT NULL,
  `is_removed` tinyint(1) DEFAULT '0',
  `opened_at` int(11) DEFAULT '0',
  PRIMARY KEY (`tournament_id`,`group_id`,`team_id`,`location_x`,`location_y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_user`;
CREATE TABLE `clan_tournament_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` tinyint(1) NOT NULL DEFAULT '1',
  `location_y` int(11) DEFAULT '0',
  `location_x` int(11) DEFAULT '0',
  `is_died` tinyint(1) DEFAULT '0',
  `moved_at` int(11) DEFAULT '0',
  `can_moved_at` int(11) DEFAULT '0',
  `hospital_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clan_tournament_user_items`;
CREATE TABLE `clan_tournament_user_items` (
  `tournament_user_id` int(11) NOT NULL,
  `map_item_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  PRIMARY KEY (`tournament_user_id`,`map_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `clanevents`;
CREATE TABLE `clanevents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `owner` int(15) NOT NULL,
  `checkm` int(11) NOT NULL DEFAULT '0',
  `author` int(15) NOT NULL,
  `a_info` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans`;
CREATE TABLE `clans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `descr` text NOT NULL,
  `glava` int(255) NOT NULL DEFAULT '0',
  `vozm` text NOT NULL,
  `align` varchar(5) NOT NULL DEFAULT '',
  `mshadow` varchar(50) NOT NULL,
  `wshadow` varchar(50) NOT NULL,
  `homepage` varchar(100) NOT NULL,
  `chat` varchar(255) DEFAULT '0',
  `rekrut1` varchar(255) DEFAULT NULL COMMENT 'рекрут клан 1',
  `rekrut2` varchar(255) DEFAULT NULL COMMENT 'рекрут клан 2',
  `rekrut_klan` int(11) NOT NULL DEFAULT '0',
  `base_klan` int(11) NOT NULL DEFAULT '0',
  `voinst` int(11) NOT NULL DEFAULT '0' COMMENT 'воинственность',
  `messages` tinyint(3) NOT NULL DEFAULT '10',
  `defch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tax_date` int(25) DEFAULT NULL COMMENT 'время выплаты',
  `tax_timer` int(25) NOT NULL DEFAULT '0' COMMENT 'таймер на неделю ( стартует от "tax_date")',
  `msg` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1- 24h, 2-12h',
  `time_to_del` int(11) DEFAULT '0' COMMENT 'окончательное удаление',
  `warcancel` int(11) NOT NULL DEFAULT '-10' COMMENT 'сколько раз можно отказаться клану от войны новой',
  `chglava` timestamp NULL DEFAULT NULL COMMENT 'время когда можно менять главу клаа',
  `tax_auto` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'авто оплата клана флаг',
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`),
  KEY `base_klan` (`base_klan`),
  KEY `rekrut_klan` (`rekrut_klan`),
  KEY `glava` (`glava`),
  KEY `tax_timer` (`tax_timer`),
  KEY `tax_date` (`tax_date`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_abil`;
CREATE TABLE `clans_abil` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `klan` varchar(255) NOT NULL DEFAULT '',
  `magic` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `users` text,
  `userscount` text,
  `recrut_count` int(11) NOT NULL DEFAULT '0',
  `free_to_day` int(11) NOT NULL DEFAULT '0' COMMENT 'бесплатных',
  `chasha` int(11) NOT NULL DEFAULT '0' COMMENT 'просто запоминалка чаши на сегодня в КВ',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `klan` (`klan`,`magic`),
  KEY `magic` (`magic`)
) ENGINE=InnoDB AUTO_INCREMENT=1876585 DEFAULT CHARSET=cp1251 COMMENT='клановые абилки';

DROP TABLE IF EXISTS `clans_abil2`;
CREATE TABLE `clans_abil2` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `klan` varchar(255) NOT NULL DEFAULT '',
  `magic` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `users` text,
  `userscount` text,
  `recrut_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `klan` (`klan`,`magic`),
  KEY `magic` (`magic`)
) ENGINE=InnoDB AUTO_INCREMENT=1426 DEFAULT CHARSET=cp1251 COMMENT='клановые абилки';

DROP TABLE IF EXISTS `clans_abil_1`;
CREATE TABLE `clans_abil_1` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `klan` varchar(255) NOT NULL DEFAULT '',
  `magic` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `users` text,
  `userscount` text,
  `recrut_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `klan` (`klan`,`magic`),
  KEY `magic` (`magic`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=cp1251 COMMENT='клановые абилки';

DROP TABLE IF EXISTS `clans_abil_log`;
CREATE TABLE `clans_abil_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` bigint(55) DEFAULT NULL,
  `klan` varchar(255) DEFAULT NULL,
  `magic` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `owner` (`owner`),
  KEY `klan` (`klan`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1865713 DEFAULT CHARSET=cp1251 COMMENT='логи юзов';

DROP TABLE IF EXISTS `clans_abil_war`;
CREATE TABLE `clans_abil_war` (
  `magic` int(11) NOT NULL DEFAULT '0' COMMENT 'что за абилка',
  `klan` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько штук в день',
  `leftdays` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько всего дней осталось',
  PRIMARY KEY (`magic`,`klan`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='индексная таблица абилок, выдаваемых после войны на срок';

DROP TABLE IF EXISTS `clans_abil_war_new`;
CREATE TABLE `clans_abil_war_new` (
  `magic` int(11) NOT NULL DEFAULT '0' COMMENT 'что за абилка',
  `klan` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько штук в день',
  `leftdays` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько всего дней осталось',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2692 DEFAULT CHARSET=cp1251 COMMENT='индексная таблица абилок, выдаваемых после войны на срок нов';

DROP TABLE IF EXISTS `clans_arsenal`;
CREATE TABLE `clans_arsenal` (
  `id_ars` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventory` int(255) DEFAULT NULL,
  `klan_name` varchar(255) DEFAULT NULL,
  `owner_original` int(255) DEFAULT NULL,
  `owner_current` int(11) NOT NULL DEFAULT '0',
  `gift` int(11) NOT NULL DEFAULT '0' COMMENT 'используется для идентификации подарка в арсенал от главы',
  `all_access` tinyint(3) NOT NULL DEFAULT '1' COMMENT 'предмету открыт доступ',
  PRIMARY KEY (`id_ars`),
  KEY `id_inventory` (`id_inventory`),
  KEY `owner_original` (`owner_original`),
  KEY `owner_current` (`owner_current`),
  KEY `gift` (`gift`)
) ENGINE=InnoDB AUTO_INCREMENT=929384 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_arsenal_access`;
CREATE TABLE `clans_arsenal_access` (
  `item` int(11) NOT NULL DEFAULT '0' COMMENT 'ид предмета',
  `klan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана',
  `klan_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'низвание клана',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара которому разрешено брать',
  `owner_login` varchar(255) NOT NULL DEFAULT '' COMMENT 'кеш ников',
  UNIQUE KEY `item_2` (`item`,`owner`),
  KEY `klan_name` (`klan_name`),
  KEY `owner` (`owner`),
  KEY `klan_id` (`klan_id`),
  KEY `item` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='доступы к предметам казны';

DROP TABLE IF EXISTS `clans_arsenal_back`;
CREATE TABLE `clans_arsenal_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL DEFAULT '0',
  `owner_current` bigint(20) NOT NULL DEFAULT '0',
  `owner_original` bigint(20) DEFAULT '0',
  `city` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'из какого города забирать 0-кеп / 1-ава',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `owner_current` (`owner_current`),
  KEY `owner_original` (`owner_original`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=cp1251 COMMENT='авто возврат шмоток арсенала';

DROP TABLE IF EXISTS `clans_arsenal_log`;
CREATE TABLE `clans_arsenal_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klan` varchar(60) DEFAULT NULL,
  `pers` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klan` (`klan`),
  KEY `date` (`date`),
  KEY `klan_2` (`klan`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=16528760 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_arsenal_old`;
CREATE TABLE `clans_arsenal_old` (
  `id_ars` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventory` int(255) DEFAULT NULL,
  `klan_name` varchar(255) DEFAULT NULL,
  `owner_original` int(255) DEFAULT NULL,
  `owner_current` int(11) NOT NULL DEFAULT '0',
  `id_city` int(11) NOT NULL DEFAULT '0' COMMENT 'неиспользуется пока ваще',
  PRIMARY KEY (`id_ars`)
) ENGINE=InnoDB AUTO_INCREMENT=888538 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_kazna`;
CREATE TABLE `clans_kazna` (
  `clan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана',
  `kr` float(12,2) NOT NULL DEFAULT '0.00' COMMENT 'кредиты',
  `kr_pass` varchar(12) NOT NULL DEFAULT '' COMMENT 'пароль для кредитной казны',
  `ekr` float(12,2) NOT NULL DEFAULT '0.00' COMMENT 'екры',
  `ekr_pass` varchar(12) NOT NULL DEFAULT '' COMMENT 'пасс для екровой',
  `ban` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'заморозка казны',
  `ban_txt` varchar(255) DEFAULT NULL COMMENT 'причина блока',
  PRIMARY KEY (`clan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='клановая казна';

DROP TABLE IF EXISTS `clans_kazna_log`;
CREATE TABLE `clans_kazna_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1=пополнение казны, 2=перевод из казны,3=покупка из казны,0-другое',
  `ktype` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1=кредиты /2=евро кредиты',
  `clan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'казна = клан_ид',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара кто выполнил дествие',
  `target` text NOT NULL COMMENT 'назначение действия или текст',
  `kdate` int(11) NOT NULL DEFAULT '0' COMMENT 'штамп операции',
  PRIMARY KEY (`id`),
  KEY `kdate` (`kdate`),
  KEY `clan_id` (`clan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=705076 DEFAULT CHARSET=cp1251 COMMENT='логи казны';

DROP TABLE IF EXISTS `clans_preset`;
CREATE TABLE `clans_preset` (
  `itemid` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `owner_login` varchar(50) NOT NULL DEFAULT '',
  `klanid` int(11) NOT NULL DEFAULT '0',
  `klan_name` varchar(255) NOT NULL DEFAULT '',
  `pdate` int(11) NOT NULL DEFAULT '0' COMMENT 'время сдачи',
  `ecost` int(11) NOT NULL DEFAULT '0' COMMENT 'стоимость ваучера',
  PRIMARY KEY (`itemid`),
  KEY `pdate` (`pdate`),
  KEY `klanid` (`klanid`),
  KEY `klan_name` (`klan_name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='индексная таблица - для продажи ваучеров кланам';

DROP TABLE IF EXISTS `clans_reg`;
CREATE TABLE `clans_reg` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `abr` varchar(200) NOT NULL DEFAULT '',
  `http` varchar(255) NOT NULL DEFAULT '',
  `sznak` varchar(155) NOT NULL DEFAULT '',
  `bznak` varchar(155) NOT NULL DEFAULT '',
  `align` varchar(5) NOT NULL DEFAULT '',
  `descr` text NOT NULL,
  `base_klan` int(55) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`abr`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_war_2`;
CREATE TABLE `clans_war_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `war_id` int(11) NOT NULL DEFAULT '0',
  `agressor` int(11) NOT NULL DEFAULT '0',
  `defender` int(11) NOT NULL DEFAULT '0',
  `date` int(25) NOT NULL DEFAULT '0' COMMENT 'Время окончания войны',
  `agr_active` tinyint(3) NOT NULL DEFAULT '0',
  `def_active` tinyint(3) NOT NULL DEFAULT '0',
  `osnova` tinyint(3) NOT NULL DEFAULT '0',
  `win1` int(5) NOT NULL DEFAULT '0' COMMENT 'agressor',
  `win2` int(5) NOT NULL DEFAULT '0' COMMENT 'defender',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agressor` (`agressor`,`defender`,`war_id`),
  KEY `agressor_2` (`agressor`),
  KEY `defender` (`defender`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=3399 DEFAULT CHARSET=cp1251 COMMENT='война кланов';

DROP TABLE IF EXISTS `clans_war_ally`;
CREATE TABLE `clans_war_ally` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_zayavka` int(6) DEFAULT NULL,
  `war_klan` int(11) NOT NULL DEFAULT '0',
  `helper_klan` int(11) NOT NULL DEFAULT '0',
  `helper_answer` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `1agrr1helper` (`war_klan`,`helper_klan`),
  KEY `agrr` (`war_klan`),
  KEY `def` (`helper_klan`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='тут живут объявления войн, ответы и формирование альянса';

DROP TABLE IF EXISTS `clans_war_city_sync`;
CREATE TABLE `clans_war_city_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `war_with` text NOT NULL,
  `war_id` int(11) NOT NULL DEFAULT '0',
  `stime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время старта',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`war_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31296 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_war_log`;
CREATE TABLE `clans_war_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt` text,
  `txt1` text,
  `fin_w` varchar(70) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `start_time` int(15) DEFAULT NULL,
  `war_id` int(11) NOT NULL DEFAULT '0',
  `winner` tinyint(3) NOT NULL DEFAULT '0',
  `def_answer` tinyint(2) DEFAULT NULL COMMENT '1 отказал, 2 ответид',
  `begin_txt` varchar(100) DEFAULT NULL COMMENT 'текст о начале войны',
  `agrr_arkan_count` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик использованых арканов att',
  `agrr_arkan_maxcount` int(11) NOT NULL DEFAULT '3' COMMENT 'счетчик макисмальных арканов att',
  `def_arkan_count` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик использованых арканов def',
  `def_arkan_maxcount` int(11) NOT NULL DEFAULT '3' COMMENT 'счетчик максимальных арканов def',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `time` (`start_time`),
  KEY `war_id` (`war_id`),
  KEY `type` (`type`),
  KEY `winner` (`winner`)
) ENGINE=InnoDB AUTO_INCREMENT=2159 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_war_new`;
CREATE TABLE `clans_war_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'номер войны',
  `agressor` int(11) NOT NULL DEFAULT '0' COMMENT 'кто напал',
  `agr_txt` text COMMENT 'кеш для названия клана агрессора',
  `defender` int(11) NOT NULL DEFAULT '0' COMMENT 'на кого напали',
  `def_txt` text COMMENT 'кеш для названия клана дефендера',
  `wtype` smallint(6) NOT NULL DEFAULT '1' COMMENT 'тип войны 1-Дуэльная война 2-Альянсовая война',
  `ztime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'подача вызова - создание',
  `stime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'начало войны',
  `ftime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время окончания',
  `winner` smallint(6) NOT NULL DEFAULT '0' COMMENT 'кто победил 0-активная/1-агр/2-def/3-ничья/4-отказ',
  `agr_ark` int(11) NOT NULL DEFAULT '0' COMMENT 'использованные арканы агрессора',
  `def_ark` int(11) NOT NULL DEFAULT '0' COMMENT 'использованные акраны дефендера',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15180 DEFAULT CHARSET=cp1251 COMMENT='новые клан вары';

DROP TABLE IF EXISTS `clans_war_new_ally`;
CREATE TABLE `clans_war_new_ally` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'просто ид',
  `warid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид войны',
  `clanid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана который в альянсе',
  `clan_txt` text COMMENT 'кеш клана который альянсе',
  `agressor` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана закого альянс если он за агрессора или 0',
  `defender` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана закого альянс если он за дефендера или 0',
  `active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'состояние альянса 0-неактив(только приглашение) 1-активный',
  PRIMARY KEY (`id`),
  KEY `warid` (`warid`),
  KEY `clanid` (`clanid`),
  KEY `agressor` (`agressor`),
  KEY `defender` (`defender`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=cp1251 COMMENT='таблица альянсов';

DROP TABLE IF EXISTS `clans_war_new_protect`;
CREATE TABLE `clans_war_new_protect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clanid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид клана',
  `fintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=cp1251 COMMENT='таймер защиты от нападения на клан';

DROP TABLE IF EXISTS `clans_war_new_times`;
CREATE TABLE `clans_war_new_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kl1` int(11) NOT NULL DEFAULT '0' COMMENT 'клан 1',
  `kl2` int(11) NOT NULL DEFAULT '0' COMMENT 'клан 2',
  `fintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время окончания',
  PRIMARY KEY (`id`),
  KEY `fintime` (`fintime`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=cp1251 COMMENT='таймер защиты от войн';

DROP TABLE IF EXISTS `clans_war_new_voin`;
CREATE TABLE `clans_war_new_voin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `war_id` int(11) NOT NULL DEFAULT '0',
  `stor` varchar(3) NOT NULL DEFAULT 'agr' COMMENT 'сторона agr/def',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'уровень для дуэльных воин',
  `voin` int(11) NOT NULL DEFAULT '0' COMMENT 'значение воинственности',
  `actual` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата создания / изменения - необходимо для просмотра за месяц',
  `winned` int(11) NOT NULL DEFAULT '0' COMMENT 'кол.выигранных боев',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `clan_id` (`clan_id`,`war_id`,`stor`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=113126 DEFAULT CHARSET=cp1251 COMMENT='начисления воинственности';

DROP TABLE IF EXISTS `clans_war_statistics`;
CREATE TABLE `clans_war_statistics` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `wins` int(10) NOT NULL DEFAULT '0',
  `fights` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `clans_war_vizov`;
CREATE TABLE `clans_war_vizov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agressor_id` int(11) NOT NULL DEFAULT '0',
  `defender_id` int(15) NOT NULL DEFAULT '0',
  `def_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-объявил, 1-глава проглядел(2часа), 2 таймер 1 истек, 3 заявка перенесена в войну',
  `defender_answer` tinyint(1) DEFAULT '0' COMMENT '1-НЕТ(или по тайму). 2-ДА.',
  `timer` int(11) NOT NULL DEFAULT '0' COMMENT 'старт войны (после всех таймеров)',
  `timer24` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agrr` (`agressor_id`),
  KEY `def` (`defender_id`),
  KEY `time` (`timer`),
  KEY `time2` (`timer24`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=968 DEFAULT CHARSET=cp1251 COMMENT='тут живут объявления войн, ответы и формирование альянса';

DROP TABLE IF EXISTS `class_profile`;
CREATE TABLE `class_profile` (
  `owner` int(15) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `prof` int(11) NOT NULL DEFAULT '0' COMMENT 'поле номера комплекта. В состоянии 0 держит реальные вещи для комнаты оружейки',
  `pname` varchar(255) DEFAULT NULL COMMENT 'название профиля',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'профиль выбран по умолчанию',
  `sila` int(4) NOT NULL DEFAULT '0',
  `lovk` int(4) NOT NULL DEFAULT '0',
  `inta` int(4) NOT NULL DEFAULT '0',
  `vinos` int(4) NOT NULL DEFAULT '0',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `maxhp` int(6) NOT NULL DEFAULT '0',
  `hp` int(6) NOT NULL DEFAULT '0',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `stats` int(5) NOT NULL DEFAULT '0',
  `master` int(5) NOT NULL DEFAULT '0',
  `nakidka` int(55) NOT NULL DEFAULT '0' COMMENT 'накидка',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `bpbonushp` int(11) NOT NULL DEFAULT '0' COMMENT 'был ли бонуc на хп призапоминании',
  `rubashka` int(55) NOT NULL DEFAULT '0' COMMENT 'рубашка',
  `runa1` int(11) NOT NULL DEFAULT '0',
  `runa2` int(11) NOT NULL DEFAULT '0',
  `runa3` int(11) NOT NULL DEFAULT '0',
  `uclass` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`prof`),
  UNIQUE KEY `owner` (`owner`,`prof`,`pname`),
  UNIQUE KEY `owner_2` (`owner`,`pname`),
  KEY `prof` (`prof`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='состояние чара для боев классов';

DROP TABLE IF EXISTS `com_logs`;
CREATE TABLE `com_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4284 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `com_money`;
CREATE TABLE `com_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `msum` float(6,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма',
  `stat` smallint(6) NOT NULL DEFAULT '0' COMMENT 'статус',
  `mktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата подачи',
  `outwmz` varchar(13) NOT NULL DEFAULT '' COMMENT 'кошель на который запрос перевода',
  `logids` varchar(255) NOT NULL DEFAULT '' COMMENT 'лог для ид свитков которые сдали',
  `prim` varchar(255) NOT NULL DEFAULT '' COMMENT 'для приметок',
  `paydate` timestamp NULL DEFAULT NULL COMMENT 'когда выплатили',
  `logip` varchar(32) NOT NULL DEFAULT '' COMMENT 'ип заявителя',
  `odobtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда одобрили',
  `kof` float(6,4) NOT NULL DEFAULT '1.0000' COMMENT 'Курс екра к баксу',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20000406 DEFAULT CHARSET=cp1251 COMMENT='таблица запроса вывода денег';

DROP TABLE IF EXISTS `com_requests`;
CREATE TABLE `com_requests` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mess_time` int(11) NOT NULL DEFAULT '0',
  `login` text NOT NULL COMMENT 'Логин подавшего заявку',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип завки в зависимости от услуги',
  `status` varchar(255) DEFAULT NULL COMMENT 'Обработана ли, в рассмотрении и тд.',
  `paid` varchar(255) DEFAULT NULL COMMENT 'На всякий случай, оплачена ли.',
  `comment` text COMMENT 'Покаяние виновного ;о)',
  `charid` int(11) DEFAULT NULL,
  `whodoit` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `utime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addinfo` text NOT NULL,
  `ip` bigint(12) unsigned NOT NULL DEFAULT '0' COMMENT 'ip address',
  `showed` tinyint(3) NOT NULL DEFAULT '1',
  `bank_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'откуда платили',
  PRIMARY KEY (`Id`),
  KEY `utime` (`utime`),
  KEY `charid` (`charid`),
  KEY `login` (`login`(50)),
  KEY `comment` (`comment`(100)),
  KEY `type` (`type`),
  KEY `mess_time` (`mess_time`),
  KEY `addinfo` (`addinfo`(10))
) ENGINE=InnoDB AUTO_INCREMENT=12258 DEFAULT CHARSET=cp1251 COMMENT='Заявки в ком отдел';

DROP TABLE IF EXISTS `com_service`;
CREATE TABLE `com_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'операция',
  `cost` int(11) NOT NULL DEFAULT '0' COMMENT 'стоимость',
  `cost_gold` int(11) NOT NULL DEFAULT '0' COMMENT 'стоимость в золоте',
  `cost_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'каким типом уплачено',
  `stat` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'статус оплаты',
  `moder` int(11) NOT NULL DEFAULT '0' COMMENT 'кто утвердил 0- не утверждено',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'время создания записи',
  `param` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT 'картинка',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'кто',
  `klan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'если клан то ид клана',
  `dil` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL COMMENT 'метка для оптовой загрузки',
  `bank` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата из банка то номер счета',
  `target` int(11) DEFAULT NULL COMMENT 'если подарок другому чару',
  `mess` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'сообщенние об утверждении',
  `del_comm` varchar(255) NOT NULL DEFAULT '' COMMENT 'примечание при отказе при статусе 100',
  `addinfo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `stat` (`stat`),
  KEY `owner` (`owner`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10016973 DEFAULT CHARSET=cp1251 COMMENT='новая система заявок ком отдела';

DROP TABLE IF EXISTS `comission_indexes`;
CREATE TABLE `comission_indexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `duration` tinyint(3) NOT NULL DEFAULT '0',
  `max_dur` tinyint(3) DEFAULT '0',
  `name` varchar(150) DEFAULT NULL,
  `nalign` int(5) DEFAULT NULL,
  `massa` tinyint(3) DEFAULT NULL,
  `img` varchar(70) DEFAULT NULL,
  `prototype` int(255) NOT NULL DEFAULT '0',
  `otdel` int(11) NOT NULL DEFAULT '0',
  `id_city` tinyint(3) NOT NULL DEFAULT '0',
  `cost` float(10,2) NOT NULL DEFAULT '0.00',
  `timer` int(20) NOT NULL DEFAULT '0' COMMENT 'окончание лежания в комке',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`id_item`),
  KEY `owner` (`owner`),
  KEY `city` (`id_city`),
  KEY `prototype` (`prototype`),
  KEY `duration` (`duration`),
  KEY `otdel` (`otdel`),
  KEY `img` (`img`),
  KEY `timer` (`timer`)
) ENGINE=InnoDB AUTO_INCREMENT=5039128 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `config_ko_main`;
CREATE TABLE `config_ko_main` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '1',
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `config_ko_settings`;
CREATE TABLE `config_ko_settings` (
  `main_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `field_name` varchar(255) NOT NULL DEFAULT '',
  `field_value` text NOT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`main_id`,`group_id`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `confirmpasswd`;
CREATE TABLE `confirmpasswd` (
  `login` varchar(50) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `date` varchar(25) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`login`,`date`),
  KEY `active` (`active`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `confirmpasswd_bank`;
CREATE TABLE `confirmpasswd_bank` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `owner` bigint(255) NOT NULL DEFAULT '0',
  `bank` bigint(255) DEFAULT '0',
  `passwd` varchar(32) DEFAULT NULL,
  `date` varchar(25) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`,`date`),
  KEY `active` (`active`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='восстановление пасс от банка';

DROP TABLE IF EXISTS `confirmpasswd_new`;
CREATE TABLE `confirmpasswd_new` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `owner` bigint(255) NOT NULL DEFAULT '0',
  `passwd` blob NOT NULL,
  `active_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'код активации',
  `date` varchar(25) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`,`date`),
  KEY `active` (`active`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='восстановление пасс от игры для смены старых паролей';

DROP TABLE IF EXISTS `craft_captcha`;
CREATE TABLE `craft_captcha` (
  `owner` int(10) unsigned NOT NULL,
  `nextcaptcha` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `craft_formula`;
CREATE TABLE `craft_formula` (
  `craftid` int(10) unsigned NOT NULL DEFAULT '0',
  `craftprotoid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип в магазине',
  `craftprototype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'тип магаза, 1 - shop, 2 - eshop, 3 - cshop',
  `craftprotocount` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'количество вещей которое будет выдано после производства',
  `crafttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время  создания в минутах',
  `craftnalign` varchar(6) NOT NULL DEFAULT '' COMMENT 'нужна ли склонка',
  `craftnlevel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'нужен ли уровень',
  `craftnres` text NOT NULL COMMENT 'сериализованный массив с прото и колвом необходимых ресурсов',
  `craftgetexp` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'сколько экспы получаем после изготовления',
  `craftloc` int(11) unsigned NOT NULL DEFAULT '91' COMMENT 'для какой локи рецепт. начиная с 91 - кузница',
  `craftrazdel` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'раздел рецепта',
  `craftgetprof` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'в какую профу улетает экспа - айди из конфига',
  `craftcomplexity` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сложность рецепта',
  `craftnsila` int(5) NOT NULL DEFAULT '0',
  `craftnlovk` int(5) NOT NULL DEFAULT '0',
  `craftninta` int(5) NOT NULL DEFAULT '0',
  `craftnvinos` int(5) NOT NULL DEFAULT '0',
  `craftnintel` int(5) NOT NULL DEFAULT '0',
  `craftnmudra` int(5) NOT NULL DEFAULT '0',
  `craftnnoj` int(2) NOT NULL DEFAULT '0',
  `craftntopor` int(2) NOT NULL DEFAULT '0',
  `craftndubina` int(2) NOT NULL DEFAULT '0',
  `craftnmech` int(2) NOT NULL DEFAULT '0',
  `craftnfire` int(3) NOT NULL DEFAULT '0',
  `craftnwater` int(3) NOT NULL DEFAULT '0',
  `craftnair` int(3) NOT NULL DEFAULT '0',
  `craftnearth` int(3) NOT NULL DEFAULT '0',
  `craftnlight` int(3) NOT NULL DEFAULT '0',
  `craftngray` int(3) NOT NULL DEFAULT '0',
  `craftndark` int(3) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'включен ли рецепт',
  `is_vaza` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'рецепт с вазой?',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'удалён ли рецепт',
  `craftnprofhunter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofwoodman` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofminer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnproffarmer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofherbalist` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofcook` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofsmith` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofarmorer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofarmorsmith` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnproftailor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofjeweler` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofalchemist` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofmage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofcarpenter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnprofprospector` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftmfchance` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'шанс крафта топ мф сразу',
  `craftgoden` int(11) unsigned NOT NULL DEFAULT '0',
  `craftis_present` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftpresent` varchar(255) NOT NULL DEFAULT '',
  `craftsowner` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnotsell` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftunik` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftnaem` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'рецепт только для наёмника',
  PRIMARY KEY (`craftid`),
  KEY `loc` (`craftloc`),
  KEY `razdel` (`craftrazdel`),
  KEY `nlevel` (`craftnlevel`),
  KEY `is_enabled` (`is_enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_ins`;
CREATE TABLE `craft_ins` (
  `insid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `razdelid` int(11) NOT NULL DEFAULT '0',
  `insprotoid` int(11) NOT NULL,
  PRIMARY KEY (`insid`),
  KEY `razdelid` (`razdelid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_job`;
CREATE TABLE `craft_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `loc` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'лока, 91 кузница и тд',
  `itemcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'количество заказанных вещей',
  `itemleft` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'сколько вещей осталось',
  `crafttime` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'время крафта одной вещи в МИНУТАХ!',
  `craftlefttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'оставшееся время в секундах',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'статус. 1 - в работе, 2 - на паузе',
  `jobprotoid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип вещи которую производим',
  `jobprototype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'айди магазин из которого производим вещь, 1 - shop, 2 - eshop, 3 - cshop',
  `itemname` varchar(255) NOT NULL DEFAULT '' COMMENT 'название вещи на производство',
  `rcid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'айди рецепта который производим',
  `itemimg` varchar(255) NOT NULL DEFAULT '',
  `insproto` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип инструмента с которого был запуск',
  `linkcache` varchar(255) NOT NULL DEFAULT '',
  `craftchance` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'шанс крафта',
  `craftmfchance` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'шанс крафта топмф',
  `lastupdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего обновления - для крона',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`,`loc`),
  KEY `owner_2` (`owner`),
  KEY `lastupdate` (`lastupdate`),
  KEY `status` (`status`),
  KEY `rcid` (`rcid`)
) ENGINE=InnoDB AUTO_INCREMENT=4309293 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_locations`;
CREATE TABLE `craft_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `helpname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_prof`;
CREATE TABLE `craft_prof` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 - производственная профа, 1 - добывающая',
  `desc` text NOT NULL COMMENT 'описание',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_razdel`;
CREATE TABLE `craft_razdel` (
  `id` int(10) unsigned NOT NULL,
  `locationid` int(10) unsigned NOT NULL,
  `razdel` int(10) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locationid` (`locationid`,`razdel`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_sellstats`;
CREATE TABLE `craft_sellstats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `itemname` varchar(255) NOT NULL,
  `itemcount` int(10) unsigned NOT NULL DEFAULT '0',
  `selltime` date NOT NULL DEFAULT '0000-00-00',
  `itemprice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `getmoney` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `selltime` (`selltime`)
) ENGINE=InnoDB AUTO_INCREMENT=261755 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `craft_stats`;
CREATE TABLE `craft_stats` (
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 - старт производства, 2 - отмена, 3 - ускорение, 4 - удачное, 5 - неудачное производства, 6 - отработанное время, 7 - получено опыта',
  `val1` int(10) unsigned NOT NULL DEFAULT '0',
  `val2` int(10) unsigned NOT NULL DEFAULT '0',
  `val3` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `countnumeric` decimal(10,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `owner` (`owner`,`type`,`val1`,`val2`,`val3`,`date`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `cshop`;
CREATE TABLE `cshop` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` int(5) NOT NULL DEFAULT '0',
  `maxdur` int(5) NOT NULL DEFAULT '0',
  `cost` float(10,2) NOT NULL DEFAULT '0.00',
  `count` int(5) NOT NULL DEFAULT '0',
  `avacount` int(11) NOT NULL DEFAULT '0',
  `angcount` int(11) NOT NULL DEFAULT '0',
  `nlevel` int(2) NOT NULL DEFAULT '0',
  `nsila` int(5) NOT NULL DEFAULT '0',
  `nlovk` int(5) NOT NULL DEFAULT '0',
  `ninta` int(5) NOT NULL DEFAULT '0',
  `nvinos` int(5) NOT NULL DEFAULT '0',
  `nintel` int(5) NOT NULL DEFAULT '0',
  `nmudra` int(5) NOT NULL DEFAULT '0',
  `nnoj` int(2) NOT NULL DEFAULT '0',
  `ntopor` int(2) NOT NULL DEFAULT '0',
  `ndubina` int(2) NOT NULL DEFAULT '0',
  `nmech` int(2) NOT NULL DEFAULT '0',
  `nalign` int(5) NOT NULL DEFAULT '0',
  `minu` int(5) NOT NULL DEFAULT '0',
  `maxu` int(5) NOT NULL DEFAULT '0',
  `gsila` int(5) NOT NULL DEFAULT '0',
  `glovk` int(5) NOT NULL DEFAULT '0',
  `ginta` int(5) NOT NULL DEFAULT '0',
  `gintel` int(5) NOT NULL DEFAULT '0',
  `ghp` int(5) NOT NULL DEFAULT '0',
  `gmp` int(10) NOT NULL,
  `mfkrit` int(5) NOT NULL DEFAULT '0',
  `mfakrit` int(5) NOT NULL DEFAULT '0',
  `mfuvorot` int(5) NOT NULL DEFAULT '0',
  `mfauvorot` int(5) NOT NULL DEFAULT '0',
  `gnoj` int(5) NOT NULL DEFAULT '0',
  `gtopor` int(5) NOT NULL DEFAULT '0',
  `gdubina` int(5) NOT NULL DEFAULT '0',
  `gmech` int(5) NOT NULL DEFAULT '0',
  `img` varchar(100) NOT NULL DEFAULT '',
  `shshop` tinyint(1) NOT NULL DEFAULT '0',
  `bron1` int(5) NOT NULL DEFAULT '0',
  `bron2` int(5) NOT NULL DEFAULT '0',
  `bron3` int(5) NOT NULL DEFAULT '0',
  `bron4` int(5) NOT NULL DEFAULT '0',
  `dategoden` int(15) NOT NULL DEFAULT '0',
  `magic` int(5) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `massa` float(4,1) NOT NULL DEFAULT '0.0',
  `goden` int(4) NOT NULL DEFAULT '0',
  `needident` tinyint(1) NOT NULL DEFAULT '0',
  `nfire` int(3) NOT NULL DEFAULT '0',
  `nwater` int(3) NOT NULL DEFAULT '0',
  `nair` int(3) NOT NULL DEFAULT '0',
  `nearth` int(3) NOT NULL DEFAULT '0',
  `nlight` int(3) NOT NULL DEFAULT '0',
  `ngray` int(3) NOT NULL DEFAULT '0',
  `ndark` int(3) NOT NULL DEFAULT '0',
  `gfire` int(3) NOT NULL DEFAULT '0',
  `gwater` int(3) NOT NULL DEFAULT '0',
  `gair` int(3) NOT NULL DEFAULT '0',
  `gearth` int(3) NOT NULL DEFAULT '0',
  `glight` int(3) NOT NULL DEFAULT '0',
  `ggray` int(3) NOT NULL DEFAULT '0',
  `gdark` int(3) NOT NULL DEFAULT '0',
  `letter` text NOT NULL,
  `isrep` tinyint(1) NOT NULL DEFAULT '1',
  `razdel` int(3) NOT NULL DEFAULT '0',
  `nsex` tinyint(3) NOT NULL DEFAULT '0',
  `gmeshok` int(55) NOT NULL,
  `group` int(5) NOT NULL DEFAULT '0',
  `wopen` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'открыто или закрыто для оружейки',
  `ab_mf` int(11) NOT NULL DEFAULT '0',
  `ab_bron` int(11) NOT NULL DEFAULT '0',
  `ab_uron` int(11) NOT NULL DEFAULT '0',
  `need_wins` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько надо побед',
  `artproto` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'включено ли для прототипа артифакта',
  `ecost` float(10,2) NOT NULL DEFAULT '0.00',
  `glava` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'для покупок глав кланов',
  `includemagic` int(11) NOT NULL,
  `includemagiccost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicdex` int(11) NOT NULL,
  `includemagicekrcost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicmax` int(11) NOT NULL,
  `includemagicname` varchar(100) NOT NULL,
  `includemagicuses` int(5) NOT NULL,
  `klan` varchar(255) DEFAULT NULL COMMENT 'для клановых предметов',
  `owner` int(255) NOT NULL DEFAULT '0' COMMENT 'для именых предметов чара',
  `charge_rep` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'флаг списывать ли репу',
  `is_owner` tinyint(3) NOT NULL DEFAULT '0',
  `mfbonus` int(11) NOT NULL DEFAULT '0' COMMENT 'mfbonus',
  `unikflag` int(11) unsigned NOT NULL DEFAULT '0',
  `stbonus` int(11) unsigned NOT NULL DEFAULT '0',
  `ekr_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `img_big` varchar(100) NOT NULL DEFAULT '',
  `rareitem` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `repcost` int(11) NOT NULL DEFAULT '0',
  `notsell` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftspeedup` int(11) unsigned NOT NULL DEFAULT '0',
  `craftbonus` int(11) unsigned NOT NULL DEFAULT '0',
  `nclass` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dressroom` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `new_item` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг нового предмета',
  `shopbanner` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'номера банеров 1- Новинка , 2 - Акция',
  PRIMARY KEY (`id`),
  KEY `count` (`count`),
  KEY `razdel` (`razdel`),
  KEY `avacount` (`avacount`),
  KEY `artproto` (`artproto`),
  KEY `img` (`img`),
  KEY `unikflag` (`unikflag`)
) ENGINE=InnoDB AUTO_INCREMENT=222222256 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `daily_free`;
CREATE TABLE `daily_free` (
  `user_id` int(11) unsigned NOT NULL,
  `essence` varchar(255) NOT NULL DEFAULT '',
  `uses` int(11) DEFAULT '0',
  `limit_uses` int(11) NOT NULL DEFAULT '0',
  `used_total` int(11) DEFAULT '0',
  `limit_used_total` int(11) NOT NULL DEFAULT '0',
  `added_at` int(11) DEFAULT '0',
  `is_finished` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`,`essence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dealers`;
CREATE TABLE `dealers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL,
  `sumekr` decimal(10,2) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `discount` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'включает возможность выдавать бонусы по дисконт-системе',
  PRIMARY KEY (`Id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=cp1251 COMMENT='for Dealers';

DROP TABLE IF EXISTS `dealers_tranz`;
CREATE TABLE `dealers_tranz` (
  `tranz` int(11) NOT NULL DEFAULT '0' COMMENT 'ид внешней системы',
  `dstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dilid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tranz`,`dilid`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблица транзакций';

DROP TABLE IF EXISTS `delo_ars`;
CREATE TABLE `delo_ars` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `author` int(255) NOT NULL DEFAULT '0',
  `pers` int(255) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT '',
  `text_ext` text NOT NULL,
  `type` int(2) NOT NULL DEFAULT '0',
  `date` int(15) NOT NULL DEFAULT '0',
  `battle` int(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pers` (`pers`)
) ENGINE=InnoDB AUTO_INCREMENT=11378642 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `delo_multi`;
CREATE TABLE `delo_multi` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `idperslater` int(255) NOT NULL,
  `idpersnow` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idperslater` (`idperslater`,`idpersnow`),
  KEY `idperslater_2` (`idperslater`),
  KEY `idpersnow` (`idpersnow`)
) ENGINE=InnoDB AUTO_INCREMENT=2899557 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_charstams`;
CREATE TABLE `deztow_charstams` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `def` tinyint(1) NOT NULL,
  `prize` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-XP,1-REP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=16031 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_eff`;
CREATE TABLE `deztow_eff` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `time` int(55) NOT NULL DEFAULT '0',
  `sila` int(4) NOT NULL DEFAULT '0',
  `lovk` int(4) NOT NULL DEFAULT '0',
  `inta` int(4) NOT NULL DEFAULT '0',
  `vinos` int(4) NOT NULL DEFAULT '0',
  `owner` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_gamers_inv`;
CREATE TABLE `deztow_gamers_inv` (
  `id_item` int(255) NOT NULL DEFAULT '0',
  `owner` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_items`;
CREATE TABLE `deztow_items` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `iteam_id` int(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `room` int(4) NOT NULL DEFAULT '0',
  `present` varchar(255) DEFAULT NULL,
  `duration` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`iteam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_logs`;
CREATE TABLE `deztow_logs` (
  `id` int(10) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_realchars`;
CREATE TABLE `deztow_realchars` (
  `owner` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `stats` int(15) NOT NULL,
  `nextup` int(11) NOT NULL,
  `level` int(2) NOT NULL,
  `master` int(5) NOT NULL,
  `bpbonussila` int(5) NOT NULL DEFAULT '0',
  `bpbonushp` int(5) NOT NULL DEFAULT '0',
  `noj` int(5) NOT NULL,
  `mec` int(5) NOT NULL,
  `topor` int(5) NOT NULL,
  `dubina` int(5) NOT NULL,
  `mfire` int(5) NOT NULL,
  `mwater` int(5) NOT NULL,
  `mair` int(5) NOT NULL,
  `mearth` int(5) NOT NULL,
  `mlight` int(5) NOT NULL,
  `mgray` int(5) NOT NULL,
  `mdark` int(5) NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_stavka`;
CREATE TABLE `deztow_stavka` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL DEFAULT '0',
  `kredit` float NOT NULL DEFAULT '0',
  `time` int(20) NOT NULL DEFAULT '0',
  `labid` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stavka` (`owner`,`labid`),
  KEY `labid` (`labid`)
) ENGINE=InnoDB AUTO_INCREMENT=155410 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_trap`;
CREATE TABLE `deztow_trap` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL,
  `room` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `room` (`room`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `deztow_turnir`;
CREATE TABLE `deztow_turnir` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '0',
  `winner` varchar(255) NOT NULL DEFAULT '',
  `coin` float NOT NULL DEFAULT '0',
  `start_time` int(55) NOT NULL DEFAULT '0',
  `log` longblob NOT NULL,
  `endtime` int(55) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `winnerlog` text NOT NULL,
  `art` tinyint(1) DEFAULT '0',
  `lvl` tinyint(3) NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `type` (`type`),
  KEY `art` (`art`),
  KEY `coin` (`coin`),
  KEY `start_time` (`start_time`),
  KEY `endtime` (`endtime`)
) ENGINE=InnoDB AUTO_INCREMENT=9396 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dilerdelo`;
CREATE TABLE `dilerdelo` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `dilerid` int(50) NOT NULL DEFAULT '0',
  `dilername` varchar(50) NOT NULL,
  `bank` int(50) NOT NULL DEFAULT '0',
  `owner` varchar(50) NOT NULL,
  `ekr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addition` int(5) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `klan` varchar(255) DEFAULT '' COMMENT 'клан чара',
  `kof` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT 'коэф',
  `b` tinyint(3) NOT NULL DEFAULT '1',
  `paysyst` varchar(100) NOT NULL DEFAULT '' COMMENT 'платежная система',
  `sub_trx` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид транзы если оплата через суб партнера',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dilerid` (`dilerid`),
  KEY `owner` (`owner`),
  KEY `owner_2` (`owner`,`dilername`),
  KEY `dilername` (`dilername`)
) ENGINE=InnoDB AUTO_INCREMENT=834166 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dressroom_compl`;
CREATE TABLE `dressroom_compl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2494 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dressroom_items`;
CREATE TABLE `dressroom_items` (
  `item_id` int(11) unsigned NOT NULL,
  `shop_id` int(11) NOT NULL,
  `dressroom_shop_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT '0',
  `is_mf` int(11) NOT NULL DEFAULT '0',
  `is_unik` int(11) NOT NULL DEFAULT '0',
  `is_uunik` int(11) NOT NULL DEFAULT '0',
  `can_mf` int(11) NOT NULL DEFAULT '1',
  `can_podgon` int(11) NOT NULL DEFAULT '1',
  `can_u` int(11) NOT NULL DEFAULT '1',
  `can_uu` int(11) NOT NULL DEFAULT '1',
  `can_u_art` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`item_id`,`shop_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dt_items`;
CREATE TABLE `dt_items` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(255) NOT NULL,
  `iteam_id` int(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `room` int(4) NOT NULL DEFAULT '0',
  `present` varchar(255) DEFAULT NULL,
  `extra` int(255) NOT NULL,
  `durability` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `room` (`room`)
) ENGINE=InnoDB AUTO_INCREMENT=3207677 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dt_log`;
CREATE TABLE `dt_log` (
  `dt_id` int(10) unsigned NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`dt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dt_map`;
CREATE TABLE `dt_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(3) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `winner` int(10) unsigned NOT NULL,
  `winnerlog` text NOT NULL,
  `prize` decimal(10,2) unsigned NOT NULL,
  `arttype` tinyint(3) unsigned NOT NULL,
  `ragetype` tinyint(3) unsigned NOT NULL,
  `greedtype` tinyint(3) unsigned NOT NULL,
  `darktype` tinyint(3) unsigned NOT NULL,
  `whitetype` tinyint(3) unsigned NOT NULL,
  `halftype` tinyint(3) unsigned NOT NULL,
  `hptype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hiddentype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'невидимая БС',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `starttime` (`starttime`),
  KEY `endtime` (`endtime`),
  KEY `winner` (`winner`),
  KEY `prize` (`prize`),
  KEY `starttime_2` (`starttime`,`endtime`)
) ENGINE=InnoDB AUTO_INCREMENT=17696 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dt_profile`;
CREATE TABLE `dt_profile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sila` int(11) unsigned NOT NULL,
  `lovk` int(11) unsigned NOT NULL,
  `inta` int(11) unsigned NOT NULL,
  `vinos` int(11) unsigned NOT NULL,
  `intel` int(11) unsigned NOT NULL,
  `mudra` int(11) unsigned NOT NULL,
  `def` tinyint(1) unsigned NOT NULL,
  `prize` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0-XP,1-REP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=12287 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dt_rate`;
CREATE TABLE `dt_rate` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(255) unsigned NOT NULL DEFAULT '0',
  `credit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `time` int(20) unsigned NOT NULL DEFAULT '0',
  `dtid` int(20) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rate` (`owner`,`dtid`),
  KEY `dtid` (`dtid`)
) ENGINE=InnoDB AUTO_INCREMENT=136107 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dt_realchars`;
CREATE TABLE `dt_realchars` (
  `owner` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `stats` int(15) NOT NULL,
  `nextup` int(11) NOT NULL,
  `level` int(2) NOT NULL,
  `master` int(5) NOT NULL,
  `bpbonussila` int(5) NOT NULL DEFAULT '0',
  `bpbonushp` int(5) NOT NULL DEFAULT '0',
  `noj` int(5) NOT NULL,
  `mec` int(5) NOT NULL,
  `topor` int(5) NOT NULL,
  `dubina` int(5) NOT NULL,
  `mfire` int(5) NOT NULL,
  `mwater` int(5) NOT NULL,
  `mair` int(5) NOT NULL,
  `mearth` int(5) NOT NULL,
  `mlight` int(5) NOT NULL,
  `mgray` int(5) NOT NULL,
  `mdark` int(5) NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `dt_usersvar`;
CREATE TABLE `dt_usersvar` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `var` varchar(255) NOT NULL DEFAULT '',
  `val` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='глобальные переменные для башни';

DROP TABLE IF EXISTS `dt_var`;
CREATE TABLE `dt_var` (
  `var` varchar(255) NOT NULL,
  `valchar` varchar(255) NOT NULL,
  `valint` int(10) unsigned NOT NULL,
  PRIMARY KEY (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `economy`;
CREATE TABLE `economy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `levels` int(5) NOT NULL DEFAULT '0' COMMENT 'уровень',
  `kol` int(11) NOT NULL DEFAULT '0' COMMENT 'количество персов',
  `kr_by_item` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма кредов в вещах',
  `ekr_by_item` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма екров в вещах',
  `kr_by_users` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма в кредах у чаров',
  `ekr_by_users` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма в екреах у чаров - выключено',
  `bank_kr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'банк кредовый',
  `bank_ekr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'Банк екровый',
  `ddate` int(11) NOT NULL DEFAULT '0' COMMENT 'штамп даты когда сделаны данные',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7348 DEFAULT CHARSET=cp1251 COMMENT='мониторинг экономики';

DROP TABLE IF EXISTS `effects`;
CREATE TABLE `effects` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `time` int(55) NOT NULL DEFAULT '0',
  `sila` int(4) NOT NULL DEFAULT '0',
  `lovk` int(4) NOT NULL DEFAULT '0',
  `inta` int(4) NOT NULL DEFAULT '0',
  `vinos` int(4) NOT NULL DEFAULT '0',
  `intel` int(11) NOT NULL DEFAULT '0',
  `owner` int(255) NOT NULL DEFAULT '0',
  `lastup` int(25) NOT NULL,
  `idiluz` bigint(11) DEFAULT '0',
  `pal` int(3) NOT NULL DEFAULT '0' COMMENT 'пал флаг',
  `add_info` text,
  `battle` int(25) DEFAULT NULL COMMENT 'для новой боевки',
  `eff_bonus` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'отработал ли бонус',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `owner` (`owner`),
  KEY `time` (`time`),
  KEY `battle` (`owner`,`battle`),
  KEY `lastup` (`lastup`),
  KEY `owner_2` (`owner`,`type`),
  KEY `owner_3` (`owner`,`type`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=35376185 DEFAULT CHARSET=cp1251 COMMENT='77-тип защита от нападения в турнире';

DROP TABLE IF EXISTS `eggs`;
CREATE TABLE `eggs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `listid` int(11) unsigned NOT NULL DEFAULT '0',
  `prototype` int(10) unsigned NOT NULL,
  `shop_id` tinyint(3) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `allcount` int(10) unsigned NOT NULL,
  `left` int(10) unsigned NOT NULL,
  `ekrprice` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ekrpayments`;
CREATE TABLE `ekrpayments` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `summa` float NOT NULL,
  `bank` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank` (`bank`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `elka`;
CREATE TABLE `elka` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `who` varchar(255) NOT NULL DEFAULT '',
  `date` varchar(16) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `elka_2011`;
CREATE TABLE `elka_2011` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT '0',
  `date` int(20) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `align` float DEFAULT NULL,
  `klan` varchar(50) DEFAULT NULL,
  `level` int(2) DEFAULT NULL,
  `del_id` int(10) NOT NULL DEFAULT '0',
  `del_login` varchar(25) NOT NULL DEFAULT '0',
  `del_level` int(2) NOT NULL DEFAULT '0',
  `del_align` float NOT NULL DEFAULT '0',
  `del_klan` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=cp1251 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `eshop`;
CREATE TABLE `eshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` int(5) NOT NULL DEFAULT '0',
  `maxdur` int(5) NOT NULL DEFAULT '0',
  `cost` float(10,2) NOT NULL,
  `count` int(5) NOT NULL DEFAULT '0',
  `avacount` int(11) NOT NULL DEFAULT '0' COMMENT 'кол. авалоне',
  `angcount` int(11) NOT NULL DEFAULT '0',
  `nlevel` int(2) NOT NULL DEFAULT '0',
  `nsila` int(5) NOT NULL DEFAULT '0',
  `nlovk` int(5) NOT NULL DEFAULT '0',
  `ninta` int(5) NOT NULL DEFAULT '0',
  `nvinos` int(5) NOT NULL DEFAULT '0',
  `nintel` int(5) NOT NULL DEFAULT '0',
  `nmudra` int(5) NOT NULL DEFAULT '0',
  `nnoj` int(2) NOT NULL DEFAULT '0',
  `ntopor` int(2) NOT NULL DEFAULT '0',
  `ndubina` int(2) NOT NULL DEFAULT '0',
  `nmech` int(2) NOT NULL DEFAULT '0',
  `nalign` int(5) NOT NULL DEFAULT '0',
  `minu` int(5) NOT NULL DEFAULT '0',
  `maxu` int(5) NOT NULL DEFAULT '0',
  `gsila` int(5) NOT NULL DEFAULT '0',
  `glovk` int(5) NOT NULL DEFAULT '0',
  `ginta` int(5) NOT NULL DEFAULT '0',
  `gintel` int(5) NOT NULL DEFAULT '0',
  `ghp` int(5) NOT NULL DEFAULT '0',
  `gmp` int(5) NOT NULL DEFAULT '0' COMMENT 'Мудрость',
  `mfkrit` int(5) NOT NULL DEFAULT '0',
  `mfakrit` int(5) NOT NULL DEFAULT '0',
  `mfuvorot` int(5) NOT NULL DEFAULT '0',
  `mfauvorot` int(5) NOT NULL DEFAULT '0',
  `gnoj` int(5) NOT NULL DEFAULT '0',
  `gtopor` int(5) NOT NULL DEFAULT '0',
  `gdubina` int(5) NOT NULL DEFAULT '0',
  `gmech` int(5) NOT NULL DEFAULT '0',
  `img` varchar(100) NOT NULL DEFAULT '',
  `shshop` tinyint(1) NOT NULL DEFAULT '0',
  `bron1` int(5) NOT NULL DEFAULT '0',
  `bron2` int(5) NOT NULL DEFAULT '0',
  `bron3` int(5) NOT NULL DEFAULT '0',
  `bron4` int(5) NOT NULL DEFAULT '0',
  `dategoden` int(15) NOT NULL DEFAULT '0',
  `magic` int(5) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `massa` float(4,1) NOT NULL DEFAULT '0.0',
  `goden` int(4) NOT NULL DEFAULT '0',
  `needident` tinyint(1) NOT NULL DEFAULT '0',
  `nfire` int(3) NOT NULL DEFAULT '0',
  `nwater` int(3) NOT NULL DEFAULT '0',
  `nair` int(3) NOT NULL DEFAULT '0',
  `nearth` int(3) NOT NULL DEFAULT '0',
  `nlight` int(3) NOT NULL DEFAULT '0',
  `ngray` int(3) NOT NULL DEFAULT '0',
  `ndark` int(3) NOT NULL DEFAULT '0',
  `gfire` int(3) NOT NULL DEFAULT '0',
  `gwater` int(3) NOT NULL DEFAULT '0',
  `gair` int(3) NOT NULL DEFAULT '0',
  `gearth` int(3) NOT NULL DEFAULT '0',
  `glight` int(3) NOT NULL DEFAULT '0',
  `ggray` int(3) NOT NULL DEFAULT '0',
  `gdark` int(3) NOT NULL DEFAULT '0',
  `letter` text NOT NULL,
  `isrep` tinyint(1) NOT NULL DEFAULT '1',
  `razdel` int(3) NOT NULL DEFAULT '0',
  `nsex` smallint(6) NOT NULL DEFAULT '0',
  `gmeshok` int(11) NOT NULL DEFAULT '0',
  `group` int(5) NOT NULL DEFAULT '0',
  `wopen` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'открыто или закрыто для оружейки',
  `ab_mf` int(11) NOT NULL DEFAULT '0',
  `ab_bron` int(11) NOT NULL DEFAULT '0',
  `ab_uron` int(11) NOT NULL DEFAULT '0',
  `need_wins` int(11) NOT NULL DEFAULT '0' COMMENT 'нужно попед',
  `artproto` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'включено ли для прототипа артифакта',
  `ecost` float(10,2) DEFAULT NULL,
  `glava` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'для покупок глав кланов',
  `includemagic` int(11) NOT NULL DEFAULT '0',
  `includemagiccost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicdex` int(11) NOT NULL DEFAULT '0',
  `includemagicekrcost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicmax` int(11) NOT NULL DEFAULT '0',
  `includemagicname` varchar(100) NOT NULL DEFAULT '',
  `includemagicuses` int(5) NOT NULL DEFAULT '0',
  `klan` varchar(255) DEFAULT NULL COMMENT 'для клановых предметов',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'для именых предметов чара',
  `charge_rep` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'флаг списывать ли репу',
  `is_owner` tinyint(3) NOT NULL DEFAULT '0',
  `mfbonus` int(11) NOT NULL DEFAULT '0',
  `unikflag` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'для ком отдела, для продажи уников',
  `stbonus` int(11) NOT NULL DEFAULT '0' COMMENT 'stbonus',
  `ekr_flag` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'флаг',
  `img_big` varchar(100) NOT NULL DEFAULT '',
  `rareitem` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `repcost` int(11) unsigned NOT NULL DEFAULT '0',
  `notsell` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftspeedup` int(11) unsigned NOT NULL DEFAULT '0',
  `craftbonus` int(11) unsigned NOT NULL DEFAULT '0',
  `nclass` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dressroom` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `new_item` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг нового предмета',
  `shopbanner` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'номера банеров 1- Новинка , 2 - Акция',
  PRIMARY KEY (`id`),
  KEY `count` (`count`),
  KEY `avacount` (`avacount`),
  KEY `razdel` (`razdel`),
  KEY `artproto` (`artproto`),
  KEY `img` (`img`),
  KEY `unikflag` (`unikflag`)
) ENGINE=InnoDB AUTO_INCREMENT=2123456861 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `event_loto`;
CREATE TABLE `event_loto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `itm` int(11) unsigned NOT NULL DEFAULT '0',
  `win` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28513 DEFAULT CHARSET=cp1251 COMMENT='пасхальное лото, списки овнеров';

DROP TABLE IF EXISTS `event_loto_items`;
CREATE TABLE `event_loto_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemproto` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'из еshop',
  `kol` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=cp1251 COMMENT='прототипы призов и их кол-во';

DROP TABLE IF EXISTS `event_loto_win`;
CREATE TABLE `event_loto_win` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `inf` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=cp1251 COMMENT='победители';

DROP TABLE IF EXISTS `event_rating`;
CREATE TABLE `event_rating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `icon` varchar(255) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `link_encicl` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '0',
  `enable_type` varchar(255) NOT NULL DEFAULT '',
  `iteration_num` int(11) DEFAULT '1',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `reward_till_days` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `event_rating_condition`;
CREATE TABLE `event_rating_condition` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` int(11) DEFAULT NULL,
  `condition_type` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `exchange`;
CREATE TABLE `exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'кто продает',
  `etype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'направление перевода пока 0 екры на креды',
  `summ` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сумма',
  `kurs` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'курс',
  `mkdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bankid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'с какого счета выставленно',
  `komis` decimal(6,3) unsigned NOT NULL DEFAULT '0.000' COMMENT 'комиссия',
  `fintime` timestamp NULL DEFAULT NULL COMMENT 'время окончания лота',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=cp1251 COMMENT='биржа';

DROP TABLE IF EXISTS `exchange_byekrs`;
CREATE TABLE `exchange_byekrs` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `sdate` date NOT NULL DEFAULT '0000-00-00' COMMENT 'дата покупки',
  `ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`owner`,`sdate`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='покупки екров для подсчета лимитов';

DROP TABLE IF EXISTS `exchange_log`;
CREATE TABLE `exchange_log` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `dilekr` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма купленных екр через диллера',
  `sellekr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сумма проданых екр через биржу',
  `byekr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сумма купленых екр через биржу',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='возможное  кол. продаж / сумма проданного';

DROP TABLE IF EXISTS `exchange_log_data`;
CREATE TABLE `exchange_log_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned DEFAULT '0',
  `owner_bank` int(11) unsigned NOT NULL DEFAULT '0',
  `etype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'тип 0 екры 1 кр',
  `mkdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `summ` int(11) unsigned NOT NULL DEFAULT '0',
  `kurs` int(11) unsigned NOT NULL DEFAULT '0',
  `komis` decimal(6,3) unsigned NOT NULL DEFAULT '0.000',
  `to_owner` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'for Admins',
  `to_owner_bank` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'for admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78462 DEFAULT CHARSET=cp1251 COMMENT='лог биржи';

DROP TABLE IF EXISTS `f_use`;
CREATE TABLE `f_use` (
  `owner` int(11) NOT NULL,
  `date` varchar(255) NOT NULL DEFAULT '',
  KEY `owner` (`owner`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='использование футбольных мячей';

DROP TABLE IF EXISTS `fair_buy`;
CREATE TABLE `fair_buy` (
  `fairowner` int(10) unsigned NOT NULL,
  `fairshoptype` int(10) unsigned NOT NULL,
  `fairprototype` int(10) unsigned NOT NULL,
  `faircount` int(10) unsigned NOT NULL,
  UNIQUE KEY `fairowner` (`fairowner`,`fairshoptype`,`fairprototype`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `fair_buy_log`;
CREATE TABLE `fair_buy_log` (
  `itemid` int(10) unsigned NOT NULL,
  `itempricegold` int(10) unsigned NOT NULL,
  `itemgoden` int(10) unsigned NOT NULL,
  `itemmaxdur` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'юзы',
  PRIMARY KEY (`itemid`),
  KEY `itemgoden` (`itemgoden`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `fair_profiles`;
CREATE TABLE `fair_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilename` varchar(255) NOT NULL DEFAULT '',
  `profiledata` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `fair_shop`;
CREATE TABLE `fair_shop` (
  `fairid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fairprototype` int(10) unsigned NOT NULL,
  `faircount` int(10) unsigned NOT NULL,
  `fairprice` int(10) unsigned NOT NULL,
  `fairshoptype` tinyint(3) unsigned NOT NULL,
  `fairlimits` varchar(255) NOT NULL,
  `fairpresent` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'подарком ли продаётся',
  `fairisowner` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'продаётся ли с привязкой',
  `fairgoden` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'срок годности - дата',
  `fairhidecount` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'скрывать количество на витрине?',
  `fairhidecount2` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'скрывать доступно?',
  `fairnotsell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг notsell',
  `fairismf` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'применять ли топ мф',
  `fairstartsell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время начала продажи',
  `fairendsell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания продажи',
  `fairgodenday` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество дней годности в момента продажи',
  `fairekr_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'устанавливать ли екр флаг',
  `fairecost` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'выставлять екр цену при покупке',
  `fairbanner` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'номер банера: 1-  "Новинка!" 2- "Акция!"',
  `faircharka` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'чарование',
  PRIMARY KEY (`fairid`),
  KEY `fairprototype` (`fairprototype`,`faircount`,`fairprice`,`fairshoptype`)
) ENGINE=InnoDB AUTO_INCREMENT=1296 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `fair_shop_copy`;
CREATE TABLE `fair_shop_copy` (
  `fairid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fairprototype` int(10) unsigned NOT NULL,
  `faircount` int(10) unsigned NOT NULL,
  `fairprice` int(10) unsigned NOT NULL,
  `fairshoptype` tinyint(3) unsigned NOT NULL,
  `fairlimits` varchar(255) NOT NULL,
  `fairpresent` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'подарком ли продаётся',
  `fairisowner` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'продаётся ли с привязкой',
  `fairgoden` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'срок годности - дата',
  `fairhidecount` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'скрывать количество на витрине?',
  `fairhidecount2` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'скрывать доступно?',
  `fairnotsell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг notsell',
  `fairismf` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'применять ли топ мф',
  `fairstartsell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время начала продажи',
  `fairendsell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания продажи',
  `fairgodenday` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество дней годности в момента продажи',
  `fairekr_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'устанавливать ли екр флаг',
  `fairecost` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'выставлять екр цену при покупке',
  `fairbanner` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'номер банера: 1-  "Новинка!" 2- "Акция!"',
  `faircharka` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'чарование',
  PRIMARY KEY (`fairid`),
  KEY `fairprototype` (`fairprototype`,`faircount`,`fairprice`,`fairshoptype`)
) ENGINE=InnoDB AUTO_INCREMENT=1287 DEFAULT CHARSET=cp1251 ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `file_compare`;
CREATE TABLE `file_compare` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `md5` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`filename`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='для мониторинга файлов городов';

DROP TABLE IF EXISTS `fontan`;
CREATE TABLE `fontan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT '0',
  `date` int(20) NOT NULL DEFAULT '0',
  `text` varchar(150) NOT NULL DEFAULT '',
  `login` varchar(50) DEFAULT NULL,
  `align` float DEFAULT NULL,
  `klan` varchar(50) DEFAULT NULL,
  `level` int(2) DEFAULT NULL,
  `del_id` int(10) NOT NULL DEFAULT '0',
  `del_login` varchar(25) NOT NULL DEFAULT '0',
  `del_level` int(2) NOT NULL DEFAULT '0',
  `del_align` float NOT NULL DEFAULT '0',
  `del_klan` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=14680 DEFAULT CHARSET=cp1251 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fontan_log`;
CREATE TABLE `fontan_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `get_money` int(6) DEFAULT NULL,
  `give_money` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1337089 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `fontan_st`;
CREATE TABLE `fontan_st` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(15) NOT NULL DEFAULT '0',
  `stavka` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3346364 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `fontan_winers`;
CREATE TABLE `fontan_winers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `winner` int(11) NOT NULL DEFAULT '0',
  `winner_info` varchar(70) DEFAULT '',
  `winner_count` tinyint(3) NOT NULL DEFAULT '0',
  `win_type` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `winner_count` (`winner_count`)
) ENGINE=InnoDB AUTO_INCREMENT=1338762 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0',
  `topic` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `date` varchar(14) NOT NULL DEFAULT '',
  `parent` int(40) NOT NULL DEFAULT '0',
  `author` int(15) NOT NULL DEFAULT '0',
  `a_info` varchar(50) DEFAULT NULL,
  `min_align` varchar(6) NOT NULL DEFAULT '0',
  `max_align` varchar(6) NOT NULL DEFAULT '0',
  `fix` float(4,2) DEFAULT NULL,
  `close` int(1) NOT NULL DEFAULT '0',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closepal` int(15) DEFAULT NULL,
  `close_info` varchar(50) DEFAULT NULL,
  `icon` int(3) NOT NULL DEFAULT '13',
  `del_top` tinyint(3) DEFAULT NULL,
  `delpal` int(15) DEFAULT NULL,
  `del_info` varchar(50) DEFAULT NULL,
  `deltoppal` int(15) DEFAULT NULL,
  `deltop_info` varchar(50) DEFAULT NULL,
  `ok` tinyint(1) DEFAULT NULL,
  `pal_comments` text,
  `vote` tinyint(1) DEFAULT NULL,
  `only_own` tinyint(1) NOT NULL DEFAULT '0',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Закрытая ветка, видят только админы и палы',
  `min_level` int(11) NOT NULL DEFAULT '0',
  `max_level` int(11) NOT NULL DEFAULT '100',
  `is_test` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `up_date` (`updated`),
  KEY `author` (`author`),
  KEY `type` (`type`),
  KEY `fix` (`fix`),
  KEY `min_align` (`min_align`),
  KEY `max_align` (`max_align`),
  KEY `parent_2` (`parent`,`fix`,`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=230629865 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum_appeal`;
CREATE TABLE `forum_appeal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `top_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moderator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_appeal_top_id_index` (`top_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1826 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum_archive`;
CREATE TABLE `forum_archive` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0',
  `topic` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `date` varchar(14) NOT NULL DEFAULT '',
  `parent` int(40) NOT NULL DEFAULT '0',
  `author` int(15) NOT NULL DEFAULT '0',
  `a_info` varchar(50) DEFAULT NULL,
  `min_align` varchar(6) NOT NULL DEFAULT '0',
  `max_align` varchar(6) NOT NULL DEFAULT '0',
  `fix` float(4,2) DEFAULT NULL,
  `close` int(1) NOT NULL DEFAULT '0',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closepal` int(15) DEFAULT NULL,
  `close_info` varchar(50) DEFAULT NULL,
  `icon` int(3) NOT NULL DEFAULT '13',
  `del_top` tinyint(3) DEFAULT NULL,
  `delpal` int(15) DEFAULT NULL,
  `del_info` varchar(50) DEFAULT NULL,
  `deltoppal` int(15) DEFAULT NULL,
  `deltop_info` varchar(50) DEFAULT NULL,
  `ok` tinyint(1) DEFAULT NULL,
  `pal_comments` text,
  `vote` tinyint(1) DEFAULT NULL,
  `only_own` tinyint(1) NOT NULL DEFAULT '0',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Закрытая ветка, видят только админы и палы',
  `min_level` int(11) NOT NULL DEFAULT '0',
  `max_level` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `up_date` (`updated`),
  KEY `author` (`author`),
  KEY `type` (`type`),
  KEY `fix` (`fix`),
  KEY `min_align` (`min_align`),
  KEY `max_align` (`max_align`),
  KEY `parent_2` (`parent`,`fix`,`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=230565199 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum_like`;
CREATE TABLE `forum_like` (
  `topic` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum_moderator`;
CREATE TABLE `forum_moderator` (
  `user_id` int(11) NOT NULL,
  `permissions` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum_votes`;
CREATE TABLE `forum_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_top` int(15) NOT NULL DEFAULT '0',
  `id_user` int(15) NOT NULL DEFAULT '0',
  `id_answer` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2240 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `forum_votes_txt`;
CREATE TABLE `forum_votes_txt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_top_txt` int(11) NOT NULL DEFAULT '0',
  `id_answ` tinyint(3) NOT NULL DEFAULT '0',
  `answers` varchar(150) NOT NULL DEFAULT '',
  `votes_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `friend` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(250) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-друзья,1-клан.враги,2-личные враги, 3-каменты на палов',
  `klan_list` varchar(80) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`friend`,`klan_list`,`type`),
  KEY `owner` (`owner`,`friend`,`status`),
  KEY `type` (`type`,`klan_list`),
  KEY `owner_3` (`owner`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1741622 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `gamehelp`;
CREATE TABLE `gamehelp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dir` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `is_enabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dir` (`dir`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `gellery`;
CREATE TABLE `gellery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(20) NOT NULL DEFAULT '0',
  `img` varchar(60) NOT NULL DEFAULT '',
  `exp_date` int(11) NOT NULL DEFAULT '1999999999' COMMENT '1999999999 для не истекающих',
  `dressed` int(10) NOT NULL DEFAULT '0',
  `otdel` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `exp_date` (`exp_date`),
  KEY `otdel` (`otdel`),
  KEY `dressed` (`dressed`),
  KEY `img` (`img`)
) ENGINE=InnoDB AUTO_INCREMENT=241850 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `gellery_prot`;
CREATE TABLE `gellery_prot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(50) DEFAULT NULL,
  `klan_owner` int(10) NOT NULL,
  `otdel` int(5) NOT NULL,
  `exp_date` int(11) NOT NULL DEFAULT '1999999999' COMMENT 'без срока по умолчанию',
  PRIMARY KEY (`id`),
  KEY `klan_owner` (`klan_owner`),
  KEY `otdel` (`otdel`),
  KEY `exp_date` (`exp_date`)
) ENGINE=InnoDB AUTO_INCREMENT=907 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `get_lock_bots`;
CREATE TABLE `get_lock_bots` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `battle` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `chanse` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'шанс сработки свитка',
  `used_proto` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип используемого свитка',
  `idbot` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид бота в бою',
  `name_bot` varchar(60) NOT NULL DEFAULT '0' COMMENT 'название бота',
  `proto_bot` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид бота для дальнейшего призыва',
  `level_bot` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'уровень бота',
  `item_id` int(11) unsigned DEFAULT NULL COMMENT 'ид свитка если выдан свиток призвать',
  PRIMARY KEY (`id`),
  UNIQUE KEY `only` (`battle`,`owner`,`idbot`),
  UNIQUE KEY `item_id` (`item_id`,`battle`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB AUTO_INCREMENT=35025 DEFAULT CHARSET=cp1251 COMMENT='таблик для ловли ботов';

DROP TABLE IF EXISTS `get_lock_bots_stats`;
CREATE TABLE `get_lock_bots_stats` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `bt311_win` int(11) unsigned NOT NULL DEFAULT '0',
  `bt312_win` int(11) unsigned NOT NULL DEFAULT '0',
  `bt313_win` int(11) unsigned NOT NULL DEFAULT '0',
  `bt314_win` int(11) unsigned NOT NULL DEFAULT '0',
  `bt311_lose` int(11) unsigned NOT NULL DEFAULT '0',
  `bt312_lose` int(11) unsigned NOT NULL DEFAULT '0',
  `bt313_lose` int(11) unsigned NOT NULL DEFAULT '0',
  `bt314_lose` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='стата по боям с поймаными ботами';

DROP TABLE IF EXISTS `gotzam_arsenal`;
CREATE TABLE `gotzam_arsenal` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_it` int(255) NOT NULL,
  `owner` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1329 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `group_unique_gift`;
CREATE TABLE `group_unique_gift` (
  `group_name` varchar(50) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`group_name`,`gift_id`,`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` int(5) NOT NULL DEFAULT '0',
  `maxdur` int(5) NOT NULL DEFAULT '0',
  `cost` float NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `nlevel` int(2) NOT NULL DEFAULT '0',
  `nsila` int(5) NOT NULL DEFAULT '0',
  `nlovk` int(5) NOT NULL DEFAULT '0',
  `ninta` int(5) NOT NULL DEFAULT '0',
  `nvinos` int(5) NOT NULL DEFAULT '0',
  `nintel` int(5) NOT NULL DEFAULT '0',
  `nmudra` int(5) NOT NULL DEFAULT '0',
  `nnoj` int(2) NOT NULL DEFAULT '0',
  `ntopor` int(2) NOT NULL DEFAULT '0',
  `ndubina` int(2) NOT NULL DEFAULT '0',
  `nmech` int(2) NOT NULL DEFAULT '0',
  `nalign` int(5) NOT NULL DEFAULT '0',
  `minu` int(5) NOT NULL DEFAULT '0',
  `maxu` int(5) NOT NULL DEFAULT '0',
  `gsila` int(5) NOT NULL DEFAULT '0',
  `glovk` int(5) NOT NULL DEFAULT '0',
  `ginta` int(5) NOT NULL DEFAULT '0',
  `gintel` int(5) NOT NULL DEFAULT '0',
  `ghp` int(5) NOT NULL DEFAULT '0',
  `mfkrit` int(5) NOT NULL DEFAULT '0',
  `mfakrit` int(5) NOT NULL DEFAULT '0',
  `mfuvorot` int(5) NOT NULL DEFAULT '0',
  `mfauvorot` int(5) NOT NULL DEFAULT '0',
  `gnoj` int(5) NOT NULL DEFAULT '0',
  `gtopor` int(5) NOT NULL DEFAULT '0',
  `gdubina` int(5) NOT NULL DEFAULT '0',
  `gmech` int(5) NOT NULL DEFAULT '0',
  `img` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(100) NOT NULL DEFAULT '',
  `dressed` tinyint(1) NOT NULL DEFAULT '0',
  `bron1` int(5) NOT NULL DEFAULT '0',
  `bron2` int(5) NOT NULL DEFAULT '0',
  `bron3` int(5) NOT NULL DEFAULT '0',
  `bron4` int(5) NOT NULL DEFAULT '0',
  `dategoden` int(15) NOT NULL DEFAULT '0',
  `magic` int(5) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `present` varchar(50) NOT NULL DEFAULT '',
  `sharped` tinyint(1) NOT NULL DEFAULT '0',
  `massa` float(4,1) NOT NULL DEFAULT '0.0' COMMENT 'масса предмета',
  `goden` int(4) NOT NULL DEFAULT '0',
  `needident` tinyint(1) NOT NULL DEFAULT '0',
  `nfire` int(3) NOT NULL DEFAULT '0',
  `nwater` int(3) NOT NULL DEFAULT '0',
  `nair` int(3) NOT NULL DEFAULT '0',
  `nearth` int(3) NOT NULL DEFAULT '0',
  `nlight` int(3) NOT NULL DEFAULT '0',
  `ngray` int(3) NOT NULL DEFAULT '0',
  `ndark` int(3) NOT NULL DEFAULT '0',
  `gfire` int(3) NOT NULL DEFAULT '0',
  `gwater` int(3) NOT NULL DEFAULT '0',
  `gair` int(3) NOT NULL DEFAULT '0',
  `gearth` int(3) NOT NULL DEFAULT '0',
  `glight` int(3) NOT NULL DEFAULT '0',
  `ggray` int(3) NOT NULL DEFAULT '0',
  `gdark` int(3) NOT NULL DEFAULT '0',
  `letter` text NOT NULL,
  `isrep` tinyint(1) NOT NULL DEFAULT '1',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `setsale` float(10,2) NOT NULL DEFAULT '0.00',
  `prototype` int(255) NOT NULL DEFAULT '0',
  `otdel` varchar(5) NOT NULL DEFAULT '',
  `bs` tinyint(1) NOT NULL DEFAULT '0',
  `gmp` int(10) NOT NULL,
  `includemagic` int(11) NOT NULL,
  `includemagicdex` int(11) NOT NULL,
  `includemagicmax` int(11) NOT NULL,
  `includemagicname` varchar(100) NOT NULL,
  `includemagicuses` int(5) NOT NULL,
  `includemagiccost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicekrcost` float NOT NULL DEFAULT '0' COMMENT 'стоимость перезарядки в екрах',
  `gmeshok` int(55) NOT NULL,
  `tradesale` float NOT NULL,
  `karman` tinyint(1) DEFAULT '0',
  `stbonus` int(11) NOT NULL DEFAULT '0',
  `upfree` int(11) NOT NULL DEFAULT '0',
  `ups` int(11) NOT NULL DEFAULT '0',
  `mfbonus` int(11) NOT NULL DEFAULT '0',
  `mffree` int(11) NOT NULL DEFAULT '0',
  `type3_updated` tinyint(1) NOT NULL DEFAULT '0',
  `bs_owner` int(11) DEFAULT '0',
  `nsex` smallint(6) NOT NULL DEFAULT '0',
  `present_text` text,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `labonly` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'не выносится из лабы',
  `labflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'заморозка лабиринта',
  `prokat_idp` int(11) NOT NULL DEFAULT '0' COMMENT 'idp проката',
  `prokat_do` int(11) DEFAULT NULL,
  `arsenal_klan` varchar(60) NOT NULL DEFAULT '',
  `arsenal_owner` int(11) NOT NULL DEFAULT '0' COMMENT 'хозяин сдатоя шмотки',
  `repcost` int(11) NOT NULL DEFAULT '0' COMMENT 'стоимость в репутации',
  `up_level` int(7) NOT NULL DEFAULT '0' COMMENT 'ап шмота на уровень',
  `ecost` float(10,2) NOT NULL DEFAULT '0.00',
  `group` int(5) NOT NULL DEFAULT '0',
  `ekr_up` varchar(20) DEFAULT NULL COMMENT 'рихтовка',
  `unik` int(1) NOT NULL DEFAULT '0' COMMENT 'ставится если уник',
  `add_pick` varchar(30) DEFAULT NULL COMMENT 'картинки',
  `pick_time` int(15) DEFAULT NULL COMMENT 'время жизни картинки',
  `sowner` int(11) NOT NULL DEFAULT '0' COMMENT 'привязана к овнеру',
  `idcity` int(2) NOT NULL DEFAULT '0' COMMENT '0-кепитал',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'для поиска боя/+поле юзается для номера лотереии :)',
  `t_id` int(11) NOT NULL DEFAULT '0' COMMENT 'используется для комка по городам',
  `ab_mf` int(11) NOT NULL DEFAULT '0' COMMENT 'бонус МФ',
  `ab_bron` int(11) NOT NULL DEFAULT '0' COMMENT 'Бонус на бронь',
  `ab_uron` int(11) NOT NULL DEFAULT '0' COMMENT 'бонус на урон',
  `art_param` varchar(60) DEFAULT NULL COMMENT 'настройки арта',
  `charka` text COMMENT 'масив с чарками',
  `ekr_flag` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг покупки из березы',
  `img_big` varchar(100) NOT NULL DEFAULT '',
  `getfrom` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'откуда был получен предмет',
  `rareitem` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 редкий, 2 великий, 3 легендарный 4 эпичный',
  `sebescost` float unsigned NOT NULL DEFAULT '0' COMMENT 'себестоимость',
  `mfinfo` text NOT NULL COMMENT 'инфо о мф шмотке',
  `sortorder` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'порядок сортировки в инвентаре',
  `notsell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'можно ли продавать в гос маге? 0 - да, 1 - нет',
  `includerechargetype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 - ничего, 1 - кр, 2 - екр, 3 - репа',
  `includeprototype` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип свитка встроенной магии',
  `craftedby` varchar(255) NOT NULL DEFAULT '' COMMENT 'вещь изготовлена мастером',
  `craftspeedup` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ускорение крафта на инструменте',
  `craftbonus` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'бонус на сложность крафта в инструменте',
  `gold` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'цена в монетах',
  `nclass` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'требуемый класс',
  `mfchance` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'шанс МФа при крафте',
  `can_drop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `naem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `dressed` (`dressed`),
  KEY `otdel` (`otdel`),
  KEY `bs` (`bs`),
  KEY `ghp` (`ghp`),
  KEY `maxdur` (`maxdur`),
  KEY `duration` (`duration`),
  KEY `dategoden` (`dategoden`),
  KEY `type` (`type`),
  KEY `setsale` (`setsale`),
  KEY `update` (`update`),
  KEY `gmp` (`gmp`),
  KEY `tradesale` (`tradesale`),
  KEY `bs_owner` (`bs_owner`),
  KEY `battle` (`battle`),
  KEY `prototype` (`prototype`),
  KEY `t_id` (`t_id`),
  KEY `prokat_do` (`prokat_do`),
  KEY `arsenal_klan` (`arsenal_klan`),
  KEY `arsenal_owner` (`arsenal_owner`),
  KEY `gmeshok` (`gmeshok`),
  KEY `sowner` (`sowner`),
  KEY `magic` (`magic`),
  KEY `add_time` (`add_time`),
  KEY `name` (`name`),
  KEY `sortorder` (`sortorder`),
  KEY `getfrom` (`getfrom`),
  KEY `owner_2` (`owner`,`prototype`),
  KEY `owner_3` (`owner`,`dressed`),
  KEY `owner_4` (`owner`,`dressed`,`prototype`),
  KEY `owner_5` (`owner`,`type`,`prototype`),
  KEY `owner_6` (`owner`,`dressed`,`type`),
  KEY `owner_7` (`owner`,`type`),
  KEY `owner_8` (`owner`,`otdel`,`prototype`),
  KEY `owner_9` (`owner`,`prototype`,`setsale`),
  KEY `owner_10` (`owner`,`arsenal_owner`,`prototype`),
  KEY `owner_11` (`owner`,`sowner`,`prototype`)
) ENGINE=InnoDB AUTO_INCREMENT=1062485216 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `inventory_aftr_del`;
CREATE TABLE `inventory_aftr_del` (
  `did` bigint(20) NOT NULL AUTO_INCREMENT,
  `deltime` int(20) DEFAULT NULL,
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` int(5) NOT NULL DEFAULT '0',
  `maxdur` int(5) NOT NULL DEFAULT '0',
  `cost` float NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `nlevel` int(2) NOT NULL DEFAULT '0',
  `nsila` int(5) NOT NULL DEFAULT '0',
  `nlovk` int(5) NOT NULL DEFAULT '0',
  `ninta` int(5) NOT NULL DEFAULT '0',
  `nvinos` int(5) NOT NULL DEFAULT '0',
  `nintel` int(5) NOT NULL DEFAULT '0',
  `nmudra` int(5) NOT NULL DEFAULT '0',
  `nnoj` int(2) NOT NULL DEFAULT '0',
  `ntopor` int(2) NOT NULL DEFAULT '0',
  `ndubina` int(2) NOT NULL DEFAULT '0',
  `nmech` int(2) NOT NULL DEFAULT '0',
  `nalign` int(5) NOT NULL DEFAULT '0',
  `minu` int(5) NOT NULL DEFAULT '0',
  `maxu` int(5) NOT NULL DEFAULT '0',
  `gsila` int(5) NOT NULL DEFAULT '0',
  `glovk` int(5) NOT NULL DEFAULT '0',
  `ginta` int(5) NOT NULL DEFAULT '0',
  `gintel` int(5) NOT NULL DEFAULT '0',
  `ghp` int(5) NOT NULL DEFAULT '0',
  `mfkrit` int(5) NOT NULL DEFAULT '0',
  `mfakrit` int(5) NOT NULL DEFAULT '0',
  `mfuvorot` int(5) NOT NULL DEFAULT '0',
  `mfauvorot` int(5) NOT NULL DEFAULT '0',
  `gnoj` int(5) NOT NULL DEFAULT '0',
  `gtopor` int(5) NOT NULL DEFAULT '0',
  `gdubina` int(5) NOT NULL DEFAULT '0',
  `gmech` int(5) NOT NULL DEFAULT '0',
  `img` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(100) NOT NULL DEFAULT '',
  `dressed` tinyint(1) NOT NULL DEFAULT '0',
  `bron1` int(5) NOT NULL DEFAULT '0',
  `bron2` int(5) NOT NULL DEFAULT '0',
  `bron3` int(5) NOT NULL DEFAULT '0',
  `bron4` int(5) NOT NULL DEFAULT '0',
  `dategoden` int(15) NOT NULL DEFAULT '0',
  `magic` int(5) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `present` varchar(50) NOT NULL DEFAULT '',
  `sharped` tinyint(1) NOT NULL DEFAULT '0',
  `massa` float(4,1) NOT NULL DEFAULT '0.0',
  `goden` int(4) NOT NULL DEFAULT '0',
  `needident` tinyint(1) NOT NULL DEFAULT '0',
  `nfire` int(3) NOT NULL DEFAULT '0',
  `nwater` int(3) NOT NULL DEFAULT '0',
  `nair` int(3) NOT NULL DEFAULT '0',
  `nearth` int(3) NOT NULL DEFAULT '0',
  `nlight` int(3) NOT NULL DEFAULT '0',
  `ngray` int(3) NOT NULL DEFAULT '0',
  `ndark` int(3) NOT NULL DEFAULT '0',
  `gfire` int(3) NOT NULL DEFAULT '0',
  `gwater` int(3) NOT NULL DEFAULT '0',
  `gair` int(3) NOT NULL DEFAULT '0',
  `gearth` int(3) NOT NULL DEFAULT '0',
  `glight` int(3) NOT NULL DEFAULT '0',
  `ggray` int(3) NOT NULL DEFAULT '0',
  `gdark` int(3) NOT NULL DEFAULT '0',
  `letter` text NOT NULL,
  `isrep` tinyint(1) NOT NULL DEFAULT '1',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `setsale` float(10,2) NOT NULL DEFAULT '0.00',
  `prototype` int(255) NOT NULL DEFAULT '0',
  `otdel` varchar(5) NOT NULL DEFAULT '',
  `bs` tinyint(1) NOT NULL DEFAULT '0',
  `gmp` int(10) NOT NULL,
  `includemagic` int(11) NOT NULL,
  `includemagicdex` int(11) NOT NULL,
  `includemagicmax` int(11) NOT NULL,
  `includemagicname` varchar(100) NOT NULL,
  `includemagicuses` int(5) NOT NULL,
  `includemagiccost` float NOT NULL DEFAULT '0',
  `includemagicekrcost` float NOT NULL DEFAULT '0' COMMENT 'стоимость перезарядки в екрах',
  `gmeshok` int(55) NOT NULL,
  `tradesale` float NOT NULL,
  `karman` tinyint(1) DEFAULT '0',
  `stbonus` int(11) NOT NULL DEFAULT '0',
  `upfree` int(11) NOT NULL DEFAULT '0',
  `ups` int(11) NOT NULL DEFAULT '0',
  `mfbonus` int(11) NOT NULL DEFAULT '0',
  `mffree` int(11) NOT NULL DEFAULT '0',
  `type3_updated` tinyint(1) NOT NULL DEFAULT '0',
  `bs_owner` int(11) DEFAULT '0',
  `nsex` smallint(6) NOT NULL DEFAULT '0',
  `present_text` text,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `labonly` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'не выносится из лабы',
  `labflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'заморозка лабиринта',
  `prokat_idp` int(11) NOT NULL DEFAULT '0' COMMENT 'idp проката',
  `prokat_do` int(11) DEFAULT NULL,
  `arsenal_klan` varchar(60) NOT NULL DEFAULT '',
  `arsenal_owner` int(11) NOT NULL DEFAULT '0',
  `repcost` int(11) NOT NULL DEFAULT '0' COMMENT 'стоимость в репутации',
  `up_level` int(7) NOT NULL DEFAULT '0' COMMENT 'ап шмота на уровень',
  `ecost` float(10,2) NOT NULL DEFAULT '0.00',
  `group` int(5) DEFAULT '0' COMMENT 'группируется ли вещь в инвентаре',
  `ekr_up` varchar(20) DEFAULT NULL COMMENT 'рихтовка',
  `unik` int(1) NOT NULL DEFAULT '0' COMMENT 'ставится если уник',
  `add_pick` varchar(30) DEFAULT NULL,
  `pick_time` int(15) DEFAULT NULL,
  `sowner` int(11) NOT NULL DEFAULT '0' COMMENT 'привязана к овнеру',
  `idcity` int(2) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `t_id` int(20) NOT NULL DEFAULT '0',
  `ab_mf` int(11) NOT NULL DEFAULT '0',
  `ab_bron` int(11) NOT NULL DEFAULT '0',
  `ab_uron` int(11) NOT NULL DEFAULT '0',
  `art_param` varchar(60) DEFAULT NULL,
  `charka` text,
  `ekr_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `img_big` varchar(100) NOT NULL DEFAULT '',
  `getfrom` int(11) unsigned NOT NULL DEFAULT '0',
  `rareitem` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sebescost` float unsigned NOT NULL DEFAULT '0' COMMENT 'себестоимость',
  `mfinfo` text NOT NULL COMMENT 'инфо о мф шмотке',
  `sortorder` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'порядок сортировки в инвентаре',
  `notsell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'можно ли продавать в гос маге? 0 - да, 1 - нет',
  `includerechargetype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 - ничего, 1 - кр, 2 - екр, 3 - репа',
  `includeprototype` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип свитка встроенной магии',
  `craftedby` varchar(255) NOT NULL DEFAULT '' COMMENT 'вещь изготовлена мастером',
  `craftspeedup` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ускорение крафта на инструменте',
  `craftbonus` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'бонус на сложность крафта в инструменте',
  `gold` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'цена в монетах',
  `nclass` smallint(6) unsigned NOT NULL DEFAULT '0',
  `mfchance` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'шанс МФа при крафте',
  `can_drop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `naem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`),
  KEY `id` (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=3288032 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `invites`;
CREATE TABLE `invites` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `whoreg` varchar(255) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `owner` int(255) NOT NULL DEFAULT '0',
  `unic` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `unic` (`unic`)
) ENGINE=InnoDB AUTO_INCREMENT=3507811 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `iplog`;
CREATE TABLE `iplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(50) NOT NULL,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `date` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `date` (`date`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=28364202 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `item_loto`;
CREATE TABLE `item_loto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'номер',
  `loto` int(11) NOT NULL DEFAULT '0' COMMENT 'номер лотереи',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид у кого билет',
  `saletime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'када был продан билет',
  `dil` int(11) NOT NULL DEFAULT '0' COMMENT 'ИД Диллера кто продал билет',
  `lotodate` varchar(20) NOT NULL DEFAULT '0' COMMENT 'дата лотереи',
  `win` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'билет выиграл',
  `item_name` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cost_kr` decimal(19,2) DEFAULT NULL,
  `cost_ekr` decimal(19,2) DEFAULT NULL,
  `item_inventory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `win` (`win`),
  KEY `loto` (`loto`)
) ENGINE=InnoDB AUTO_INCREMENT=199478 DEFAULT CHARSET=cp1251 COMMENT='Екровая лотерея';

DROP TABLE IF EXISTS `item_loto_ras`;
CREATE TABLE `item_loto_ras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lotodate` int(11) NOT NULL DEFAULT '0' COMMENT 'время лотереи',
  `status` smallint(3) NOT NULL DEFAULT '1' COMMENT '0 была 1-будет',
  `log` blob NOT NULL COMMENT 'кто что выиграл история',
  `msg` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'системка отправленна',
  `msg24` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'за 24 часа',
  `msg6` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'за 6 часов',
  `in_process` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=cp1251 COMMENT='история лотереи предметов, их активность и следующая лотеря';

DROP TABLE IF EXISTS `items_count`;
CREATE TABLE `items_count` (
  `proto` int(11) unsigned NOT NULL DEFAULT '0',
  `cnt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'счетчик',
  PRIMARY KEY (`proto`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='для подсчета шансов';

DROP TABLE IF EXISTS `ivents`;
CREATE TABLE `ivents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazv` varchar(255) DEFAULT NULL COMMENT 'название ивента',
  `info` text NOT NULL COMMENT 'текст ивента',
  `stat` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-не активен,1-активен, 2- окончен',
  `last_finish` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'когда был завершен в последний раз',
  `cc` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'счетчик цикла',
  `off` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251 COMMENT='игровые ивенты';

DROP TABLE IF EXISTS `komotdel`;
CREATE TABLE `komotdel` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pers` int(255) NOT NULL DEFAULT '0',
  `text` varchar(480) NOT NULL DEFAULT '',
  `date` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pers` (`pers`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `komplekt`;
CREATE TABLE `komplekt` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `owner` int(255) NOT NULL DEFAULT '0',
  `sergi` int(255) NOT NULL DEFAULT '0',
  `kulon` int(255) NOT NULL DEFAULT '0',
  `perchi` int(255) NOT NULL DEFAULT '0',
  `weap` int(255) NOT NULL DEFAULT '0',
  `bron` int(255) NOT NULL DEFAULT '0',
  `r1` int(255) NOT NULL DEFAULT '0',
  `r2` int(255) NOT NULL DEFAULT '0',
  `r3` int(255) NOT NULL DEFAULT '0',
  `helm` int(255) NOT NULL DEFAULT '0',
  `shit` int(255) NOT NULL DEFAULT '0',
  `boots` int(255) NOT NULL DEFAULT '0',
  `m1` int(255) NOT NULL,
  `m2` int(255) NOT NULL,
  `m3` int(255) NOT NULL,
  `m4` int(255) NOT NULL,
  `m5` int(255) NOT NULL,
  `m6` int(255) NOT NULL,
  `m7` int(255) NOT NULL,
  `m8` int(255) NOT NULL,
  `m9` int(255) NOT NULL,
  `m10` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=9749 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `kotvmeshke`;
CREATE TABLE `kotvmeshke` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `listid` int(11) unsigned NOT NULL DEFAULT '0',
  `prototype` int(10) unsigned NOT NULL,
  `shop_id` tinyint(3) unsigned NOT NULL,
  `allcount` int(10) unsigned NOT NULL,
  `left` int(10) unsigned NOT NULL,
  `ekrprice` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=118;

DROP TABLE IF EXISTS `labirint_items`;
CREATE TABLE `labirint_items` (
  `map` bigint(20) NOT NULL DEFAULT '0' COMMENT 'в какой карте сундук',
  `item` char(1) NOT NULL COMMENT 'итем',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'координата х',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'координата y',
  `active` int(11) NOT NULL DEFAULT '1' COMMENT 'состояние',
  `count` int(11) DEFAULT '0' COMMENT 'количество',
  `val` bigint(20) NOT NULL DEFAULT '0',
  `owner` int(25) NOT NULL DEFAULT '0' COMMENT '0-все могут поднять; или ид того кто может взять',
  `add_info` varchar(255) NOT NULL DEFAULT '' COMMENT 'дополнительная информация если надо',
  PRIMARY KEY (`map`,`x`,`y`,`active`,`item`,`val`,`owner`),
  KEY `owner` (`owner`),
  KEY `map` (`map`),
  KEY `item` (`item`),
  KEY `x` (`x`),
  KEY `y` (`y`),
  KEY `val` (`val`),
  KEY `active` (`active`),
  KEY `owner_2` (`owner`,`active`,`map`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Сундуки в лабе';

DROP TABLE IF EXISTS `labirint_users`;
CREATE TABLE `labirint_users` (
  `map` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id указатель на файл карты',
  `owner` bigint(20) DEFAULT NULL COMMENT 'id чара',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'координата х на карте',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'координата у на карте',
  `start` datetime DEFAULT NULL COMMENT 'время старта',
  `dead` int(11) NOT NULL DEFAULT '0' COMMENT 'кол. смертей',
  `flr` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'этаж легендарного лабиринта',
  `flr2` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'карта 2го этажа',
  `flr3` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'карта 3го этажа',
  `flr4` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'карта 4го этажа',
  UNIQUE KEY `owner` (`owner`,`x`,`y`),
  UNIQUE KEY `key` (`owner`),
  KEY `map` (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='расстановка чаров в лабиринте';

DROP TABLE IF EXISTS `labirint_var`;
CREATE TABLE `labirint_var` (
  `owner` bigint(20) NOT NULL DEFAULT '0' COMMENT 'чел',
  `var` varchar(255) NOT NULL DEFAULT '' COMMENT 'шо за',
  `val` int(12) NOT NULL DEFAULT '0' COMMENT 'значение',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='глобальные переменные для лабы';

DROP TABLE IF EXISTS `labirint_zayav`;
CREATE TABLE `labirint_zayav` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `team` longtext COMMENT 'команда учасников',
  `minlevel` int(11) DEFAULT NULL COMMENT 'минимальный уровень учасника',
  `maxlevel` int(11) DEFAULT NULL COMMENT 'Максимальный уровень учасника',
  `kol` int(11) DEFAULT NULL COMMENT 'Количество учасников',
  `koment` varchar(50) DEFAULT NULL COMMENT 'комментарий к заявке',
  `stamp` int(11) DEFAULT NULL,
  `pass` varchar(12) DEFAULT NULL,
  `lab` int(11) NOT NULL DEFAULT '1' COMMENT 'тип лабы-1-старая 2-новая',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5021682 DEFAULT CHARSET=cp1251 COMMENT='заявки на лабиринт';

DROP TABLE IF EXISTS `larci`;
CREATE TABLE `larci` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `listid` int(11) unsigned NOT NULL DEFAULT '0',
  `prototype` int(10) unsigned NOT NULL,
  `shop_id` tinyint(3) unsigned NOT NULL,
  `allcount` int(10) unsigned NOT NULL,
  `left` int(10) unsigned NOT NULL,
  `ekrprice` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `library_category`;
CREATE TABLE `library_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '-1',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `order_position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_enabled` (`is_enabled`),
  KEY `parent` (`parent`),
  KEY `order_position` (`order_position`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `library_item`;
CREATE TABLE `library_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pocket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `shop_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pocket_id` (`pocket_id`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1327 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `library_page`;
CREATE TABLE `library_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dir` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL DEFAULT '',
  `page_description` text,
  `body` longtext NOT NULL,
  `var_from` varchar(255) NOT NULL DEFAULT '',
  `var_to` varchar(255) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 - без типа, 1 - акция, 2 - событие, 3 - квест',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `order_position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `type` (`type`),
  KEY `is_enabled` (`is_enabled`),
  KEY `dir` (`dir`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `library_pocket`;
CREATE TABLE `library_pocket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `lichka`;
CREATE TABLE `lichka` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pers` int(255) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `date` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pers` (`pers`)
) ENGINE=InnoDB AUTO_INCREMENT=1152974 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `logitemmf`;
CREATE TABLE `logitemmf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `item_name` text NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `was` text NOT NULL,
  `add` text NOT NULL,
  `add_money` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=14381 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(255) NOT NULL DEFAULT '0',
  `log` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `lord_donate`;
CREATE TABLE `lord_donate` (
  `owner` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  PRIMARY KEY (`owner`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `lord_var`;
CREATE TABLE `lord_var` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `var` varchar(255) NOT NULL DEFAULT '',
  `val` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='глобальные переменные для лорда';

DROP TABLE IF EXISTS `loto_item`;
CREATE TABLE `loto_item` (
  `id` int(11) NOT NULL,
  `loto_num` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `stock` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `use_count` int(11) NOT NULL DEFAULT '0',
  `cost_kr` decimal(19,2) DEFAULT NULL,
  `cost_ekr` decimal(19,2) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL DEFAULT 'item' COMMENT 'тип предмета:\r\nitem - предмет из магазина\r\nability_own - личная абилка ',
  PRIMARY KEY (`id`,`loto_num`),
  UNIQUE KEY `UK_loto_item` (`loto_num`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=455;

DROP TABLE IF EXISTS `loto_item_info`;
CREATE TABLE `loto_item_info` (
  `loto_num` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`field`,`item_id`,`loto_num`),
  KEY `FK_loto_item_info_loto_item_id` (`item_id`),
  KEY `FK_loto_item_info` (`loto_num`,`item_id`),
  CONSTRAINT `FK_loto_item_info` FOREIGN KEY (`loto_num`, `item_id`) REFERENCES `loto_item` (`loto_num`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=112;

DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `jackpot` float NOT NULL,
  `fond` float NOT NULL,
  `end` int(11) NOT NULL,
  `summ_5` float NOT NULL,
  `summ_4` float NOT NULL,
  `summ_3` float NOT NULL,
  `count_5` int(11) NOT NULL,
  `count_4` int(11) NOT NULL,
  `count_3` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `lottery_cheaters`;
CREATE TABLE `lottery_cheaters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `values` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `lottery_log`;
CREATE TABLE `lottery_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_lottery` int(11) NOT NULL,
  `date_bill` datetime NOT NULL,
  `values` text NOT NULL,
  `send` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_lottery` (`id_lottery`)
) ENGINE=InnoDB AUTO_INCREMENT=213596 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `lottery_win_combination`;
CREATE TABLE `lottery_win_combination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lottery` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `values` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `magic`;
CREATE TABLE `magic` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `chanse` int(3) NOT NULL DEFAULT '0',
  `time` int(6) NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL DEFAULT '',
  `targeted` int(1) NOT NULL DEFAULT '0' COMMENT '0 - тупо на себя без указания себя. 1 - на шмотку (встройки и тд) 2 - на тело (на себя или противника) 3 - записки коментатора',
  `img` varchar(100) NOT NULL,
  `battle_use` int(5) NOT NULL DEFAULT '0' COMMENT '0 нельзя, 1 можно (в бою)',
  `need_block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - блок не нужен , 1 - нужен блок, 2 - нужен блок только если цель не я',
  `nlevel` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Требуемый уровнь',
  `us_type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'тип использования:0 - ниче не меняется,1 - только в бою,2 - только вне боя,3 - в бою и вне боя',
  `target_type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '0 - ниче не пишется, 1- можно только на себя 2-можно на других',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20180604 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `magic_scroll_timer`;
CREATE TABLE `magic_scroll_timer` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `cnt` int(11) unsigned NOT NULL DEFAULT '0',
  `last_use` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='для подсчета юза свитка Волшебный папирус';

DROP TABLE IF EXISTS `map_cache`;
CREATE TABLE `map_cache` (
  `id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `cache` longtext NOT NULL,
  KEY `type` (`type`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `map_groups`;
CREATE TABLE `map_groups` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `leader` int(255) unsigned NOT NULL,
  `team` text NOT NULL,
  `path` longtext NOT NULL,
  `lastmove` int(255) unsigned NOT NULL DEFAULT '0',
  `nextcost` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `horse` tinyint(4) NOT NULL,
  `room` int(10) unsigned NOT NULL,
  `canjoin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wannajoin` text NOT NULL,
  `cost` int(10) unsigned NOT NULL DEFAULT '0',
  `team_cache` longtext NOT NULL,
  `udate` int(10) unsigned NOT NULL DEFAULT '0',
  `magicfast` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'магия ускорения. 1 - map_costm1 из конфига',
  `skillfast` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `leader` (`leader`,`lastmove`,`status`),
  KEY `room` (`room`),
  KEY `status` (`status`),
  KEY `lastmove` (`lastmove`),
  KEY `nextcost` (`nextcost`)
) ENGINE=InnoDB AUTO_INCREMENT=12429179 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `map_items`;
CREATE TABLE `map_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `room` int(10) unsigned NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `extra2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`,`room`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=77319 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `map_quests`;
CREATE TABLE `map_quests` (
  `owner` int(11) unsigned NOT NULL,
  `q_id` int(11) unsigned NOT NULL,
  `step` int(11) unsigned NOT NULL,
  `addinfo` varchar(255) NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `map_qvar`;
CREATE TABLE `map_qvar` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `var` varchar(255) NOT NULL DEFAULT '',
  `val` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `map_var`;
CREATE TABLE `map_var` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `var` varchar(255) NOT NULL DEFAULT '',
  `val` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`),
  KEY `owner_2` (`owner`,`var`,`val`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `mini_rooms`;
CREATE TABLE `mini_rooms` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `l` int(4) NOT NULL DEFAULT '0',
  `t` int(4) NOT NULL DEFAULT '0',
  `r` int(4) NOT NULL DEFAULT '0',
  `b` int(4) NOT NULL DEFAULT '0',
  `time` tinyint(3) NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `mini_zayavka`;
CREATE TABLE `mini_zayavka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `lvl` tinyint(2) NOT NULL DEFAULT '1',
  `t1` varchar(255) NOT NULL DEFAULT '',
  `t1_login` varchar(50) NOT NULL DEFAULT '',
  `t1_align` tinyint(3) NOT NULL DEFAULT '0',
  `t1_level` tinyint(2) NOT NULL DEFAULT '0',
  `t1_klan` varchar(50) DEFAULT NULL,
  `t1_count` tinyint(3) NOT NULL DEFAULT '0',
  `t1_pass` varchar(35) DEFAULT NULL,
  `t2` varchar(255) NOT NULL DEFAULT '',
  `t2_login` varchar(50) NOT NULL DEFAULT '',
  `t2_align` tinyint(3) NOT NULL DEFAULT '0',
  `t2_level` tinyint(2) NOT NULL DEFAULT '0',
  `t2_klan` varchar(50) DEFAULT NULL,
  `t2_count` tinyint(3) NOT NULL DEFAULT '0',
  `t2_pass` varchar(35) DEFAULT NULL,
  `start` tinyint(3) NOT NULL DEFAULT '0',
  `start_time` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `money_out`;
CREATE TABLE `money_out` (
  `sdate` date NOT NULL DEFAULT '0000-00-00' COMMENT 'дата',
  `stype` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 - ввод/1-куплено/2-выведено репы',
  `val` int(11) DEFAULT NULL COMMENT 'сумма для типа 0/1 баксы. 3-репа',
  PRIMARY KEY (`sdate`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='для графика';

DROP TABLE IF EXISTS `naem_proto`;
CREATE TABLE `naem_proto` (
  `id` int(10) unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pricetype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 - кр, 1 - екр, 2 - репа,3 - голда',
  `img` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL,
  `sila` int(4) NOT NULL DEFAULT '3',
  `lovk` int(4) NOT NULL DEFAULT '3',
  `inta` int(4) NOT NULL DEFAULT '3',
  `vinos` int(4) NOT NULL DEFAULT '3',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `maxhp` int(6) NOT NULL DEFAULT '18',
  `hp` int(6) NOT NULL DEFAULT '18',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `shadow` varchar(40) NOT NULL DEFAULT '0.gif',
  `uclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `skills` text NOT NULL,
  `skills_point` smallint(6) unsigned NOT NULL DEFAULT '1',
  `passkills` text NOT NULL COMMENT 'пасивные скилы',
  `passkills_points` smallint(5) unsigned NOT NULL DEFAULT '2',
  `is_enabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `naim_message`;
CREATE TABLE `naim_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид найма',
  `in_klan_id` int(11) NOT NULL DEFAULT '0' COMMENT 'входящие предложение клана',
  `stat` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 статус предложения',
  `indata` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'время вызова',
  `sender` int(11) NOT NULL DEFAULT '0' COMMENT 'ид отправителя',
  `war_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид войны',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`in_klan_id`),
  KEY `owner` (`owner`),
  KEY `in_klan_id` (`in_klan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `new_delo`;
CREATE TABLE `new_delo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL COMMENT 'кто',
  `owner_login` varchar(255) DEFAULT NULL,
  `owner_balans_do` float(13,2) NOT NULL DEFAULT '0.00',
  `owner_balans_posle` float(13,2) NOT NULL DEFAULT '0.00',
  `owner_rep_do` int(11) NOT NULL DEFAULT '0',
  `owner_rep_posle` int(11) NOT NULL DEFAULT '0',
  `target` int(11) DEFAULT '0' COMMENT 'кому',
  `target_login` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT 'тип операции',
  `sdate` int(11) DEFAULT NULL COMMENT 'время операции',
  `sum_kr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма операции',
  `sum_ekr` float(11,2) NOT NULL DEFAULT '0.00',
  `sum_rep` int(11) DEFAULT '0',
  `sum_kom` float(11,2) DEFAULT NULL,
  `item_id` longtext COMMENT 'предмет ид',
  `aitem_id` longtext COMMENT 'ид обмена или уничтожения',
  `item_name` varchar(255) DEFAULT NULL,
  `item_count` int(11) NOT NULL DEFAULT '0',
  `item_type` int(11) NOT NULL DEFAULT '0',
  `item_proto` int(11) NOT NULL DEFAULT '0',
  `item_cost` float(13,2) DEFAULT '0.00',
  `item_ecost` float(13,2) DEFAULT NULL,
  `item_dur` int(11) NOT NULL DEFAULT '0',
  `item_maxdur` int(11) NOT NULL DEFAULT '0',
  `item_ups` int(11) NOT NULL DEFAULT '0',
  `item_unic` tinyint(3) NOT NULL DEFAULT '0',
  `item_incmagic` varchar(255) DEFAULT NULL,
  `item_incmagic_id` int(11) DEFAULT NULL,
  `item_incmagic_count` varchar(255) DEFAULT NULL,
  `item_arsenal` varchar(255) DEFAULT NULL,
  `item_sowner` tinyint(3) DEFAULT NULL,
  `item_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_mfinfo` varchar(255) NOT NULL DEFAULT '',
  `battle` int(11) NOT NULL DEFAULT '0',
  `bank_id` int(11) NOT NULL DEFAULT '0',
  `add_info` longtext COMMENT 'доп инфа',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `target` (`target`),
  KEY `sdate` (`sdate`),
  KEY `type` (`type`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB AUTO_INCREMENT=757437005 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `new_delo_it_index`;
CREATE TABLE `new_delo_it_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(30) DEFAULT NULL,
  `delo_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item_id`),
  KEY `delo` (`delo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124492985 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `new_updates`;
CREATE TABLE `new_updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_data` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `top` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hide` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hide` (`hide`),
  KEY `id` (`id`,`hide`),
  KEY `top` (`top`),
  KEY `cdate` (`cdate`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=cp1251 COMMENT='таблица с сообщениями от админов';

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0',
  `topic` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` varchar(14) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `author` text NOT NULL,
  `print_time` timestamp NULL DEFAULT NULL COMMENT 'в ремя када выводить новость',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `date` (`date`),
  KEY `topic` (`topic`),
  KEY `author` (`author`(10)),
  KEY `print_time` (`print_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7202 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `newyear_snowman`;
CREATE TABLE `newyear_snowman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unic` (`owner`),
  KEY `count` (`cnt`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ntur_logs`;
CREATE TABLE `ntur_logs` (
  `id` int(11) NOT NULL,
  `type` int(5) DEFAULT NULL COMMENT 'тип турнира',
  `start_time` int(11) DEFAULT NULL COMMENT 'начало турнира',
  `logs` longblob COMMENT 'логи турнира',
  `end_time` int(11) DEFAULT NULL COMMENT 'окончание',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'состояние',
  `winer` text COMMENT 'слепок победителя',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='логи новыых турниров';

DROP TABLE IF EXISTS `ntur_next`;
CREATE TABLE `ntur_next` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opentime` timestamp(6) NULL DEFAULT NULL,
  `sysmessage` smallint(6) NOT NULL DEFAULT '0' COMMENT 'счетчик системок',
  `turtype` smallint(6) NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6182 DEFAULT CHARSET=cp1251 COMMENT='расписание авто заявок';

DROP TABLE IF EXISTS `ntur_profile`;
CREATE TABLE `ntur_profile` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `def` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=155645 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ntur_realchars`;
CREATE TABLE `ntur_realchars` (
  `owner` int(255) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `stats` int(15) NOT NULL,
  `master` int(5) NOT NULL,
  `bpbonussila` int(5) NOT NULL DEFAULT '0',
  `bpbonushp` int(5) NOT NULL DEFAULT '0',
  `noj` int(5) NOT NULL,
  `mec` int(5) NOT NULL,
  `topor` int(5) NOT NULL,
  `dubina` int(5) NOT NULL,
  `mfire` int(5) NOT NULL,
  `mwater` int(5) NOT NULL,
  `mair` int(5) NOT NULL,
  `mearth` int(5) NOT NULL,
  `mlight` int(5) NOT NULL,
  `mgray` int(5) NOT NULL,
  `mdark` int(5) NOT NULL,
  `mana` int(10) unsigned NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ntur_stat`;
CREATE TABLE `ntur_stat` (
  `battle` int(11) NOT NULL DEFAULT '0',
  `dm_t1` int(11) NOT NULL DEFAULT '0',
  `dm_t2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`battle`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ntur_users`;
CREATE TABLE `ntur_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ид инстанции',
  `ntype` smallint(6) NOT NULL DEFAULT '4' COMMENT 'тип 4 или 8',
  `stat` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'статус инстанции',
  `mktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'время создания/обновления',
  `stat_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время последней смены статуса',
  `nazva` varchar(20) NOT NULL DEFAULT '',
  `pas` varchar(10) NOT NULL DEFAULT '',
  `koment` varchar(30) NOT NULL DEFAULT '',
  `o1` int(11) NOT NULL DEFAULT '0',
  `o2` int(11) NOT NULL DEFAULT '0',
  `o3` int(11) NOT NULL DEFAULT '0',
  `o4` int(11) NOT NULL DEFAULT '0',
  `o5` int(11) NOT NULL DEFAULT '0',
  `o6` int(11) NOT NULL DEFAULT '0',
  `o7` int(11) NOT NULL DEFAULT '0',
  `o8` int(11) NOT NULL DEFAULT '0',
  `o9` int(11) NOT NULL DEFAULT '0',
  `o10` int(11) NOT NULL DEFAULT '0',
  `o11` int(11) NOT NULL DEFAULT '0',
  `o12` int(11) NOT NULL DEFAULT '0',
  `o13` int(11) NOT NULL DEFAULT '0',
  `o14` int(11) NOT NULL DEFAULT '0',
  `o15` int(11) NOT NULL DEFAULT '0',
  `o16` int(11) NOT NULL DEFAULT '0',
  `o17` int(11) NOT NULL DEFAULT '0',
  `o18` int(11) NOT NULL DEFAULT '0',
  `o19` int(11) NOT NULL DEFAULT '0',
  `o20` int(11) NOT NULL DEFAULT '0',
  `o21` int(11) NOT NULL DEFAULT '0',
  `o22` int(11) NOT NULL DEFAULT '0',
  `o23` int(11) NOT NULL DEFAULT '0',
  `o24` int(11) NOT NULL DEFAULT '0',
  `o25` int(11) NOT NULL DEFAULT '0',
  `o26` int(11) NOT NULL DEFAULT '0',
  `o27` int(11) NOT NULL DEFAULT '0',
  `o28` int(11) NOT NULL DEFAULT '0',
  `o29` int(11) NOT NULL DEFAULT '0',
  `o30` int(11) NOT NULL DEFAULT '0',
  `o31` int(11) NOT NULL DEFAULT '0',
  `o32` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'ид боя если в бою',
  `faza` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик для раундов',
  `sysmcount` smallint(6) NOT NULL DEFAULT '0' COMMENT 'счетчик отпраленных системок',
  PRIMARY KEY (`id`),
  KEY `stat` (`stat`),
  KEY `ntype` (`ntype`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB AUTO_INCREMENT=71005 DEFAULT CHARSET=cp1251 COMMENT='новые турниры';

DROP TABLE IF EXISTS `ny_quest_var`;
CREATE TABLE `ny_quest_var` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `var` varchar(255) NOT NULL DEFAULT '',
  `val` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`),
  KEY `owner_2` (`owner`,`var`,`val`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `obmen_run`;
CREATE TABLE `obmen_run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `komu` int(11) NOT NULL DEFAULT '0',
  `kto` int(11) NOT NULL DEFAULT '0',
  `kogda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `chto` text NOT NULL,
  `nachto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22928 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `id` int(255) NOT NULL DEFAULT '0',
  `date` int(15) NOT NULL DEFAULT '0',
  `room` int(5) NOT NULL DEFAULT '0',
  `real_time` int(15) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `op_battle_index`;
CREATE TABLE `op_battle_index` (
  `battle` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  `team` tinyint(4) NOT NULL,
  UNIQUE KEY `battle` (`battle`,`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `paket`;
CREATE TABLE `paket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(15) NOT NULL DEFAULT '0',
  `pid` int(15) NOT NULL DEFAULT '0',
  `owner` int(15) NOT NULL DEFAULT '0',
  `dategoden` int(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `iid` (`iid`),
  KEY `pid` (`pid`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=9233 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `pal_rights`;
CREATE TABLE `pal_rights` (
  `pal_id` int(5) NOT NULL,
  `logs` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'просмотр переводов',
  `ext_logs` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'расширенные переводы',
  `red_forum` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'писать красным',
  `top_move` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'перенос топов',
  `abils` text COMMENT 'абилки палов (убираем привязку к склонкам)',
  `klans_ars_logs` tinyint(3) NOT NULL DEFAULT '0',
  `klans_ara_put` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'изымать вещь из арсенала (привязанную к арсу) и также возможность привязывать вещь к арсеналу.',
  `klans_kazna_logs` tinyint(3) NOT NULL DEFAULT '0',
  `klans_kazna_view` tinyint(3) NOT NULL DEFAULT '0',
  `pals_delo` tinyint(1) NOT NULL DEFAULT '0',
  `pals_online` tinyint(1) NOT NULL DEFAULT '0',
  `pal_tel` tinyint(3) NOT NULL DEFAULT '0',
  `zhhistory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `loginip` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `viewmanyips` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'видить в инфе много ипов',
  PRIMARY KEY (`pal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `pal_vizits`;
CREATE TABLE `pal_vizits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(15) NOT NULL DEFAULT '0',
  `room` int(15) NOT NULL DEFAULT '0',
  `date` int(15) DEFAULT NULL,
  `id_city` tinyint(3) NOT NULL DEFAULT '0',
  `chatactive` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'активен ли чат у пала',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pal_date` (`owner`,`date`),
  KEY `owner` (`owner`),
  KEY `room` (`room`),
  KEY `date` (`date`),
  KEY `chatactive` (`chatactive`)
) ENGINE=InnoDB AUTO_INCREMENT=2527549 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `paldelo`;
CREATE TABLE `paldelo` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `author` int(255) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT '',
  `date` int(15) NOT NULL DEFAULT '0',
  `m_type` tinyint(3) DEFAULT NULL COMMENT 'тип действия',
  `target` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `author` (`author`),
  KEY `m_type` (`m_type`)
) ENGINE=InnoDB AUTO_INCREMENT=897619 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` blob,
  `status` int(11) DEFAULT NULL,
  `all_ekr` float(10,2) NOT NULL DEFAULT '0.00',
  `money` float(10,2) NOT NULL DEFAULT '0.00',
  `getted` float(10,2) NOT NULL DEFAULT '0.00',
  `banners` varchar(255) DEFAULT '',
  `percent` int(3) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `wm` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_link` varchar(255) DEFAULT NULL,
  `site_desc` varchar(255) DEFAULT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `show_b1` int(11) DEFAULT NULL,
  `show_b2` int(11) DEFAULT NULL,
  `show_b3` int(11) DEFAULT NULL,
  `show_b4` int(11) DEFAULT NULL,
  `show_b5` int(11) DEFAULT NULL,
  `show_b6` int(11) DEFAULT NULL,
  `show_b7` int(11) DEFAULT NULL,
  `show_b8` int(11) DEFAULT NULL,
  `show_b9` int(11) DEFAULT NULL,
  `show_b10` int(11) DEFAULT NULL,
  `show_b11` int(11) DEFAULT NULL,
  `show_b12` int(11) DEFAULT NULL,
  `show_b13` int(11) DEFAULT '0',
  `show_b14` int(11) DEFAULT '0',
  `click_b1` int(11) DEFAULT NULL,
  `click_b2` int(11) DEFAULT NULL,
  `click_b3` int(11) DEFAULT NULL,
  `click_b4` int(11) DEFAULT NULL,
  `click_b5` int(11) DEFAULT NULL,
  `click_b6` int(11) DEFAULT NULL,
  `click_b7` int(11) DEFAULT NULL,
  `click_b8` int(11) DEFAULT NULL,
  `click_b9` int(11) DEFAULT NULL,
  `click_b10` int(11) DEFAULT NULL,
  `click_b11` int(11) DEFAULT NULL,
  `click_b12` int(11) DEFAULT NULL,
  `click_b13` int(11) DEFAULT '0',
  `click_b14` int(11) DEFAULT '0',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата регистрации',
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=1847 DEFAULT CHARSET=cp1251 COMMENT='Партнеры';

DROP TABLE IF EXISTS `partners_delo`;
CREATE TABLE `partners_delo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealer_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `ekr` float(10,2) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `transfer_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60870 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `partners_users`;
CREATE TABLE `partners_users` (
  `id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  `partner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид партнера',
  `banner` varchar(255) DEFAULT NULL,
  `from_site` varchar(255) DEFAULT NULL,
  `reg_time` varchar(255) DEFAULT NULL,
  `fraud` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`partner`),
  KEY `fraud` (`fraud`),
  KEY `reg_time` (`reg_time`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `pawnbroker`;
CREATE TABLE `pawnbroker` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `itemid` int(255) NOT NULL,
  `owner` int(255) NOT NULL,
  `starttime` int(255) unsigned NOT NULL,
  `endtime` int(255) unsigned NOT NULL,
  `warning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemid` (`itemid`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=82335 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `place_battle`;
CREATE TABLE `place_battle` (
  `var` varchar(255) NOT NULL DEFAULT '' COMMENT 'переменная',
  `val` bigint(20) NOT NULL DEFAULT '0' COMMENT 'значение',
  PRIMARY KEY (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='ивент поле брани';

DROP TABLE IF EXISTS `place_logs`;
CREATE TABLE `place_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` varchar(30) DEFAULT NULL,
  `findate` varchar(30) DEFAULT NULL,
  `win` tinyint(3) NOT NULL DEFAULT '0',
  `battle` bigint(20) DEFAULT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '0',
  `t1data` longtext,
  `t2data` longtext,
  `usrc` int(11) NOT NULL DEFAULT '0' COMMENT 'какое было макс.кол.юзеров',
  PRIMARY KEY (`id`),
  UNIQUE KEY `battle` (`battle`),
  KEY `????? ??????` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=1563 DEFAULT CHARSET=cp1251 COMMENT='логи боев поля боя';

DROP TABLE IF EXISTS `place_turn`;
CREATE TABLE `place_turn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `poz` int(11) DEFAULT NULL,
  `owner_data` longtext,
  `t` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='очередь в мега бой';

DROP TABLE IF EXISTS `place_zay`;
CREATE TABLE `place_zay` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `coment` varchar(100) NOT NULL DEFAULT 'СВЕТ VS TЬМА',
  `type` int(2) NOT NULL DEFAULT '61',
  `team1` longtext NOT NULL,
  `t1data` longtext NOT NULL COMMENT 'шоб не парсить ники в заявке к1',
  `team2` longtext NOT NULL,
  `t2data` longtext NOT NULL COMMENT 'шоб не парсить ники в заявке к2',
  `team3` longtext NOT NULL,
  `t3data` longtext NOT NULL,
  `start` int(10) NOT NULL DEFAULT '0' COMMENT 'просто информативное поле - страрт по крону',
  `timeout` int(2) NOT NULL DEFAULT '5',
  `t1min` int(2) NOT NULL DEFAULT '3',
  `t1max` int(2) NOT NULL DEFAULT '21',
  `t2min` int(2) NOT NULL DEFAULT '3',
  `t2max` int(2) NOT NULL DEFAULT '21',
  `t3min` int(2) NOT NULL DEFAULT '3',
  `t3max` int(2) NOT NULL DEFAULT '21',
  `level` int(2) NOT NULL DEFAULT '6' COMMENT 'тут так надо 6 всегда',
  `podan` varchar(5) NOT NULL DEFAULT '00:00',
  `t1c` int(5) NOT NULL DEFAULT '30',
  `t2c` int(5) NOT NULL DEFAULT '30',
  `t3c` int(5) NOT NULL DEFAULT '30',
  `blood` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(3) DEFAULT '0',
  `z_curent1` int(11) NOT NULL DEFAULT '0' COMMENT 'для блага т1',
  `z_curent2` int(11) NOT NULL DEFAULT '0' COMMENT 'благо т2',
  `z_curent3` int(11) NOT NULL DEFAULT '0',
  `sys_mess_10m` tinyint(3) NOT NULL DEFAULT '0',
  `sys_mess_5min` tinyint(3) NOT NULL DEFAULT '0',
  `sys_mess_1h` tinyint(3) NOT NULL DEFAULT '0',
  `sys_mess_4h` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2095 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `plugin_analyze`;
CREATE TABLE `plugin_analyze` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(255) DEFAULT NULL,
  `code` text,
  `is_correct` tinyint(1) DEFAULT '1',
  `check_param` text,
  `created_at` int(11) DEFAULT '0',
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `plugin_user_warning`;
CREATE TABLE `plugin_user_warning` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `data` text,
  `updated_at` int(11) DEFAULT '0',
  `finish_interval` int(11) DEFAULT '0',
  `change_host` tinyint(1) DEFAULT '0',
  `change_host_count` int(11) DEFAULT '0',
  `total_check_host` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6235 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `pool`;
CREATE TABLE `pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_assign`;
CREATE TABLE `pool_assign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL,
  `target_type` enum('rate') NOT NULL DEFAULT 'rate',
  `target_id` int(11) NOT NULL,
  `target_name` varchar(255) NOT NULL DEFAULT '',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_assign_rating`;
CREATE TABLE `pool_assign_rating` (
  `pool_assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` int(11) NOT NULL,
  `min_position` int(11) NOT NULL,
  `max_position` int(11) NOT NULL,
  PRIMARY KEY (`pool_assign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_pocket`;
CREATE TABLE `pool_pocket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `condition` enum('and','or') DEFAULT 'and',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_pocket_item`;
CREATE TABLE `pool_pocket_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  `item_type` enum('exp','repa','item','kr','ekr','gold','ability','medal','weight','prof_exp') NOT NULL DEFAULT 'exp',
  `give_count` int(11) NOT NULL DEFAULT '1',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_pocket_item_info`;
CREATE TABLE `pool_pocket_item_info` (
  `pocket_item_id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `pool_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  PRIMARY KEY (`pocket_item_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_validator`;
CREATE TABLE `pool_validator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('pool','pocket','pocket_item') NOT NULL DEFAULT 'pool',
  `target_id` int(11) NOT NULL,
  `validator_type` enum('user') NOT NULL DEFAULT 'user',
  `pool_id` int(11) DEFAULT NULL,
  `pocket_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pool_validator_info`;
CREATE TABLE `pool_validator_info` (
  `validator_id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `target_type` enum('pool','pocket','pocket_item') NOT NULL DEFAULT 'pool',
  `target_id` int(11) NOT NULL,
  `pool_id` int(11) DEFAULT NULL,
  `pocket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`validator_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `prival_stats`;
CREATE TABLE `prival_stats` (
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `owner` (`owner`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `prokat`;
CREATE TABLE `prokat` (
  `idp` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'ид итема из shop',
  `startpay` float(6,2) NOT NULL DEFAULT '0.00',
  `daypay` float(6,2) NOT NULL DEFAULT '0.00',
  `kol` int(11) NOT NULL DEFAULT '0',
  `mag` int(11) NOT NULL DEFAULT '0' COMMENT 'если надо ИД магии',
  `magname` varchar(255) DEFAULT NULL COMMENT 'название магии',
  `magcount` int(11) NOT NULL DEFAULT '0' COMMENT 'кол магии',
  `magcost` float(8,2) NOT NULL DEFAULT '0.00' COMMENT 'стоимость перезаряда',
  `fups` int(11) NOT NULL DEFAULT '0' COMMENT 'подгонок',
  `fstat` int(11) NOT NULL DEFAULT '0' COMMENT 'свободные статы',
  `fmf` int(11) NOT NULL DEFAULT '0' COMMENT 'свободные модификаторы',
  `addhp` int(11) NOT NULL DEFAULT '0' COMMENT 'добавляем хп',
  `addbron` int(11) NOT NULL DEFAULT '0' COMMENT 'добавляем бронь',
  PRIMARY KEY (`idp`),
  KEY `itemid` (`itemid`,`mag`)
) ENGINE=InnoDB AUTO_INCREMENT=1169 DEFAULT CHARSET=cp1251 COMMENT='прокатная лавка';

DROP TABLE IF EXISTS `quest8_log`;
CREATE TABLE `quest8_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `rate_user_before` int(11) DEFAULT NULL,
  `rate_user_after` int(11) DEFAULT NULL,
  `rate_target_before` int(11) DEFAULT NULL,
  `rate_target_after` int(11) DEFAULT NULL,
  `cost` decimal(19,2) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `item_proto` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24334 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_bot`;
CREATE TABLE `quest_bot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;

DROP TABLE IF EXISTS `quest_bot_list`;
CREATE TABLE `quest_bot_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `start_quest` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_quest_bot_list_quest_bot_id` (`bot_id`),
  KEY `FK_quest_bot_list_quest_list_id` (`quest_id`),
  CONSTRAINT `FK_quest_bot_list_quest_list_id` FOREIGN KEY (`quest_id`) REFERENCES `quest_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276;

DROP TABLE IF EXISTS `quest_condition`;
CREATE TABLE `quest_condition` (
  `group` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` varchar(255) NOT NULL DEFAULT 'quest',
  `condition_type` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`,`condition_type`,`field`,`item_type`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_dialog`;
CREATE TABLE `quest_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `global_parent_id` int(11) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT '',
  `action_type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_saved` tinyint(1) DEFAULT '0',
  `order_position` int(11) NOT NULL,
  `next_save_dialog` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `location` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=862;

DROP TABLE IF EXISTS `quest_dialog_action`;
CREATE TABLE `quest_dialog_action` (
  `id` int(11) NOT NULL,
  `global_parent_id` int(11) NOT NULL,
  `dialog_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT '',
  `next_dialog_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_event`;
CREATE TABLE `quest_event` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `quest_ids` varchar(255) NOT NULL DEFAULT '',
  `is_enabled` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_event_reward`;
CREATE TABLE `quest_event_reward` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `reward` text NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `date_event` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3895 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_list`;
CREATE TABLE `quest_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `started_at` int(11) DEFAULT NULL,
  `ended_at` int(11) DEFAULT NULL,
  `min_level` int(11) NOT NULL,
  `max_level` int(11) NOT NULL,
  `limit_count` int(11) DEFAULT NULL,
  `limit_interval` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_canceled` int(11) DEFAULT '1',
  `is_clan` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_enabled` (`is_enabled`,`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=8192;

DROP TABLE IF EXISTS `quest_part`;
CREATE TABLE `quest_part` (
  `id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `img` text,
  `description_type` varchar(255) NOT NULL,
  `description_data` text,
  `part_gift` text COMMENT 'предметы, которые выдаются за прохождение части',
  `chat_start` text,
  `chat_end` text,
  `is_auto_finish` tinyint(1) NOT NULL DEFAULT '0',
  `part_number` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_auto_start` tinyint(1) DEFAULT '0',
  `weight` int(11) DEFAULT '1',
  `complete_condition_message` text,
  PRIMARY KEY (`id`),
  KEY `quest_id` (`quest_id`,`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;

DROP TABLE IF EXISTS `quest_pocket`;
CREATE TABLE `quest_pocket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `global_parent_id` int(11) NOT NULL COMMENT 'quest_id',
  `item_id` int(11) NOT NULL COMMENT 'part_id',
  `item_type` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `dialog_finish_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_pocket_item`;
CREATE TABLE `quest_pocket_item` (
  `id` int(11) NOT NULL,
  `global_parent_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  `pocket_item_id` int(11) NOT NULL,
  `pocket_item_type` varchar(255) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  KEY `pocket_id` (`pocket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_pocket_item_info`;
CREATE TABLE `quest_pocket_item_info` (
  `item_id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `global_parent_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  `pocket_item_id` int(11) NOT NULL,
  `pocket_item_type` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`,`field`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_validator_item`;
CREATE TABLE `quest_validator_item` (
  `id` int(11) unsigned NOT NULL,
  `item_type` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL,
  `parent_type` varchar(255) NOT NULL DEFAULT '',
  `global_parent_id` int(11) NOT NULL DEFAULT '0',
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quest_validator_item_info`;
CREATE TABLE `quest_validator_item_info` (
  `item_id` int(11) unsigned NOT NULL,
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `validator_item_type` varchar(255) NOT NULL DEFAULT '',
  `validator_parent_id` int(11) NOT NULL,
  `validator_parent_type` varchar(255) NOT NULL DEFAULT '',
  `global_parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`field`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `quests`;
CREATE TABLE `quests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qname` varchar(255) DEFAULT NULL COMMENT 'название квеста',
  `qstart` text COMMENT 'стартовый диалог',
  `qfin` varchar(255) DEFAULT NULL COMMENT 'Финальный диалог',
  `qsystem` varchar(255) DEFAULT NULL COMMENT 'системка в чат',
  `qsysk` int(11) DEFAULT '0' COMMENT '0-выкл;1-до боя ;2-после боя',
  `qsys_fail` varchar(255) DEFAULT NULL COMMENT 'системка дополнительно',
  `qtype` int(11) DEFAULT NULL COMMENT 'тип квеста: 1-Выбивалка; 2-Собиралка;3-Убивалка',
  `q_item` int(25) NOT NULL DEFAULT '0' COMMENT 'id-итема квестового из-магазина',
  `q_item_count` int(11) NOT NULL DEFAULT '0' COMMENT 'нужное количество предметов',
  `q_item2` int(25) DEFAULT NULL,
  `q_item2_count` int(11) DEFAULT NULL,
  `q_item3` int(11) DEFAULT NULL,
  `q_item3_count` int(11) DEFAULT NULL,
  `q_item4` int(25) DEFAULT NULL,
  `q_item4_count` int(11) DEFAULT NULL,
  `q_bot` int(11) DEFAULT NULL,
  `q_bot_count` int(11) DEFAULT NULL,
  `rep` int(11) NOT NULL DEFAULT '0' COMMENT 'награда репутации для стандарта',
  `lab` int(3) NOT NULL DEFAULT '0' COMMENT '0-любая лаба; 1-первая;2-вторая',
  `repeat` int(11) NOT NULL DEFAULT '1' COMMENT 'сколько раз можно выполнить квест',
  `info` text COMMENT 'Служебная информация',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=cp1251 COMMENT='Квесты';

DROP TABLE IF EXISTS `r_djs`;
CREATE TABLE `r_djs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dj` int(11) NOT NULL DEFAULT '0',
  `id_radio` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1_rufm 2_oldfm',
  `in_efir` tinyint(1) NOT NULL DEFAULT '0',
  `top_dj` tinyint(1) NOT NULL DEFAULT '0',
  `icq` int(20) DEFAULT NULL,
  `skype` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ID_DJ` (`id_dj`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=cp1251 COMMENT='тут живут диджеи для соответствующей закладки в друзьях';

DROP TABLE IF EXISTS `r_djse`;
CREATE TABLE `r_djse` (
  `id_radio` int(11) NOT NULL,
  `id_dj` int(11) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `efir_type` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id_radio` (`id_radio`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='тут живут диджеи которые взяли эфир';

DROP TABLE IF EXISTS `r_djsh`;
CREATE TABLE `r_djsh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_radio` int(11) NOT NULL,
  `id_dj` int(11) NOT NULL DEFAULT '0',
  `starttime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `efir_type` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `id_dj` (`id_dj`),
  KEY `starttime` (`starttime`),
  KEY `endtime` (`endtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2600 DEFAULT CHARSET=cp1251 COMMENT='тут живут хистори диджейских эфиров';

DROP TABLE IF EXISTS `r_djsn`;
CREATE TABLE `r_djsn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dj` int(11) NOT NULL DEFAULT '0',
  `r1_access` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1_rufm',
  `r2_access` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2_rufm',
  `top_dj` tinyint(1) NOT NULL DEFAULT '0',
  `icq` int(20) DEFAULT NULL,
  `skype` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ID_DJ` (`id_dj`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=cp1251 COMMENT='тут живут диджеи для соответствующей закладки в друзьях';

DROP TABLE IF EXISTS `reg_ip`;
CREATE TABLE `reg_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=cp1251 COMMENT='тут IP с которых регались. Задержка час';

DROP TABLE IF EXISTS `reg_klan`;
CREATE TABLE `reg_klan` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `abr` varchar(200) NOT NULL DEFAULT '',
  `http` varchar(255) NOT NULL DEFAULT '',
  `sznak` varchar(155) NOT NULL DEFAULT '',
  `bznak` varchar(155) NOT NULL DEFAULT '',
  `align` varchar(5) NOT NULL DEFAULT '',
  `descr` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`abr`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `rentalshop`;
CREATE TABLE `rentalshop` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `itemid` int(255) NOT NULL,
  `owner` int(255) NOT NULL,
  `maxendtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'максимальная время в лавке',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'максимальная время у игрока',
  `tempowner` int(255) unsigned NOT NULL DEFAULT '0',
  `price` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemid` (`itemid`),
  KEY `owner` (`owner`),
  KEY `tempowner` (`tempowner`),
  KEY `endtime` (`endtime`),
  KEY `maxendtime` (`maxendtime`),
  KEY `price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=244981 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `rid_history`;
CREATE TABLE `rid_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `when` int(10) unsigned NOT NULL,
  `summa` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1 - баксы, 2 - ваучеры, 3 - екры',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`,`when`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `rid_refs`;
CREATE TABLE `rid_refs` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `ref` int(11) NOT NULL DEFAULT '0',
  `when` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `ref` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `rid_sales`;
CREATE TABLE `rid_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `when` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `ref` int(10) unsigned NOT NULL,
  `summa` decimal(10,2) unsigned NOT NULL,
  `interest` decimal(10,2) unsigned NOT NULL,
  `bonus` decimal(10,2) unsigned NOT NULL,
  `dealer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `when` (`when`,`owner`,`ref`,`dealer`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `rid_users`;
CREATE TABLE `rid_users` (
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `allprofit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `profit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `interest` decimal(10,1) NOT NULL DEFAULT '5.0',
  PRIMARY KEY (`owner`),
  KEY `allprofit` (`allprofit`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ristalka`;
CREATE TABLE `ristalka` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `chaos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'счетчик хаотов',
  `labp` smallint(6) NOT NULL DEFAULT '0' COMMENT 'пропуск в лабу заюзан',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='счетчик для ристалки';

DROP TABLE IF EXISTS `ruines_activity_log`;
CREATE TABLE `ruines_activity_log` (
  `mapid` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `var` varchar(255) NOT NULL,
  `val` int(10) unsigned NOT NULL,
  KEY `mapid` (`mapid`,`owner`),
  KEY `owner` (`owner`,`var`),
  KEY `mapid_2` (`mapid`,`owner`,`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_items`;
CREATE TABLE `ruines_items` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(255) NOT NULL,
  `iteam_id` int(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `room` int(4) NOT NULL DEFAULT '0',
  `present` varchar(255) DEFAULT NULL,
  `extra` int(255) NOT NULL,
  `durability` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `room` (`room`)
) ENGINE=InnoDB AUTO_INCREMENT=19469223 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_log`;
CREATE TABLE `ruines_log` (
  `id` int(10) unsigned NOT NULL,
  `log` mediumtext NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `active` tinyint(4) NOT NULL,
  `t1` text NOT NULL,
  `t2` text NOT NULL,
  `win` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `starttime` (`starttime`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_log_index`;
CREATE TABLE `ruines_log_index` (
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `mapid` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `starttime` (`starttime`,`user`,`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_map`;
CREATE TABLE `ruines_map` (
  `id` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `t1score` tinyint(4) NOT NULL DEFAULT '0',
  `t2score` tinyint(4) NOT NULL DEFAULT '0',
  `k1owner` int(255) unsigned NOT NULL DEFAULT '0',
  `k2owner` int(255) unsigned NOT NULL DEFAULT '0',
  `lowlvl` tinyint(4) NOT NULL DEFAULT '8',
  `sanct` int(255) NOT NULL DEFAULT '0',
  `k1timeout` int(11) unsigned NOT NULL DEFAULT '0',
  `k2timeout` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rooms` (`rooms`),
  KEY `k1owner` (`k1owner`),
  KEY `k2owner` (`k2owner`),
  KEY `k1timeout` (`k1timeout`),
  KEY `k2timeout` (`k2timeout`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_profile`;
CREATE TABLE `ruines_profile` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `def` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=101417 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_realchars`;
CREATE TABLE `ruines_realchars` (
  `owner` int(255) NOT NULL,
  `sila` int(11) NOT NULL,
  `lovk` int(11) NOT NULL,
  `inta` int(11) NOT NULL,
  `vinos` int(11) NOT NULL,
  `intel` int(11) NOT NULL,
  `mudra` int(11) NOT NULL,
  `stats` int(15) NOT NULL,
  `master` int(5) NOT NULL,
  `bpbonussila` int(5) NOT NULL DEFAULT '0',
  `bpbonushp` int(5) NOT NULL DEFAULT '0',
  `noj` int(5) NOT NULL,
  `mec` int(5) NOT NULL,
  `topor` int(5) NOT NULL,
  `dubina` int(5) NOT NULL,
  `mfire` int(5) NOT NULL,
  `mwater` int(5) NOT NULL,
  `mair` int(5) NOT NULL,
  `mearth` int(5) NOT NULL,
  `mlight` int(5) NOT NULL,
  `mgray` int(5) NOT NULL,
  `mdark` int(5) NOT NULL,
  `mana` int(10) unsigned NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_start`;
CREATE TABLE `ruines_start` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `ownerlvl` tinyint(2) NOT NULL,
  `num` tinyint(2) NOT NULL,
  `lvl` tinyint(2) NOT NULL DEFAULT '0',
  `t1_logins` text NOT NULL,
  `t1_loginscache` text NOT NULL,
  `t1_pass` varchar(35) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241877 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `ruines_var`;
CREATE TABLE `ruines_var` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `var` varchar(255) NOT NULL DEFAULT '',
  `val` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`var`),
  KEY `owner` (`owner`),
  KEY `var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='глобальные переменные для руин';

DROP TABLE IF EXISTS `session_chit`;
CREATE TABLE `session_chit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(25) NOT NULL DEFAULT '0',
  `ip_was` varchar(255) DEFAULT NULL,
  `ip_hack` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` int(5) NOT NULL DEFAULT '0',
  `maxdur` int(5) NOT NULL DEFAULT '0',
  `cost` float(10,2) NOT NULL DEFAULT '0.00',
  `count` int(5) NOT NULL DEFAULT '0',
  `avacount` int(11) NOT NULL DEFAULT '0',
  `angcount` int(11) NOT NULL DEFAULT '0' COMMENT 'count - for Angelscity',
  `nlevel` int(2) NOT NULL DEFAULT '0',
  `nsila` int(5) NOT NULL DEFAULT '0',
  `nlovk` int(5) NOT NULL DEFAULT '0',
  `ninta` int(5) NOT NULL DEFAULT '0',
  `nvinos` int(5) NOT NULL DEFAULT '0',
  `nintel` int(5) NOT NULL DEFAULT '0',
  `nmudra` int(5) NOT NULL DEFAULT '0',
  `nnoj` int(2) NOT NULL DEFAULT '0',
  `ntopor` int(2) NOT NULL DEFAULT '0',
  `ndubina` int(2) NOT NULL DEFAULT '0',
  `nmech` int(2) NOT NULL DEFAULT '0',
  `nalign` int(11) NOT NULL DEFAULT '0',
  `minu` int(5) NOT NULL DEFAULT '0',
  `maxu` int(5) NOT NULL DEFAULT '0',
  `gsila` int(5) NOT NULL DEFAULT '0',
  `glovk` int(5) NOT NULL DEFAULT '0',
  `ginta` int(5) NOT NULL DEFAULT '0',
  `gintel` int(5) NOT NULL DEFAULT '0',
  `ghp` int(5) NOT NULL DEFAULT '0',
  `gmp` int(10) NOT NULL,
  `mfkrit` int(5) NOT NULL DEFAULT '0',
  `mfakrit` int(5) NOT NULL DEFAULT '0',
  `mfuvorot` int(5) NOT NULL DEFAULT '0',
  `mfauvorot` int(5) NOT NULL DEFAULT '0',
  `gnoj` int(5) NOT NULL DEFAULT '0',
  `gtopor` int(5) NOT NULL DEFAULT '0',
  `gdubina` int(5) NOT NULL DEFAULT '0',
  `gmech` int(5) NOT NULL DEFAULT '0',
  `img` varchar(100) NOT NULL DEFAULT '',
  `shshop` tinyint(1) NOT NULL DEFAULT '0',
  `bron1` int(5) NOT NULL DEFAULT '0',
  `bron2` int(5) NOT NULL DEFAULT '0',
  `bron3` int(5) NOT NULL DEFAULT '0',
  `bron4` int(5) NOT NULL DEFAULT '0',
  `dategoden` int(15) NOT NULL DEFAULT '0',
  `magic` int(5) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0',
  `massa` float(4,1) NOT NULL DEFAULT '0.0',
  `goden` int(4) NOT NULL DEFAULT '0',
  `needident` tinyint(1) NOT NULL DEFAULT '0',
  `nfire` int(3) NOT NULL DEFAULT '0',
  `nwater` int(3) NOT NULL DEFAULT '0',
  `nair` int(3) NOT NULL DEFAULT '0',
  `nearth` int(3) NOT NULL DEFAULT '0',
  `nlight` int(3) NOT NULL DEFAULT '0',
  `ngray` int(3) NOT NULL DEFAULT '0',
  `ndark` int(3) NOT NULL DEFAULT '0',
  `gfire` int(3) NOT NULL DEFAULT '0',
  `gwater` int(3) NOT NULL DEFAULT '0',
  `gair` int(3) NOT NULL DEFAULT '0',
  `gearth` int(3) NOT NULL DEFAULT '0',
  `glight` int(3) NOT NULL DEFAULT '0',
  `ggray` int(3) NOT NULL DEFAULT '0',
  `gdark` int(3) NOT NULL DEFAULT '0',
  `letter` text NOT NULL,
  `isrep` tinyint(1) NOT NULL DEFAULT '1',
  `razdel` int(3) NOT NULL DEFAULT '0',
  `nsex` tinyint(3) NOT NULL DEFAULT '0',
  `gmeshok` int(55) NOT NULL,
  `group` int(5) NOT NULL DEFAULT '0',
  `wopen` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'открыто или закрыто для оружейки',
  `ab_mf` int(11) NOT NULL DEFAULT '0',
  `ab_bron` int(11) NOT NULL DEFAULT '0',
  `ab_uron` int(11) NOT NULL DEFAULT '0',
  `need_wins` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько надо побед',
  `artproto` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'включено ли для прототипа артифакта',
  `ecost` float(10,2) NOT NULL,
  `glava` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'для покупок глав кланов',
  `includemagic` int(11) NOT NULL,
  `includemagiccost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicdex` int(11) NOT NULL,
  `includemagicekrcost` float(10,2) NOT NULL DEFAULT '0.00',
  `includemagicmax` int(11) NOT NULL,
  `includemagicname` varchar(100) NOT NULL,
  `includemagicuses` int(5) NOT NULL,
  `klan` varchar(255) DEFAULT NULL COMMENT 'для клановых предметов',
  `owner` int(255) NOT NULL DEFAULT '0' COMMENT 'для именых предметов чара',
  `charge_rep` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'флаг списывать ли репу',
  `is_owner` tinyint(1) NOT NULL DEFAULT '0',
  `mfbonus` int(11) NOT NULL DEFAULT '0' COMMENT 'mfbonus',
  `unikflag` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'для ком отдела, для продажи уников',
  `stbonus` int(11) NOT NULL DEFAULT '0' COMMENT 'stbonus',
  `ekr_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `img_big` varchar(100) NOT NULL DEFAULT '',
  `rareitem` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `repcost` int(10) unsigned NOT NULL DEFAULT '0',
  `notsell` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `craftspeedup` int(11) unsigned NOT NULL DEFAULT '0',
  `craftbonus` int(11) unsigned NOT NULL DEFAULT '0',
  `nclass` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'необходимый класс',
  `dressroom` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `new_item` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг нового предмета',
  `shopbanner` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'номера банеров 1- Новинка , 2 - Акция',
  PRIMARY KEY (`id`),
  KEY `count` (`count`),
  KEY `razdel` (`razdel`),
  KEY `avacount` (`avacount`),
  KEY `artproto` (`artproto`),
  KEY `img` (`img`),
  KEY `unikflag` (`unikflag`)
) ENGINE=InnoDB AUTO_INCREMENT=1991226256 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `shop_stats`;
CREATE TABLE `shop_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `shoptype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 - гос, 2 - береза, 3 - цветочка, 4 - храм лавка, 5 - ярмарка',
  `shopprototype` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'id прототипа',
  `shopcount` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'доп поле сортировки на всякие',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_2` (`owner`,`shoptype`,`shopprototype`),
  KEY `owner` (`owner`),
  KEY `shoptype` (`shoptype`),
  KEY `shopcount` (`shopcount`),
  KEY `lastupdate` (`lastupdate`)
) ENGINE=InnoDB AUTO_INCREMENT=4273589 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `shop_suit_prototype`;
CREATE TABLE `shop_suit_prototype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prototype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `sex` tinyint(3) NOT NULL DEFAULT '2' COMMENT '0_Ж 1_М 2_все',
  `img_name` varchar(30) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '1999999999' COMMENT 'in sec, no exp_time 1999999999',
  PRIMARY KEY (`id`),
  KEY `id_prototype` (`id_prototype`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=cp1251 COMMENT='Картинки костюмов => прототип коробки (магия одна)';

DROP TABLE IF EXISTS `skupka`;
CREATE TABLE `skupka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид предмета',
  `stavka` int(11) NOT NULL DEFAULT '0' COMMENT 'какой бонус на продажу',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemid` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=13393 DEFAULT CHARSET=cp1251 COMMENT='таблица скупки по свиткам';

DROP TABLE IF EXISTS `smiles`;
CREATE TABLE `smiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `w` int(10) unsigned NOT NULL,
  `h` int(10) unsigned NOT NULL,
  `klan` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `owner` (`owner`),
  KEY `klan` (`klan`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `sms_payments`;
CREATE TABLE `sms_payments` (
  `Id` int(50) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(50) NOT NULL DEFAULT '0',
  `ekr` float(10,2) NOT NULL DEFAULT '0.00',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `bank_account` int(55) NOT NULL DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '3',
  `order_id` int(50) NOT NULL DEFAULT '0',
  `inv_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10650 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `sn_settings`;
CREATE TABLE `sn_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `key` text,
  `public_key` text,
  `secret_key` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `sn_temp`;
CREATE TABLE `sn_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn_type` int(11) NOT NULL,
  `sn_id` text NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` int(11) DEFAULT '0',
  `email` text,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `sid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3778 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `social`;
CREATE TABLE `social` (
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'чар ид',
  `social` varchar(10) NOT NULL DEFAULT '' COMMENT 'название сети',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чела в сети',
  PRIMARY KEY (`owner`,`social`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='социальные сети';

DROP TABLE IF EXISTS `stat_fight`;
CREATE TABLE `stat_fight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fight_type` varchar(255) NOT NULL,
  `location_type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `stat_location_end`;
CREATE TABLE `stat_location_end` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `static_message`;
CREATE TABLE `static_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `is_send` tinyint(1) NOT NULL DEFAULT '0',
  `must_send` int(11) NOT NULL DEFAULT '0',
  `day_interval` int(11) NOT NULL DEFAULT '1',
  `message_type` varchar(255) NOT NULL,
  `is_fixed` tinyint(1) DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `id` int(10) unsigned NOT NULL,
  `tocity` tinyint(3) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `starttime` char(5) NOT NULL,
  `price` float unsigned DEFAULT NULL,
  `count` int(10) unsigned NOT NULL,
  `defcount` int(10) unsigned NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `protoid` int(10) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `starttime` (`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `station_go`;
CREATE TABLE `station_go` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room` int(10) unsigned NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `tocity` tinyint(3) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room` (`room`,`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `stats_drop_info`;
CREATE TABLE `stats_drop_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `lvl` int(11) unsigned NOT NULL DEFAULT '0',
  `proto` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13884 DEFAULT CHARSET=cp1251 COMMENT='статистика по хилу который упал';

DROP TABLE IF EXISTS `stats_drop_info_arhive`;
CREATE TABLE `stats_drop_info_arhive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `lvl` int(11) unsigned NOT NULL DEFAULT '0',
  `proto` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37857 DEFAULT CHARSET=cp1251 COMMENT='статистика по хилу который упал';

DROP TABLE IF EXISTS `stol`;
CREATE TABLE `stol` (
  `owner` bigint(20) NOT NULL DEFAULT '0',
  `stol` smallint(6) NOT NULL DEFAULT '0' COMMENT 'номер квеста навсяк',
  `count` varchar(255) NOT NULL DEFAULT '0' COMMENT 'сколько раз',
  PRIMARY KEY (`owner`,`stol`),
  KEY `owner` (`owner`),
  KEY `stol` (`stol`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='празничный стол';

DROP TABLE IF EXISTS `stur_logs`;
CREATE TABLE `stur_logs` (
  `id` int(11) NOT NULL,
  `type` int(5) DEFAULT NULL COMMENT 'тип турнира',
  `start_time` int(11) DEFAULT NULL COMMENT 'начало турнира',
  `logs` longblob COMMENT 'логи турнира',
  `end_time` int(11) DEFAULT NULL COMMENT 'окончание',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'состояние',
  `winer` text COMMENT 'слепок победителя',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='логи новыых турниров для годовщины';

DROP TABLE IF EXISTS `stur_users`;
CREATE TABLE `stur_users` (
  `stur` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид турнира',
  `t1_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `t2_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `stat` smallint(5) unsigned NOT NULL DEFAULT '0',
  `krug` int(11) unsigned NOT NULL DEFAULT '0',
  `sttime` timestamp NULL DEFAULT NULL COMMENT 'время когда стартовать бой',
  `room` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `battle` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`room`),
  KEY `stur` (`stur`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='участники';

DROP TABLE IF EXISTS `sturnir`;
CREATE TABLE `sturnir` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nazv` varchar(255) NOT NULL DEFAULT '' COMMENT 'название турнира',
  `allc` int(11) unsigned NOT NULL DEFAULT '8' COMMENT 'учасников в старте',
  `inc` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сколько уже учавствует',
  `stat` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'состояние турнира',
  `krug` int(11) unsigned NOT NULL DEFAULT '4' COMMENT 'круг 1/4 1/2 1/1',
  `mktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251 COMMENT='спец турнир';

DROP TABLE IF EXISTS `sub_dil`;
CREATE TABLE `sub_dil` (
  `dil` int(11) NOT NULL DEFAULT '0' COMMENT 'ид диллера',
  `dil_login` varchar(30) DEFAULT NULL,
  `subdil` int(11) NOT NULL DEFAULT '0' COMMENT 'ид субдиллера',
  `subdil_login` varchar(30) DEFAULT NULL,
  KEY `subdil` (`subdil`),
  KEY `dil` (`dil`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='инфа по суб.диллерам';

DROP TABLE IF EXISTS `t_list`;
CREATE TABLE `t_list` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `time_start` int(11) NOT NULL DEFAULT '0',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `state` enum('offer','during','finished') NOT NULL DEFAULT 'offer',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `t_use`;
CREATE TABLE `t_use` (
  `owner` int(11) NOT NULL,
  `date` varchar(255) NOT NULL DEFAULT '',
  `proto` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `owner` (`owner`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='использование хеллоуинских тыкв';

DROP TABLE IF EXISTS `t_use_tykva`;
CREATE TABLE `t_use_tykva` (
  `proto` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид предмета',
  `count1` int(11) unsigned NOT NULL DEFAULT '0',
  `count2` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`proto`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='стоп таблица';

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `user_html` varchar(500) DEFAULT '',
  `time_added` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `t_victims`;
CREATE TABLE `t_victims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL DEFAULT '0',
  `state` enum('awaiting','accepted','finished') NOT NULL DEFAULT 'awaiting',
  `user_id_left` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id_right` bigint(20) unsigned NOT NULL DEFAULT '0',
  `state_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_left_ready` enum('Y','N') NOT NULL DEFAULT 'N',
  `user_right_ready` enum('Y','N') NOT NULL DEFAULT 'N',
  `win_side` enum('left','right') DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `telegraph`;
CREATE TABLE `telegraph` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `owner` int(255) NOT NULL,
  `date` varchar(15) NOT NULL,
  `text` text NOT NULL,
  `addinfo` int(11) NOT NULL DEFAULT '0' COMMENT 'доп поле',
  `deltime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время удаления',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `deltime` (`deltime`)
) ENGINE=InnoDB AUTO_INCREMENT=19525679 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `test_tab`;
CREATE TABLE `test_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=cp1251 COMMENT='test';

DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestump` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `field1` int(11) DEFAULT NULL,
  `field2` int(11) DEFAULT NULL,
  `field3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28454 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `top_list`;
CREATE TABLE `top_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `description2` text,
  `is_enabled` tinyint(1) DEFAULT '1',
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `updated_at` int(11) DEFAULT '0',
  `position` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `top_rate`;
CREATE TABLE `top_rate` (
  `user_id` int(11) NOT NULL,
  `action_type` varchar(255) NOT NULL COMMENT 'Тип акции',
  `rate_type` int(11) NOT NULL DEFAULT '0' COMMENT '1 - дарили подарки\r\n2 - принимали подарки',
  `value` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`action_type`,`rate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `top_victorina`;
CREATE TABLE `top_victorina` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `answers` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Ответы юзеров на викторину';

DROP TABLE IF EXISTS `topclans`;
CREATE TABLE `topclans` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `klan` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(255) NOT NULL,
  `http` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `klan` (`klan`),
  KEY `count` (`count`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `to_id` int(255) NOT NULL DEFAULT '0',
  `login` varchar(255) NOT NULL DEFAULT '',
  `txt` text NOT NULL,
  `kr` int(55) NOT NULL DEFAULT '0',
  `id` int(255) NOT NULL DEFAULT '0',
  `baer` int(255) NOT NULL DEFAULT '0',
  `zalog` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'для мф. залог',
  `mktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'время создания опрерации',
  `proto` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'прототип для продажи пачкой',
  `kol` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество для продажи пачкой',
  KEY `to_id` (`to_id`),
  KEY `baer` (`baer`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `trader_balance`;
CREATE TABLE `trader_balance` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(40) DEFAULT '0',
  `traderid` int(11) DEFAULT NULL,
  `bankid` int(11) NOT NULL DEFAULT '0' COMMENT 'если пополнялось чару в банк',
  `amount` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `balanceamount` float DEFAULT NULL,
  `timestamp` varchar(10) DEFAULT NULL,
  `method` varchar(25) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `traderid` (`traderid`)
) ENGINE=InnoDB AUTO_INCREMENT=10928 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `trader_balance_delo`;
CREATE TABLE `trader_balance_delo` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `dilerid` int(50) NOT NULL DEFAULT '0',
  `dilername` varchar(50) NOT NULL,
  `bank` int(50) NOT NULL DEFAULT '0',
  `owner` varchar(50) NOT NULL,
  `ekr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addition` int(5) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `klan` varchar(255) DEFAULT '' COMMENT 'клан чара',
  `kof` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT 'коэф',
  `b` tinyint(3) NOT NULL DEFAULT '1',
  `paysyst` varchar(20) NOT NULL DEFAULT '' COMMENT 'платежная система',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=834166 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `trader_balance_don`;
CREATE TABLE `trader_balance_don` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymode` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `transaction_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Id платежа в системе Payeer',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки Деньги Онлайн';

DROP TABLE IF EXISTS `trader_balance_liqpay`;
CREATE TABLE `trader_balance_liqpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sender_phone` varchar(20) NOT NULL DEFAULT '' COMMENT 'номер tel',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `transaction_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Id платежа в системе LiqPay',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание',
  `sub_trx` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120536 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки LiqPay';

DROP TABLE IF EXISTS `trader_balance_okpay`;
CREATE TABLE `trader_balance_okpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `sum_usd` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма в usd',
  `sum_rub` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма в рублях',
  `currency` varchar(3) NOT NULL DEFAULT '' COMMENT 'валюта в которой выставили счет',
  `ok_txn_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'ok_txn_amount',
  `ok_txn_net` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'ok_txn_net',
  `ok_txn_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'ok_txn_fee',
  `ok_txn_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ok_txn_datetime',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `trans` int(11) NOT NULL DEFAULT '0' COMMENT 'ид ранзы в Okpay',
  `PaymentMethod` varchar(255) NOT NULL DEFAULT '' COMMENT 'системе okpay',
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание наше ',
  `logdata` text NOT NULL COMMENT ' все остальныные переменные после оплаты ',
  `sub_trx` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'если оплата через суб.агрегатора ид транзы',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5004054 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки okpay';

DROP TABLE IF EXISTS `trader_balance_paypal`;
CREATE TABLE `trader_balance_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `sum_real` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sender_mail` varchar(200) NOT NULL DEFAULT '' COMMENT 'отправитель',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `transaction_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Id платежа в системе PayPay',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание',
  `sub_trx` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=905941 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки PayPal';

DROP TABLE IF EXISTS `trader_balance_qiwi`;
CREATE TABLE `trader_balance_qiwi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` float(13,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `sum_rub` float(13,2) NOT NULL DEFAULT '0.00',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qiwi` varchar(12) NOT NULL DEFAULT '' COMMENT 'номер киви',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `kurs` float(6,3) NOT NULL DEFAULT '0.000' COMMENT 'учет курса для диллеров',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14267 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки киви';

DROP TABLE IF EXISTS `trader_balance_robo`;
CREATE TABLE `trader_balance_robo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `sum_rub` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма в рублях',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `PaymentMethod` varchar(255) NOT NULL DEFAULT '' COMMENT 'системе robo',
  `IncCurrLabel` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301183 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки ROBOKASSA';

DROP TABLE IF EXISTS `trader_balance_ubill`;
CREATE TABLE `trader_balance_ubill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `sum_rub` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sender_phone` varchar(20) NOT NULL DEFAULT '' COMMENT 'номер tel',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `transaction_id` int(11) unsigned DEFAULT NULL COMMENT 'Id платежа в системе ubill',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=500056 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки ubill';

DROP TABLE IF EXISTS `trader_balance_yandex`;
CREATE TABLE `trader_balance_yandex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '' COMMENT 'ник',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT 'банк',
  `sum_ekr` float(13,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма екров',
  `sum_rub` float(13,2) NOT NULL DEFAULT '0.00',
  `param` int(11) NOT NULL DEFAULT '0' COMMENT 'если оплата а не покупка тип покупки',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-выставлен, 1- оплачен',
  `description` text NOT NULL COMMENT 'описание',
  `allinfo` text NOT NULL COMMENT 'полный запрос системы',
  `invoiceId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150366 DEFAULT CHARSET=cp1251 COMMENT='счета для обработки yandex';

DROP TABLE IF EXISTS `trader_partn_trans`;
CREATE TABLE `trader_partn_trans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `par_id` int(11) unsigned NOT NULL DEFAULT '0',
  `par_serv` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `mk_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pay_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма в екрах транзы',
  `pay_syst` varchar(255) NOT NULL DEFAULT '' COMMENT 'платежная система',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100019 DEFAULT CHARSET=cp1251 COMMENT='транзакции партнеров';

DROP TABLE IF EXISTS `trader_partners`;
CREATE TABLE `trader_partners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT NULL COMMENT 'ид партнера',
  `par_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'название партнера',
  `par_key` varchar(20) NOT NULL DEFAULT '' COMMENT 'типа пароль доступа',
  `par_serv` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сервис партнера',
  `par_serv_desc` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание сервиса',
  `par_active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'состояние сервиса',
  `cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'стоимость услуги',
  `sum_ekr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'заработанные екр',
  `par_rate` decimal(10,2) unsigned NOT NULL DEFAULT '10.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `servise_id` (`par_id`,`par_serv`,`par_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251 COMMENT='таблица сервисов партнеров';

DROP TABLE IF EXISTS `tur_grup`;
CREATE TABLE `tur_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(3) NOT NULL DEFAULT '0' COMMENT 'типа/уровень',
  `nazva` varchar(12) NOT NULL DEFAULT 'Отряд' COMMENT 'название отряда',
  `owner1` int(25) NOT NULL DEFAULT '0' COMMENT 'первый',
  `owner_data1` text COMMENT 'html',
  `owner2` int(25) NOT NULL DEFAULT '0' COMMENT 'ворой',
  `owner_data2` text COMMENT 'html',
  `owner3` int(25) NOT NULL DEFAULT '0' COMMENT 'третий',
  `owner_data3` text COMMENT 'html',
  `stat` int(11) NOT NULL DEFAULT '0' COMMENT 'тайм штамп в турнирах отрядов для отдыха',
  `volna` int(11) NOT NULL DEFAULT '0' COMMENT 'номер волны в групп-турнирах',
  `pass` varchar(12) DEFAULT NULL COMMENT 'пароль команды',
  `active` int(1) DEFAULT '1' COMMENT '1- живая тима',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'ид боя если в бою',
  `demag` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько набито',
  `c` int(11) NOT NULL DEFAULT '0' COMMENT 'счет клонов',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nazva` (`nazva`,`active`),
  KEY `owner1` (`owner1`),
  KEY `owner2` (`owner2`),
  KEY `owner3` (`owner3`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='списки групп для гупповых турниров';

DROP TABLE IF EXISTS `tur_logs`;
CREATE TABLE `tur_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(5) DEFAULT NULL COMMENT 'тип турнира',
  `start_time` int(11) DEFAULT NULL COMMENT 'начало турнира',
  `logs` longblob COMMENT 'логи турнира',
  `end_time` int(11) DEFAULT NULL COMMENT 'окончание',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'состояние',
  `winer` text COMMENT 'слепок победителя',
  `gotime` int(11) NOT NULL DEFAULT '0' COMMENT 'время выброса - таймер на не бои',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`start_time`),
  KEY `id` (`id`),
  KEY `active` (`active`),
  KEY `start_time` (`start_time`),
  KEY `gotime` (`gotime`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=97783 DEFAULT CHARSET=cp1251 COMMENT='логи всех турниров';

DROP TABLE IF EXISTS `tur_raspis`;
CREATE TABLE `tur_raspis` (
  `tur_type` int(4) NOT NULL DEFAULT '0' COMMENT 'типы 210- одиночный 240- группа 270-отряды',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT 'время открытия заявки',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-закрыто(планируется) 1- открыта(открыт вход)  2- идет(в процессе соревнования) -3 - окончен',
  `sendmsg` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'system_msg',
  UNIQUE KEY `tur_type` (`tur_type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='главная таблица расписаний турниров';

DROP TABLE IF EXISTS `tur_stat`;
CREATE TABLE `tur_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` text NOT NULL COMMENT 'кеш для названия и чаров  группы html',
  `u1` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара 1',
  `u2` int(11) NOT NULL DEFAULT '0',
  `u3` int(11) NOT NULL DEFAULT '0',
  `demag` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько группа набила',
  `btime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'время када был бой',
  `start` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-не стартанула/1-еще воюет/2-окончила',
  `lvl` int(11) NOT NULL DEFAULT '0' COMMENT 'уровень',
  `pas` varchar(10) NOT NULL DEFAULT '' COMMENT 'пароль группы',
  `com` varchar(100) NOT NULL DEFAULT '' COMMENT 'комментарий к заявке',
  `volna` int(11) NOT NULL DEFAULT '0' COMMENT 'номер волны',
  `c` int(11) NOT NULL DEFAULT '0' COMMENT 'счет для номеров клонов',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'ид боя',
  `testflag` int(11) NOT NULL DEFAULT '0' COMMENT 'флаг тестового конфига',
  `use_gerb1` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'какой герб будет использован',
  `use_gerb2` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `use_gerb3` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `btime` (`btime`),
  KEY `lvl` (`lvl`),
  KEY `start` (`start`),
  KEY `u1` (`u1`),
  KEY `u2` (`u2`),
  KEY `u3` (`u3`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB AUTO_INCREMENT=19224 DEFAULT CHARSET=cp1251 COMMENT='данные набитые за последние 6 часов';

DROP TABLE IF EXISTS `unic_log`;
CREATE TABLE `unic_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `creater` int(11) NOT NULL DEFAULT '0',
  `where_cr` int(11) NOT NULL DEFAULT '0',
  `what_add` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23111 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_2fa`;
CREATE TABLE `user_2fa` (
  `user_id` int(11) unsigned NOT NULL,
  `secret` text NOT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '0 - выключена, 1 - включена, но не активирована, 2 - активирована',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_advert`;
CREATE TABLE `user_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ts_id` int(11) NOT NULL,
  `cpa` text NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `need_send_postback` tinyint(1) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_advises_status`;
CREATE TABLE `user_advises_status` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL,
  `first_entry` int(25) DEFAULT NULL,
  `first_battle` int(25) DEFAULT NULL,
  `first_up` int(25) DEFAULT NULL,
  `second_up` int(25) DEFAULT NULL,
  `third_up` int(11) DEFAULT NULL,
  `lvl0` varchar(255) DEFAULT NULL,
  `lvl1` longtext,
  `lvl2` longtext,
  `lvl3` longtext,
  `lvl4` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49696 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_badge`;
CREATE TABLE `user_badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text,
  `alt` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1' COMMENT 'вкл или выключен',
  `show_time` tinyint(1) DEFAULT '1' COMMENT 'показываем по времени',
  `show_started_at` int(11) DEFAULT '0',
  `show_ended_at` int(11) DEFAULT '0',
  `rate_unique` varchar(255) NOT NULL COMMENT 'идентификатор значка',
  `stage` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0' COMMENT 'дата добавления',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21645 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_dialog`;
CREATE TABLE `user_dialog` (
  `user_id` int(11) unsigned NOT NULL,
  `quest_id` int(11) NOT NULL,
  `dialog_id` int(11) NOT NULL,
  `state` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `quest_id` (`quest_id`,`user_id`,`dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_event_rating`;
CREATE TABLE `user_event_rating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rating_id` int(11) NOT NULL,
  `iteration_num` int(11) DEFAULT '1',
  `value` int(11) DEFAULT '0',
  `is_end` tinyint(1) DEFAULT '0',
  `is_reward` tinyint(1) DEFAULT '0',
  `is_closed` tinyint(1) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `reward_till` int(11) DEFAULT '0' COMMENT 'дата до которого можно забрать награду',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3077 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_location`;
CREATE TABLE `user_location` (
  `user_id` int(25) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `city` varchar(255) NOT NULL DEFAULT 'capitalcity' COMMENT 'город',
  `in_clan_tournament` tinyint(1) DEFAULT '0',
  `location_special_id` int(11) DEFAULT '0' COMMENT 'id турнира, в котором находится',
  `location_special_id2` int(11) DEFAULT '0',
  `location_special_id3` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='место нахождения чара';

DROP TABLE IF EXISTS `user_quest`;
CREATE TABLE `user_quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'завершили квест',
  `is_send_gift` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'отправили подарок за выполнение квеста',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'отказались от квеста',
  `is_end` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'закончился квест',
  `dialog_id_save` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `ended_at` int(11) NOT NULL DEFAULT '0',
  `custom_dialog_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_user_quest_quest_list_id` (`quest_id`),
  KEY `user_id` (`user_id`,`is_finished`,`is_cancel`,`is_end`)
) ENGINE=InnoDB AUTO_INCREMENT=1534644 DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=16384;

DROP TABLE IF EXISTS `user_quest_check`;
CREATE TABLE `user_quest_check` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `check_type` varchar(255) NOT NULL DEFAULT '',
  `check_count` int(11) NOT NULL,
  `params` text,
  `created_at` int(11) DEFAULT '0',
  `finished_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124605 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_quest_event`;
CREATE TABLE `user_quest_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `count` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `date_event` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3125 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_quest_info_start`;
CREATE TABLE `user_quest_info_start` (
  `user_quest_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `align` varchar(255) NOT NULL,
  `craft_levels` text,
  PRIMARY KEY (`user_quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_quest_location_dialog`;
CREATE TABLE `user_quest_location_dialog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_quest_log`;
CREATE TABLE `user_quest_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quest_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `pocket_item_id` int(11) DEFAULT NULL,
  `user_quest_id` int(11) DEFAULT NULL,
  `user_part_id` int(11) DEFAULT NULL,
  `user_task_id` int(11) DEFAULT NULL,
  `check_count` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8846097 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_quest_part`;
CREATE TABLE `user_quest_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_quest_id` int(11) NOT NULL COMMENT 'id квеста, в таблице user_quest',
  `quest_id` int(11) NOT NULL COMMENT 'id квеста',
  `quest_part_id` int(11) NOT NULL COMMENT 'id части квеста',
  `user_id` int(11) NOT NULL COMMENT 'id пользователя',
  `is_finished` tinyint(1) DEFAULT '0',
  `is_started` tinyint(1) DEFAULT '0',
  `started_at` int(11) DEFAULT '0',
  `ended_at` int(11) DEFAULT '0',
  `ready_to_finish` tinyint(1) DEFAULT '0',
  `part_number` int(11) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_user_quest_part_quest_list_id` (`quest_id`),
  KEY `FK_user_quest_part_quest_part_id` (`quest_part_id`),
  KEY `FK_user_quest_part_user_quest_id` (`user_quest_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1814616 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;

DROP TABLE IF EXISTS `user_quest_part_item`;
CREATE TABLE `user_quest_part_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_quest_id` int(11) NOT NULL,
  `user_quest_part_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `quest_part_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `need_count` int(11) NOT NULL,
  `ended_at` int(11) DEFAULT '0',
  `is_finished` tinyint(1) DEFAULT '0',
  `process` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_user_quest_part_item_quest_list_id` (`quest_id`),
  KEY `FK_user_quest_part_item_quest_part_id` (`quest_part_id`),
  KEY `FK_user_quest_part_item_user_quest_id` (`user_quest_id`),
  KEY `FK_user_quest_part_item_user_quest_part_id` (`user_quest_part_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2578610 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;

DROP TABLE IF EXISTS `user_reward_list`;
CREATE TABLE `user_reward_list` (
  `user_id` int(11) unsigned NOT NULL,
  `reward_type` varchar(255) NOT NULL DEFAULT '0',
  `create_at` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`,`reward_type`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `user_security`;
CREATE TABLE `user_security` (
  `user_id` int(11) unsigned NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `second_password` varchar(255) DEFAULT NULL,
  `status_2fa` tinyint(1) DEFAULT '0',
  `secret_2fa` varchar(255) DEFAULT NULL,
  `security_cooldown` int(11) DEFAULT '0',
  `transfer_cooldown` int(11) DEFAULT '0',
  `reset_token` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `pass` blob NOT NULL,
  `second_password` varchar(255) NOT NULL DEFAULT '' COMMENT 'второй пароль, если поле пустое - нету',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `borndate` varchar(12) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '',
  `icq` int(15) NOT NULL DEFAULT '0',
  `http` varchar(255) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `lozung` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(7) NOT NULL DEFAULT '0',
  `level` int(2) NOT NULL DEFAULT '0',
  `align` varchar(6) NOT NULL DEFAULT '0',
  `klan` varchar(25) NOT NULL DEFAULT '',
  `sila` int(4) NOT NULL DEFAULT '3',
  `lovk` int(4) NOT NULL DEFAULT '3',
  `inta` int(4) NOT NULL DEFAULT '3',
  `vinos` int(4) NOT NULL DEFAULT '3',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `win` int(7) NOT NULL DEFAULT '0',
  `lose` int(7) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `borncity` varchar(100) NOT NULL DEFAULT '',
  `borntime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room` int(5) NOT NULL DEFAULT '1',
  `maxhp` int(6) NOT NULL DEFAULT '18',
  `hp` int(6) NOT NULL DEFAULT '18',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `stats` int(5) NOT NULL DEFAULT '3',
  `exp` bigint(55) unsigned NOT NULL DEFAULT '0',
  `master` int(5) NOT NULL DEFAULT '1',
  `shadow` varchar(60) NOT NULL DEFAULT '0.gif',
  `nextup` bigint(55) unsigned NOT NULL DEFAULT '20',
  `m1` int(255) NOT NULL DEFAULT '0',
  `m2` int(255) NOT NULL DEFAULT '0',
  `m3` int(255) NOT NULL DEFAULT '0',
  `m4` int(255) NOT NULL DEFAULT '0',
  `m5` int(255) NOT NULL DEFAULT '0',
  `m6` int(255) NOT NULL DEFAULT '0',
  `m7` int(255) NOT NULL DEFAULT '0',
  `m8` int(255) NOT NULL DEFAULT '0',
  `m9` int(255) NOT NULL DEFAULT '0',
  `m10` int(255) NOT NULL DEFAULT '0',
  `m11` int(255) NOT NULL DEFAULT '0',
  `m12` int(255) NOT NULL DEFAULT '0',
  `m13` int(255) NOT NULL DEFAULT '0',
  `m14` int(255) NOT NULL DEFAULT '0',
  `m15` int(255) NOT NULL DEFAULT '0',
  `m16` int(255) unsigned NOT NULL DEFAULT '0',
  `m17` int(255) unsigned NOT NULL DEFAULT '0',
  `m18` int(255) unsigned NOT NULL DEFAULT '0',
  `m19` int(255) unsigned NOT NULL DEFAULT '0',
  `m20` int(255) unsigned NOT NULL DEFAULT '0',
  `nakidka` bigint(20) NOT NULL DEFAULT '0' COMMENT 'накидка',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `fullhptime` int(10) NOT NULL DEFAULT '0',
  `zayavka` int(255) NOT NULL DEFAULT '0',
  `battle` int(255) NOT NULL DEFAULT '0',
  `battle_t` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'сторона за которую воюет чар',
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `palcom` varchar(255) NOT NULL DEFAULT '',
  `medals` text NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `podarokAD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'используется для отравы в лабе/ флаг лошади в загороде',
  `lab` tinyint(1) NOT NULL DEFAULT '0',
  `bot` tinyint(1) NOT NULL DEFAULT '0',
  `in_tower` tinyint(1) NOT NULL DEFAULT '0',
  `ekr` decimal(10,2) DEFAULT NULL,
  `chattime` int(25) NOT NULL,
  `sid` varchar(128) NOT NULL,
  `fullmptime` int(20) NOT NULL,
  `deal` tinyint(1) NOT NULL DEFAULT '0',
  `married` varchar(50) NOT NULL,
  `injury_possible` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'флаг оповещения для лошадок',
  `labzay` bigint(20) NOT NULL DEFAULT '0',
  `fcount` int(5) DEFAULT '0' COMMENT 'счетчик бесплат.подгонок на чаре',
  `rep` bigint(15) NOT NULL DEFAULT '0' COMMENT 'репа храма',
  `repmoney` bigint(20) NOT NULL DEFAULT '0' COMMENT 'репа-деньги',
  `last_battle` int(255) NOT NULL DEFAULT '0' COMMENT 'последний бой ид',
  `vk_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'vk',
  `bpzay` bigint(20) NOT NULL DEFAULT '0' COMMENT 'заявка на мега бой',
  `bpalign` int(11) NOT NULL DEFAULT '0' COMMENT 'закого воюем. свет или тьма',
  `bpstor` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'на какой стороне след.бой',
  `bpbonussila` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько бонуса силы',
  `bpbonushp` int(11) NOT NULL DEFAULT '0',
  `show_advises` varchar(15) NOT NULL DEFAULT '1' COMMENT 'масив для настроек',
  `hidden` bigint(255) NOT NULL DEFAULT '0' COMMENT 'невидимка ИД',
  `battle_fin` tinyint(1) NOT NULL DEFAULT '0',
  `gruppovuha` text NOT NULL COMMENT 'масив настроек',
  `autofight` tinyint(1) DEFAULT NULL,
  `expbonus` decimal(10,2) NOT NULL DEFAULT '1.00',
  `wcount` int(11) NOT NULL DEFAULT '0' COMMENT 'победы подряд в хаоте',
  `victorina` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик викторины',
  `id_grup` int(11) NOT NULL DEFAULT '0' COMMENT 'id для груповых турниров',
  `prem` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'премиум',
  `hiller` int(11) NOT NULL DEFAULT '0' COMMENT 'хиллер- комудать опыт за следующий удар',
  `khiller` int(3) NOT NULL DEFAULT '0' COMMENT 'коэф хиллера',
  `slp` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'признак молчанки',
  `trv` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'признак защиты от  травмы',
  `ldate` int(11) NOT NULL DEFAULT '0' COMMENT 'реальное время обновляется в function',
  `stamina` int(11) NOT NULL DEFAULT '0' COMMENT 'выносливость',
  `odate` int(11) NOT NULL DEFAULT '0' COMMENT 'онлайн время',
  `id_city` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-кеп/1-авалон',
  `ruines` bigint(20) NOT NULL DEFAULT '0' COMMENT 'руины',
  `voinst` int(11) NOT NULL DEFAULT '0' COMMENT 'воинственность',
  `rubashka` int(55) NOT NULL DEFAULT '0' COMMENT 'рубашка',
  `stbat` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик статусных',
  `winstbat` int(11) NOT NULL DEFAULT '0' COMMENT 'побед в статусных боях',
  `citizen` varchar(50) NOT NULL DEFAULT '' COMMENT 'гражданство',
  `skulls` int(11) NOT NULL DEFAULT '0' COMMENT 'черепа',
  `hiddenlog` varchar(105) NOT NULL DEFAULT '' COMMENT 'ник в перевоплоте',
  `naim` int(11) NOT NULL DEFAULT '0',
  `naim_war` int(11) NOT NULL DEFAULT '0',
  `pasbaf` int(11) NOT NULL DEFAULT '0' COMMENT 'ид пасивного бафа',
  `runa1` int(11) NOT NULL DEFAULT '0',
  `runa2` int(11) NOT NULL DEFAULT '0',
  `runa3` int(11) NOT NULL DEFAULT '0',
  `is_sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'флаг, пользователь из соц. сетей или нет',
  `elkbat` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'счетчик еловых боев',
  `smagic` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'ид магии стихий 1-Огонь;2-Земля;3-Воздух;4-Вода',
  `unikstatus` varchar(255) NOT NULL DEFAULT '' COMMENT 'уникальный статус',
  `change` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'смена противника',
  `rep_bonus` decimal(10,2) unsigned NOT NULL DEFAULT '1.00' COMMENT 'проценты реп бонуса',
  `gold` int(10) unsigned NOT NULL DEFAULT '0',
  `znak` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'счетчик знаков',
  `buketbat` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик боев на букетах',
  `uclass` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'класс перса',
  `oldpass` blob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`,`email`),
  UNIQUE KEY `login_2` (`login`),
  KEY `klan` (`klan`),
  KEY `ip` (`ip`),
  KEY `bot` (`bot`),
  KEY `in_tower` (`in_tower`),
  KEY `chattime` (`chattime`),
  KEY `vinos` (`vinos`,`maxhp`),
  KEY `sid` (`sid`),
  KEY `maxhp` (`maxhp`),
  KEY `hp` (`hp`),
  KEY `maxmana` (`maxmana`),
  KEY `mana` (`mana`),
  KEY `battle` (`battle`),
  KEY `fullmptime` (`fullmptime`),
  KEY `fullhptime` (`fullhptime`),
  KEY `mudra` (`mudra`),
  KEY `vk_user_id` (`vk_user_id`),
  KEY `battle_t` (`battle_t`),
  KEY `hidden` (`hidden`),
  KEY `last_battle` (`last_battle`),
  KEY `ldate` (`ldate`),
  KEY `room` (`room`),
  KEY `ruines` (`ruines`),
  KEY `deal` (`deal`),
  KEY `id_city` (`id_city`),
  KEY `odate` (`odate`),
  KEY `zayavka` (`zayavka`),
  KEY `align` (`align`),
  KEY `borntime` (`borntime`),
  KEY `id_grup` (`id_grup`),
  KEY `id` (`id`,`battle`,`zayavka`),
  KEY `odate_2` (`odate`,`in_tower`,`room`),
  KEY `odate_3` (`odate`,`klan`,`id_city`),
  KEY `id_2` (`id`,`hp`),
  KEY `id_3` (`id`,`hp`,`battle`,`battle_t`),
  KEY `battle_2` (`battle`,`battle_t`),
  KEY `battle_3` (`battle`,`battle_t`,`hp`),
  KEY `battle_4` (`battle`,`hp`),
  KEY `battle_5` (`battle`,`in_tower`),
  KEY `battle_6` (`battle`,`battle_t`,`in_tower`),
  KEY `battle_7` (`battle`,`id_grup`),
  KEY `id_4` (`id`,`battle`),
  KEY `battle_8` (`battle`,`ruines`,`id_grup`),
  KEY `id_5` (`id`,`battle`,`in_tower`)
) ENGINE=InnoDB AUTO_INCREMENT=707819 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_14lvl`;
CREATE TABLE `users_14lvl` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `onflag` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'включен ли бонус опыта после',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=5925373 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_abils`;
CREATE TABLE `users_abils` (
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `magic_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид магии',
  `allcount` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько всего абилок',
  `findata` int(11) NOT NULL DEFAULT '0' COMMENT 'штамп окончания',
  `dailyc` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик юза для суточных абилок',
  `daily` int(11) NOT NULL DEFAULT '0' COMMENT 'если абилка посуточная то тут сколько в сутки выдавать если 0 то абилка просто на количество',
  UNIQUE KEY `owner` (`owner`,`magic_id`),
  KEY `owner_2` (`owner`),
  KEY `allcount` (`allcount`),
  KEY `daily` (`daily`),
  KEY `findata` (`findata`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='личные абилки';

DROP TABLE IF EXISTS `users_adminnotepad`;
CREATE TABLE `users_adminnotepad` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `txt` text NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_babil`;
CREATE TABLE `users_babil` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `magic` int(11) NOT NULL DEFAULT '0' COMMENT 'магия',
  `btype` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-не боевая, 1-боевая',
  `dur` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько осталось',
  `maxdur` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько максимум , для обнуления',
  PRIMARY KEY (`owner`,`magic`),
  KEY `btype` (`btype`),
  KEY `dur` (`dur`),
  KEY `maxdur` (`maxdur`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='автономные абилки';

DROP TABLE IF EXISTS `users_babil_time`;
CREATE TABLE `users_babil_time` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `stime` int(11) NOT NULL DEFAULT '0' COMMENT 'время последнего сброса',
  PRIMARY KEY (`owner`),
  UNIQUE KEY `owner_2` (`owner`,`stime`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблица когда можно сбрасывать абилки';

DROP TABLE IF EXISTS `users_bcp`;
CREATE TABLE `users_bcp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(11) NOT NULL DEFAULT '0',
  `borndate` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110010 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_bcp_`;
CREATE TABLE `users_bcp_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(11) NOT NULL DEFAULT '0',
  `borndate` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110012 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_bonus`;
CREATE TABLE `users_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `sila` int(11) NOT NULL DEFAULT '0',
  `sila_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `lovk` int(11) NOT NULL DEFAULT '0',
  `lovk_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `inta` int(11) NOT NULL DEFAULT '0',
  `inta_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `intel` int(11) NOT NULL DEFAULT '0',
  `intel_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `mudra` int(11) NOT NULL DEFAULT '0',
  `mudra_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `maxhp` int(11) NOT NULL DEFAULT '0',
  `maxhp_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `expbonus` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'бонус експы',
  `expbonus_count` int(11) NOT NULL DEFAULT '1' COMMENT 'пока не используется',
  `refresh` int(11) NOT NULL DEFAULT '0' COMMENT 'параметр указывающий на тип апдейта если обновить это поле на +1 то пройдет перерасчет всех бонусов',
  `battle` int(11) NOT NULL DEFAULT '0' COMMENT 'ид боя текущего',
  `usec` int(11) NOT NULL DEFAULT '0' COMMENT 'usec - флаг для замковых свитков',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT 'если есть время окончания то удаляется эфект по времени',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=2526386 DEFAULT CHARSET=cp1251 COMMENT='бонусы на бои';

DROP TABLE IF EXISTS `users_boxsize`;
CREATE TABLE `users_boxsize` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `boxlvl` int(11) unsigned NOT NULL DEFAULT '0',
  `boxsize` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='размер и уровеь сундкука';

DROP TABLE IF EXISTS `users_capcha_time`;
CREATE TABLE `users_capcha_time` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `captime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'время когда была показанна капча',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таймеры чаров на капчу';

DROP TABLE IF EXISTS `users_clons`;
CREATE TABLE `users_clons` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `sex` tinyint(3) DEFAULT '0',
  `level` int(3) DEFAULT '0',
  `align` varchar(6) DEFAULT '0',
  `klan` varchar(30) DEFAULT NULL,
  `sila` int(4) DEFAULT '3',
  `lovk` int(4) NOT NULL DEFAULT '3',
  `inta` int(4) NOT NULL DEFAULT '3',
  `vinos` int(4) NOT NULL DEFAULT '3',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `maxhp` int(6) NOT NULL DEFAULT '18',
  `hp` int(6) NOT NULL DEFAULT '18',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `nakidka` bigint(20) NOT NULL DEFAULT '0',
  `shadow` varchar(40) NOT NULL DEFAULT '0.gif',
  `battle` int(255) NOT NULL DEFAULT '0',
  `bot` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `at_cost` int(11) DEFAULT '0',
  `kulak1` int(11) DEFAULT '0',
  `sum_minu` int(11) DEFAULT '0',
  `sum_maxu` int(11) DEFAULT '0',
  `sum_mfkrit` int(11) DEFAULT '0',
  `sum_mfakrit` int(11) DEFAULT '0',
  `sum_mfuvorot` int(11) DEFAULT '0',
  `sum_mfauvorot` int(11) DEFAULT '0',
  `sum_bron1` int(11) DEFAULT '0',
  `sum_bron2` int(11) DEFAULT '0',
  `sum_bron3` int(11) DEFAULT '0',
  `sum_bron4` int(11) DEFAULT '0',
  `ups` int(11) DEFAULT NULL,
  `injury_possible` tinyint(1) NOT NULL DEFAULT '0',
  `battle_t` int(2) NOT NULL DEFAULT '0',
  `hidden` int(1) DEFAULT NULL COMMENT 'неиспользуется - нужно для сопостовления полей',
  `hil` int(3) NOT NULL DEFAULT '0' COMMENT 'сколько разхилнулся бот',
  `bot_online` int(11) NOT NULL DEFAULT '0' COMMENT 'клон в онлайне',
  `bot_room` int(11) DEFAULT NULL COMMENT 'конмната где бот',
  `bot_count` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик выпущеных в бой ботом ботв',
  `rubashka` int(55) NOT NULL DEFAULT '0',
  `hiddenlog` varchar(105) NOT NULL DEFAULT '' COMMENT 'для клонов перевоплотов',
  `mklevel` int(11) NOT NULL DEFAULT '0' COMMENT 'уровень создавшег бота',
  `runa1` int(11) NOT NULL DEFAULT '0',
  `runa2` int(11) NOT NULL DEFAULT '0',
  `runa3` int(11) NOT NULL DEFAULT '0',
  `fullhptime` int(11) unsigned NOT NULL DEFAULT '0',
  `uclass` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'класс бота/клона',
  `owner` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'хозяин наемника',
  `exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'опыт наемника',
  `nextup` bigint(20) unsigned NOT NULL DEFAULT '20',
  `stats` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'свободные статы',
  `master` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'свободные мастерство',
  `expbonus` decimal(10,2) unsigned NOT NULL DEFAULT '1.00' COMMENT 'бонус опыта',
  `stbat` int(11) unsigned NOT NULL DEFAULT '0',
  `winstbat` int(11) unsigned NOT NULL DEFAULT '0',
  `win` int(11) unsigned NOT NULL DEFAULT '0',
  `lose` int(11) unsigned NOT NULL DEFAULT '0',
  `last_battle` bigint(11) unsigned NOT NULL DEFAULT '0',
  `skills` text NOT NULL COMMENT 'масив для настроек приемов наемника',
  `skills_point` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'очки для активных скилов',
  `passkills` text NOT NULL COMMENT 'пасивные скилы масив',
  `passkills_points` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'очки для пассивных скилов',
  `naem_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `naem_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `borndate` varchar(12) NOT NULL DEFAULT '',
  `borncity` varchar(100) NOT NULL DEFAULT 'Capital City',
  `citizen` varchar(50) NOT NULL DEFAULT 'Capital City',
  `borntime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `skulls` int(11) unsigned NOT NULL DEFAULT '0',
  `rep_bonus` decimal(10,2) unsigned NOT NULL DEFAULT '1.00',
  `energy` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'энергия для наймов',
  `fullentime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время для восстановления енергии',
  PRIMARY KEY (`id`),
  KEY `klan` (`klan`),
  KEY `bot` (`bot`),
  KEY `vinos` (`vinos`,`maxhp`),
  KEY `maxhp` (`maxhp`),
  KEY `hp` (`hp`),
  KEY `maxmana` (`maxmana`),
  KEY `mana` (`mana`),
  KEY `battle` (`battle`),
  KEY `mudra` (`mudra`),
  KEY `login` (`login`),
  KEY `bot_online` (`bot_online`),
  KEY `bot_room` (`bot_room`),
  KEY `battle_t` (`battle_t`),
  KEY `id_user` (`id_user`),
  KEY `hil` (`hil`),
  KEY `bot_count` (`bot_count`),
  KEY `mklevel` (`mklevel`),
  KEY `fullhptime` (`fullhptime`),
  KEY `bot_room_2` (`bot_room`,`bot_online`),
  KEY `owner` (`owner`),
  KEY `owner_2` (`owner`,`naem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=320331335 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_complect`;
CREATE TABLE `users_complect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(15) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE cp1251_general_cs NOT NULL DEFAULT '0',
  `data` text COLLATE cp1251_general_cs,
  `id_city` tinyint(3) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'тип вкладки комплекта',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unic` (`name`,`owner`),
  KEY `owner` (`owner`),
  KEY `name` (`name`),
  KEY `id_city` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=9640157 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='комплекты чаров - внимание регистр CS';

DROP TABLE IF EXISTS `users_complect2`;
CREATE TABLE `users_complect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(15) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE cp1251_general_cs NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'тип вкладки комплекта',
  `sergi` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `kulon` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `perchi` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `weap` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `bron` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `r1` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `r2` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `r3` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `helm` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `shit` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m1` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m2` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m3` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m4` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m5` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m6` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m7` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m8` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m9` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m10` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m11` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m12` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m13` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m14` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m15` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m16` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m17` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m18` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m19` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m20` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `nakidka` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `rubashka` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `boots` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `runa1` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `runa2` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `runa3` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unic` (`name`,`owner`),
  KEY `owner` (`owner`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1311671 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='комплекты чаров2';

DROP TABLE IF EXISTS `users_complect_scrolls`;
CREATE TABLE `users_complect_scrolls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(15) NOT NULL DEFAULT '0',
  `m1` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m2` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m3` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m4` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m5` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m6` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m7` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m8` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m9` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m10` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m11` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m12` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m13` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m14` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m15` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m16` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m17` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m18` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m19` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `m20` varchar(255) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=2227 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='комплекты чаров - скролы';

DROP TABLE IF EXISTS `users_counter`;
CREATE TABLE `users_counter` (
  `owner` bigint(20) NOT NULL DEFAULT '0' COMMENT 'овнер',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT 'считалка',
  `logdate` date DEFAULT '0000-00-00' COMMENT 'дата',
  UNIQUE KEY `owner` (`owner`,`logdate`),
  KEY `logdate` (`logdate`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='счетчик входа в игру для чаров';

DROP TABLE IF EXISTS `users_craft`;
CREATE TABLE `users_craft` (
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `hunterlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hunterexp` int(10) unsigned NOT NULL DEFAULT '0',
  `woodmanlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `woodmanexp` int(10) unsigned NOT NULL DEFAULT '0',
  `minerlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `minerexp` int(10) unsigned NOT NULL DEFAULT '0',
  `farmerlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `farmerexp` int(10) unsigned NOT NULL DEFAULT '0',
  `herbalistlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `herbalistexp` int(10) unsigned NOT NULL DEFAULT '0',
  `cooklevel` int(10) unsigned NOT NULL DEFAULT '0',
  `cookexp` int(10) unsigned NOT NULL DEFAULT '0',
  `smithlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `smithexp` int(10) unsigned NOT NULL DEFAULT '0',
  `armorerlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `armorerexp` int(10) unsigned NOT NULL DEFAULT '0',
  `armorsmithlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `armorsmithexp` int(10) unsigned NOT NULL DEFAULT '0',
  `tailorlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `tailorexp` int(10) unsigned NOT NULL DEFAULT '0',
  `jewelerlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `jewelerexp` int(10) unsigned NOT NULL DEFAULT '0',
  `alchemistlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `alchemistexp` int(10) unsigned NOT NULL DEFAULT '0',
  `magelevel` int(10) unsigned NOT NULL DEFAULT '0',
  `mageexp` int(10) unsigned NOT NULL DEFAULT '0',
  `carpenterlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `carpenterexp` int(11) unsigned NOT NULL DEFAULT '0',
  `prospectorlevel` int(10) unsigned NOT NULL DEFAULT '0',
  `prospectorexp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_flag`;
CREATE TABLE `users_flag` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(100) NOT NULL DEFAULT '0' COMMENT 'flags png',
  `flag_name` varchar(150) NOT NULL DEFAULT '' COMMENT 'название',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='флаги в инфу';

DROP TABLE IF EXISTS `users_fortune`;
CREATE TABLE `users_fortune` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'шаг фортуны',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_fortune_stats`;
CREATE TABLE `users_fortune_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemproto` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `date` (`date`),
  KEY `status` (`status`),
  KEY `itemproto` (`itemproto`)
) ENGINE=InnoDB AUTO_INCREMENT=526744 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_gold_log`;
CREATE TABLE `users_gold_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_owner` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'кто продал золото',
  `gold` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько золота',
  `baer_owner` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'кто купил золото',
  `kr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'экв. в кр уплочено',
  `tdate` date NOT NULL DEFAULT '0000-00-00' COMMENT 'дата операции для фиксации лимита',
  PRIMARY KEY (`id`),
  KEY `tdate` (`tdate`,`baer_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=4171 DEFAULT CHARSET=cp1251 COMMENT='таблица с лимитами и логом покупок между чарами';

DROP TABLE IF EXISTS `users_hill`;
CREATE TABLE `users_hill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ид по порядку',
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'кто хилял',
  `target` int(11) NOT NULL DEFAULT '0' COMMENT 'кого хиляли',
  `khill` int(3) NOT NULL DEFAULT '0' COMMENT 'коэф от хила и от уровня для опыта',
  `battle` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ид боя - используется для очистки вконце',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `battle` (`battle`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=cp1251 COMMENT='очередь хила для чара';

DROP TABLE IF EXISTS `users_history`;
CREATE TABLE `users_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `itype` int(11) unsigned NOT NULL DEFAULT '0',
  `hdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hclan` text NOT NULL,
  `halign` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `hlevel` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `hdate` (`hdate`),
  KEY `owner_2` (`owner`,`hdate`)
) ENGINE=InnoDB AUTO_INCREMENT=353714 DEFAULT CHARSET=cp1251 COMMENT='хроника перса';

DROP TABLE IF EXISTS `users_history_old`;
CREATE TABLE `users_history_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `itype` int(11) unsigned NOT NULL DEFAULT '0',
  `hdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hclan` text,
  `halign` int(11) unsigned DEFAULT NULL,
  `hlevel` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `hdate` (`hdate`),
  KEY `owner_2` (`owner`,`hdate`)
) ENGINE=InnoDB AUTO_INCREMENT=550952 DEFAULT CHARSET=cp1251 COMMENT='хроника перса';

DROP TABLE IF EXISTS `users_ingame`;
CREATE TABLE `users_ingame` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `s2min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `s30min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `s60min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Награды за онлайн';

DROP TABLE IF EXISTS `users_klandel_hist`;
CREATE TABLE `users_klandel_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `kid` int(11) DEFAULT NULL,
  `deldate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `kid` (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=4936 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_last_align`;
CREATE TABLE `users_last_align` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `align` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_align` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=245569 DEFAULT CHARSET=cp1251 COMMENT='последняя склонка перса, по истечению штрафа(с крона)';

DROP TABLE IF EXISTS `users_money`;
CREATE TABLE `users_money` (
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `wmz` varchar(13) NOT NULL DEFAULT '' COMMENT 'Z-кош',
  `swtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'штамп када установлен кошель навсяк',
  `wmid` varchar(12) DEFAULT NULL COMMENT 'wmid',
  `ban` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'забанен или нет',
  `bantime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время до которого бан по времени',
  PRIMARY KEY (`owner`),
  UNIQUE KEY `wmz` (`wmz`),
  UNIQUE KEY `wmid` (`wmid`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='инфа о кошельках веб мани';

DROP TABLE IF EXISTS `users_nick_hist`;
CREATE TABLE `users_nick_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(15) NOT NULL DEFAULT '0',
  `old_login` varchar(255) DEFAULT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'change date',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `login` (`old_login`)
) ENGINE=InnoDB AUTO_INCREMENT=2149 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_notepad`;
CREATE TABLE `users_notepad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 персональный, 1 клановый',
  `txt` text NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52071 DEFAULT CHARSET=cp1251 COMMENT='персональные и клановые блокноты';

DROP TABLE IF EXISTS `users_pas_ch`;
CREATE TABLE `users_pas_ch` (
  `owner` bigint(25) NOT NULL DEFAULT '0',
  `login` varchar(255) DEFAULT NULL,
  `last` int(11) DEFAULT NULL,
  PRIMARY KEY (`owner`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_perevod`;
CREATE TABLE `users_perevod` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `val` int(11) NOT NULL DEFAULT '0',
  `lday` date NOT NULL DEFAULT '0000-00-00' COMMENT 'время изменения',
  `lim` int(5) NOT NULL DEFAULT '100' COMMENT 'лимит -1 без ограничений',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='подсчет переводов';

DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE `users_profile` (
  `owner` int(15) NOT NULL DEFAULT '0' COMMENT 'ид чара',
  `prof` int(11) NOT NULL DEFAULT '0' COMMENT 'поле номера комплекта. В состоянии 0 держит реальные вещи для комнаты оружейки',
  `pname` varchar(255) DEFAULT NULL COMMENT 'название профиля',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'профиль выбран по умолчанию',
  `sila` int(4) NOT NULL DEFAULT '0',
  `lovk` int(4) NOT NULL DEFAULT '0',
  `inta` int(4) NOT NULL DEFAULT '0',
  `vinos` int(4) NOT NULL DEFAULT '0',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `maxhp` int(6) NOT NULL DEFAULT '0',
  `hp` int(6) NOT NULL DEFAULT '0',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `stats` int(5) NOT NULL DEFAULT '0',
  `master` int(5) NOT NULL DEFAULT '0',
  `nakidka` int(55) NOT NULL DEFAULT '0' COMMENT 'накидка',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `bpbonushp` int(11) NOT NULL DEFAULT '0' COMMENT 'был ли бонуc на хп призапоминании',
  `rubashka` int(55) NOT NULL DEFAULT '0' COMMENT 'рубашка',
  `runa1` int(11) NOT NULL DEFAULT '0',
  `runa2` int(11) NOT NULL DEFAULT '0',
  `runa3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`,`prof`),
  UNIQUE KEY `owner` (`owner`,`prof`,`pname`),
  UNIQUE KEY `owner_2` (`owner`,`pname`),
  KEY `prof` (`prof`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='состояние чара для оружейки';

DROP TABLE IF EXISTS `users_progress`;
CREATE TABLE `users_progress` (
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `dexp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'опыт за день',
  `drep` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'репа за день',
  `dwins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'побед за день',
  `dlose` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'поражений за день',
  `dtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `druns` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'опыт рун за день',
  `awinbs` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'победы в БС',
  `awinruins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'победы в руинах',
  `abattlehaos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'бои с ИХ',
  `alabcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'походы в лабу',
  `alordcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'бои у лорда',
  `ar240count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Групповые сражения',
  `ar270count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Одиночные сражения',
  `ar270_win` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'побед в одиночках',
  `aquestzag` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'загородных квестов',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='статистика пользователя';

DROP TABLE IF EXISTS `users_quest`;
CREATE TABLE `users_quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(25) DEFAULT NULL COMMENT 'чар',
  `quest_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ид квеста',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0 - взят но не выполнен; 1- выполнен',
  `city` varchar(255) NOT NULL DEFAULT 'capitalcity',
  `get_date` int(11) DEFAULT NULL COMMENT 'дата когда закончился квест',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT 'количество завершенных раз',
  PRIMARY KEY (`id`),
  UNIQUE KEY `questu` (`owner`,`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4555179 DEFAULT CHARSET=cp1251 COMMENT='списки квестов чара/ status: 0-невыполнен еще ;1-выполнен';

DROP TABLE IF EXISTS `users_referals`;
CREATE TABLE `users_referals` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `ref` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_ref` (`user`,`ref`),
  KEY `user` (`user`),
  KEY `owner` (`owner`),
  KEY `ref` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=19378 DEFAULT CHARSET=cp1251 COMMENT='лог рефов для юзеров, притащивших людей';

DROP TABLE IF EXISTS `users_rep_log`;
CREATE TABLE `users_rep_log` (
  `onwer` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0' COMMENT 'уровень чара',
  `sdate` date NOT NULL DEFAULT '0000-00-00',
  `rep_lab` int(11) NOT NULL DEFAULT '0' COMMENT 'реба за лабу',
  `rep_zag` int(11) NOT NULL DEFAULT '0' COMMENT 'репа загородом',
  `rep_rist270` int(11) NOT NULL DEFAULT '0' COMMENT 'ристалка отряды',
  `rep_rist240` int(11) NOT NULL DEFAULT '0' COMMENT 'ристалка группы',
  `rep_rist210` int(11) NOT NULL DEFAULT '0' COMMENT 'ристалка одиночных',
  `rep_zam` int(11) NOT NULL DEFAULT '0' COMMENT 'реп за замки',
  `rep_ruin` int(11) NOT NULL DEFAULT '0' COMMENT 'рапа из руин',
  `rep_bat` int(11) NOT NULL DEFAULT '0' COMMENT 'реп полученая в остальных боях',
  `rep_other` int(11) NOT NULL DEFAULT '0' COMMENT 'остальная репа полученая не в боях',
  `rep_hram` int(11) NOT NULL DEFAULT '0' COMMENT 'рапа с квестов',
  PRIMARY KEY (`onwer`),
  UNIQUE KEY `onwer` (`onwer`,`sdate`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='статистика репутации';

DROP TABLE IF EXISTS `users_rep_stat`;
CREATE TABLE `users_rep_stat` (
  `sdate` date NOT NULL DEFAULT '0000-00-00' COMMENT 'дата',
  `rep` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sdate`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='статистика по получению репы по овнерам и дням';

DROP TABLE IF EXISTS `users_scans`;
CREATE TABLE `users_scans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `sdate` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=9902 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_shadows`;
CREATE TABLE `users_shadows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL,
  `klan` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-прост, 1-клан, 2-личн, 3-прем',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `klan` (`klan`),
  KEY `type` (`type`),
  KEY `klan_2` (`klan`,`owner`,`sex`),
  KEY `type_2` (`type`,`klan`)
) ENGINE=InnoDB AUTO_INCREMENT=1682 DEFAULT CHARSET=cp1251 COMMENT='Персональные образы';

DROP TABLE IF EXISTS `users_sn`;
CREATE TABLE `users_sn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sn_type` int(11) NOT NULL COMMENT '1 - ВК\r\n2 - ФБ\r\n3 - ОК\r\n4 - mail.ru',
  `sn_id` text NOT NULL,
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_users_sn` (`user_id`,`sn_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2197 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_temp_rep`;
CREATE TABLE `users_temp_rep` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `login` varchar(255) NOT NULL DEFAULT '',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `rep` int(11) NOT NULL DEFAULT '0',
  `rep_money` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_test`;
CREATE TABLE `users_test` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `pass` blob NOT NULL,
  `second_password` varchar(255) NOT NULL DEFAULT '' COMMENT 'второй пароль, если поле пустое - нету',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `borndate` varchar(12) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '',
  `icq` int(15) NOT NULL DEFAULT '0',
  `http` varchar(255) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `lozung` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(7) NOT NULL DEFAULT '0',
  `level` int(2) NOT NULL DEFAULT '0',
  `align` varchar(6) NOT NULL DEFAULT '0',
  `klan` varchar(25) NOT NULL DEFAULT '',
  `sila` int(4) NOT NULL DEFAULT '3',
  `lovk` int(4) NOT NULL DEFAULT '3',
  `inta` int(4) NOT NULL DEFAULT '3',
  `vinos` int(4) NOT NULL DEFAULT '3',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `money` float(10,2) NOT NULL,
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `win` int(7) NOT NULL DEFAULT '0',
  `lose` int(7) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `borncity` varchar(100) NOT NULL DEFAULT '',
  `borntime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room` int(5) NOT NULL DEFAULT '1',
  `maxhp` int(6) NOT NULL DEFAULT '18',
  `hp` int(6) NOT NULL DEFAULT '18',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `stats` int(5) NOT NULL DEFAULT '3',
  `exp` bigint(55) unsigned NOT NULL DEFAULT '0',
  `master` int(5) NOT NULL DEFAULT '1',
  `shadow` varchar(30) NOT NULL DEFAULT '0.gif',
  `nextup` bigint(55) unsigned NOT NULL DEFAULT '20',
  `m1` int(255) NOT NULL DEFAULT '0',
  `m2` int(255) NOT NULL DEFAULT '0',
  `m3` int(255) NOT NULL DEFAULT '0',
  `m4` int(255) NOT NULL DEFAULT '0',
  `m5` int(255) NOT NULL DEFAULT '0',
  `m6` int(255) NOT NULL DEFAULT '0',
  `m7` int(255) NOT NULL DEFAULT '0',
  `m8` int(255) NOT NULL DEFAULT '0',
  `m9` int(255) NOT NULL DEFAULT '0',
  `m10` int(255) NOT NULL DEFAULT '0',
  `m11` int(255) NOT NULL DEFAULT '0',
  `m12` int(255) NOT NULL DEFAULT '0',
  `m13` int(255) NOT NULL DEFAULT '0',
  `m14` int(255) NOT NULL DEFAULT '0',
  `m15` int(255) NOT NULL DEFAULT '0',
  `nakidka` bigint(20) NOT NULL DEFAULT '0' COMMENT 'накидка',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `fullhptime` int(10) NOT NULL DEFAULT '0',
  `zayavka` int(255) NOT NULL DEFAULT '0',
  `battle` int(255) NOT NULL DEFAULT '0',
  `battle_t` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'сторона за которую воюет чар',
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `palcom` varchar(255) NOT NULL DEFAULT '',
  `medals` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `podarokAD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'используется для отравы в лабе/ флаг лошади в загороде',
  `lab` tinyint(1) NOT NULL DEFAULT '0',
  `bot` tinyint(1) NOT NULL DEFAULT '0',
  `in_tower` tinyint(1) NOT NULL DEFAULT '0',
  `ekr` float(10,2) NOT NULL,
  `chattime` int(25) NOT NULL,
  `sid` varchar(128) NOT NULL,
  `fullmptime` int(20) NOT NULL,
  `deal` tinyint(1) NOT NULL DEFAULT '0',
  `married` varchar(50) NOT NULL,
  `injury_possible` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'флаг оповещения для лошадок',
  `labzay` bigint(20) NOT NULL DEFAULT '0',
  `fcount` int(5) DEFAULT '0' COMMENT 'счетчик бесплат.подгонок на чаре',
  `rep` bigint(15) NOT NULL DEFAULT '0' COMMENT 'репа храма',
  `repmoney` bigint(20) NOT NULL DEFAULT '0' COMMENT 'репа-деньги',
  `last_battle` int(255) NOT NULL DEFAULT '0' COMMENT 'последний бой ид',
  `vk_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'vk',
  `bpzay` bigint(20) NOT NULL DEFAULT '0' COMMENT 'заявка на мега бой',
  `bpalign` int(11) NOT NULL DEFAULT '0' COMMENT 'закого воюем. свет или тьма',
  `bpstor` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'на какой стороне след.бой',
  `bpbonussila` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько бонуса силы',
  `bpbonushp` int(11) NOT NULL DEFAULT '0',
  `show_advises` varchar(15) NOT NULL DEFAULT '1' COMMENT 'масив для настроек',
  `hidden` bigint(255) NOT NULL DEFAULT '0' COMMENT 'невидимка ИД',
  `battle_fin` tinyint(1) NOT NULL DEFAULT '0',
  `gruppovuha` varchar(20) NOT NULL DEFAULT '0,0,0,0,0,0' COMMENT 'By Trinity ))',
  `autofight` tinyint(1) DEFAULT NULL,
  `expbonus` float(3,2) NOT NULL DEFAULT '1.00',
  `wcount` int(11) NOT NULL DEFAULT '0' COMMENT 'победы подряд в хаоте',
  `victorina` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик викторины',
  `id_grup` int(11) NOT NULL DEFAULT '0' COMMENT 'id для груповых турниров',
  `prem` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'премиум',
  `hiller` int(11) NOT NULL DEFAULT '0' COMMENT 'хиллер- комудать опыт за следующий удар',
  `khiller` int(3) NOT NULL DEFAULT '0' COMMENT 'коэф хиллера',
  `slp` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'признак молчанки',
  `trv` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'признак защиты от  травмы',
  `ldate` int(11) NOT NULL DEFAULT '0' COMMENT 'реальное время обновляется в function',
  `stamina` int(11) NOT NULL DEFAULT '0' COMMENT 'выносливость',
  `odate` int(11) NOT NULL DEFAULT '0' COMMENT 'онлайн время',
  `id_city` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-кеп/1-авалон',
  `ruines` bigint(20) NOT NULL DEFAULT '0' COMMENT 'руины',
  `voinst` int(11) NOT NULL DEFAULT '0' COMMENT 'воинственность',
  `rubashka` int(55) NOT NULL DEFAULT '0' COMMENT 'рубашка',
  `stbat` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик статусных',
  `winstbat` int(11) NOT NULL DEFAULT '0' COMMENT 'побед в статусных боях',
  `citizen` varchar(50) NOT NULL DEFAULT '' COMMENT 'гражданство',
  `skulls` int(11) NOT NULL DEFAULT '0' COMMENT 'черепа',
  `hiddenlog` varchar(105) NOT NULL DEFAULT '' COMMENT 'ник в перевоплоте',
  `naim` int(11) NOT NULL DEFAULT '0',
  `naim_war` int(11) NOT NULL DEFAULT '0',
  `pasbaf` int(11) NOT NULL DEFAULT '0' COMMENT 'ид пасивного бафа',
  `runa1` int(11) NOT NULL DEFAULT '0',
  `runa2` int(11) NOT NULL DEFAULT '0',
  `runa3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`,`email`),
  UNIQUE KEY `login_2` (`login`),
  KEY `klan` (`klan`),
  KEY `ip` (`ip`),
  KEY `bot` (`bot`),
  KEY `in_tower` (`in_tower`),
  KEY `chattime` (`chattime`),
  KEY `vinos` (`vinos`,`maxhp`),
  KEY `sid` (`sid`),
  KEY `maxhp` (`maxhp`),
  KEY `hp` (`hp`),
  KEY `maxmana` (`maxmana`),
  KEY `mana` (`mana`),
  KEY `battle` (`battle`),
  KEY `fullmptime` (`fullmptime`),
  KEY `fullhptime` (`fullhptime`),
  KEY `mudra` (`mudra`),
  KEY `vk_user_id` (`vk_user_id`),
  KEY `battle_t` (`battle_t`),
  KEY `hidden` (`hidden`),
  KEY `last_battle` (`last_battle`),
  KEY `ldate` (`ldate`),
  KEY `room` (`room`),
  KEY `ruines` (`ruines`),
  KEY `deal` (`deal`),
  KEY `id_city` (`id_city`),
  KEY `odate` (`odate`),
  KEY `zayavka` (`zayavka`),
  KEY `align` (`align`)
) ENGINE=InnoDB AUTO_INCREMENT=8541 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_timer`;
CREATE TABLE `users_timer` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `cbattle` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик боев',
  `tbattle` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время последнего обновленя счетчика боя',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT 'счет часов',
  `ttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время последнего обновления счета часов',
  `cday` int(11) NOT NULL DEFAULT '0' COMMENT 'счет какой день сейчас',
  `tday` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время перехода на новый день',
  `getflag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'получил сегодня подарок',
  PRIMARY KEY (`owner`),
  KEY `tbattle` (`tbattle`),
  KEY `ttime` (`ttime`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таймер для бонусов онлайн+бои';

DROP TABLE IF EXISTS `users_timer_rest`;
CREATE TABLE `users_timer_rest` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `cbattle` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик боев',
  `tbattle` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время последнего обновленя счетчика боя',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT 'счет часов',
  `ttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время последнего обновления счета часов',
  `cday` int(11) NOT NULL DEFAULT '0' COMMENT 'счет какой день сейчас',
  `tday` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время перехода на новый день',
  `getflag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'получил сегодня подарок',
  PRIMARY KEY (`owner`),
  KEY `tbattle` (`tbattle`),
  KEY `ttime` (`ttime`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таймер для бонусов онлайн+бои';

DROP TABLE IF EXISTS `users_timer_week`;
CREATE TABLE `users_timer_week` (
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'овнер',
  `cweek` int(11) NOT NULL DEFAULT '0' COMMENT 'кол.недель',
  PRIMARY KEY (`owner`,`cweek`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='счетчик недель для линейки бонусов';

DROP TABLE IF EXISTS `users_ttest`;
CREATE TABLE `users_ttest` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `second_password` varchar(255) NOT NULL DEFAULT '' COMMENT 'второй пароль, если поле пустое - нету',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `borndate` varchar(12) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '',
  `icq` int(15) NOT NULL DEFAULT '0',
  `http` varchar(255) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `lozung` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(7) NOT NULL DEFAULT '0',
  `level` int(2) NOT NULL DEFAULT '0',
  `align` varchar(6) NOT NULL DEFAULT '0',
  `klan` varchar(25) NOT NULL DEFAULT '',
  `sila` int(4) NOT NULL DEFAULT '3',
  `lovk` int(4) NOT NULL DEFAULT '3',
  `inta` int(4) NOT NULL DEFAULT '3',
  `vinos` int(4) NOT NULL DEFAULT '3',
  `intel` int(4) NOT NULL DEFAULT '0',
  `mudra` int(4) NOT NULL DEFAULT '0',
  `duh` int(4) NOT NULL DEFAULT '0',
  `bojes` int(4) NOT NULL DEFAULT '0',
  `money` float(10,2) NOT NULL,
  `noj` int(2) NOT NULL DEFAULT '0',
  `mec` int(2) NOT NULL DEFAULT '0',
  `topor` int(2) NOT NULL DEFAULT '0',
  `dubina` int(2) NOT NULL DEFAULT '0',
  `win` int(7) NOT NULL DEFAULT '0',
  `lose` int(7) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `borncity` varchar(100) NOT NULL DEFAULT '',
  `borntime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room` int(5) NOT NULL DEFAULT '1',
  `maxhp` int(6) NOT NULL DEFAULT '18',
  `hp` int(6) NOT NULL DEFAULT '18',
  `maxmana` int(6) NOT NULL DEFAULT '0',
  `mana` int(6) NOT NULL DEFAULT '0',
  `sergi` int(55) NOT NULL DEFAULT '0',
  `kulon` int(55) NOT NULL DEFAULT '0',
  `perchi` int(55) NOT NULL DEFAULT '0',
  `weap` int(55) NOT NULL DEFAULT '0',
  `bron` int(55) NOT NULL DEFAULT '0',
  `r1` int(55) NOT NULL DEFAULT '0',
  `r2` int(55) NOT NULL DEFAULT '0',
  `r3` int(55) NOT NULL DEFAULT '0',
  `helm` int(55) NOT NULL DEFAULT '0',
  `shit` int(55) NOT NULL DEFAULT '0',
  `boots` int(55) NOT NULL DEFAULT '0',
  `stats` int(5) NOT NULL DEFAULT '3',
  `exp` int(15) NOT NULL DEFAULT '0',
  `master` int(5) NOT NULL DEFAULT '1',
  `shadow` varchar(30) NOT NULL DEFAULT '0.gif',
  `nextup` int(55) NOT NULL DEFAULT '20',
  `m1` int(255) NOT NULL DEFAULT '0',
  `m2` int(255) NOT NULL DEFAULT '0',
  `m3` int(255) NOT NULL DEFAULT '0',
  `m4` int(255) NOT NULL DEFAULT '0',
  `m5` int(255) NOT NULL DEFAULT '0',
  `m6` int(255) NOT NULL DEFAULT '0',
  `m7` int(255) NOT NULL DEFAULT '0',
  `m8` int(255) NOT NULL DEFAULT '0',
  `m9` int(255) NOT NULL DEFAULT '0',
  `m10` int(255) NOT NULL DEFAULT '0',
  `m11` int(255) NOT NULL DEFAULT '0',
  `m12` int(255) NOT NULL DEFAULT '0',
  `m13` int(255) NOT NULL DEFAULT '0',
  `m14` int(255) NOT NULL DEFAULT '0',
  `m15` int(255) NOT NULL DEFAULT '0',
  `nakidka` bigint(20) NOT NULL DEFAULT '0' COMMENT 'накидка',
  `mfire` int(3) NOT NULL DEFAULT '0',
  `mwater` int(3) NOT NULL DEFAULT '0',
  `mair` int(3) NOT NULL DEFAULT '0',
  `mearth` int(3) NOT NULL DEFAULT '0',
  `mlight` int(3) NOT NULL DEFAULT '0',
  `mgray` int(3) NOT NULL DEFAULT '0',
  `mdark` int(3) NOT NULL DEFAULT '0',
  `fullhptime` int(10) NOT NULL DEFAULT '0',
  `zayavka` int(255) NOT NULL DEFAULT '0',
  `battle` int(255) NOT NULL DEFAULT '0',
  `battle_t` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'сторона за которую воюет чар',
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `palcom` varchar(255) NOT NULL DEFAULT '',
  `medals` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `podarokAD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'используется для отравы в лабе/ флаг лошади в загороде',
  `lab` tinyint(1) NOT NULL DEFAULT '0',
  `bot` tinyint(1) NOT NULL DEFAULT '0',
  `in_tower` tinyint(1) NOT NULL DEFAULT '0',
  `ekr` float(10,2) NOT NULL,
  `chattime` int(25) NOT NULL,
  `sid` varchar(128) NOT NULL,
  `fullmptime` int(20) NOT NULL,
  `deal` tinyint(1) NOT NULL DEFAULT '0',
  `married` varchar(50) NOT NULL,
  `injury_possible` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'флаг оповещения для лошадок',
  `labzay` bigint(20) NOT NULL DEFAULT '0',
  `fcount` int(5) DEFAULT '0' COMMENT 'счетчик бесплат.подгонок на чаре',
  `rep` bigint(15) NOT NULL DEFAULT '0' COMMENT 'репа храма',
  `repmoney` bigint(20) NOT NULL DEFAULT '0' COMMENT 'репа-деньги',
  `last_battle` int(255) NOT NULL DEFAULT '0' COMMENT 'последний бой ид',
  `vk_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'vk',
  `bpzay` bigint(20) NOT NULL DEFAULT '0' COMMENT 'заявка на мега бой',
  `bpalign` int(11) NOT NULL DEFAULT '0' COMMENT 'закого воюем. свет или тьма',
  `bpstor` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'на какой стороне след.бой',
  `bpbonussila` int(11) NOT NULL DEFAULT '0' COMMENT 'сколько бонуса силы',
  `bpbonushp` int(11) NOT NULL DEFAULT '0',
  `show_advises` varchar(15) NOT NULL DEFAULT '1' COMMENT 'масив для настроек',
  `hidden` bigint(255) NOT NULL DEFAULT '0' COMMENT 'невидимка ИД',
  `battle_fin` tinyint(1) NOT NULL DEFAULT '0',
  `gruppovuha` varchar(20) NOT NULL DEFAULT '0,0,0,0,0,0' COMMENT 'By Trinity ))',
  `autofight` tinyint(1) DEFAULT NULL,
  `expbonus` float(3,2) NOT NULL DEFAULT '1.00',
  `wcount` int(11) NOT NULL DEFAULT '0' COMMENT 'победы подряд в хаоте',
  `victorina` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик викторины',
  `id_grup` int(11) NOT NULL DEFAULT '0' COMMENT 'id для груповых турниров',
  `prem` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'премиум',
  `hiller` int(11) NOT NULL DEFAULT '0' COMMENT 'хиллер- комудать опыт за следующий удар',
  `khiller` int(3) NOT NULL DEFAULT '0' COMMENT 'коэф хиллера',
  `slp` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'признак молчанки',
  `trv` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'признак защиты от  травмы',
  `ldate` int(11) NOT NULL DEFAULT '0' COMMENT 'реальное время обновляется в function',
  `stamina` int(11) NOT NULL DEFAULT '0' COMMENT 'выносливость',
  `odate` int(11) NOT NULL DEFAULT '0' COMMENT 'онлайн время',
  `id_city` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-кеп/1-авалон',
  `ruines` bigint(20) NOT NULL DEFAULT '0' COMMENT 'руины',
  `voinst` int(11) NOT NULL DEFAULT '0' COMMENT 'воинственность',
  `rubashka` int(55) NOT NULL DEFAULT '0' COMMENT 'рубашка',
  `stbat` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик статусных',
  `winstbat` int(11) NOT NULL DEFAULT '0' COMMENT 'побед в статусных боях',
  `citizen` varchar(50) NOT NULL DEFAULT '' COMMENT 'гражданство',
  `skulls` int(11) NOT NULL DEFAULT '0' COMMENT 'черепа',
  `hiddenlog` varchar(105) NOT NULL DEFAULT '' COMMENT 'ник в перевоплоте',
  `naim` int(11) NOT NULL DEFAULT '0',
  `naim_war` int(11) NOT NULL DEFAULT '0',
  `pasbaf` int(11) NOT NULL DEFAULT '0' COMMENT 'ид пасивного бафа',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`,`email`),
  UNIQUE KEY `login_2` (`login`),
  KEY `klan` (`klan`),
  KEY `ip` (`ip`),
  KEY `bot` (`bot`),
  KEY `in_tower` (`in_tower`),
  KEY `chattime` (`chattime`),
  KEY `vinos` (`vinos`,`maxhp`),
  KEY `sid` (`sid`),
  KEY `maxhp` (`maxhp`),
  KEY `hp` (`hp`),
  KEY `maxmana` (`maxmana`),
  KEY `mana` (`mana`),
  KEY `battle` (`battle`),
  KEY `fullmptime` (`fullmptime`),
  KEY `fullhptime` (`fullhptime`),
  KEY `mudra` (`mudra`),
  KEY `vk_user_id` (`vk_user_id`),
  KEY `battle_t` (`battle_t`),
  KEY `hidden` (`hidden`),
  KEY `last_battle` (`last_battle`),
  KEY `ldate` (`ldate`),
  KEY `room` (`room`),
  KEY `ruines` (`ruines`)
) ENGINE=InnoDB AUTO_INCREMENT=28454 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_vduh`;
CREATE TABLE `users_vduh` (
  `owner` int(11) NOT NULL DEFAULT '0' COMMENT 'овнер',
  `bcount` int(11) NOT NULL DEFAULT '0' COMMENT 'счетчик',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблица счетчиков для весеннего духа';

DROP TABLE IF EXISTS `users_voin`;
CREATE TABLE `users_voin` (
  `owner` int(11) NOT NULL DEFAULT '0',
  `voin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='воин-ть кот. нулится каждый мес. заполняет триг. в юзерс';

DROP TABLE IF EXISTS `users_voin_temp`;
CREATE TABLE `users_voin_temp` (
  `owner` int(11) unsigned NOT NULL,
  `voin` int(11) NOT NULL DEFAULT '0',
  `send` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `users_znahar`;
CREATE TABLE `users_znahar` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) DEFAULT NULL,
  `stat` int(11) DEFAULT '0',
  `masters` int(11) DEFAULT '0',
  `dropstat` datetime DEFAULT NULL,
  `dropmast` datetime DEFAULT NULL,
  `klass` int(11) DEFAULT '10',
  `dropklass` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=115999 DEFAULT CHARSET=cp1251 COMMENT='сбросы';

DROP TABLE IF EXISTS `users_znahar_bcp`;
CREATE TABLE `users_znahar_bcp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) DEFAULT NULL,
  `stat` int(11) DEFAULT '0',
  `masters` int(11) DEFAULT '0',
  `dropstat` datetime DEFAULT NULL,
  `dropmast` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=8561 DEFAULT CHARSET=cp1251 COMMENT='сбросы';

DROP TABLE IF EXISTS `users_znahar_sfree`;
CREATE TABLE `users_znahar_sfree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT '0',
  `free` int(2) NOT NULL DEFAULT '1' COMMENT 'неиспользуется',
  `last_use` int(15) DEFAULT '0',
  `used` int(2) NOT NULL DEFAULT '0' COMMENT 'неиспользуется',
  `free_count` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Сколько есть свободных статов(обновляется кроном по понедельникам)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=183547 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `variables`;
CREATE TABLE `variables` (
  `var` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `variables_int`;
CREATE TABLE `variables_int` (
  `var` varchar(255) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `victorina`;
CREATE TABLE `victorina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Q` text COMMENT 'Вопрос',
  `A` varchar(255) DEFAULT NULL COMMENT 'Ответ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65480 DEFAULT CHARSET=cp1251 COMMENT='Викторина';

DROP TABLE IF EXISTS `wc_event`;
CREATE TABLE `wc_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT '2018',
  `team1` varchar(255) NOT NULL DEFAULT '',
  `team2` varchar(255) NOT NULL DEFAULT '',
  `datetime` int(11) NOT NULL DEFAULT '0',
  `team1_res` int(11) DEFAULT NULL,
  `team2_res` int(11) DEFAULT NULL,
  `who_win` tinyint(1) DEFAULT NULL,
  `updated_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `wc_event_bet`;
CREATE TABLE `wc_event_bet` (
  `wc_event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `res` tinyint(1) NOT NULL,
  `is_rewarded` tinyint(1) DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `item_proto_id` int(11) NOT NULL,
  `is_win` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  PRIMARY KEY (`wc_event_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `wc_event_item`;
CREATE TABLE `wc_event_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pocket_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_count` int(11) NOT NULL DEFAULT '1',
  `updated_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2531 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `wc_event_item_details`;
CREATE TABLE `wc_event_item_details` (
  `pocket_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `wordfilter`;
CREATE TABLE `wordfilter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL DEFAULT '',
  `onlyfull` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`),
  KEY `onlyfull` (`onlyfull`)
) ENGINE=InnoDB AUTO_INCREMENT=2808 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `wordfilterexception`;
CREATE TABLE `wordfilterexception` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL DEFAULT '',
  `incsearch` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'искать ли как вхождение',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`),
  KEY `incsearch` (`incsearch`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `work_edit`;
CREATE TABLE `work_edit` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `file` varchar(255) NOT NULL DEFAULT '',
  `who` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `xml_data`;
CREATE TABLE `xml_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `added_at` date NOT NULL,
  `param_id` int(255) NOT NULL,
  `value` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид партнера в партнерке',
  `stamp` int(11) NOT NULL DEFAULT '0' COMMENT 'точное время по серверу',
  PRIMARY KEY (`id`),
  KEY `added_at` (`added_at`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2729269 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `xml_data_69`;
CREATE TABLE `xml_data_69` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lbid` int(11) NOT NULL DEFAULT '0' COMMENT 'код пикселя',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид их веб мастера',
  `price` float(8,2) NOT NULL DEFAULT '0.00' COMMENT 'проплата на сумму',
  `stamp` int(11) NOT NULL DEFAULT '0' COMMENT 'штамп времени',
  `micro` int(11) NOT NULL DEFAULT '0' COMMENT 'микро секунды',
  `trid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид ид дела по проплате',
  PRIMARY KEY (`id`),
  KEY `lbid` (`lbid`)
) ENGINE=InnoDB AUTO_INCREMENT=5564 DEFAULT CHARSET=cp1251 COMMENT='для партнера 69';

DROP TABLE IF EXISTS `xml_data_old`;
CREATE TABLE `xml_data_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `added_at` date NOT NULL,
  `param_id` int(255) NOT NULL,
  `value` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'ид партнера в партнерке',
  `stamp` int(11) NOT NULL DEFAULT '0' COMMENT 'точное время по серверу',
  PRIMARY KEY (`id`),
  KEY `added_at` (`added_at`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2681932 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `xml_params`;
CREATE TABLE `xml_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zavoz`;
CREATE TABLE `zavoz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(20) DEFAULT NULL,
  `razdel` tinyint(3) DEFAULT NULL,
  `shop` int(20) NOT NULL DEFAULT '0',
  `eshop` int(20) NOT NULL DEFAULT '0',
  `cshop` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `razdel` (`razdel`)
) ENGINE=InnoDB AUTO_INCREMENT=1524 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `zayavka`;
CREATE TABLE `zayavka` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `coment` varchar(100) NOT NULL DEFAULT '',
  `type` int(2) NOT NULL DEFAULT '0',
  `team1` longtext NOT NULL,
  `team2` longtext NOT NULL,
  `start` int(10) NOT NULL DEFAULT '0',
  `timeout` int(2) NOT NULL DEFAULT '0',
  `t1min` int(2) NOT NULL DEFAULT '0',
  `t1max` int(2) NOT NULL DEFAULT '0',
  `t2min` int(2) NOT NULL DEFAULT '0',
  `t2max` int(2) NOT NULL DEFAULT '0',
  `level` int(2) NOT NULL DEFAULT '0' COMMENT 'это раздел в заявке 5 это хаоты',
  `podan` varchar(5) NOT NULL DEFAULT '00:00',
  `t1c` int(3) NOT NULL DEFAULT '0',
  `t2c` int(3) NOT NULL DEFAULT '0',
  `stavka` float NOT NULL DEFAULT '0',
  `blood` tinyint(1) NOT NULL,
  `fond` int(8) DEFAULT '0',
  `price` int(8) DEFAULT '0',
  `nomagic` tinyint(1) DEFAULT '0',
  `autoblow` int(2) NOT NULL DEFAULT '0' COMMENT '1= авто удар',
  `am1` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'бои склонок за меня 1',
  `am2` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'бои склонок за меня 2',
  `ae1` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'бои склонок против меня 1',
  `ae2` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'бои склонок против меня 2',
  `t1hist` longtext NOT NULL COMMENT 'кеш',
  `t2hist` longtext NOT NULL COMMENT 'кеш',
  `bcl` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'флаг закрыт ли бой после старта',
  `subtype` smallint(6) NOT NULL DEFAULT '0' COMMENT 'подтип боя, надо для боев на елках',
  `zcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'сколько вошло',
  `hz` smallint(6) NOT NULL DEFAULT '0' COMMENT 'флаг рандом распределения в бою',
  `hide` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'флаг скрытых ников 0-нормаль 1-скрыто',
  `klan1` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид клана 1',
  `klan2` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид клана 2',
  `reklan1` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид клан рекрута 1',
  `reklan2` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид клан рекрута 2',
  `alig1` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'склонка для трен.боев 1',
  `alig2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'склонка для трен.боев 2',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `start` (`start`),
  KEY `level` (`level`),
  KEY `nomagic` (`nomagic`)
) ENGINE=InnoDB AUTO_INCREMENT=1000084 DEFAULT CHARSET=cp1251;

DROP TABLE IF EXISTS `zayavka_turn`;
CREATE TABLE `zayavka_turn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0' COMMENT 'уровень',
  `align` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'склонка',
  `mktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `zayid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ид заявки собранной',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner` (`owner`),
  KEY `lvl` (`lvl`),
  KEY `align` (`align`)
) ENGINE=InnoDB AUTO_INCREMENT=100001116 DEFAULT CHARSET=cp1251 COMMENT='очередь на бой склонок';

DROP TABLE IF EXISTS `zhalobi`;
CREATE TABLE `zhalobi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(15) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `n` tinyint(3) NOT NULL DEFAULT '0',
  `author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ex_text` (`m_id`,`hash`),
  KEY `hash` (`hash`),
  KEY `time` (`m_id`),
  KEY `n` (`n`)
) ENGINE=InnoDB AUTO_INCREMENT=263313 DEFAULT CHARSET=cp1251;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;


-- dump end
