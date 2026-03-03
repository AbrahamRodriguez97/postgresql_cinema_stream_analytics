-- Optimizamos el rendimiento de lectura para reportes pesados.
-- En lugar de recalcular rankings en cada consulta, persistimos el resultado.

DROP MATERIALIZED VIEW IF EXISTS mv_movie_performance;

CREATE MATERIALIZED VIEW mv_movie_performance AS
WITH movie_revenue AS (
    SELECT 
        f.film_id,
        f.title,
        f.rental_rate,
        COUNT(r.rental_id) as total_rentals,
        COALESCE(SUM(p.amount), 0) as total_earned
    FROM films f
    LEFT JOIN rentals r ON f.film_id = r.film_id
    LEFT JOIN payments p ON r.rental_id = p.rental_id
    GROUP BY f.film_id, f.title, f.rental_rate
)
SELECT 
    title,
    total_earned,
    total_rentals,
    RANK() OVER (ORDER BY total_earned DESC) as sales_rank,
    AVG(total_earned) OVER () as global_avg_revenue,
    PERCENT_RANK() OVER (ORDER BY total_earned) as success_percentile
FROM movie_revenue;

-- Comando para refrescar datos (Uso manual o mediante cron jobs)
-- REFRESH MATERIALIZED VIEW mv_movie_performance;


