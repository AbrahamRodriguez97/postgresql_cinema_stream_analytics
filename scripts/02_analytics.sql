-- Reporte de Rendimiento de Películas 
WITH movie_revenue AS (
    SELECT 
        f.film_id,
        f.title,
        f.rental_rate,
        COUNT(r.rental_id) as total_rentals,
        COALESCE(SUM(p.amount), 0) as total_earned -- COALESCE para evitar nulos
    FROM films f
    LEFT JOIN rentals r ON f.film_id = r.film_id
    LEFT JOIN payments p ON r.rental_id = p.rental_id
    GROUP BY f.film_id, f.title, f.rental_rate
),
analytics_summary AS (
    SELECT 
        title,
        total_earned,
        total_rentals,
        -- Ranking basado en ganancias
        RANK() OVER (ORDER BY total_earned DESC) as sales_rank,
        -- Promedio de ganancias de todo el catálogo
        AVG(total_earned) OVER () as global_avg_revenue,
        -- Percentil de éxito
        PERCENT_RANK() OVER (ORDER BY total_earned) as success_percentile
    FROM movie_revenue
)
SELECT * FROM analytics_summary;