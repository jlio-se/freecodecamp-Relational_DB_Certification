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
-- Name: additinfo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.additinfo (
    name character varying(40) NOT NULL,
    has_info boolean NOT NULL,
    location text,
    additinfo_id integer NOT NULL
);


ALTER TABLE public.additinfo OWNER TO freecodecamp;

--
-- Name: additinfo_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.additinfo_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additinfo_info_id_seq OWNER TO freecodecamp;

--
-- Name: additinfo_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.additinfo_info_id_seq OWNED BY public.additinfo.additinfo_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_types text,
    distance_from_earth integer
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
    name character varying(40) NOT NULL,
    distance_from_home_planet integer NOT NULL,
    description text,
    planet_id integer,
    unique_moon boolean
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean,
    planet_types text,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    star_type text,
    galaxy_id integer
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
-- Name: additinfo additinfo_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additinfo ALTER COLUMN additinfo_id SET DEFAULT nextval('public.additinfo_info_id_seq'::regclass);


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
-- Data for Name: additinfo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.additinfo VALUES ('info1', false, 'No', 1);
INSERT INTO public.additinfo VALUES ('info2', false, 'No', 2);
INSERT INTO public.additinfo VALUES ('info3', false, 'No', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610, 'barred spiral', 26670);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10010, 'barred spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 250, 'interacting', 65000000);
INSERT INTO public.galaxy VALUES (4, 'Backward', 500, 'spiral', 111000000);
INSERT INTO public.galaxy VALUES (5, 'Blackeye', 13280, 'spiral', 24010000);
INSERT INTO public.galaxy VALUES (6, 'Bodes', 13310, 'grand design spiral', 11740000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Our Moon', 384400, 'fifth largest in system', 3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 6000, 'Greek God Phobos', 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 'Phobos Twin Bro', 4, false);
INSERT INTO public.moon VALUES (4, 'Metis', 128000, 'inner moon', 5, false);
INSERT INTO public.moon VALUES (5, 'Adrastea', 128980, 'inner moon', 5, false);
INSERT INTO public.moon VALUES (6, 'Amalthea', 181300, 'inner moon', 5, false);
INSERT INTO public.moon VALUES (7, 'Thebe', 221900, 'inner moon', 5, false);
INSERT INTO public.moon VALUES (8, 'Io', 422000, 'Galilean moon', 5, false);
INSERT INTO public.moon VALUES (9, 'Europa', 671000, 'Galilean moon', 5, false);
INSERT INTO public.moon VALUES (10, 'Ganymede', 1070000, 'Galilean moon', 5, false);
INSERT INTO public.moon VALUES (11, 'Callisto', 1883000, 'Galilean moon', 5, false);
INSERT INTO public.moon VALUES (12, 'Mimas', 185520, 'Discovered by Herschel in 1789', 6, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 238020, 'Discovered by Herschel in 1789', 6, false);
INSERT INTO public.moon VALUES (14, 'Tethys', 294660, 'Discovered by Cassini in 1684', 6, false);
INSERT INTO public.moon VALUES (15, 'Dione', 377400, 'Discovered by Cassini in 1684', 6, false);
INSERT INTO public.moon VALUES (16, 'Rhea', 527040, 'Discovered by Cassini in 1672', 6, false);
INSERT INTO public.moon VALUES (17, 'Titan', 1221850, 'Discovered by Huygens in 1655', 6, false);
INSERT INTO public.moon VALUES (18, 'Cordelia', 49800, 'Discovered by Voyager 2 in 1986', 7, false);
INSERT INTO public.moon VALUES (19, 'Ophelia', 53800, 'Discovered by Voyager 2 in 1986', 7, false);
INSERT INTO public.moon VALUES (20, 'Bianca', 59200, 'Discovered by Voyager 2 in 1986', 7, false);
INSERT INTO public.moon VALUES (21, 'Cressida', 61800, 'Discovered by Voyager 2 in 1986', 7, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4503, false, 'Rock', 4);
INSERT INTO public.planet VALUES (2, 'Venus', 4503, false, 'Rock', 4);
INSERT INTO public.planet VALUES (3, 'Earth', 4503, true, 'Rock', 4);
INSERT INTO public.planet VALUES (4, 'Mars', 4503, false, 'Rock', 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4503, false, 'Gas', 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, false, 'Gas', 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, false, 'Gas', 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, false, 'Gas', 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 4503, false, 'Dwarf', 4);
INSERT INTO public.planet VALUES (10, 'A Centauri C Planet 1', 4503, false, 'Unknown', 1);
INSERT INTO public.planet VALUES (11, 'A Centauri C Planet 2', 4503, false, 'Unknown', 1);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 8000, false, 'Exoplanet', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a Centauri C', 4850, 'red dwarf', 1);
INSERT INTO public.star VALUES (2, 'a Centauri A', 5300, 'Yellow Main', 1);
INSERT INTO public.star VALUES (3, 'a Centauri B', 5400, 'Orange Main', 1);
INSERT INTO public.star VALUES (4, 'Sun', 4600, 'spiral', 1);
INSERT INTO public.star VALUES (5, 'Barnards Star', 8500, 'red dwarf', 1);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 8200, 'yellow Main', 1);


--
-- Name: additinfo_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.additinfo_info_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: additinfo additinfo_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additinfo
    ADD CONSTRAINT additinfo_name_key UNIQUE (name);


--
-- Name: additinfo additinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additinfo
    ADD CONSTRAINT additinfo_pkey PRIMARY KEY (additinfo_id);


--
-- Name: galaxy galaxy_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_earth_key UNIQUE (distance_from_earth);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

