-- Implementación de Slowly Changing Dimensions (SCD) para rastrear cambios en precios.

-- A. Tabla de historial
CREATE TABLE IF NOT EXISTS film_price_history (
    audit_id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES films(film_id),
    old_price NUMERIC(4,2),
    new_price NUMERIC(4,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_executing TEXT DEFAULT CURRENT_USER
);

-- B. Función de Trigger
CREATE OR REPLACE FUNCTION fn_log_price_changes()
RETURNS TRIGGER AS $$
BEGIN
    -- Solo registramos si el precio realmente cambió
    IF OLD.rental_rate <> NEW.rental_rate THEN
        INSERT INTO film_price_history(film_id, old_price, new_price)
        VALUES(OLD.film_id, OLD.rental_rate, NEW.rental_rate);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- C. Creación del Trigger
DROP TRIGGER IF EXISTS tr_audit_film_prices ON films;

CREATE TRIGGER tr_audit_film_prices
BEFORE UPDATE ON films
FOR EACH ROW
EXECUTE FUNCTION fn_log_price_changes();