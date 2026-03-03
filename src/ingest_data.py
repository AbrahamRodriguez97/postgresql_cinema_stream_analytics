import pandas as pd
from sqlalchemy import create_engine
import datetime

# Configuración de la conexión a la base de datos PostgreSQL
engine = create_engine('postgresql://admin:password123@localhost:5433/cinemastream')

def load_initial_data():
    try:
        # 1. Crear Datos de Categorías
        categories_data = pd.DataFrame({
            'name': ['Action', 'Comedy', 'Drama', 'Sci-Fi', 'Horror', 'Documentary']
        })
        categories_data.to_sql('categories', engine, if_exists='append', index=False)
        print("Categorías cargadas.")

        # 2. Crear Datos de Películas
        films_data = pd.DataFrame({
            'title': ['Inception', 'The Matrix', 'Parasite', 'Interstellar'],
            'description': ['A thief who steals corporate secrets...', 'A computer hacker learns...', 'Greed and class discrimination...', 'A team of explorers travel...'],
            'release_year': [2010, 1999, 2019, 2014],
            'rental_rate': [4.99, 3.99, 5.99, 4.99],
            'rating': ['PG-13', 'R', 'R', 'PG-13']
        })
        films_data.to_sql('films', engine, if_exists='append', index=False)
        print("Películas cargadas.")

        # 3. Crear Clientes (Demo)
        customers_data = pd.DataFrame({
            'first_name': ['Abraham', 'Francisco', 'John'],
            'last_name': ['Rodriguez', 'Dev', 'Doe'],
            'email': ['abraham@example.com', 'francisco@example.com', 'john@example.com'],
            'status': ['active', 'active', 'inactive']
        })
        customers_data.to_sql('customers', engine, if_exists='append', index=False)
        print("Clientes cargados.")

    except Exception as e:
        print(f"Error durante la ingesta: {e}")

if __name__ == "__main__":
    load_initial_data()