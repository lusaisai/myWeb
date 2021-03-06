CREATE DATABASE myweb01;
CREATE USER 'myweb'@'localhost' IDENTIFIED BY 'myweb';
GRANT ALL ON myweb01.* TO 'myweb'@'localhost';

CREATE TABLE myweb01.d_topic_type
(
topic_type_id    tinyint NOT NULL AUTO_INCREMENT,
topic_type_desc    varchar(100) NOT NULL,
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( topic_type_id ),
INDEX ( modified_ts )
)
ENGINE=INNODB
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE myweb01.f_topic
(
topic_id    integer NOT NULL AUTO_INCREMENT,
topic_type_id    tinyint NOT NULL,
topic_name    varchar(100) NOT NULL,
topic_tags    varchar(4000),
topic_recom_flag  varchar(4000) default 'N',
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( topic_id ),
INDEX ( modified_ts ),
index (topic_recom_flag),
FOREIGN KEY (topic_type_id)
REFERENCES myweb01.d_topic_type(topic_type_id)
ON UPDATE CASCADE ON DELETE RESTRICT
)
ENGINE=INNODB
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE myweb01.f_topic_list
(
list_id    integer NOT NULL AUTO_INCREMENT,
topic_id    integer NOT NULL,
list_name    varchar(100) NOT NULL,
list_desc    text,
list_image_loc    varchar(4000),
list_outer_link    varchar(4000),
list_other_link    varchar(4000),
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( list_id ),
INDEX ( modified_ts ),
FOREIGN KEY (topic_id)
REFERENCES myweb01.f_topic(topic_id)
ON UPDATE CASCADE ON DELETE RESTRICT
)
ENGINE=INNODB
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE myweb01.f_poem
(
poem_id    integer NOT NULL AUTO_INCREMENT,
poem_content varchar(4000) NOT NULL,
poet varchar(100),
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( poem_id  ),
INDEX ( modified_ts )
)
ENGINE=INNODB
DEFAULT CHARACTER SET = utf8
;

