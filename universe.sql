--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    type character varying(100),
    distance_from_earth double precision,
    description text,
    galaxy_types_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    type character varying(100) NOT NULL,
    description character varying(255),
    is_active boolean DEFAULT true,
    name character varying(255)
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    radius double precision,
    has_atmosphere boolean,
    temperature numeric(10,2),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    type character varying(100),
    mass numeric(40,10),
    radius double precision,
    orbital_period integer,
    temperature integer,
    description text,
    has_life boolean,
    planet_types_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    type character varying(100) NOT NULL,
    description character varying(255),
    is_active boolean DEFAULT true,
    name character varying(255)
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    type character varying(100),
    mass numeric(40,10),
    radius double precision,
    age integer,
    luminosity integer,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Espiral', 0, 'Nuestra galaxia hogar', 1);
INSERT INTO public.galaxy VALUES (3, 'Andrómeda', 'Espiral', 2537000, 'La galaxia más cercana a la Vía Láctea', 1);
INSERT INTO public.galaxy VALUES (4, 'Galaxia del Sombrero', 'Espiral', 28000000, 'Conocida por su apariencia de sombrero, rica en estrellas', 1);
INSERT INTO public.galaxy VALUES (8, 'Galaxia del Triángulo', 'Espiral', 3000000, 'Una de las galaxias más cercanas a la Vía Láctea', 1);
INSERT INTO public.galaxy VALUES (9, 'Galaxia de Bode', 'Espiral', 12000000, 'Galaxia brillante que se encuentra en la constelación de la Osa Mayor', 1);
INSERT INTO public.galaxy VALUES (10, 'Galaxia de Cigarro', 'Espiral', 120000000, 'Galaxia con un aspecto alargado, famosa por su forma inusual', 1);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Espiral', 'Galaxias con brazos que se extienden desde el centro', true, 'Galaxia Espiral');
INSERT INTO public.galaxy_types VALUES (2, 'Elíptica', 'Galaxias con forma ovalada y sin estructura interna clara', true, 'Galaxia Elíptica');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Galaxias que no tienen una forma definida', true, 'Galaxia Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 1737.4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 2, 1560.8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Fobos', 3, 11.4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', 3, 6.2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 2575, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 763.8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1469, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Tritón', 5, 1353.4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Charon', 6, 1212, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Haumea I', 7, 510, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Haumea II', 7, 300, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Makemake I', 8, 700, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Ganimedes', 2, 2634.1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Calisto', 2, 2410.3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Callisto', 2, 2410.3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Encelado', 4, 504.2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Miranda', 5, 471.6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Ariel', 5, 1165, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Umbriel', 5, 584.7, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Oberón', 5, 761.4, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1, 'Terrestre', 59720000000.0000000000, 6371, NULL, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (2, 'Júpiter', 1, 'Gaseoso', 18980000000.0000000000, 69911, NULL, NULL, NULL, false, 2);
INSERT INTO public.planet VALUES (3, 'Marte', 1, 'Terrestre', 64170000000.0000000000, 3389, NULL, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (4, 'Mercurio', 1, 'Terrestre', 3300000000.0000000000, 2439.7, NULL, NULL, 'Planeta más cercano al Sol', false, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Terrestre', 4867000000.0000000000, 6051.8, NULL, NULL, 'Segundo planeta desde el Sol', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 'Gaseoso', 56800000000.0000000000, 58232, NULL, NULL, 'Famoso por sus anillos', false, 2);
INSERT INTO public.planet VALUES (7, 'Urano', 1, 'Gaseoso', 86810000000.0000000000, 25362, NULL, NULL, 'Un gigante gaseoso con un eje de rotación extremo', false, 2);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 'Gaseoso', 102000000000.0000000000, 24622, NULL, NULL, 'El planeta más alejado del Sol', false, 2);
INSERT INTO public.planet VALUES (9, 'Plutón', 1, 'Enano', 1300000000.0000000000, 1188.3, NULL, NULL, 'Antiguamente considerado el noveno planeta', false, 3);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 'Enano', 1600000000.0000000000, 1163, NULL, NULL, 'Planeta enano en el cinturón de Kuiper', false, 3);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 'Enano', 400000000.0000000000, 1632, NULL, NULL, 'Un planeta enano con forma de elipsoide', false, 3);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 'Enano', 400000000.0000000000, 715, NULL, NULL, 'Otro planeta enano en el cinturón de Kuiper', false, 3);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestre', 'Planetas compuestos principalmente de rocas y metales', true, NULL);
INSERT INTO public.planet_types VALUES (3, 'Enano', 'Objetos que son más grandes que un asteroide pero no son planetas principales', true, NULL);
INSERT INTO public.planet_types VALUES (2, 'Gaseoso', 'Planetas compuestos en su mayoría de gases', true, 'Planeta Gaseoso');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Estrella X', 1, 'Tipo A', 1000000000.1234567890, 696340, 1000, 100, true);
INSERT INTO public.star VALUES (2, 'Sol', 1, 'Enana amarilla', 19890000000.0000000000, 696340, 4600, 1, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Enana blanca', 21000000000.0000000000, 1180, 200, 25, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Supergigante roja', 20000000000.0000000000, 887, 1000000, 100, true);
INSERT INTO public.star VALUES (6, 'Sirius A', 1, 'Enana blanca', 5000000000000000000000000.0000000000, 1189000, 200, 25, true);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 1, 'Enana amarilla', 8000000000000000000000000.0000000000, 1092000, 5500, 2, true);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 'Enana roja', 100000000000000000000000.0000000000, 200000, 4500, 0, false);
INSERT INTO public.star VALUES (10, 'Rigel', 1, 'Supergigante azul', 2000000000000000000000000.0000000000, 785000, 80, 100000, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 22, true);


--
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 28, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: galaxy_types unique_galaxy_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique_galaxy_type UNIQUE (type);


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
-- Name: planet_types unique_planet_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_type UNIQUE (type);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: galaxy fk_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id) ON DELETE SET NULL;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_planet_types; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_types FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id) ON DELETE SET NULL;


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


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

