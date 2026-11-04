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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbital_period_years integer NOT NULL,
    tail_length_million_km numeric(5,2),
    is_periodic boolean DEFAULT true NOT NULL,
    CONSTRAINT comet_orbital_period_years_check CHECK ((orbital_period_years > 0))
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.comet ALTER COLUMN comet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comet_comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    satellite_count integer DEFAULT 0 NOT NULL,
    redshift numeric NOT NULL,
    description text,
    CONSTRAINT galaxy_redshift_check CHECK ((redshift > ('-1'::integer)::numeric))
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
    name character varying(50),
    planet_id integer NOT NULL,
    radius numeric(5,1),
    gravity numeric(3,2)
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
    name character varying(50),
    moon_count integer DEFAULT 0 NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(20),
    mass numeric(6,2)
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
    name character varying(50),
    galaxy_id integer NOT NULL,
    luminosity double precision,
    age numeric(4,2)
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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (1, 'Halleys Comet', 75, 22.50, true);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (2, 'Hale-Bopp', 2533, 45.00, true);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (3, 'Encke', 3, 2.10, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 50, 0.0000, 'Our home spiral galaxy containing Earth.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 14, -0.0010, 'Massive neighbor galaxy on a collision course with us.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 0, -0.0006, 'The third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 10, 0.0034, 'Unusual galaxy with a bright nucleus and large central bulge.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 1, 0.0015, 'Classic grand design spiral galaxy interacting with a smaller dwarf.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 11, 0.0018, 'One of the closest radio galaxies to Earth.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 1737.4, 1.62);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.2, 0.01);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 0.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.6, 1.80);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.8, 1.32);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.1, 1.43);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, 1.24);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.5, 0.02);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 69.8, 0.06);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198.2, 0.06);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 252.1, 0.11);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 531.1, 0.15);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 561.4, 0.23);
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 763.8, 0.26);
INSERT INTO public.moon VALUES (15, 'Titan', 6, 2574.7, 1.35);
INSERT INTO public.moon VALUES (16, 'Hyperion', 6, 135.0, 0.02);
INSERT INTO public.moon VALUES (17, 'Iapetus', 6, 734.3, 0.22);
INSERT INTO public.moon VALUES (18, 'Almach Moon A', 9, 340.5, 0.45);
INSERT INTO public.moon VALUES (19, 'Almach Moon B', 9, 120.0, 0.12);
INSERT INTO public.moon VALUES (20, 'Mirach Moon Alpha', 11, 450.0, 0.55);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, true, 1, 'Terrestrial', 0.06);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, true, 1, 'Terrestrial', 0.82);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 1, 'Terrestrial', 1.00);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, true, 1, 'Terrestrial', 0.11);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, false, true, 1, 'Gas Giant', 317.80);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, false, true, 1, 'Gas Giant', 95.16);
INSERT INTO public.planet VALUES (7, 'Proxima b', 0, false, true, 2, 'Exoplanet', 1.07);
INSERT INTO public.planet VALUES (8, 'Sirius b Planet', 0, false, true, 3, 'Exoplanet', 5.40);
INSERT INTO public.planet VALUES (9, 'Almach Prime', 4, false, true, 4, 'Gas Giant', 500.50);
INSERT INTO public.planet VALUES (10, 'Almach Secundus', 1, false, true, 4, 'Terrestrial', 2.10);
INSERT INTO public.planet VALUES (11, 'Mirach Alpha', 3, false, true, 5, 'Super-Earth', 8.30);
INSERT INTO public.planet VALUES (12, 'Vega Major', 5, false, true, 6, 'Gas Giant', 120.40);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 4.60);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 1.5, 5.30);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 25.4, 0.24);
INSERT INTO public.star VALUES (4, 'Almach', 2, 2000, 6.50);
INSERT INTO public.star VALUES (5, 'Mirach', 2, 1900, 8.10);
INSERT INTO public.star VALUES (6, 'Vega', 3, 40.1, 0.45);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

