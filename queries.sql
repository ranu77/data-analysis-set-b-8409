USE support_db;

-- S2a: Average resolution time by department
SELECT teams.department, ROUND(AVG(tickets.resolution_hours), 2) AS avg_resolution_hours
FROM tickets
JOIN teams ON tickets.team_id = teams.team_id
GROUP BY teams.department
ORDER BY avg_resolution_hours DESC;

-- S2b: Teams whose average resolution hours exceeds 24
SELECT teams.team, ROUND(AVG(tickets.resolution_hours), 2) AS avg_resolution_hours
FROM tickets
JOIN teams ON tickets.team_id = teams.team_id
GROUP BY teams.team
HAVING AVG(tickets.resolution_hours) > 24
ORDER BY avg_resolution_hours DESC;

-- S2c: Top two channels by count of tickets with resolution_hours > 24
SELECT channel, COUNT(*) AS breach_count
FROM tickets
WHERE resolution_hours > 24
GROUP BY channel
ORDER BY breach_count DESC, channel ASC
LIMIT 2;

-- Diagnostic: LEFT JOIN from teams to tickets, count unmatched keys
SELECT COUNT(*) AS unmatched_keys
FROM teams
LEFT JOIN tickets ON teams.team_id = tickets.team_id
WHERE tickets.ticket_id IS NULL;