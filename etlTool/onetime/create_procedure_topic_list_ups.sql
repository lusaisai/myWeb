DELIMITER $$
create procedure topic_list_ups()
begin

update stg_f_topic_w w, f_topic t
set 
t.topic_type_id = w.topic_type_id,
t.topic_name = w.topic_name,
t.topic_tags = w.topic_tags,
t.topic_recom_flag = w.topic_recom_flag,
t.modified_ts = w.modified_ts
where t.topic_id = w.topic_id
;

insert into f_topic
(
  topic_id
, topic_type_id
, topic_name
, topic_tags
, topic_recom_flag
, modified_ts
)
select
  w.topic_id
, w.topic_type_id
, w.topic_name
, w.topic_tags
, w.topic_recom_flag
, w.modified_ts
from stg_f_topic_w w

left join f_topic t
on   w.topic_id = t.topic_id

where t.topic_id is null
;

update stg_f_topic_list_w w, f_topic_list t
set 
t.topic_id = w.topic_id,
t.list_name = w.list_name,
t.list_desc = w.list_desc,
t.list_image_loc = w.list_image_loc,
t.list_outer_link = w.list_outer_link,
t.list_other_link = w.list_other_link,
t.modified_ts = w.modified_ts
where t.list_id = w.list_id
;

insert into f_topic_list
(
  list_id
, topic_id
, list_name
, list_desc
, list_image_loc
, list_outer_link
, list_other_link
, modified_ts
)
select 
  w.list_id
, w.topic_id
, w.list_name
, w.list_desc
, w.list_image_loc
, w.list_outer_link
, w.list_other_link
, w.modified_ts
from stg_f_topic_list_w w

left join f_topic_list t
on w.list_id = t.list_id

where t.list_id is null
;
end$$

