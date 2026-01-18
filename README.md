# Universe Database - PostgreSQL Project

Base de datos relacional PostgreSQL que modela el universo con galaxias, estrellas, planetas, lunas y asteroides. Proyecto de certificación freeCodeCamp Relational Database.

## Descripción

Base de datos que representa objetos celestes y sus relaciones jerárquicas. Desarrollado como parte del curso "Learn Relational Databases by Building a Celestial Bodies Database" de freeCodeCamp.

Relaciones implementadas:
- Galaxias contienen Estrellas
- Estrellas tienen Planetas en órbita
- Planetas tienen Lunas orbitando
- Asteroides como objetos independientes

## Estructura de la Base de Datos

### Tabla: galaxy
- galaxy_id (SERIAL, PRIMARY KEY)
- name (VARCHAR, UNIQUE, NOT NULL)
- description (TEXT)
- age_in_millions_of_years (INT, NOT NULL)
- distance_from_earth (NUMERIC)
- has_life (BOOLEAN, NOT NULL)
- is_spherical (BOOLEAN, NOT NULL)
- number_of_stars (INT)

### Tabla: star
- star_id (SERIAL, PRIMARY KEY)
- name (VARCHAR, UNIQUE, NOT NULL)
- galaxy_id (INT, NOT NULL, FOREIGN KEY)
- description (TEXT)
- age_in_millions_of_years (INT, NOT NULL)
- distance_from_earth (NUMERIC)
- has_life (BOOLEAN, NOT NULL)
- is_spherical (BOOLEAN, NOT NULL)
- temperature_kelvin (INT)

### Tabla: planet
- planet_id (SERIAL, PRIMARY KEY)
- name (VARCHAR, UNIQUE, NOT NULL)
- star_id (INT, NOT NULL, FOREIGN KEY)
- description (TEXT)
- age_in_millions_of_years (INT, NOT NULL)
- distance_from_earth (NUMERIC)
- has_life (BOOLEAN, NOT NULL)
- is_spherical (BOOLEAN, NOT NULL)
- number_of_moons (INT)

### Tabla: moon
- moon_id (SERIAL, PRIMARY KEY)
- name (VARCHAR, UNIQUE, NOT NULL)
- planet_id (INT, NOT NULL, FOREIGN KEY)
- description (TEXT)
- age_in_millions_of_years (INT, NOT NULL)
- distance_from_earth (NUMERIC)
- has_life (BOOLEAN, NOT NULL)
- is_spherical (BOOLEAN, NOT NULL)
- diameter_km (INT)

### Tabla: asteroid
- asteroid_id (SERIAL, PRIMARY KEY)
- name (VARCHAR, UNIQUE, NOT NULL)
- description (TEXT)
- diameter_km (INT, NOT NULL)
- distance_from_earth (NUMERIC)
- is_dangerous (BOOLEAN, NOT NULL)
- has_been_visited (BOOLEAN, NOT NULL)
- discovery_year (INT)

## Instalación

Conectarse a PostgreSQL:
```bash
psql --username=freecodecamp --dbname=postgres
```

Crear base de datos:
```sql
CREATE DATABASE universe;
\c universe
```

Restaurar desde dump:
```bash
psql -U freecodecamp universe < universe.sql
```

## Datos incluidos

- 6 galaxias (Milky Way, Andromeda, Triangulum, etc.)
- 6 estrellas (Sun, Proxima Centauri, Sirius, etc.)
- 12 planetas (Earth, Mars, Jupiter, Saturn, exoplanetas, etc.)
- 20 lunas (Moon, Europa, Titan, Ganymede, etc.)
- 3 asteroides (Ceres, Vesta, Pallas)

## Consultas de ejemplo

Ver estrellas de la Vía Láctea:
```sql
SELECT s.name, s.temperature_kelvin 
FROM star s
JOIN galaxy g ON s.galaxy_id = g.galaxy_id
WHERE g.name = 'Milky Way';
```

Contar lunas por planeta:
```sql
SELECT p.name, COUNT(m.moon_id) AS moon_count
FROM planet p
LEFT JOIN moon m ON p.planet_id = m.planet_id
GROUP BY p.name
ORDER BY moon_count DESC;
```

## Respaldo de la base de datos

Crear respaldo:
```bash
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```

Restaurar respaldo:
```bash
psql -U freecodecamp < universe.sql
```

## Tecnologías

- PostgreSQL 12+
- SQL
- Bash

## Autor

GitHub: [MILLERMARRU]
freeCodeCamp: [@miller_zamora]

## Licencia

MIT License

## Proyecto educativo

Parte de la certificación Relational Database de freeCodeCamp.
