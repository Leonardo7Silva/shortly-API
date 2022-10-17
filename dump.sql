--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    counter integer DEFAULT 0
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    tolken text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "userName" text NOT NULL,
    "passWord" text NOT NULL,
    "userEmail" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (1, 1, '2022-10-15 15:16:50.998846', 'cachorro', 'cachorrin', 0);
INSERT INTO public.links VALUES (5, 3, '2022-10-15 20:46:29.500099', '2V6paHD6', 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 6);
INSERT INTO public.links VALUES (6, 4, '2022-10-16 22:11:15.111364', 'PNSp2nMH', 'https://www.google.com/', 1);
INSERT INTO public.links VALUES (7, 5, '2022-10-16 22:11:45.961372', 'PAhax_81', 'https://www.google.com/', 2);
INSERT INTO public.links VALUES (8, 6, '2022-10-16 22:12:18.705075', 'hsFiMH7Z', 'https://www.google.com/', 3);
INSERT INTO public.links VALUES (9, 7, '2022-10-16 22:12:51.081552', 'dOwrmpSx', 'https://www.google.com/', 4);
INSERT INTO public.links VALUES (4, 3, '2022-10-15 20:40:37.172111', 'HvpIbUaK', 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 1);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 3, '2022-10-15 18:04:35.064427', 'cf9f4130-d671-40fd-bb41-2b35027171aa');
INSERT INTO public.sessions VALUES (2, 4, '2022-10-16 22:08:15.334878', 'dee7d901-4907-4fc3-9e1c-6f0cc94d3d51');
INSERT INTO public.sessions VALUES (3, 5, '2022-10-16 22:08:59.525271', 'a7c5542c-8465-40f7-b2d8-1f8a9f7439d4');
INSERT INTO public.sessions VALUES (4, 6, '2022-10-16 22:09:25.252754', '3dd49a6f-531e-4631-a585-d54a1692e378');
INSERT INTO public.sessions VALUES (5, 7, '2022-10-16 22:09:46.156402', 'f5a9bbea-284b-453c-be06-9d2312189601');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'leo', '12345', 'leo@', '2022-10-15 15:15:38.167795');
INSERT INTO public.users VALUES (2, 'leonardo', '12345678', 'leo7kisam@gmail.com', '2022-10-15 16:47:48.957427');
INSERT INTO public.users VALUES (3, 'leo3', '$2b$12$4PkMoZ0it75hcR42l72Jfu.6jBOTV/Ibsg2duW4zAefxmpbAH4oaK', 'leonardo@gmail.com', '2022-10-15 17:00:44.310922');
INSERT INTO public.users VALUES (4, 'leo4', '$2b$12$pZEUZSLVfXGu2eIJka33VOLzrijnq1eoNPm7mMtJrlbWOP3nx2rOG', 'leonard@gmail.com', '2022-10-16 22:05:31.258933');
INSERT INTO public.users VALUES (5, 'leo5', '$2b$12$Vkct0eC/aNK72C/Afv7JIeKTpoeCZXHxpRk6llEMQ.HoKEucR8i/W', 'leonar@gmail.com', '2022-10-16 22:05:42.783868');
INSERT INTO public.users VALUES (6, 'leo6', '$2b$12$z6VPEIlPNwxPUTgjF6Ve9uUHZyMxwtSHBJLVDESPkMBTjXnsW7Z0O', 'leona@gmail.com', '2022-10-16 22:05:53.898547');
INSERT INTO public.users VALUES (7, 'leo7', '$2b$12$u31FoPW4l5IPilk7PGRh3ObFCn6N.xfovfSUXxIdwio1Ji18Rvnxu', 'leon@gmail.com', '2022-10-16 22:06:07.758265');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 9, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_userEmail_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_userEmail_key" UNIQUE ("userEmail");


--
-- Name: users users_userName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_userName_key" UNIQUE ("userName");


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

