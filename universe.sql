--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    diameter_km integer NOT NULL,
    distance_from_earth numeric(10,2),
    is_dangerous boolean NOT NULL,
    has_been_visited boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    diameter_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    temperature_kelvin integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Largest asteroid', 940, 413.00, false, true, 1801);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Second largest', 525, 353.00, false, true, 1807);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Third largest', 512, 414.00, false, false, 1802);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 0.00, true, false, 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 10000, 2537000.00, false, false, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in local group', 12000, 3000000.00, false, false, 40000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Beautiful spiral galaxy', 11000, 23000000.00, false, false, 100000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Hat-shaped galaxy', 13250, 29000000.00, false, false, 800000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 13000, 21000000.00, false, false, 100000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earths only moon', 4530, 0.00, false, true, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Mars inner moon', 4600, 225.00, false, false, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Mars outer moon', 4600, 225.00, false, false, 12);
INSERT INTO public.moon VALUES (4, 'Io', 3, 'Volcanic moon', 4600, 778.00, false, true, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Ice moon with ocean', 4600, 778.00, false, true, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 'Largest moon', 4600, 778.00, false, true, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'Heavily cratered', 4600, 778.00, false, true, 4820);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Saturn largest moon', 4500, 1400.00, false, true, 5150);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 'Ice geysers', 4500, 1400.00, false, true, 504);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 'Death Star moon', 4500, 1400.00, false, true, 396);
INSERT INTO public.moon VALUES (11, 'Rhea', 4, 'Second largest Saturn moon', 4500, 1400.00, false, true, 1527);
INSERT INTO public.moon VALUES (12, 'Iapetus', 4, 'Two-toned moon', 4500, 1400.00, false, true, 1469);
INSERT INTO public.moon VALUES (13, 'Dione', 4, 'Icy moon', 4500, 1400.00, false, true, 1123);
INSERT INTO public.moon VALUES (14, 'Tethys', 4, 'Low density moon', 4500, 1400.00, false, true, 1062);
INSERT INTO public.moon VALUES (15, 'Triton', 7, 'Neptune largest moon', 4500, 4500.00, false, true, 2706);
INSERT INTO public.moon VALUES (16, 'Titania', 8, 'Uranus largest moon', 4500, 2900.00, false, true, 1578);
INSERT INTO public.moon VALUES (17, 'Oberon', 8, 'Uranus second largest', 4500, 2900.00, false, true, 1523);
INSERT INTO public.moon VALUES (18, 'Miranda', 8, 'Fractured moon', 4500, 2900.00, false, true, 472);
INSERT INTO public.moon VALUES (19, 'Ariel', 8, 'Bright icy moon', 4500, 2900.00, false, true, 1158);
INSERT INTO public.moon VALUES (20, 'Umbriel', 8, 'Dark moon', 4500, 2900.00, false, true, 1169);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Our home planet', 4543, 0.00, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'The red planet', 4603, 225.00, false, true, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Largest planet', 4603, 778.00, false, true, 79);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Planet with rings', 4503, 1400.00, false, true, 82);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Hottest planet', 4503, 41.00, false, true, 0);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 'Closest to sun', 4503, 91.00, false, true, 0);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 'Ice giant', 4503, 4500.00, false, true, 14);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Tilted planet', 4503, 2900.00, false, true, 27);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet in habitable zone', 4850, 4.24, false, true, 0);
INSERT INTO public.planet VALUES (10, 'Sirius b companion', 3, 'Planet around Sirius', 242, 8.60, false, true, 0);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 1, 'Earth-like exoplanet', 6000, 1400.00, false, true, 0);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 1, 'Potentially habitable', 7000, 20.00, false, true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our star', 4600, 0.00, false, true, 5778);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest star to Sun', 4850, 4.24, false, true, 3042);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Brightest star in night sky', 242, 8.60, false, true, 9940);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant', 8000, 548.00, false, true, 3500);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'Part of triple star system', 5300, 4.37, false, true, 5790);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Fifth brightest star', 455, 25.00, false, true, 9602);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

