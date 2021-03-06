select
  projectstable.*, votestable.votes, uservote.vote_type, users.username, users.avatar
from
  (select proj.*, tags.tags
  FROM
    (select * from projects) proj
  LEFT JOIN
    (select pt.project_id, array_to_string(array_agg(t.tag_name), ',') as tags
    from projects_tags pt
    left join tags t
    on (pt.tag_id = t.id)
    group by pt.project_id) tags
  on (proj.id = tags.project_id)
  ) projectstable
left join
  (select
    sum(vote_type) votes, topic_id
  from votes
  where type='project'
  group by topic_id
  ) votestable
on (projectstable.id = votestable.topic_id)
left join
  (select vote_type, topic_id
  from votes
  where user_id = ${user_id}
  ) uservote
on (uservote.topic_id = projectstable.id)
left join
  users
on
  users.id = projectstable.user_id
order by 
projectstable.created_at desc 
NULLS LAST 
limit 25;
