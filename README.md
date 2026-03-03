# CinemaStream Analytics: End-to-End SQL & Data Engineering

## Overview / Resumen

**EN:** This project simulates the data ecosystem of a streaming platform. The goal is to build an optimized Data Warehouse in PostgreSQL to generate business insights on content profitability and customer behavior.

**ES:** Este proyecto simula el ecosistema de datos de una plataforma de streaming. El objetivo es construir un Data Warehouse optimizado en PostgreSQL para generar insights de negocio sobre la rentabilidad del contenido y el comportamiento de los clientes.

---

## Tech Stack / Tecnologías

* **Database / Base de Datos:** PostgreSQL 15 (Dockerized).
* **Languages / Lenguajes:** SQL (PL/pgSQL), Python 3.x (Pandas, SQLAlchemy).
* **Infrastructure / Infraestructura:** Docker & Docker Compose.
* **BI Tools / Herramientas de BI:** DBeaver, Tableau/PowerBI compatible analysis.

---

## Key Features / Características Principales

1.  **Dynamic ETL / ETL Dinámico:**
    * **EN:** Automated data ingestion via a Python script connecting directly to the database engine.
    * **ES:** Ingesta de datos automatizada mediante un script de Python que conecta con el motor de base de datos.

2.  **Advanced Analytics / Análisis Avanzado:**
    * **EN:** Implementation of Common Table Expressions (CTEs) and Window Functions to calculate sales rankings and success percentiles per movie.
    * **ES:** Implementación de Common Table Expressions (CTEs) y Window Functions para calcular rankings de ventas y percentiles de éxito por película.

3.  **Performance Optimization / Optimización de Rendimiento:**
    * **EN:** Use of Materialized Views to reduce latency in high-demand business reports.
    * **ES:** Uso de Materialized Views para reducir la latencia en reportes de negocio de alta demanda.

4.  **Integrity & Auditing / Integridad y Auditoría:**
    * **EN:** PL/pgSQL trigger system to track historical changes in rental prices (SCD Type 4).
    * **ES:** Sistema de triggers en PL/pgSQL para rastrear cambios históricos en los precios de renta (SCD Tipo 4).

---

## Data Model (ERD) / Modelo de Datos



[Image of Database Entity Relationship Diagram]


**EN:** The design follows a normalized relational architecture to ensure transactional consistency.

**ES:** El diseño sigue una arquitectura relacional normalizada para garantizar la consistencia de las transacciones.

---

## How to Run / Cómo Ejecutar

1.  **Clone the repo / Clonar el repositorio:**
    `git clone https://github.com/AbrahamRodriguez97/postgresql_cinema_stream_analytics.git`

2.  **Set up environment / Levantar el entorno:**
    `docker-compose up -d`

3.  **Run Ingestion / Ejecutar la ingesta:**
    `python src/ingest_data.py`

4.  **Explore results / Explorar resultados:**

    **EN:** Check the `mv_movie_performance` view in your SQL client.

    **ES:** Explorar los resultados en la vista `mv_movie_performance` desde su cliente SQL.