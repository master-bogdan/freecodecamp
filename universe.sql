 
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    has_life boolean NOT NULL,
    age_in_millions_of_years integer
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
    name character varying(255) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric,
    age_in_millions_of_years integer,
    description text
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
    name character varying(255) NOT NULL,
    star_id integer,
    planet_type character varying(255),
    has_moons boolean NOT NULL,
    distance_from_star numeric
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(255),
    is_super_giant boolean NOT NULL,
    distance_from_earth numeric
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, 6000);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Spiral', true, 13000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', false, 6000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', false, 12000);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'Spiral', false, 9000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (2, 'Moon 2', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (3, 'Moon 3', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (5, 'Moon 6', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (6, 'Moon 5', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (7, 'Moon 4', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (8, 'Moon 9', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (9, 'Moon 8', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (10, 'Moon 7', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (11, 'Moon 12', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (12, 'Moon 11', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (13, 'Moon 10', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (14, 'Moon 15', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (15, 'Moon 14', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (16, 'Moon 13', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (17, 'Moon 18', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (18, 'Moon 17', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (19, 'Moon 16', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (20, 'Moon 21', 6, true, 384400, 4500, 'The Earths''s natural satellite');
INSERT INTO public.moon VALUES (21, 'Moon 20', 4, true, 385000, 3000, 'A small moon orbiting a gas giant');
INSERT INTO public.moon VALUES (22, 'Moon 19', 11, false, 450000, 2000, 'Icy moon with subsurface ocean');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Mercury', 7, 'Terrestrial', false, 0.39);
INSERT INTO public.planet VALUES (5, 'Venus', 7, 'Terrestrial', false, 0.72);
INSERT INTO public.planet VALUES (6, 'Earth', 7, 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 7, 'Gas Giant', true, 9.58);
INSERT INTO public.planet VALUES (8, 'Jupitier', 7, 'Gas Giant', true, 5.20);
INSERT INTO public.planet VALUES (9, 'Mars', 7, 'Terrestrial', true, 1.52);
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 'Exoplanet', true, 0.05);
INSERT INTO public.planet VALUES (11, 'Neptune', 3, 'Ice Giant', true, 30.05);
INSERT INTO public.planet VALUES (12, 'Uranus', 8, 'Ice Giant', true, 19.22);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 8, 'Exoplanet', true, 1402);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 1, 'Hot Jupiter', false, 0.045);
INSERT INTO public.planet VALUES (15, 'GJ 581 c', 1, 'Exoplanet', false, 0.073);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 5, 'G2V', false, 4.37);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 5, 'K1V', false, 4.37);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 5, 'M5Ve', false, 4.24);
INSERT INTO public.star VALUES (7, 'Sun', 4, 'G2V', true, 1);
INSERT INTO public.star VALUES (8, 'Sirius', 2, 'A1V', true, 8.6);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 4, 'M1-M2Ia-Iab', true, 642.5);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Terretrial', NULL);
INSERT INTO public.star_type VALUES (2, 'Gas Giant', NULL);
INSERT INTO public.star_type VALUES (3, 'Exoplanet', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

