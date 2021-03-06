CREATE TABLE imsixthr_myweb01.stg_f_topic_w
(
topic_id    integer NOT NULL ,
topic_type_id    tinyint NOT NULL,
topic_name    varchar(100) NOT NULL,
topic_tags    varchar(4000),
topic_recom_flag  varchar(4000) ,
modified_ts TIMESTAMP,
PRIMARY KEY ( topic_id )
)
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE imsixthr_myweb01.stg_f_topic_list_w
(
list_id    integer NOT NULL,
topic_id    integer NOT NULL,
list_name    varchar(100) NOT NULL,
list_desc    text,
list_image_loc    varchar(4000),
list_outer_link    varchar(4000),
list_other_link    varchar(4000),
modified_ts TIMESTAMP,
PRIMARY KEY ( list_id )
)
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE imsixthr_myweb01.d_topic_type
(
topic_type_id    tinyint NOT NULL,
topic_type_desc    varchar(100) NOT NULL,
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( topic_type_id ),
INDEX ( modified_ts )
)
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE imsixthr_myweb01.f_topic
(
topic_id    integer NOT NULL,
topic_type_id    tinyint NOT NULL,
topic_name    varchar(100) NOT NULL,
topic_tags    varchar(4000),
topic_recom_flag  varchar(4000) default 'N',
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( topic_id ),
INDEX ( modified_ts ),
index (topic_recom_flag)
)
DEFAULT CHARACTER SET = utf8
;

CREATE TABLE imsixthr_myweb01.f_topic_list
(
list_id    integer NOT NULL,
topic_id    integer NOT NULL,
list_name    varchar(100) NOT NULL,
list_desc    text,
list_image_loc    varchar(4000),
list_outer_link    varchar(4000),
list_other_link    varchar(4000),
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY ( list_id ),
INDEX ( modified_ts )
)
DEFAULT CHARACTER SET = utf8
;

