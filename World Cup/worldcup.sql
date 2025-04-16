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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (97, 2018, 'Final', 252, 253, 4, 2);
INSERT INTO public.games VALUES (98, 2018, 'Third Place', 254, 255, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Semi-Final', 253, 255, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Semi-Final', 252, 254, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 253, 256, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 255, 257, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Quarter-Final', 254, 258, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Quarter-Final', 252, 259, 2, 0);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 255, 260, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 257, 261, 1, 0);
INSERT INTO public.games VALUES (107, 2018, 'Eighth-Final', 254, 262, 3, 2);
INSERT INTO public.games VALUES (108, 2018, 'Eighth-Final', 258, 263, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 253, 264, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 256, 265, 2, 1);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 259, 266, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 252, 267, 4, 3);
INSERT INTO public.games VALUES (113, 2014, 'Final', 268, 267, 1, 0);
INSERT INTO public.games VALUES (114, 2014, 'Third Place', 269, 258, 3, 0);
INSERT INTO public.games VALUES (115, 2014, 'Semi-Final', 267, 269, 1, 0);
INSERT INTO public.games VALUES (116, 2014, 'Semi-Final', 268, 258, 7, 1);
INSERT INTO public.games VALUES (117, 2014, 'Quarter-Final', 269, 270, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Quarter-Final', 267, 254, 1, 0);
INSERT INTO public.games VALUES (119, 2014, 'Quarter-Final', 258, 260, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Quarter-Final', 268, 252, 1, 0);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 258, 271, 2, 1);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 260, 259, 2, 0);
INSERT INTO public.games VALUES (123, 2014, 'Eighth-Final', 252, 272, 2, 0);
INSERT INTO public.games VALUES (124, 2014, 'Eighth-Final', 268, 273, 2, 1);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 269, 263, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 270, 274, 2, 1);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 267, 261, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 254, 275, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (252, 'France');
INSERT INTO public.teams VALUES (253, 'Croatia');
INSERT INTO public.teams VALUES (254, 'Belgium');
INSERT INTO public.teams VALUES (255, 'England');
INSERT INTO public.teams VALUES (256, 'Russia');
INSERT INTO public.teams VALUES (257, 'Sweden');
INSERT INTO public.teams VALUES (258, 'Brazil');
INSERT INTO public.teams VALUES (259, 'Uruguay');
INSERT INTO public.teams VALUES (260, 'Colombia');
INSERT INTO public.teams VALUES (261, 'Switzerland');
INSERT INTO public.teams VALUES (262, 'Japan');
INSERT INTO public.teams VALUES (263, 'Mexico');
INSERT INTO public.teams VALUES (264, 'Denmark');
INSERT INTO public.teams VALUES (265, 'Spain');
INSERT INTO public.teams VALUES (266, 'Portugal');
INSERT INTO public.teams VALUES (267, 'Argentina');
INSERT INTO public.teams VALUES (268, 'Germany');
INSERT INTO public.teams VALUES (269, 'Netherlands');
INSERT INTO public.teams VALUES (270, 'Costa Rica');
INSERT INTO public.teams VALUES (271, 'Chile');
INSERT INTO public.teams VALUES (272, 'Nigeria');
INSERT INTO public.teams VALUES (273, 'Algeria');
INSERT INTO public.teams VALUES (274, 'Greece');
INSERT INTO public.teams VALUES (275, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 275, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

