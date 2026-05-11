--
-- PostgreSQL database dump
--

\restrict zuHTMUaRtqgJkJCxUEvXPYel9DaIoarYBCZbuKMo51WbhLsE523cz9LsnJFcxLk

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: ejercicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ejercicio (
    id integer NOT NULL,
    detalle character varying(40),
    id_tipo_ejercicio integer
);


ALTER TABLE public.ejercicio OWNER TO postgres;

--
-- Name: ejercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ejercicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ejercicio_id_seq OWNER TO postgres;

--
-- Name: ejercicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ejercicio_id_seq OWNED BY public.ejercicio.id;


--
-- Name: plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan (
    id integer NOT NULL,
    id_usuario integer,
    dia character varying(6),
    detalle character varying(20)
);


ALTER TABLE public.plan OWNER TO postgres;

--
-- Name: plan_ejercicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_ejercicio (
    id_plan integer,
    id_ejercicio integer,
    series character varying(10),
    rep character varying(10),
    peso character varying(10)
);


ALTER TABLE public.plan_ejercicio OWNER TO postgres;

--
-- Name: plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plan_id_seq OWNER TO postgres;

--
-- Name: plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_id_seq OWNED BY public.plan.id;


--
-- Name: tipo_ejercicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_ejercicio (
    id integer NOT NULL,
    detalle character varying(20)
);


ALTER TABLE public.tipo_ejercicio OWNER TO postgres;

--
-- Name: tipo_ejercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_ejercicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_ejercicio_id_seq OWNER TO postgres;

--
-- Name: tipo_ejercicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_ejercicio_id_seq OWNED BY public.tipo_ejercicio.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    usuario character varying(40),
    email character varying(80),
    password character varying(100),
    telefono character varying(12),
    dni character varying(12)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: ejercicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejercicio ALTER COLUMN id SET DEFAULT nextval('public.ejercicio_id_seq'::regclass);


--
-- Name: plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan ALTER COLUMN id SET DEFAULT nextval('public.plan_id_seq'::regclass);


--
-- Name: tipo_ejercicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_ejercicio ALTER COLUMN id SET DEFAULT nextval('public.tipo_ejercicio_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: ejercicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ejercicio (id, detalle, id_tipo_ejercicio) FROM stdin;
1	pecho plano	2
2	90 a 90	1
3	90 90 + rotacióncon baston	1
4	Estocada psoas-isquios	1
5	bisagra de cadera	1
6	carpa + flex brazo	1
7	vuelos Y	1
8	vuelos T	1
9	gato bueno malo	1
10	90 90 + elevacion	1
11	bisagra de cadera c/baston	1
12	dorsiflexion de tobillo con baston	1
13	plancha frontal + vuelo lateral	3
14	abd lanzo	3
15	rotaciones desde polea	3
16	puente lateral + abduccion	3
17	abd bolita	3
18	roll out ruedita	3
19	plancha frontal paso elemento	3
20	puente de isquios pie en cajon	3
21	Sillon de cuadriceps	2
22	Sentadilla smith	2
23	Peso muerto c/m	2
24	Vuelo frontal c/disco	2
25	Remo bajo	2
26	inclinado c/m	2
27	triceps c/barrita	2
28	jalón al pecho prono	2
29	peso muerto c/b	2
30	hip thrust	2
31	remo al menton	2
32	lumbares en maquina	2
33	curl de biceps c/m	2
34	tricep soga	2
35	gemelos en maquina	2
36	sillon de abductores	2
37	sentadilla copa	2
38	press plano c/b	2
39	apertura c/m	2
40	sillon de isquios	2
41	press militar c/m	2
42	curl de biceps	2
43	curl prono en W	2
44	sillon de aduccion	2
\.


--
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan (id, id_usuario, dia, detalle) FROM stdin;
1	1	1	full-body
2	1	2	full-body
3	1	3	full-body
\.


--
-- Data for Name: plan_ejercicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_ejercicio (id_plan, id_ejercicio, series, rep, peso) FROM stdin;
1	3	2	6 c/l	0
1	4	2	6 c/l	0
1	5	2	10 c/l	0
2	6	2	5	0
2	7	2	10	0
2	8	2	10	0
2	9	2	5	0
3	10	2	6 c/l	0
3	11	2	10	0
3	12	2	6 c/l	0
1	13	3	10 c/l	7,5
1	14	3	10	4
1	15	3	10 c/l	5
1	16	3	10 c/l	0
2	17	3	tabata	0
3	18	3	10	0
3	19	3	10	6
3	20	3	6 c/l	0
1	21	3	15	55
1	22	4	6-8-10-12	20
1	23	4	10	10
1	24	3	12	15
1	25	3	6	50
1	26	3	8	15
1	27	3	12	30
2	26	4	12	15
2	28	4	6-8	40
2	29	4	8	5
2	30	3	8	30
2	31	3	12	20
2	32	3	15	0
2	33	3	10	12
2	34	3	10	5
2	35	3	15	30
3	25	3	10	40
3	36	4	10	max 50
3	37	4	10	18
3	38	4	6	15
3	39	4	12	10
3	40	3	10	45
3	41	3	10	15
3	42	3	10	12
3	43	3	10	5
3	44	3	15	40
\.


--
-- Data for Name: tipo_ejercicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_ejercicio (id, detalle) FROM stdin;
1	movilidad
2	musculación
3	zona media
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, usuario, email, password, telefono, dni) FROM stdin;
1	agus	agustin@arla.com.ar	$2b$10$4H.OlrrNkFby8FNCdhKbUuVilH2m0oJwaoDOPkuhMeh0b78.NDi6i	3518006018	45086990
\.


--
-- Name: ejercicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ejercicio_id_seq', 44, true);


--
-- Name: plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_id_seq', 3, true);


--
-- Name: tipo_ejercicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_ejercicio_id_seq', 3, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, true);


--
-- Name: ejercicio ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejercicio
    ADD CONSTRAINT ejercicio_pkey PRIMARY KEY (id);


--
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (id);


--
-- Name: tipo_ejercicio tipo_ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_ejercicio
    ADD CONSTRAINT tipo_ejercicio_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: ejercicio ejercicio_id_tipo_ejercicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejercicio
    ADD CONSTRAINT ejercicio_id_tipo_ejercicio_fkey FOREIGN KEY (id_tipo_ejercicio) REFERENCES public.tipo_ejercicio(id);


--
-- Name: plan_ejercicio plan_ejercicio_id_ejercicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_ejercicio
    ADD CONSTRAINT plan_ejercicio_id_ejercicio_fkey FOREIGN KEY (id_ejercicio) REFERENCES public.ejercicio(id);


--
-- Name: plan_ejercicio plan_ejercicio_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_ejercicio
    ADD CONSTRAINT plan_ejercicio_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.plan(id);


--
-- Name: plan plan_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- PostgreSQL database dump complete
--

\unrestrict zuHTMUaRtqgJkJCxUEvXPYel9DaIoarYBCZbuKMo51WbhLsE523cz9LsnJFcxLk

