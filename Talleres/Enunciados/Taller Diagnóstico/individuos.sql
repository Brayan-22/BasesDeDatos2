--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.3

-- Started on 2019-12-18 21:54:09 UTC

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

DROP DATABASE individuos;
--
-- TOC entry 2954 (class 1262 OID 16393)
-- Name: individuos; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE individuos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE individuos OWNER TO postgres;

\connect individuos

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    dep_id integer NOT NULL,
    dep_nombre character varying(25),
    dep_codigo character varying(2)
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE departamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.departamento IS 'tabla de departamentos';


--
-- TOC entry 197 (class 1259 OID 16397)
-- Name: departamento_dep_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_dep_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_dep_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 197
-- Name: departamento_dep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamento_dep_id_seq OWNED BY public.departamento.dep_id;


--
-- TOC entry 198 (class 1259 OID 16399)
-- Name: especie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especie (
    esp_id integer NOT NULL,
    esp_nombre character varying(25)
);


ALTER TABLE public.especie OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE especie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.especie IS 'especies a inventariar';


--
-- TOC entry 199 (class 1259 OID 16402)
-- Name: especie_esp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especie_esp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especie_esp_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 199
-- Name: especie_esp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especie_esp_id_seq OWNED BY public.especie.esp_id;


--
-- TOC entry 200 (class 1259 OID 16404)
-- Name: estado_individuo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_individuo (
    esi_id integer NOT NULL,
    esi_nombre character varying(20)
);


ALTER TABLE public.estado_individuo OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16407)
-- Name: estado_individuo_esi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_individuo_esi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_individuo_esi_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_individuo_esi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_individuo_esi_id_seq OWNED BY public.estado_individuo.esi_id;


--
-- TOC entry 202 (class 1259 OID 16409)
-- Name: individuo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individuo (
    ind_id integer NOT NULL,
    mxp_id integer,
    ind_fecha date,
    esi_id integer,
    usu_id integer
);


ALTER TABLE public.individuo OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16412)
-- Name: individuo_ind_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individuo_ind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individuo_ind_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 203
-- Name: individuo_ind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individuo_ind_id_seq OWNED BY public.individuo.ind_id;


--
-- TOC entry 204 (class 1259 OID 16414)
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio (
    mun_id integer NOT NULL,
    mun_nombre character varying(50),
    dep_id integer,
    mun_codigo character varying(10)
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE municipio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.municipio IS 'municipios';


--
-- TOC entry 205 (class 1259 OID 16417)
-- Name: municipio_mun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipio_mun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipio_mun_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 205
-- Name: municipio_mun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipio_mun_id_seq OWNED BY public.municipio.mun_id;


--
-- TOC entry 206 (class 1259 OID 16419)
-- Name: municipio_paramo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio_paramo (
    mxp_id integer NOT NULL,
    mun_id integer,
    par_id integer
);


ALTER TABLE public.municipio_paramo OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16422)
-- Name: municipio_paramo_mxp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipio_paramo_mxp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipio_paramo_mxp_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 207
-- Name: municipio_paramo_mxp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipio_paramo_mxp_id_seq OWNED BY public.municipio_paramo.mxp_id;


--
-- TOC entry 208 (class 1259 OID 16424)
-- Name: paramo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paramo (
    par_id integer NOT NULL,
    par_nombre character varying(100)
);


ALTER TABLE public.paramo OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE paramo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.paramo IS 'tabla de paramos';


--
-- TOC entry 209 (class 1259 OID 16427)
-- Name: paramo_par_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paramo_par_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paramo_par_id_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 209
-- Name: paramo_par_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paramo_par_id_seq OWNED BY public.paramo.par_id;


--
-- TOC entry 210 (class 1259 OID 16429)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    usu_id integer NOT NULL,
    usu_nombre character varying(50),
    usu_apellido character varying(50)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16432)
-- Name: usuario_usua_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_usua_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usua_id_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 211
-- Name: usuario_usua_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usua_id_seq OWNED BY public.usuario.usu_id;


--
-- TOC entry 2782 (class 2604 OID 16434)
-- Name: departamento dep_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento ALTER COLUMN dep_id SET DEFAULT nextval('public.departamento_dep_id_seq'::regclass);


--
-- TOC entry 2783 (class 2604 OID 16435)
-- Name: especie esp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especie ALTER COLUMN esp_id SET DEFAULT nextval('public.especie_esp_id_seq'::regclass);


--
-- TOC entry 2784 (class 2604 OID 16436)
-- Name: estado_individuo esi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_individuo ALTER COLUMN esi_id SET DEFAULT nextval('public.estado_individuo_esi_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 16437)
-- Name: individuo ind_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuo ALTER COLUMN ind_id SET DEFAULT nextval('public.individuo_ind_id_seq'::regclass);


--
-- TOC entry 2786 (class 2604 OID 16438)
-- Name: municipio mun_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio ALTER COLUMN mun_id SET DEFAULT nextval('public.municipio_mun_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 16439)
-- Name: municipio_paramo mxp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio_paramo ALTER COLUMN mxp_id SET DEFAULT nextval('public.municipio_paramo_mxp_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 16440)
-- Name: paramo par_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paramo ALTER COLUMN par_id SET DEFAULT nextval('public.paramo_par_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 16441)
-- Name: usuario usu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usu_id SET DEFAULT nextval('public.usuario_usua_id_seq'::regclass);


--
-- TOC entry 2933 (class 0 OID 16394)
-- Dependencies: 196
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (1, 'Amazonas', '91');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (2, 'Antioquia', '05');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (3, 'Arauca', '81');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (4, 'San Andrés y Providencia', '88');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (5, 'Atlántico', '08');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (6, 'Bogotá, D.C.', '11');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (7, 'Bolívar', '13');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (8, 'Boyacá', '15');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (9, 'Caldas', '17');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (10, 'Caquetá', '18');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (11, 'Casanare', '85');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (12, 'Cauca', '19');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (13, 'Cesar', '20');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (14, 'Chocó', '27');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (15, 'Córdoba', '23');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (16, 'Cundinamarca', '25');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (17, 'Guainía', '94');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (18, 'Guaviare', '95');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (19, 'Huila', '41');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (20, 'La Guajira', '44');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (21, 'Magdalena', '47');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (22, 'Meta', '50');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (23, 'Nariño', '52');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (24, 'Norte de Santander', '54');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (25, 'Norte de Santander', '54');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (26, 'Putumayo', '86');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (27, 'Quindio', '63');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (28, 'Risaralda', '66');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (29, 'Santander', '68');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (30, 'Sucre', '70');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (31, 'Tolima', '73');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (32, 'Valle del Cauca', '76');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (33, 'Vaupés', '97');
INSERT INTO public.departamento (dep_id, dep_nombre, dep_codigo) VALUES (34, 'Vichada', '99');


--
-- TOC entry 2935 (class 0 OID 16399)
-- Dependencies: 198
-- Data for Name: especie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especie (esp_id, esp_nombre) VALUES (1, 'Espeletia argentea');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (2, 'Espeletia killipii');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (3, 'Espeletia grandiflora');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (4, 'Espeletia boyacensis');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (5, 'Espeletia cayetana');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (6, 'Espeletia azucarina');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (7, 'Espeletia discoidea');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (8, 'Espeletia barclayana');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (9, 'Espeletia hartwegiana');
INSERT INTO public.especie (esp_id, esp_nombre) VALUES (10, 'Espeletia pycnophylla');


--
-- TOC entry 2937 (class 0 OID 16404)
-- Dependencies: 200
-- Data for Name: estado_individuo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado_individuo (esi_id, esi_nombre) VALUES (1, 'Muy bueno');
INSERT INTO public.estado_individuo (esi_id, esi_nombre) VALUES (2, 'Bueno');
INSERT INTO public.estado_individuo (esi_id, esi_nombre) VALUES (3, 'Regular');
INSERT INTO public.estado_individuo (esi_id, esi_nombre) VALUES (4, 'Deteriorado');
INSERT INTO public.estado_individuo (esi_id, esi_nombre) VALUES (5, 'Muerto');


--
-- TOC entry 2939 (class 0 OID 16409)
-- Dependencies: 202
-- Data for Name: individuo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (1, 1, '2002-02-10', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (2, 19, '2010-03-10', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (3, 39, '2011-10-09', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (4, 75, '2014-08-05', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (5, 75, '2004-01-07', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (6, 33, '2003-03-02', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (7, 5, '2008-04-11', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (8, 76, '2001-11-10', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (9, 60, '2010-03-08', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (10, 2, '2012-07-07', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (11, 5, '2002-02-04', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (12, 45, '2019-03-07', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (13, 55, '2006-09-08', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (14, 34, '2010-08-04', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (15, 19, '2012-09-09', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (16, 46, '2015-04-05', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (17, 53, '2008-10-07', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (18, 71, '2011-09-08', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (19, 14, '2016-05-11', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (20, 31, '2015-06-03', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (21, 17, '2010-05-08', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (22, 55, '2005-07-03', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (23, 59, '2004-03-06', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (24, 1, '2018-12-07', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (25, 15, '2007-11-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (26, 21, '2019-04-09', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (27, 73, '2017-09-07', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (28, 4, '2012-02-08', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (29, 64, '2010-01-06', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (30, 15, '2003-07-06', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (31, 73, '2018-05-10', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (32, 61, '2008-05-09', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (33, 54, '2016-07-08', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (34, 35, '2011-07-12', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (35, 74, '2011-05-06', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (36, 44, '2001-10-04', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (37, 29, '2015-12-03', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (38, 34, '2010-03-10', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (39, 52, '2017-10-06', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (40, 70, '2009-04-11', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (41, 54, '2004-07-07', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (42, 50, '2004-02-02', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (43, 34, '2013-03-08', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (44, 26, '2004-08-01', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (45, 41, '2010-02-02', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (46, 66, '2013-02-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (47, 33, '2011-01-10', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (48, 52, '2007-03-01', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (49, 29, '2007-10-12', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (50, 60, '2018-01-02', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (51, 78, '2003-10-08', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (52, 36, '2000-04-04', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (53, 37, '2015-02-06', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (54, 39, '2014-11-09', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (55, 55, '2015-06-02', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (56, 33, '2008-08-01', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (57, 47, '2018-08-06', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (58, 38, '2002-07-05', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (59, 7, '2003-05-06', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (60, 46, '2016-11-04', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (61, 8, '2018-05-04', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (62, 54, '2018-02-03', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (63, 21, '2013-09-05', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (64, 11, '2015-09-12', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (65, 61, '2014-04-04', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (66, 41, '2010-05-05', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (67, 4, '2008-10-12', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (68, 17, '2009-11-06', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (69, 72, '2010-11-06', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (70, 1, '2014-04-12', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (71, 60, '2008-03-01', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (72, 22, '2003-12-03', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (73, 53, '2018-01-04', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (74, 50, '2001-10-12', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (75, 60, '2008-04-02', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (76, 14, '2006-06-03', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (77, 73, '2001-10-11', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (78, 13, '2010-12-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (79, 34, '2008-09-03', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (80, 65, '2009-09-08', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (81, 71, '2007-10-07', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (82, 3, '2001-08-06', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (83, 1, '2002-09-10', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (84, 72, '2008-03-08', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (85, 66, '2011-09-02', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (86, 15, '2007-01-02', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (87, 10, '2007-05-10', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (88, 9, '2000-12-09', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (89, 30, '2014-04-01', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (90, 49, '2019-04-02', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (91, 70, '2014-02-10', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (92, 74, '2006-10-12', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (93, 22, '2014-10-05', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (94, 7, '2002-03-06', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (95, 73, '2002-01-02', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (96, 76, '2009-04-03', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (97, 32, '2003-07-12', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (98, 56, '2014-10-05', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (99, 38, '2018-01-11', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (100, 28, '2018-08-03', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (101, 5, '2012-10-11', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (102, 61, '2018-05-04', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (103, 9, '2012-05-06', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (104, 79, '2016-04-04', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (105, 22, '2018-11-09', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (106, 41, '2019-06-04', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (107, 50, '2011-07-01', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (108, 21, '2006-05-05', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (109, 46, '2015-11-10', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (110, 14, '2005-12-07', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (111, 61, '2014-07-03', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (112, 65, '2014-01-09', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (113, 28, '2010-07-01', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (114, 69, '2006-01-02', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (115, 51, '2011-08-11', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (116, 25, '2014-03-12', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (117, 5, '2010-05-11', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (118, 46, '2018-05-11', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (119, 70, '2018-08-04', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (120, 43, '2014-08-01', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (121, 14, '2015-02-06', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (122, 18, '2001-02-03', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (123, 66, '2014-06-08', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (124, 11, '2013-03-06', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (125, 28, '2012-01-07', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (126, 52, '2011-07-08', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (127, 22, '2017-11-08', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (128, 48, '2001-10-05', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (129, 75, '2008-01-08', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (130, 21, '2009-02-08', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (131, 61, '2002-01-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (132, 18, '2002-11-08', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (133, 46, '2007-06-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (134, 31, '2004-08-09', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (135, 24, '2013-04-12', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (136, 77, '2005-11-06', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (137, 76, '2018-03-02', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (138, 35, '2000-02-04', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (139, 41, '2001-04-02', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (140, 73, '2008-05-06', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (141, 65, '2012-03-06', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (142, 45, '2018-09-10', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (143, 5, '2005-07-06', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (144, 30, '2010-08-04', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (145, 13, '2007-08-03', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (146, 46, '2006-05-11', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (147, 37, '2012-09-11', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (148, 41, '2006-11-02', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (149, 61, '2008-12-09', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (150, 33, '2014-06-04', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (151, 61, '2014-05-07', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (152, 62, '2007-11-09', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (153, 24, '2003-05-01', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (154, 67, '2007-04-03', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (155, 9, '2018-07-03', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (156, 30, '2006-01-11', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (157, 39, '2002-04-09', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (158, 27, '2018-10-05', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (159, 56, '2013-06-08', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (160, 68, '2012-10-02', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (161, 16, '2014-07-04', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (162, 57, '2018-08-02', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (163, 45, '2005-06-09', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (164, 58, '2002-01-12', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (165, 59, '2014-02-12', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (166, 60, '2014-03-06', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (167, 25, '2006-03-05', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (168, 12, '2009-07-01', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (169, 74, '2007-04-12', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (170, 43, '2009-02-04', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (171, 8, '2006-12-01', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (172, 18, '2018-05-09', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (173, 42, '2011-10-11', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (174, 48, '2017-08-05', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (175, 46, '2008-06-11', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (176, 15, '2017-12-07', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (177, 7, '2001-08-12', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (178, 38, '2014-07-11', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (179, 52, '2004-10-02', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (180, 62, '2019-11-06', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (181, 26, '2000-06-03', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (182, 71, '2009-01-09', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (183, 56, '2013-05-08', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (184, 55, '2005-09-04', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (185, 53, '2009-03-03', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (186, 54, '2010-04-08', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (187, 21, '2008-02-08', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (188, 12, '2010-12-11', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (189, 18, '2004-11-10', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (190, 31, '2018-06-08', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (191, 73, '2003-11-03', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (192, 1, '2006-02-06', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (193, 55, '2003-01-04', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (194, 26, '2010-05-03', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (195, 22, '2016-03-10', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (196, 63, '2006-06-06', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (197, 74, '2017-10-10', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (198, 5, '2001-07-10', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (199, 14, '2001-06-03', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (200, 25, '2003-12-10', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (201, 4, '2011-06-02', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (202, 28, '2000-03-02', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (203, 36, '2019-04-11', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (204, 66, '2018-09-08', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (205, 64, '2017-10-11', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (206, 30, '2016-01-12', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (207, 19, '2012-08-06', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (208, 5, '2003-10-09', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (209, 77, '2015-01-02', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (210, 77, '2000-03-02', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (211, 41, '2016-08-06', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (212, 46, '2012-03-06', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (213, 44, '2008-09-10', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (214, 12, '2001-02-12', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (215, 4, '2019-07-02', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (216, 59, '2005-06-02', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (217, 14, '2005-08-07', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (218, 53, '2006-04-09', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (219, 78, '2016-05-04', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (220, 63, '2018-04-06', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (221, 61, '2010-11-11', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (222, 61, '2014-10-09', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (223, 8, '2012-11-03', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (224, 49, '2016-12-04', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (225, 51, '2012-04-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (226, 38, '2001-01-04', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (227, 14, '2019-12-09', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (228, 71, '2019-07-05', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (229, 37, '2000-05-04', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (230, 40, '2014-05-06', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (231, 74, '2018-07-09', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (232, 6, '2019-05-09', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (233, 1, '2003-01-05', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (234, 31, '2009-09-08', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (235, 46, '2001-12-05', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (236, 9, '2008-11-11', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (237, 37, '2019-10-07', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (238, 18, '2005-12-12', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (239, 12, '2014-08-08', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (240, 75, '2011-02-04', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (241, 63, '2017-08-07', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (242, 5, '2015-08-09', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (243, 25, '2015-05-10', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (244, 42, '2019-11-03', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (245, 44, '2008-02-03', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (246, 23, '2015-10-01', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (247, 61, '2015-11-08', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (248, 75, '2017-01-09', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (249, 57, '2018-01-04', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (250, 75, '2000-07-09', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (251, 13, '2014-05-03', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (252, 43, '2013-07-09', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (253, 64, '2017-08-09', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (254, 22, '2018-05-04', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (255, 77, '2005-01-02', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (256, 20, '2015-04-08', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (257, 50, '2011-03-07', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (258, 2, '2011-06-12', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (259, 64, '2012-03-03', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (260, 5, '2012-05-11', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (261, 58, '2000-04-06', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (262, 7, '2003-12-03', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (263, 13, '2019-08-05', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (264, 32, '2000-01-12', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (265, 14, '2019-12-10', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (266, 28, '2013-09-09', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (267, 57, '2013-11-03', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (268, 66, '2003-04-03', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (269, 54, '2002-07-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (270, 50, '2005-07-11', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (271, 20, '2007-04-01', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (272, 15, '2019-11-04', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (273, 26, '2009-11-12', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (274, 22, '2010-06-08', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (275, 39, '2013-04-11', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (276, 18, '2019-12-03', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (277, 58, '2001-05-12', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (278, 30, '2018-05-05', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (279, 35, '2007-02-11', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (280, 71, '2002-09-01', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (281, 53, '2014-07-01', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (282, 67, '2017-06-07', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (283, 43, '2012-05-12', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (284, 27, '2001-12-05', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (285, 56, '2011-06-10', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (286, 66, '2012-11-07', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (287, 51, '2018-03-12', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (288, 4, '2007-12-09', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (289, 29, '2004-01-05', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (290, 53, '2008-10-01', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (291, 15, '2015-02-09', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (292, 56, '2016-12-08', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (293, 56, '2015-07-08', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (294, 9, '2014-10-12', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (295, 26, '2013-07-09', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (296, 49, '2008-05-04', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (297, 27, '2009-12-03', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (298, 72, '2004-04-06', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (299, 12, '2008-02-08', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (300, 8, '2014-05-11', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (301, 55, '2019-02-04', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (302, 15, '2008-07-05', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (303, 25, '2012-02-04', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (304, 60, '2007-05-02', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (305, 63, '2007-06-10', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (306, 22, '2009-05-08', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (307, 48, '2006-10-09', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (308, 56, '2014-09-05', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (309, 13, '2009-06-08', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (310, 28, '2010-02-04', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (311, 22, '2013-07-03', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (312, 34, '2009-10-07', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (313, 5, '2006-02-07', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (314, 17, '2014-10-12', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (315, 10, '2018-07-10', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (316, 25, '2000-03-05', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (317, 49, '2018-09-10', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (318, 70, '2015-01-10', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (319, 36, '2015-11-07', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (320, 20, '2019-03-01', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (321, 64, '2015-06-06', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (322, 13, '2013-08-03', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (323, 15, '2006-02-10', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (324, 71, '2005-08-04', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (325, 57, '2013-12-11', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (326, 39, '2014-11-02', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (327, 68, '2011-06-08', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (328, 68, '2002-10-09', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (329, 37, '2001-12-03', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (330, 16, '2006-06-12', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (331, 5, '2007-04-05', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (332, 61, '2014-04-07', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (333, 72, '2002-09-03', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (334, 54, '2011-10-03', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (335, 70, '2015-06-05', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (336, 68, '2002-02-05', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (337, 23, '2013-02-07', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (338, 63, '2001-05-05', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (339, 12, '2012-04-07', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (340, 77, '2018-04-08', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (341, 62, '2003-09-01', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (342, 65, '2009-03-03', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (343, 32, '2013-09-10', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (344, 67, '2000-04-04', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (345, 65, '2003-10-05', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (346, 67, '2016-06-08', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (347, 8, '2012-04-05', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (348, 43, '2008-07-06', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (349, 77, '2015-10-10', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (350, 1, '2009-02-01', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (351, 26, '2005-12-01', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (352, 67, '2006-03-01', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (353, 79, '2000-03-10', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (354, 34, '2015-12-12', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (355, 8, '2013-07-12', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (356, 28, '2015-04-05', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (357, 46, '2018-06-07', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (358, 69, '2013-05-08', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (359, 39, '2009-09-11', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (360, 43, '2007-09-08', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (361, 19, '2007-01-02', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (362, 23, '2018-07-07', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (363, 30, '2005-09-01', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (364, 49, '2001-12-08', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (365, 18, '2005-05-07', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (366, 17, '2003-08-08', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (367, 68, '2016-12-04', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (368, 45, '2005-09-09', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (369, 35, '2011-05-03', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (370, 53, '2017-01-08', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (371, 76, '2001-10-11', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (372, 51, '2008-10-07', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (373, 75, '2002-02-03', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (374, 78, '2014-01-08', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (375, 7, '2010-04-12', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (376, 13, '2012-01-10', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (377, 1, '2000-11-02', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (378, 36, '2006-12-01', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (379, 48, '2000-12-10', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (380, 54, '2003-06-07', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (381, 2, '2011-03-12', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (382, 24, '2013-12-07', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (383, 6, '2013-08-10', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (384, 1, '2017-01-08', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (385, 53, '2000-08-09', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (386, 65, '2016-07-09', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (387, 6, '2013-09-02', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (388, 40, '2014-09-01', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (389, 19, '2019-10-02', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (390, 42, '2016-01-05', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (391, 51, '2017-01-11', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (392, 29, '2019-07-10', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (393, 31, '2018-06-07', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (394, 68, '2014-02-03', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (395, 47, '2013-01-10', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (396, 46, '2006-09-07', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (397, 31, '2008-10-03', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (398, 14, '2002-08-03', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (399, 35, '2010-01-10', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (400, 68, '2002-02-03', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (401, 49, '2014-03-03', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (402, 71, '2014-11-01', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (403, 79, '2004-10-12', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (404, 38, '2009-02-05', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (405, 65, '2008-02-09', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (406, 11, '2000-05-07', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (407, 79, '2014-09-11', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (408, 6, '2017-08-04', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (409, 79, '2004-10-02', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (410, 48, '2017-08-02', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (411, 45, '2007-08-11', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (412, 35, '2008-04-03', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (413, 18, '2019-07-09', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (414, 39, '2009-10-11', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (415, 31, '2019-12-07', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (416, 18, '2006-05-01', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (417, 15, '2011-01-04', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (418, 11, '2016-04-08', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (419, 38, '2014-08-02', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (420, 55, '2019-07-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (421, 72, '2008-01-05', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (422, 51, '2008-12-04', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (423, 26, '2015-02-10', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (424, 46, '2018-11-11', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (425, 6, '2007-06-05', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (426, 10, '2011-11-10', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (427, 49, '2013-06-12', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (428, 66, '2005-09-01', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (429, 28, '2002-07-02', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (430, 4, '2004-08-03', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (431, 52, '2007-10-01', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (432, 64, '2005-03-10', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (433, 77, '2017-02-08', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (434, 12, '2018-09-07', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (435, 54, '2011-02-03', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (436, 41, '2015-08-11', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (437, 45, '2001-11-07', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (438, 41, '2014-09-05', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (439, 76, '2006-05-04', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (440, 51, '2019-03-01', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (441, 67, '2018-02-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (442, 53, '2012-05-06', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (443, 33, '2014-08-04', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (444, 71, '2018-02-07', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (445, 12, '2008-08-08', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (446, 72, '2012-05-09', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (447, 2, '2013-06-01', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (448, 1, '2000-02-12', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (449, 54, '2006-10-06', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (450, 14, '2001-07-11', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (451, 46, '2005-04-04', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (452, 49, '2004-12-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (453, 49, '2014-03-06', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (454, 40, '2001-12-10', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (455, 45, '2006-05-11', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (456, 6, '2009-05-04', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (457, 73, '2009-11-10', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (458, 68, '2004-07-02', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (459, 77, '2007-11-01', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (460, 57, '2003-04-02', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (461, 75, '2019-09-01', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (462, 19, '2008-02-04', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (463, 49, '2004-04-11', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (464, 58, '2009-05-03', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (465, 18, '2019-02-03', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (466, 37, '2011-12-06', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (467, 24, '2006-10-05', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (468, 45, '2005-02-07', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (469, 65, '2007-10-11', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (470, 24, '2003-04-10', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (471, 55, '2004-12-03', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (472, 44, '2006-09-07', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (473, 70, '2007-05-08', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (474, 58, '2018-08-06', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (475, 27, '2009-12-06', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (476, 32, '2011-06-11', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (477, 69, '2019-02-03', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (478, 43, '2019-01-09', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (479, 73, '2004-10-01', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (480, 53, '2001-05-01', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (481, 24, '2019-09-07', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (482, 28, '2018-07-06', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (483, 10, '2001-10-07', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (484, 34, '2018-12-07', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (485, 55, '2017-08-01', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (486, 14, '2017-05-11', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (487, 32, '2018-03-08', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (488, 25, '2008-08-10', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (489, 21, '2003-12-05', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (490, 9, '2015-10-03', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (491, 47, '2015-07-09', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (492, 72, '2005-01-09', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (493, 16, '2006-02-03', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (494, 14, '2016-02-08', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (495, 43, '2002-05-02', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (496, 45, '2013-02-01', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (497, 1, '2018-03-08', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (498, 15, '2011-02-08', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (499, 67, '2007-05-03', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (500, 57, '2007-12-06', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (501, 38, '2005-08-03', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (502, 2, '2005-02-02', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (503, 55, '2017-12-08', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (504, 76, '2002-07-03', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (505, 28, '2012-02-09', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (506, 34, '2015-06-07', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (507, 30, '2013-12-05', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (508, 10, '2016-05-02', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (509, 50, '2001-07-05', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (510, 61, '2015-07-11', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (511, 77, '2003-03-09', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (512, 12, '2019-08-07', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (513, 13, '2007-10-09', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (514, 13, '2018-11-09', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (515, 13, '2009-03-03', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (516, 73, '2009-01-01', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (517, 68, '2004-12-03', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (518, 24, '2017-12-07', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (519, 37, '2009-12-04', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (520, 41, '2007-11-05', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (521, 1, '2018-12-01', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (522, 4, '2011-10-10', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (523, 49, '2005-01-11', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (524, 37, '2016-07-09', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (525, 51, '2018-02-01', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (526, 28, '2017-11-03', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (527, 2, '2007-02-02', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (528, 21, '2009-08-06', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (529, 77, '2006-01-10', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (530, 12, '2011-04-02', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (531, 43, '2005-05-05', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (532, 73, '2010-12-07', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (533, 77, '2006-10-03', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (534, 6, '2002-08-06', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (535, 78, '2013-11-09', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (536, 19, '2000-09-06', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (537, 4, '2005-08-06', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (538, 37, '2016-03-09', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (539, 49, '2019-06-07', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (540, 52, '2003-12-05', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (541, 21, '2019-10-06', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (542, 68, '2008-12-08', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (543, 52, '2004-03-05', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (544, 57, '2000-07-10', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (545, 67, '2013-01-11', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (546, 61, '2012-08-12', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (547, 69, '2019-04-05', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (548, 40, '2013-11-04', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (549, 55, '2016-08-08', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (550, 71, '2007-07-09', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (551, 37, '2002-08-12', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (552, 38, '2009-06-03', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (553, 57, '2017-04-05', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (554, 39, '2014-06-07', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (555, 49, '2000-04-03', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (556, 67, '2005-11-11', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (557, 75, '2017-05-11', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (558, 51, '2018-05-08', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (559, 16, '2013-01-05', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (560, 45, '2003-08-01', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (561, 42, '2014-01-07', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (562, 18, '2000-12-09', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (563, 27, '2004-06-08', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (564, 76, '2019-01-04', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (565, 64, '2015-01-06', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (566, 28, '2002-10-03', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (567, 4, '2002-04-01', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (568, 4, '2014-12-12', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (569, 38, '2000-05-06', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (570, 41, '2001-05-07', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (571, 78, '2009-10-09', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (572, 20, '2019-12-06', 5, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (573, 65, '2002-10-05', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (574, 6, '2018-11-04', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (575, 43, '2005-05-05', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (576, 37, '2017-05-07', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (577, 57, '2008-04-01', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (578, 47, '2014-10-09', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (579, 71, '2010-01-10', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (580, 36, '2008-12-07', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (581, 76, '2012-11-07', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (582, 47, '2001-12-05', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (583, 27, '2000-12-04', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (584, 65, '2016-02-12', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (585, 36, '2005-09-01', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (586, 3, '2010-04-01', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (587, 43, '2011-08-10', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (588, 37, '2002-11-09', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (589, 64, '2012-04-06', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (590, 74, '2005-08-04', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (591, 53, '2003-05-07', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (592, 47, '2014-01-09', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (593, 45, '2012-05-07', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (594, 62, '2017-08-10', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (595, 74, '2010-01-02', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (596, 13, '2015-03-05', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (597, 5, '2010-04-06', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (598, 54, '2019-03-10', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (599, 73, '2001-07-03', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (600, 5, '2002-04-04', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (601, 3, '2009-02-04', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (602, 13, '2011-09-10', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (603, 43, '2011-08-07', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (604, 49, '2005-04-04', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (605, 47, '2009-01-05', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (606, 34, '2014-02-04', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (607, 78, '2004-01-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (608, 1, '2009-08-11', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (609, 12, '2011-07-06', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (610, 43, '2013-09-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (611, 76, '2000-03-01', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (612, 35, '2017-02-07', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (613, 4, '2017-12-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (614, 78, '2001-07-12', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (615, 70, '2001-04-11', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (616, 71, '2003-02-05', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (617, 72, '2001-03-07', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (618, 67, '2015-06-09', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (619, 51, '2005-04-12', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (620, 65, '2010-09-04', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (621, 70, '2018-02-07', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (622, 56, '2001-07-04', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (623, 68, '2018-02-02', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (624, 50, '2009-06-02', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (625, 41, '2003-11-09', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (626, 47, '2000-12-03', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (627, 53, '2012-08-10', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (628, 18, '2015-02-09', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (629, 30, '2014-02-12', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (630, 45, '2012-12-01', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (631, 61, '2001-04-03', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (632, 66, '2018-10-01', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (633, 54, '2008-08-04', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (634, 23, '2018-03-01', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (635, 62, '2006-10-01', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (636, 3, '2014-07-07', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (637, 53, '2006-06-12', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (638, 72, '2016-02-12', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (639, 11, '2004-07-04', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (640, 54, '2015-01-05', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (641, 13, '2016-09-10', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (642, 35, '2001-12-11', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (643, 49, '2006-02-09', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (644, 26, '2019-01-07', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (645, 4, '2012-06-04', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (646, 47, '2001-07-07', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (647, 58, '2017-07-01', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (648, 46, '2009-06-10', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (649, 72, '2015-02-05', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (650, 50, '2002-09-09', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (651, 40, '2003-08-12', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (652, 19, '2002-07-03', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (653, 55, '2014-05-07', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (654, 13, '2006-12-10', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (655, 2, '2010-02-07', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (656, 70, '2016-11-05', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (657, 4, '2003-01-08', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (658, 20, '2016-08-03', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (659, 3, '2012-03-10', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (660, 18, '2008-11-04', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (661, 7, '2008-12-07', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (662, 35, '2010-04-05', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (663, 46, '2012-09-08', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (664, 24, '2009-10-07', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (665, 40, '2006-06-02', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (666, 51, '2017-12-05', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (667, 62, '2008-09-08', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (668, 9, '2016-06-07', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (669, 31, '2011-08-11', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (670, 73, '2015-07-03', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (671, 31, '2012-02-07', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (672, 43, '2016-11-09', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (673, 77, '2000-01-02', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (674, 41, '2018-04-08', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (675, 24, '2017-01-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (676, 10, '2005-10-09', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (677, 41, '2015-05-10', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (678, 60, '2004-01-02', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (679, 41, '2000-05-10', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (680, 55, '2007-08-09', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (681, 12, '2016-06-02', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (682, 3, '2011-06-08', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (683, 57, '2008-07-06', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (684, 46, '2004-10-05', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (685, 66, '2001-02-01', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (686, 17, '2018-09-09', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (687, 63, '2017-09-12', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (688, 67, '2008-12-05', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (689, 53, '2010-05-08', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (690, 2, '2017-06-06', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (691, 38, '2013-05-01', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (692, 71, '2001-02-03', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (693, 47, '2005-08-03', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (694, 26, '2009-01-11', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (695, 55, '2010-06-01', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (696, 64, '2002-04-09', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (697, 10, '2001-07-11', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (698, 1, '2009-04-03', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (699, 29, '2018-05-02', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (700, 30, '2008-04-02', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (701, 49, '2003-06-10', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (702, 21, '2013-06-12', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (703, 25, '2013-09-02', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (704, 62, '2002-06-05', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (705, 2, '2011-04-08', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (706, 49, '2001-03-11', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (707, 28, '2001-03-01', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (708, 46, '2001-01-05', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (709, 12, '2007-04-11', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (710, 28, '2013-08-02', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (711, 46, '2015-08-03', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (712, 39, '2001-05-03', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (713, 65, '2005-11-10', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (714, 77, '2015-05-04', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (715, 2, '2008-01-08', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (716, 59, '2012-03-05', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (717, 47, '2013-07-11', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (718, 32, '2006-02-12', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (719, 75, '2013-01-04', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (720, 31, '2008-07-01', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (721, 11, '2002-03-04', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (722, 69, '2008-11-07', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (723, 36, '2002-05-05', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (724, 42, '2018-10-11', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (725, 2, '2013-08-11', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (726, 20, '2014-11-04', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (727, 74, '2012-07-10', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (728, 24, '2018-06-11', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (729, 61, '2014-11-05', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (730, 49, '2015-10-05', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (731, 69, '2018-07-06', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (732, 28, '2006-09-03', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (733, 79, '2013-05-04', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (734, 46, '2009-09-03', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (735, 73, '2000-04-09', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (736, 5, '2000-09-02', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (737, 41, '2006-07-08', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (738, 3, '2014-10-07', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (739, 58, '2008-08-01', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (740, 40, '2000-11-03', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (741, 19, '2002-02-07', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (742, 30, '2013-12-07', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (743, 44, '2007-12-03', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (744, 43, '2008-03-03', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (745, 68, '2009-12-04', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (746, 33, '2007-11-10', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (747, 12, '2011-01-02', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (748, 44, '2009-04-04', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (749, 40, '2009-03-03', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (750, 25, '2010-03-12', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (751, 20, '2004-11-11', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (752, 79, '2004-06-08', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (753, 26, '2012-08-08', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (754, 35, '2009-06-03', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (755, 20, '2000-05-02', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (756, 32, '2003-07-08', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (757, 50, '2009-08-06', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (758, 40, '2015-05-02', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (759, 4, '2001-02-10', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (760, 23, '2004-01-09', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (761, 30, '2009-05-07', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (762, 16, '2011-11-05', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (763, 56, '2011-07-06', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (764, 35, '2003-04-10', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (765, 54, '2006-02-07', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (766, 68, '2002-12-10', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (767, 39, '2018-10-10', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (768, 13, '2005-04-09', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (769, 7, '2011-09-12', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (770, 30, '2005-01-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (771, 34, '2016-07-05', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (772, 76, '2006-02-09', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (773, 33, '2019-10-03', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (774, 77, '2014-11-03', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (775, 44, '2008-08-10', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (776, 22, '2012-05-01', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (777, 35, '2010-02-09', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (778, 48, '2014-03-02', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (779, 62, '2007-12-03', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (780, 74, '2013-09-08', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (781, 56, '2010-09-07', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (782, 14, '2012-05-03', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (783, 20, '2016-07-05', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (784, 79, '2006-08-10', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (785, 58, '2010-12-11', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (786, 53, '2019-11-10', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (787, 51, '2018-01-12', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (788, 63, '2001-11-09', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (789, 75, '2002-02-04', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (790, 67, '2002-05-05', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (791, 74, '2006-12-12', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (792, 79, '2004-02-09', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (793, 65, '2008-07-07', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (794, 9, '2008-01-02', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (795, 41, '2015-04-09', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (796, 51, '2018-06-11', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (797, 35, '2002-03-03', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (798, 30, '2014-04-12', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (799, 33, '2000-04-09', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (800, 38, '2016-02-04', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (801, 38, '2018-01-10', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (802, 1, '2001-06-11', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (803, 66, '2019-07-07', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (804, 15, '2017-04-02', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (805, 16, '2018-03-12', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (806, 18, '2008-11-04', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (807, 33, '2015-11-06', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (808, 62, '2005-05-11', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (809, 10, '2008-06-05', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (810, 15, '2013-09-06', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (811, 18, '2004-05-05', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (812, 60, '2005-12-08', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (813, 37, '2014-12-07', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (814, 45, '2013-04-12', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (815, 52, '2000-12-07', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (816, 45, '2002-02-11', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (817, 64, '2018-11-10', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (818, 3, '2014-11-10', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (819, 63, '2016-04-12', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (820, 29, '2003-12-06', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (821, 44, '2014-08-08', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (822, 69, '2007-07-10', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (823, 20, '2005-03-02', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (824, 63, '2016-06-05', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (825, 13, '2019-07-09', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (826, 32, '2003-06-12', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (827, 1, '2013-08-01', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (828, 38, '2005-08-06', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (829, 33, '2005-02-03', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (830, 19, '2017-05-02', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (831, 54, '2010-10-06', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (832, 62, '2008-08-01', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (833, 42, '2002-12-02', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (834, 34, '2019-10-08', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (835, 7, '2009-10-09', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (836, 27, '2017-10-10', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (837, 64, '2008-07-06', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (838, 37, '2001-05-01', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (839, 6, '2006-06-12', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (840, 34, '2019-06-02', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (841, 15, '2014-01-08', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (842, 65, '2005-05-05', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (843, 19, '2011-10-02', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (844, 22, '2014-02-08', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (845, 55, '2016-05-06', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (846, 12, '2011-04-07', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (847, 15, '2015-10-09', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (848, 18, '2014-07-02', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (849, 18, '2014-11-05', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (850, 19, '2010-08-01', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (851, 1, '2005-08-12', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (852, 17, '2016-02-04', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (853, 19, '2002-06-05', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (854, 72, '2001-09-12', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (855, 6, '2015-04-12', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (856, 23, '2004-12-01', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (857, 65, '2015-11-02', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (858, 20, '2014-09-09', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (859, 53, '2011-01-07', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (860, 7, '2001-01-05', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (861, 38, '2004-07-12', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (862, 12, '2017-11-07', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (863, 65, '2004-10-04', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (864, 73, '2010-06-11', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (865, 7, '2006-01-05', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (866, 46, '2006-04-12', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (867, 36, '2007-02-10', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (868, 6, '2011-01-05', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (869, 40, '2009-01-07', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (870, 65, '2015-01-03', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (871, 4, '2019-08-06', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (872, 56, '2007-02-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (873, 52, '2015-11-05', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (874, 51, '2004-05-06', 1, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (875, 21, '2018-04-09', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (876, 15, '2004-12-05', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (877, 19, '2000-03-09', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (878, 13, '2013-07-03', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (879, 30, '2009-09-02', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (880, 59, '2012-01-10', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (881, 44, '2007-08-09', 4, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (882, 67, '2012-08-11', 5, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (883, 26, '2000-04-10', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (884, 51, '2019-08-11', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (885, 3, '2004-09-09', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (886, 65, '2005-05-04', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (887, 30, '2015-07-08', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (888, 26, '2009-11-07', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (889, 33, '2001-03-07', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (890, 60, '2008-12-10', 1, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (891, 74, '2019-12-10', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (892, 5, '2007-06-11', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (893, 25, '2011-11-09', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (894, 35, '2015-11-06', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (895, 55, '2007-04-07', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (896, 54, '2018-02-01', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (897, 64, '2006-02-11', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (898, 18, '2010-08-12', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (899, 50, '2019-04-07', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (900, 55, '2002-02-11', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (901, 25, '2006-10-10', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (902, 79, '2004-07-03', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (903, 44, '2018-06-03', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (904, 55, '2012-09-08', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (905, 62, '2019-04-01', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (906, 42, '2019-11-03', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (907, 47, '2005-09-09', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (908, 13, '2010-12-01', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (909, 54, '2005-09-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (910, 26, '2012-09-08', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (911, 38, '2008-02-06', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (912, 71, '2015-07-11', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (913, 1, '2019-01-01', 3, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (914, 19, '2005-09-07', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (915, 52, '2011-08-11', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (916, 29, '2005-02-05', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (917, 4, '2010-10-02', 3, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (918, 5, '2002-02-12', 3, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (919, 2, '2000-10-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (920, 32, '2007-02-06', 2, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (921, 16, '2015-02-06', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (922, 67, '2016-11-03', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (923, 59, '2006-01-02', 5, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (924, 5, '2003-02-01', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (925, 66, '2006-12-05', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (926, 51, '2016-04-02', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (927, 31, '2000-02-02', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (928, 4, '2012-07-08', 4, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (929, 65, '2007-01-01', 4, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (930, 69, '2010-04-07', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (931, 63, '2016-08-09', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (932, 68, '2012-08-07', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (933, 35, '2006-12-11', 1, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (934, 65, '2019-07-06', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (935, 68, '2013-01-05', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (936, 23, '2010-06-11', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (937, 70, '2008-11-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (938, 16, '2010-06-10', 5, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (939, 37, '2005-07-10', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (940, 57, '2003-05-02', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (941, 24, '2002-02-04', 1, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (942, 59, '2008-12-03', 4, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (943, 39, '2004-08-01', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (944, 18, '2004-11-08', 1, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (945, 50, '2016-11-06', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (946, 17, '2016-02-07', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (947, 43, '2000-07-07', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (948, 1, '2007-03-11', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (949, 21, '2002-11-04', 5, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (950, 51, '2018-03-03', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (951, 58, '2010-06-06', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (952, 41, '2007-07-01', 1, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (953, 40, '2018-09-11', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (954, 74, '2004-09-05', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (955, 60, '2016-07-04', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (956, 28, '2014-01-07', 2, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (957, 74, '2008-11-07', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (958, 44, '2018-01-12', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (959, 65, '2012-07-02', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (960, 53, '2013-12-11', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (961, 62, '2011-03-04', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (962, 45, '2003-08-03', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (963, 41, '2019-05-04', 3, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (964, 28, '2010-12-11', 2, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (965, 3, '2005-06-08', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (966, 36, '2018-10-06', 4, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (967, 52, '2015-06-06', 2, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (968, 52, '2019-01-10', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (969, 21, '2004-05-02', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (970, 35, '2015-12-04', 5, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (971, 17, '2009-08-07', 2, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (972, 78, '2016-11-10', 4, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (973, 24, '2012-11-04', 3, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (974, 60, '2017-12-12', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (975, 73, '2012-02-08', 2, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (976, 2, '2018-06-06', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (977, 45, '2000-01-05', 3, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (978, 22, '2017-10-11', 4, 7);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (979, 68, '2001-03-07', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (980, 5, '2012-02-07', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (981, 45, '2003-08-01', 2, 3);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (982, 32, '2019-07-03', 5, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (983, 3, '2003-07-07', 5, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (984, 79, '2001-02-05', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (985, 29, '2000-03-03', 3, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (986, 72, '2007-07-06', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (987, 11, '2016-09-03', 1, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (988, 20, '2011-06-08', 5, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (989, 34, '2010-08-02', 4, 2);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (990, 29, '2000-03-04', 3, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (991, 13, '2009-10-03', 2, 6);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (992, 10, '2007-08-03', 2, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (993, 75, '2015-03-09', 1, 10);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (994, 72, '2000-08-09', 4, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (995, 13, '2007-11-04', 3, 1);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (996, 65, '2018-07-02', 1, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (997, 79, '2013-10-07', 5, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (998, 40, '2019-12-01', 2, 9);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (999, 77, '2015-02-08', 1, 5);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (1000, 44, '2012-05-07', 4, 4);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (1001, 64, '2012-01-01', 3, 8);
INSERT INTO public.individuo (ind_id, mxp_id, ind_fecha, esi_id, usu_id) VALUES (1002, 6, '2006-04-07', 5, 2);


--
-- TOC entry 2941 (class 0 OID 16414)
-- Dependencies: 204
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (5, 'LETICIA', 1, '91001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1, 'EL ENCANTO', 1, '91263');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (2, 'LA CHORRERA', 1, '91405');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (3, 'LA PEDRERA', 1, '91407');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (4, 'LA VICTORIA', 1, '91430');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (6, 'MIRITI-PARANÁ', 1, '91460');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (7, 'PUERTO ALEGRÍA', 1, '91530');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (8, 'PUERTO ARICA', 1, '91536');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (9, 'PUERTO NARIÑO', 1, '91540');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (10, 'PUERTO SANTANDER', 1, '91669');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (11, 'TARAPACÁ', 1, '91798');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (12, 'ABEJORRAL', 2, '05002');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (13, 'ABRIAQUÍ', 2, '05004');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (14, 'ALEJANDRÍA', 2, '05021');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (15, 'AMAGÁ', 2, '05030');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (16, 'AMALFI', 2, '05031');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (17, 'ANDES', 2, '05034');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (18, 'ANGELÓPOLIS', 2, '05036');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (19, 'ANGOSTURA', 2, '05038');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (20, 'ANORÍ', 2, '05040');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (21, 'ANZA', 2, '05044');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (22, 'APARTADÓ', 2, '05045');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (23, 'ARBOLETES', 2, '05051');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (24, 'ARGELIA', 2, '05055');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (25, 'ARMENIA', 2, '05059');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (26, 'BARBOSA', 2, '05079');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (27, 'BELLO', 2, '05088');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (28, 'BELMIRA', 2, '05086');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (29, 'BETANIA', 2, '05091');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (30, 'BETULIA', 2, '05093');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (31, 'BRICEÑO', 2, '05107');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (32, 'BURITICÁ', 2, '05113');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (33, 'CÁCERES', 2, '05120');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (34, 'CAICEDO', 2, '05125');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (35, 'CALDAS', 2, '05129');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (36, 'CAMPAMENTO', 2, '05134');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (37, 'CAÑASGORDAS', 2, '05138');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (38, 'CARACOLÍ', 2, '05142');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (39, 'CARAMANTA', 2, '05145');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (40, 'CAREPA', 2, '05147');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (41, 'CAROLINA', 2, '05150');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (42, 'CAUCASIA', 2, '05154');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (43, 'CHIGORODÓ', 2, '05172');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (44, 'CISNEROS', 2, '05190');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (45, 'CIUDAD BOLÍVAR', 2, '05101');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (46, 'COCORNÁ', 2, '05197');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (47, 'CONCEPCIÓN', 2, '05206');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (48, 'CONCORDIA', 2, '05209');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (49, 'COPACABANA', 2, '05212');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (50, 'DABEIBA', 2, '05234');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (51, 'DON MATÍAS', 2, '05237');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (52, 'EBÉJICO', 2, '05240');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (53, 'EL BAGRE', 2, '05250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (54, 'EL CARMEN DE VIBORAL', 2, '05148');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (55, 'EL SANTUARIO', 2, '05697');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (56, 'ENTRERRIOS', 2, '05264');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (57, 'ENVIGADO', 2, '05266');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (58, 'FREDONIA', 2, '05282');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (59, 'FRONTINO', 2, '05284');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (60, 'GIRALDO', 2, '05306');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (61, 'GIRARDOTA', 2, '05308');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (62, 'GÓMEZ PLATA', 2, '05310');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (63, 'GRANADA', 2, '05313');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (64, 'GUADALUPE', 2, '05315');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (65, 'GUARNE', 2, '05318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (66, 'GUATAPE', 2, '05321');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (67, 'HELICONIA', 2, '05347');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (68, 'HISPANIA', 2, '05353');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (69, 'ITAGUI', 2, '05360');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (70, 'ITUANGO', 2, '05361');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (71, 'JARDÍN', 2, '05364');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (72, 'JERICÓ', 2, '05368');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (73, 'LA CEJA', 2, '05376');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (74, 'LA ESTRELLA', 2, '05380');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (75, 'LA PINTADA', 2, '05390');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (76, 'LA UNIÓN', 2, '05400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (77, 'LIBORINA', 2, '05411');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (78, 'MACEO', 2, '05425');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (79, 'MARINILLA', 2, '05440');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (80, 'MEDELLÍN', 2, '05001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (81, 'MONTEBELLO', 2, '05467');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (82, 'MURINDÓ', 2, '05475');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (83, 'MUTATÁ', 2, '05480');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (84, 'NARIÑO', 2, '05483');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (85, 'NECHÍ', 2, '05495');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (86, 'NECOCLÍ', 2, '05490');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (87, 'OLAYA', 2, '05501');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (88, 'PEÑOL', 2, '05541');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (89, 'PEQUE', 2, '05543');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (90, 'PUEBLORRICO', 2, '05576');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (91, 'PUERTO BERRÍO', 2, '05579');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (92, 'PUERTO NARE', 2, '05585');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (93, 'PUERTO TRIUNFO', 2, '05591');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (94, 'REMEDIOS', 2, '05604');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (95, 'RETIRO', 2, '05607');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (96, 'RIONEGRO', 2, '05615');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (97, 'SABANALARGA', 2, '05628');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (98, 'SABANETA', 2, '05631');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (99, 'SALGAR', 2, '05642');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (100, 'SAN ANDRÉS DE CUERQUÍA', 2, '05647');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (101, 'SAN CARLOS', 2, '05649');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (102, 'SAN FRANCISCO', 2, '05652');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (103, 'SAN JERÓNIMO', 2, '05656');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (104, 'SAN JOSÉ DE LA MONTAÑA', 2, '05658');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (105, 'SAN JUAN DE URABÁ', 2, '05659');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (106, 'SAN LUIS', 2, '05660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (107, 'SAN PEDRO DE LOS MILAGROS', 2, '05664');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (108, 'SAN PEDRO DE URABA', 2, '05665');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (109, 'SAN RAFAEL', 2, '05667');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (110, 'SAN ROQUE', 2, '05670');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (111, 'SAN VICENTE', 2, '05674');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (112, 'SANTA BÁRBARA', 2, '05679');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (113, 'SANTA ROSA DE OSOS', 2, '05686');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (114, 'SANTAFÉ DE ANTIOQUIA', 2, '05042');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (115, 'SANTO DOMINGO', 2, '05690');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (116, 'SEGOVIA', 2, '05736');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (117, 'SONSON', 2, '05756');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (118, 'SOPETRÁN', 2, '05761');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (119, 'TÁMESIS', 2, '05789');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (120, 'TARAZÁ', 2, '05790');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (121, 'TARSO', 2, '05792');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (122, 'TITIRIBÍ', 2, '05809');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (123, 'TOLEDO', 2, '05819');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (124, 'TURBO', 2, '05837');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (125, 'URAMITA', 2, '05842');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (126, 'URRAO', 2, '05847');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (127, 'VALDIVIA', 2, '05854');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (128, 'VALPARAÍSO', 2, '05856');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (129, 'VEGACHÍ', 2, '05858');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (130, 'VENECIA', 2, '05861');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (131, 'VIGÍA DEL FUERTE', 2, '05873');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (132, 'YALÍ', 2, '05885');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (133, 'YARUMAL', 2, '05887');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (134, 'YOLOMBÓ', 2, '05890');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (135, 'YONDÓ', 2, '05893');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (136, 'ZARAGOZA', 2, '05895');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (137, 'ARAUCA', 3, '81001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (138, 'ARAUQUITA', 3, '81065');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (139, 'CRAVO NORTE', 3, '81220');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (140, 'FORTUL', 3, '81300');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (141, 'PUERTO RONDÓN', 3, '81591');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (142, 'SARAVENA', 3, '81736');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (143, 'TAME', 3, '81794');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (144, 'PROVIDENCIA', 4, '88564');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (145, 'SAN ANDRÉS', 4, '88001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (146, 'BARANOA', 5, '08078');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (147, 'BARRANQUILLA', 5, '08001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (148, 'CAMPO DE LA CRUZ', 5, '08137');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (149, 'CANDELARIA', 5, '08141');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (150, 'GALAPA', 5, '08296');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (151, 'JUAN DE ACOSTA', 5, '08372');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (152, 'LURUACO', 5, '08421');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (153, 'MALAMBO', 5, '08433');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (154, 'MANATÍ', 5, '08436');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (155, 'PALMAR DE VARELA', 5, '08520');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (156, 'PIOJÓ', 5, '08549');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (157, 'POLONUEVO', 5, '08558');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (158, 'PONEDERA', 5, '08560');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (159, 'PUERTO COLOMBIA', 5, '08573');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (160, 'REPELÓN', 5, '08606');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (161, 'SABANAGRANDE', 5, '08634');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (162, 'SABANALARGA', 5, '08638');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (163, 'SANTA LUCÍA', 5, '08675');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (164, 'SANTO TOMÁS', 5, '08685');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (165, 'SOLEDAD', 5, '08758');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (166, 'SUAN', 5, '08770');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (167, 'TUBARÁ', 5, '08832');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (168, 'USIACURÍ', 5, '08849');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (169, 'BOGOTÁ, D.C.', 6, '11001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (170, 'ACHÍ', 7, '13006');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (171, 'ALTOS DEL ROSARIO', 7, '13030');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (172, 'ARENAL', 7, '13042');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (173, 'ARJONA', 7, '13052');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (174, 'ARROYOHONDO', 7, '13062');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (175, 'BARRANCO DE LOBA', 7, '13074');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (176, 'CALAMAR', 7, '13140');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (177, 'CANTAGALLO', 7, '13160');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (178, 'CARTAGENA', 7, '13001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (179, 'CICUCO', 7, '13188');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (180, 'CLEMENCIA', 7, '13222');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (181, 'CÓRDOBA', 7, '13212');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (182, 'EL CARMEN DE BOLÍVAR', 7, '13244');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (183, 'EL GUAMO', 7, '13248');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (184, 'EL PEÑÓN', 7, '13268');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (185, 'HATILLO DE LOBA', 7, '13300');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (186, 'MAGANGUÉ', 7, '13430');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (187, 'MAHATES', 7, '13433');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (188, 'MARGARITA', 7, '13440');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (189, 'MARÍA LA BAJA', 7, '13442');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (190, 'MOMPÓS', 7, '13468');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (191, 'MONTECRISTO', 7, '13458');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (192, 'MORALES', 7, '13473');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (193, 'PINILLOS', 7, '13549');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (194, 'REGIDOR', 7, '13580');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (195, 'RÍO VIEJO', 7, '13600');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (196, 'SAN CRISTÓBAL', 7, '13620');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (197, 'SAN ESTANISLAO', 7, '13647');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (198, 'SAN FERNANDO', 7, '13650');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (199, 'SAN JACINTO', 7, '13654');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (200, 'SAN JACINTO DEL CAUCA', 7, '13655');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (201, 'SAN JUAN NEPOMUCENO', 7, '13657');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (202, 'SAN MARTÍN DE LOBA', 7, '13667');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (203, 'SAN PABLO', 7, '13670');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (204, 'SANTA CATALINA', 7, '13673');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (205, 'SANTA ROSA', 7, '13683');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (206, 'SANTA ROSA DEL SUR', 7, '13688');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (207, 'SIMITÍ', 7, '13744');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (208, 'SOPLAVIENTO', 7, '13760');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (209, 'TALAIGUA NUEVO', 7, '13780');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (210, 'TIQUISIO', 7, '13810');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (211, 'TURBACO', 7, '13836');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (212, 'TURBANÁ', 7, '13838');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (213, 'VILLANUEVA', 7, '13873');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (214, 'ZAMBRANO', 7, '13894');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (215, 'ALMEIDA', 8, '15022');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (216, 'AQUITANIA', 8, '15047');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (217, 'ARCABUCO', 8, '15051');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (218, 'BELÉN', 8, '15087');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (219, 'BERBEO', 8, '15090');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (220, 'BETÉITIVA', 8, '15092');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (221, 'BOAVITA', 8, '15097');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (222, 'BOYACÁ', 8, '15104');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (223, 'BRICEÑO', 8, '15106');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (224, 'BUENAVISTA', 8, '15109');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (225, 'BUSBANZÁ', 8, '15114');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (226, 'CALDAS', 8, '15131');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (227, 'CAMPOHERMOSO', 8, '15135');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (228, 'CERINZA', 8, '15162');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (229, 'CHINAVITA', 8, '15172');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (230, 'CHIQUINQUIRÁ', 8, '15176');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (231, 'CHÍQUIZA', 8, '15232');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (232, 'CHISCAS', 8, '15180');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (233, 'CHITA', 8, '15183');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (234, 'CHITARAQUE', 8, '15185');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (235, 'CHIVATÁ', 8, '15187');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (236, 'CHIVOR', 8, '15236');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (237, 'CIÉNEGA', 8, '15189');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (238, 'CÓMBITA', 8, '15204');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (239, 'COPER', 8, '15212');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (240, 'CORRALES', 8, '15215');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (241, 'COVARACHÍA', 8, '15218');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (242, 'CUBARÁ', 8, '15223');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (243, 'CUCAITA', 8, '15224');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (244, 'CUÍTIVA', 8, '15226');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (245, 'DUITAMA', 8, '15238');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (246, 'EL COCUY', 8, '15244');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (247, 'EL ESPINO', 8, '15248');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (248, 'FIRAVITOBA', 8, '15272');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (249, 'FLORESTA', 8, '15276');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (250, 'GACHANTIVÁ', 8, '15293');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (251, 'GAMEZA', 8, '15296');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (252, 'GARAGOA', 8, '15299');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (253, 'GUACAMAYAS', 8, '15317');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (254, 'GUATEQUE', 8, '15322');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (255, 'GUAYATÁ', 8, '15325');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (256, 'GÜICÁN', 8, '15332');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (257, 'IZA', 8, '15362');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (258, 'JENESANO', 8, '15367');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (259, 'JERICÓ', 8, '15368');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (260, 'LA CAPILLA', 8, '15380');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (261, 'LA UVITA', 8, '15403');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (262, 'LA VICTORIA', 8, '15401');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (263, 'LABRANZAGRANDE', 8, '15377');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (264, 'MACANAL', 8, '15425');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (265, 'MARIPÍ', 8, '15442');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (266, 'MIRAFLORES', 8, '15455');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (267, 'MONGUA', 8, '15464');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (268, 'MONGUÍ', 8, '15466');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (269, 'MONIQUIRÁ', 8, '15469');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (270, 'MOTAVITA', 8, '15476');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (271, 'MUZO', 8, '15480');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (272, 'NOBSA', 8, '15491');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (273, 'NUEVO COLÓN', 8, '15494');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (274, 'OICATÁ', 8, '15500');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (275, 'OTANCHE', 8, '15507');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (276, 'PACHAVITA', 8, '15511');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (277, 'PÁEZ', 8, '15514');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (278, 'PAIPA', 8, '15516');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (279, 'PAJARITO', 8, '15518');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (280, 'PANQUEBA', 8, '15522');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (281, 'PAUNA', 8, '15531');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (282, 'PAYA', 8, '15533');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (283, 'PAZ DE RÍO', 8, '15537');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (284, 'PESCA', 8, '15542');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (285, 'PISBA', 8, '15550');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (286, 'PUERTO BOYACÁ', 8, '15572');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (287, 'QUÍPAMA', 8, '15580');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (288, 'RAMIRIQUÍ', 8, '15599');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (289, 'RÁQUIRA', 8, '15600');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (290, 'RONDÓN', 8, '15621');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (291, 'SABOYÁ', 8, '15632');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (292, 'SÁCHICA', 8, '15638');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (293, 'SAMACÁ', 8, '15646');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (294, 'SAN EDUARDO', 8, '15660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (295, 'SAN JOSÉ DE PARE', 8, '15664');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (296, 'SAN LUIS DE GACENO', 8, '15667');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (297, 'SAN MATEO', 8, '15673');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (298, 'SAN MIGUEL DE SEMA', 8, '15676');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (299, 'SAN PABLO DE BORBUR', 8, '15681');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (300, 'SANTA MARÍA', 8, '15690');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (301, 'SANTA ROSA DE VITERBO', 8, '15693');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (302, 'SANTA SOFÍA', 8, '15696');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (303, 'SANTANA', 8, '15686');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (304, 'SATIVANORTE', 8, '15720');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (305, 'SATIVASUR', 8, '15723');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (306, 'SIACHOQUE', 8, '15740');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (307, 'SOATÁ', 8, '15753');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (308, 'SOCHA', 8, '15757');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (309, 'SOCOTÁ', 8, '15755');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (310, 'SOGAMOSO', 8, '15759');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (311, 'SOMONDOCO', 8, '15761');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (312, 'SORA', 8, '15762');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (313, 'SORACÁ', 8, '15764');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (314, 'SOTAQUIRÁ', 8, '15763');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (315, 'SUSACÓN', 8, '15774');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (316, 'SUTAMARCHÁN', 8, '15776');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (317, 'SUTATENZA', 8, '15778');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (318, 'TASCO', 8, '15790');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (319, 'TENZA', 8, '15798');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (320, 'TIBANÁ', 8, '15804');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (321, 'TIBASOSA', 8, '15806');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (322, 'TINJACÁ', 8, '15808');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (323, 'TIPACOQUE', 8, '15810');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (324, 'TOCA', 8, '15814');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (325, 'TOGÜÍ', 8, '15816');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (326, 'TÓPAGA', 8, '15820');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (327, 'TOTA', 8, '15822');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (328, 'TUNJA', 8, '15001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (329, 'TUNUNGUÁ', 8, '15832');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (330, 'TURMEQUÉ', 8, '15835');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (331, 'TUTA', 8, '15837');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (332, 'TUTAZÁ', 8, '15839');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (333, 'UMBITA', 8, '15842');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (334, 'VENTAQUEMADA', 8, '15861');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (335, 'VILLA DE LEYVA', 8, '15407');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (336, 'VIRACACHÁ', 8, '15879');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (337, 'ZETAQUIRA', 8, '15897');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (338, 'AGUADAS', 9, '17013');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (339, 'ANSERMA', 9, '17042');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (340, 'ARANZAZU', 9, '17050');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (341, 'BELALCÁZAR', 9, '17088');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (342, 'CHINCHINÁ', 9, '17174');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (343, 'FILADELFIA', 9, '17272');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (344, 'LA DORADA', 9, '17380');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (345, 'LA MERCED', 9, '17388');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (346, 'MANIZALES', 9, '17001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (347, 'MANZANARES', 9, '17433');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (348, 'MARMATO', 9, '17442');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (349, 'MARQUETALIA', 9, '17444');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (350, 'MARULANDA', 9, '17446');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (351, 'NEIRA', 9, '17486');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (352, 'NORCASIA', 9, '17495');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (353, 'PÁCORA', 9, '17513');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (354, 'PALESTINA', 9, '17524');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (355, 'PENSILVANIA', 9, '17541');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (356, 'RIOSUCIO', 9, '17614');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (357, 'RISARALDA', 9, '17616');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (358, 'SALAMINA', 9, '17653');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (359, 'SAMANÁ', 9, '17662');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (360, 'SAN JOSÉ', 9, '17665');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (361, 'SUPÍA', 9, '17777');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (362, 'VICTORIA', 9, '17867');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (363, 'VILLAMARÍA', 9, '17873');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (364, 'VITERBO', 9, '17877');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (365, 'ALBANIA', 10, '18029');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (366, 'BELÉN DE LOS ANDAQUÍES', 10, '18094');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (367, 'CARTAGENA DEL CHAIRÁ', 10, '18150');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (368, 'CURILLO', 10, '18205');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (369, 'EL DONCELLO', 10, '18247');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (370, 'EL PAUJIL', 10, '18256');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (371, 'FLORENCIA', 10, '18001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (372, 'LA MONTAÑITA', 10, '18410');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (373, 'MILÁN', 10, '18460');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (374, 'MORELIA', 10, '18479');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (375, 'PUERTO RICO', 10, '18592');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (376, 'SAN JOSÉ DEL FRAGUA', 10, '18610');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (377, 'SAN VICENTE DEL CAGUÁN', 10, '18753');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (378, 'SOLANO', 10, '18756');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (379, 'SOLITA', 10, '18785');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (380, 'VALPARAÍSO', 10, '18860');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (381, 'AGUAZUL', 11, '85010');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (382, 'CHAMEZA', 11, '85015');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (383, 'HATO COROZAL', 11, '85125');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (384, 'LA SALINA', 11, '85136');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (385, 'MANÍ', 11, '85139');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (386, 'MONTERREY', 11, '85162');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (387, 'NUNCHÍA', 11, '85225');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (388, 'OROCUÉ', 11, '85230');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (389, 'PAZ DE ARIPORO', 11, '85250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (390, 'PORE', 11, '85263');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (391, 'RECETOR', 11, '85279');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (392, 'SABANALARGA', 11, '85300');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (393, 'SÁCAMA', 11, '85315');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (394, 'SAN LUIS DE PALENQUE', 11, '85325');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (395, 'TÁMARA', 11, '85400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (396, 'TAURAMENA', 11, '85410');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (397, 'TRINIDAD', 11, '85430');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (398, 'VILLANUEVA', 11, '85440');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (399, 'YOPAL', 11, '85001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (400, 'ALMAGUER', 12, '19022');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (401, 'ARGELIA', 12, '19050');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (402, 'BALBOA', 12, '19075');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (403, 'BOLÍVAR', 12, '19100');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (404, 'BUENOS AIRES', 12, '19110');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (405, 'CAJIBÍO', 12, '19130');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (406, 'CALDONO', 12, '19137');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (407, 'CALOTO', 12, '19142');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (408, 'CORINTO', 12, '19212');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (409, 'EL TAMBO', 12, '19256');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (410, 'FLORENCIA', 12, '19290');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (411, 'GUACHENÉ', 12, '19300');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (412, 'GUAPI', 12, '19318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (413, 'INZÁ', 12, '19355');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (414, 'JAMBALÓ', 12, '19364');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (415, 'LA SIERRA', 12, '19392');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (416, 'LA VEGA', 12, '19397');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (417, 'LÓPEZ', 12, '19418');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (418, 'MERCADERES', 12, '19450');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (419, 'MIRANDA', 12, '19455');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (420, 'MORALES', 12, '19473');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (421, 'PADILLA', 12, '19513');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (422, 'PAEZ', 12, '19517');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (423, 'PATÍA', 12, '19532');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (424, 'PIAMONTE', 12, '19533');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (425, 'PIENDAMÓ', 12, '19548');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (426, 'POPAYÁN', 12, '19001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (427, 'PUERTO TEJADA', 12, '19573');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (428, 'PURACÉ', 12, '19585');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (429, 'ROSAS', 12, '19622');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (430, 'SAN SEBASTIÁN', 12, '19693');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (431, 'SANTA ROSA', 12, '19701');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (432, 'SANTANDER DE QUILICHAO', 12, '19698');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (433, 'SILVIA', 12, '19743');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (434, 'SOTARA', 12, '19760');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (435, 'SOTARÁ', 12, '19760');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (436, 'SUÁREZ', 12, '19780');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (437, 'SUCRE', 12, '19785');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (438, 'TIMBÍO', 12, '19807');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (439, 'TIMBIQUÍ', 12, '19809');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (440, 'TORIBIO', 12, '19821');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (441, 'TOTORÓ', 12, '19824');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (442, 'VILLA RICA', 12, '19845');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (443, 'AGUACHICA', 13, '20011');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (444, 'AGUSTÍN CODAZZI', 13, '20013');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (445, 'ASTREA', 13, '20032');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (446, 'BECERRIL', 13, '20045');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (447, 'BOSCONIA', 13, '20060');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (448, 'CHIMICHAGUA', 13, '20175');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (449, 'CHIRIGUANÁ', 13, '20178');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (450, 'CURUMANÍ', 13, '20228');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (451, 'EL COPEY', 13, '20238');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (452, 'EL PASO', 13, '20250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (453, 'GAMARRA', 13, '20295');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (454, 'GONZÁLEZ', 13, '20310');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (455, 'LA GLORIA', 13, '20383');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (456, 'LA JAGUA DE IBIRICO', 13, '20400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (457, 'LA PAZ', 13, '20621');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (458, 'MANAURE', 13, '20443');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (459, 'PAILITAS', 13, '20517');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (460, 'PELAYA', 13, '20550');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (461, 'PUEBLO BELLO', 13, '20570');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (462, 'RÍO DE ORO', 13, '20614');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (463, 'SAN ALBERTO', 13, '20710');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (464, 'SAN DIEGO', 13, '20750');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (465, 'SAN MARTÍN', 13, '20770');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (466, 'TAMALAMEQUE', 13, '20787');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (467, 'VALLEDUPAR', 13, '20001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (468, 'ACANDÍ', 14, '27006');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (469, 'ALTO BAUDÓ', 14, '27025');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (470, 'ATRATO', 14, '27050');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (471, 'BAGADÓ', 14, '27073');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (472, 'BAHÍA SOLANO', 14, '27075');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (473, 'BAJO BAUDÓ', 14, '27077');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (474, 'BELÉN DE BAJIRÁ', 14, '27086');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (475, 'BOJAYA', 14, '27099');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (476, 'CARMEN DEL DARIEN', 14, '27150');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (477, 'CÉRTEGUI', 14, '27160');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (478, 'CONDOTO', 14, '27205');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (479, 'EL CANTÓN DEL SAN PABLO', 14, '27135');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (480, 'EL CARMEN DE ATRATO', 14, '27245');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (481, 'EL LITORAL DEL SAN JUAN', 14, '27250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (482, 'ISTMINA', 14, '27361');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (483, 'JURADÓ', 14, '27372');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (484, 'LLORÓ', 14, '27413');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (485, 'MEDIO ATRATO', 14, '27425');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (486, 'MEDIO BAUDÓ', 14, '27430');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (487, 'MEDIO SAN JUAN', 14, '27450');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (488, 'NÓVITA', 14, '27491');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (489, 'NUQUÍ', 14, '27495');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (490, 'QUIBDÓ', 14, '27001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (491, 'RÍO IRÓ', 14, '27580');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (492, 'RÍO QUITO', 14, '27600');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (493, 'RIOSUCIO', 14, '27615');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (494, 'SAN JOSÉ DEL PALMAR', 14, '27660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (495, 'SIPÍ', 14, '27745');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (496, 'TADÓ', 14, '27787');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (497, 'UNGUÍA', 14, '27800');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (498, 'UNIÓN PANAMERICANA', 14, '27810');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (499, 'AYAPEL', 15, '23068');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (500, 'BUENAVISTA', 15, '23079');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (501, 'CANALETE', 15, '23090');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (502, 'CERETÉ', 15, '23162');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (503, 'CHIMÁ', 15, '23168');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (504, 'CHINÚ', 15, '23182');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (505, 'CIÉNAGA DE ORO', 15, '23189');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (506, 'COTORRA', 15, '23300');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (507, 'LA APARTADA', 15, '23350');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (508, 'LORICA', 15, '23417');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (509, 'LOS CÓRDOBAS', 15, '23419');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (510, 'MOMIL', 15, '23464');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (511, 'MONTELÍBANO', 15, '23466');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (512, 'MONTERÍA', 15, '23001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (513, 'MOÑITOS', 15, '23500');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (514, 'PLANETA RICA', 15, '23555');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (515, 'PUEBLO NUEVO', 15, '23570');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (516, 'PUERTO ESCONDIDO', 15, '23574');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (517, 'PUERTO LIBERTADOR', 15, '23580');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (518, 'PURÍSIMA', 15, '23586');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (519, 'SAHAGÚN', 15, '23660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (520, 'SAN ANDRÉS SOTAVENTO', 15, '23670');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (521, 'SAN ANTERO', 15, '23672');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (522, 'SAN BERNARDO DEL VIENTO', 15, '23675');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (523, 'SAN CARLOS', 15, '23678');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (524, 'SAN PELAYO', 15, '23686');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (525, 'TIERRALTA', 15, '23807');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (526, 'VALENCIA', 15, '23855');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (527, 'AGUA DE DIOS', 16, '25001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (528, 'ALBÁN', 16, '25019');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (529, 'ANAPOIMA', 16, '25035');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (530, 'ANOLAIMA', 16, '25040');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (531, 'APULO', 16, '25599');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (532, 'ARBELÁEZ', 16, '25053');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (533, 'BELTRÁN', 16, '25086');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (534, 'BITUIMA', 16, '25095');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (535, 'BOJACÁ', 16, '25099');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (536, 'CABRERA', 16, '25120');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (537, 'CACHIPAY', 16, '25123');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (538, 'CAJICÁ', 16, '25126');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (539, 'CAPARRAPÍ', 16, '25148');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (540, 'CAQUEZA', 16, '25151');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (541, 'CARMEN DE CARUPA', 16, '25154');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (542, 'CHAGUANÍ', 16, '25168');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (543, 'CHÍA', 16, '25175');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (544, 'CHIPAQUE', 16, '25178');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (545, 'CHOACHÍ', 16, '25181');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (546, 'CHOCONTÁ', 16, '25183');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (547, 'COGUA', 16, '25200');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (548, 'COTA', 16, '25214');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (549, 'CUCUNUBÁ', 16, '25224');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (550, 'EL COLEGIO', 16, '25245');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (551, 'EL PEÑÓN', 16, '25258');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (552, 'EL ROSAL', 16, '25260');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (553, 'FACATATIVÁ', 16, '25269');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (554, 'FOMEQUE', 16, '25279');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (555, 'FOSCA', 16, '25281');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (556, 'FUNZA', 16, '25286');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (557, 'FÚQUENE', 16, '25288');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (558, 'FUSAGASUGÁ', 16, '25290');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (559, 'GACHALA', 16, '25293');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (560, 'GACHANCIPÁ', 16, '25295');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (561, 'GACHETÁ', 16, '25297');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (562, 'GAMA', 16, '25299');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (563, 'GIRARDOT', 16, '25307');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (564, 'GRANADA', 16, '25312');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (565, 'GUACHETÁ', 16, '25317');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (566, 'GUADUAS', 16, '25320');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (567, 'GUASCA', 16, '25322');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (568, 'GUATAQUÍ', 16, '25324');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (569, 'GUATAVITA', 16, '25326');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (570, 'GUAYABAL DE SIQUIMA', 16, '25328');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (571, 'GUAYABETAL', 16, '25335');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (572, 'GUTIÉRREZ', 16, '25339');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (573, 'JERUSALÉN', 16, '25368');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (574, 'JUNÍN', 16, '25372');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (575, 'LA CALERA', 16, '25377');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (576, 'LA MESA', 16, '25386');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (577, 'LA PALMA', 16, '25394');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (578, 'LA PEÑA', 16, '25398');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (579, 'LA VEGA', 16, '25402');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (580, 'LENGUAZAQUE', 16, '25407');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (581, 'MACHETA', 16, '25426');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (582, 'MADRID', 16, '25430');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (583, 'MANTA', 16, '25436');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (584, 'MEDINA', 16, '25438');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (585, 'MOSQUERA', 16, '25473');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (586, 'NARIÑO', 16, '25483');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (587, 'NEMOCÓN', 16, '25486');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (588, 'NILO', 16, '25488');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (589, 'NIMAIMA', 16, '25489');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (590, 'NOCAIMA', 16, '25491');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (591, 'PACHO', 16, '25513');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (592, 'PAIME', 16, '25518');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (593, 'PANDI', 16, '25524');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (594, 'PARATEBUENO', 16, '25530');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (595, 'PASCA', 16, '25535');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (596, 'PUERTO SALGAR', 16, '25572');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (597, 'PULÍ', 16, '25580');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (598, 'QUEBRADANEGRA', 16, '25592');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (599, 'QUETAME', 16, '25594');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (600, 'QUIPILE', 16, '25596');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (601, 'RICAURTE', 16, '25612');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (602, 'SAN ANTONIO DEL TEQUENDAMA', 16, '25645');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (603, 'SAN BERNARDO', 16, '25649');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (604, 'SAN CAYETANO', 16, '25653');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (605, 'SAN FRANCISCO', 16, '25658');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (606, 'SAN JUAN DE RÍO SECO', 16, '25662');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (607, 'SASAIMA', 16, '25718');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (608, 'SESQUILÉ', 16, '25736');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (609, 'SIBATÉ', 16, '25740');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (610, 'SILVANIA', 16, '25743');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (611, 'SIMIJACA', 16, '25745');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (612, 'SOACHA', 16, '25754');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (613, 'SOPÓ', 16, '25758');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (614, 'SUBACHOQUE', 16, '25769');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (615, 'SUESCA', 16, '25772');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (616, 'SUPATÁ', 16, '25777');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (617, 'SUSA', 16, '25779');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (618, 'SUTATAUSA', 16, '25781');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (619, 'TABIO', 16, '25785');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (620, 'TAUSA', 16, '25793');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (621, 'TENA', 16, '25797');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (622, 'TENJO', 16, '25799');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (623, 'TIBACUY', 16, '25805');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (624, 'TIBIRITA', 16, '25807');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (625, 'TOCAIMA', 16, '25815');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (626, 'TOCANCIPÁ', 16, '25817');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (627, 'TOPAIPÍ', 16, '25823');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (628, 'UBALÁ', 16, '25839');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (629, 'UBAQUE', 16, '25841');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (630, 'UNE', 16, '25845');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (631, 'ÚTICA', 16, '25851');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (632, 'VENECIA', 16, '25506');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (633, 'VERGARA', 16, '25862');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (634, 'VIANÍ', 16, '25867');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (635, 'VILLA DE SAN DIEGO DE UBATE', 16, '25843');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (636, 'VILLAGÓMEZ', 16, '25871');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (637, 'VILLAPINZÓN', 16, '25873');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (638, 'VILLETA', 16, '25875');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (639, 'VIOTÁ', 16, '25878');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (640, 'YACOPÍ', 16, '25885');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (641, 'ZIPACÓN', 16, '25898');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (642, 'ZIPAQUIRÁ', 16, '25899');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (643, 'BARRANCO MINAS', 17, '94343');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (644, 'CACAHUAL', 17, '94886');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (645, 'INÍRIDA', 17, '94001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (646, 'LA GUADALUPE', 17, '94885');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (647, 'MAPIRIPANA', 17, '94663');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (648, 'MORICHAL', 17, '94888');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (649, 'PANA PANA', 17, '94887');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (650, 'PUERTO COLOMBIA', 17, '94884');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (651, 'SAN FELIPE', 17, '94883');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (652, 'CALAMAR', 18, '95015');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (653, 'EL RETORNO', 18, '95025');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (654, 'MIRAFLORES', 18, '95200');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (655, 'SAN JOSÉ DEL GUAVIARE', 18, '95001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (656, 'ACEVEDO', 19, '41006');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (657, 'AGRADO', 19, '41013');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (658, 'AIPE', 19, '41016');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (659, 'ALGECIRAS', 19, '41020');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (660, 'ALTAMIRA', 19, '41026');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (661, 'BARAYA', 19, '41078');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (662, 'CAMPOALEGRE', 19, '41132');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (663, 'COLOMBIA', 19, '41206');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (664, 'ELÍAS', 19, '41244');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (665, 'GARZÓN', 19, '41298');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (666, 'GIGANTE', 19, '41306');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (667, 'GUADALUPE', 19, '41319');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (668, 'HOBO', 19, '41349');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (669, 'IQUIRA', 19, '41357');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (670, 'ISNOS', 19, '41359');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (671, 'LA ARGENTINA', 19, '41378');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (672, 'LA PLATA', 19, '41396');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (673, 'NÁTAGA', 19, '41483');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (674, 'NEIVA', 19, '41001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (675, 'OPORAPA', 19, '41503');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (676, 'PAICOL', 19, '41518');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (677, 'PALERMO', 19, '41524');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (678, 'PALESTINA', 19, '41530');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (679, 'PITAL', 19, '41548');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (680, 'PITALITO', 19, '41551');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (681, 'RIVERA', 19, '41615');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (682, 'SALADOBLANCO', 19, '41660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (683, 'SAN AGUSTÍN', 19, '41668');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (684, 'SANTA MARÍA', 19, '41676');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (685, 'SUAZA', 19, '41770');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (686, 'TARQUI', 19, '41791');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (687, 'TELLO', 19, '41799');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (688, 'TERUEL', 19, '41801');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (689, 'TESALIA', 19, '41797');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (690, 'TIMANÁ', 19, '41807');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (691, 'VILLAVIEJA', 19, '41872');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (692, 'YAGUARÁ', 19, '41885');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (693, 'ALBANIA', 20, '44035');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (694, 'BARRANCAS', 20, '44078');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (695, 'DIBULLA', 20, '44090');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (696, 'DISTRACCIÓN', 20, '44098');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (697, 'EL MOLINO', 20, '44110');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (698, 'FONSECA', 20, '44279');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (699, 'HATO NUEVO', 20, '44378');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (700, 'LA JAGUA DEL PILAR', 20, '44420');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (701, 'MAICAO', 20, '44430');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (702, 'MANAURE', 20, '44560');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (703, 'RIOHACHA', 20, '44001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (704, 'SAN JUAN DEL CESAR', 20, '44650');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (705, 'URIBIA', 20, '44847');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (706, 'URUMITA', 20, '44855');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (707, 'VILLANUEVA', 20, '44874');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (708, 'ALGARROBO', 21, '47030');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (709, 'ARACATACA', 21, '47053');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (710, 'ARIGUANÍ', 21, '47058');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (711, 'CERRO SAN ANTONIO', 21, '47161');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (712, 'CHIBOLO', 21, '47170');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (713, 'CIÉNAGA', 21, '47189');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (714, 'CONCORDIA', 21, '47205');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (715, 'EL BANCO', 21, '47245');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (716, 'EL PIÑON', 21, '47258');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (717, 'EL RETÉN', 21, '47268');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (718, 'FUNDACIÓN', 21, '47288');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (719, 'GUAMAL', 21, '47318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (720, 'NUEVA GRANADA', 21, '47460');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (721, 'PEDRAZA', 21, '47541');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (722, 'PIJIÑO DEL CARMEN', 21, '47545');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (723, 'PIVIJAY', 21, '47551');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (724, 'PLATO', 21, '47555');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (725, 'PUEBLOVIEJO', 21, '47570');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (726, 'REMOLINO', 21, '47605');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (727, 'SABANAS DE SAN ANGEL', 21, '47660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (728, 'SALAMINA', 21, '47675');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (729, 'SAN SEBASTIÁN DE BUENAVISTA', 21, '47692');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (730, 'SAN ZENÓN', 21, '47703');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (731, 'SANTA ANA', 21, '47707');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (732, 'SANTA BÁRBARA DE PINTO', 21, '47720');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (733, 'SANTA MARTA', 21, '47001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (734, 'SITIONUEVO', 21, '47745');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (735, 'TENERIFE', 21, '47798');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (736, 'ZAPAYÁN', 21, '47960');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (737, 'ZONA BANANERA', 21, '47980');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (738, 'ACACÍAS', 22, '50006');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (739, 'BARRANCA DE UPÍA', 22, '50110');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (740, 'CABUYARO', 22, '50124');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (741, 'CASTILLA LA NUEVA', 22, '50150');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (742, 'CUBARRAL', 22, '50223');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (743, 'CUMARAL', 22, '50226');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (744, 'EL CALVARIO', 22, '50245');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (745, 'EL CASTILLO', 22, '50251');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (746, 'EL DORADO', 22, '50270');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (747, 'FUENTE DE ORO', 22, '50287');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (748, 'GRANADA', 22, '50313');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (749, 'GUAMAL', 22, '50318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (750, 'LA MACARENA', 22, '50350');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (751, 'LEJANÍAS', 22, '50400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (752, 'MAPIRIPÁN', 22, '50325');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (753, 'MESETAS', 22, '50330');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (754, 'PUERTO CONCORDIA', 22, '50450');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (755, 'PUERTO GAITÁN', 22, '50568');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (756, 'PUERTO LLERAS', 22, '50577');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (757, 'PUERTO LÓPEZ', 22, '50573');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (758, 'PUERTO RICO', 22, '50590');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (759, 'RESTREPO', 22, '50606');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (760, 'SAN CARLOS DE GUAROA', 22, '50680');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (761, 'SAN JUAN DE ARAMA', 22, '50683');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (762, 'SAN JUANITO', 22, '50686');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (763, 'SAN MARTÍN', 22, '50689');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (764, 'URIBE', 22, '50370');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (765, 'VILLAVICENCIO', 22, '50001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (766, 'VISTA HERMOSA', 22, '50711');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (767, 'ALBÁN', 23, '52019');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (768, 'ALDANA', 23, '52022');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (769, 'ANCUYÁ', 23, '52036');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (770, 'ARBOLEDA', 23, '52051');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (771, 'BARBACOAS', 23, '52079');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (772, 'BELÉN', 23, '52083');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (773, 'BUESACO', 23, '52110');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (774, 'CHACHAGÜÍ', 23, '52240');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (775, 'COLÓN', 23, '52203');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (776, 'CONSACA', 23, '52207');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (777, 'CONTADERO', 23, '52210');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (778, 'CÓRDOBA', 23, '52215');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (779, 'CUASPUD', 23, '52224');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (780, 'CUMBAL', 23, '52227');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (781, 'CUMBITARA', 23, '52233');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (782, 'EL CHARCO', 23, '52250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (783, 'EL PEÑOL', 23, '52254');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (784, 'EL ROSARIO', 23, '52256');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (785, 'EL TABLÓN DE GÓMEZ', 23, '52258');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (786, 'EL TAMBO', 23, '52260');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (787, 'FRANCISCO PIZARRO', 23, '52520');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (788, 'FUNES', 23, '52287');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (789, 'GUACHUCAL', 23, '52317');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (790, 'GUAITARILLA', 23, '52320');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (791, 'GUALMATÁN', 23, '52323');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (792, 'ILES', 23, '52352');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (793, 'IMUÉS', 23, '52354');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (794, 'IPIALES', 23, '52356');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (795, 'LA CRUZ', 23, '52378');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (796, 'LA FLORIDA', 23, '52381');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (797, 'LA LLANADA', 23, '52385');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (798, 'LA TOLA', 23, '52390');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (799, 'LA UNIÓN', 23, '52399');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (800, 'LEIVA', 23, '52405');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (801, 'LINARES', 23, '52411');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (802, 'LOS ANDES', 23, '52418');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (803, 'MAGÜI', 23, '52427');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (804, 'MALLAMA', 23, '52435');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (805, 'MOSQUERA', 23, '52473');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (806, 'NARIÑO', 23, '52480');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (807, 'OLAYA HERRERA', 23, '52490');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (808, 'OSPINA', 23, '52506');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (809, 'PASTO', 23, '52001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (810, 'POLICARPA', 23, '52540');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (811, 'POTOSÍ', 23, '52560');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (812, 'PROVIDENCIA', 23, '52565');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (813, 'PUERRES', 23, '52573');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (814, 'PUPIALES', 23, '52585');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (815, 'RICAURTE', 23, '52612');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (816, 'ROBERTO PAYÁN', 23, '52621');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (817, 'SAMANIEGO', 23, '52678');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (818, 'SAN ANDRES DE TUMACO', 23, '52835');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (819, 'SAN BERNARDO', 23, '52685');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (820, 'SAN LORENZO', 23, '52687');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (821, 'SAN PABLO', 23, '52693');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (822, 'SAN PEDRO DE CARTAGO', 23, '52694');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (823, 'SANDONÁ', 23, '52683');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (824, 'SANTA BÁRBARA', 23, '52696');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (825, 'SANTACRUZ', 23, '52699');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (826, 'SAPUYES', 23, '52720');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (827, 'TAMINANGO', 23, '52786');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (828, 'TANGUA', 23, '52788');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (829, 'TÚQUERRES', 23, '52838');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (830, 'YACUANQUER', 23, '52885');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (831, 'ABREGO', 24, '54003');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (832, 'ARBOLEDAS', 24, '54051');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (833, 'BOCHALEMA', 24, '54099');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (834, 'BUCARASICA', 24, '54109');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (835, 'CACHIRÁ', 24, '54128');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (836, 'CÁCOTA', 24, '54125');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (837, 'CHINÁCOTA', 24, '54172');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (838, 'CHITAGÁ', 24, '54174');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (839, 'CONVENCIÓN', 24, '54206');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (840, 'CÚCUTA', 24, '54001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (841, 'CUCUTILLA', 24, '54223');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (842, 'DURANIA', 24, '54239');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (843, 'EL CARMEN', 24, '54245');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (844, 'EL TARRA', 24, '54250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (845, 'EL ZULIA', 24, '54261');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (846, 'GRAMALOTE', 24, '54313');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (847, 'HACARÍ', 24, '54344');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (848, 'HERRÁN', 24, '54347');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (849, 'LA ESPERANZA', 24, '54385');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (850, 'LA PLAYA', 24, '54398');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (851, 'LABATECA', 24, '54377');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (852, 'LOS PATIOS', 24, '54405');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (853, 'LOURDES', 24, '54418');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (854, 'MUTISCUA', 24, '54480');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (855, 'OCAÑA', 24, '54498');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (856, 'PAMPLONA', 24, '54518');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (857, 'PAMPLONITA', 24, '54520');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (858, 'PUERTO SANTANDER', 24, '54553');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (859, 'RAGONVALIA', 24, '54599');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (860, 'SALAZAR', 24, '54660');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (861, 'SAN CALIXTO', 24, '54670');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (862, 'SAN CAYETANO', 24, '54673');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (863, 'SANTIAGO', 24, '54680');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (864, 'SARDINATA', 24, '54720');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (865, 'SILOS', 24, '54743');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (866, 'TEORAMA', 24, '54800');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (867, 'TIBÚ', 24, '54810');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (868, 'TOLEDO', 24, '54820');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (869, 'VILLA CARO', 24, '54871');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (870, 'VILLA DEL ROSARIO', 24, '54874');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (871, 'COLÓN', 26, '86219');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (872, 'LEGUÍZAMO', 26, '86573');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (873, 'MOCOA', 26, '86001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (874, 'ORITO', 26, '86320');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (875, 'PUERTO ASÍS', 26, '86568');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (876, 'PUERTO CAICEDO', 26, '86569');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (877, 'PUERTO GUZMÁN', 26, '86571');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (878, 'SAN FRANCISCO', 26, '86755');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (879, 'SAN MIGUEL', 26, '86757');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (880, 'SANTIAGO', 26, '86760');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (881, 'SIBUNDOY', 26, '86749');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (882, 'VALLE DEL GUAMUEZ', 26, '86865');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (883, 'VILLAGARZÓN', 26, '86885');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (884, 'ARMENIA', 27, '63001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (885, 'BUENAVISTA', 27, '63111');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (886, 'CALARCA', 27, '63130');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (887, 'CIRCASIA', 27, '63190');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (888, 'CÓRDOBA', 27, '63212');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (889, 'FILANDIA', 27, '63272');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (890, 'GÉNOVA', 27, '63302');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (891, 'LA TEBAIDA', 27, '63401');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (892, 'MONTENEGRO', 27, '63470');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (893, 'PIJAO', 27, '63548');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (894, 'QUIMBAYA', 27, '63594');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (895, 'SALENTO', 27, '63690');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (896, 'APÍA', 28, '66045');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (897, 'BALBOA', 28, '66075');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (898, 'BELÉN DE UMBRÍA', 28, '66088');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (899, 'DOSQUEBRADAS', 28, '66170');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (900, 'GUÁTICA', 28, '66318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (901, 'LA CELIA', 28, '66383');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (902, 'LA VIRGINIA', 28, '66400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (903, 'MARSELLA', 28, '66440');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (904, 'MISTRATÓ', 28, '66456');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (905, 'PEREIRA', 28, '66001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (906, 'PUEBLO RICO', 28, '66572');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (907, 'QUINCHÍA', 28, '66594');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (908, 'SANTA ROSA DE CABAL', 28, '66682');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (909, 'SANTUARIO', 28, '66687');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (910, 'AGUADA', 29, '68013');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (911, 'ALBANIA', 29, '68020');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (912, 'ARATOCA', 29, '68051');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (913, 'BARBOSA', 29, '68077');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (914, 'BARICHARA', 29, '68079');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (915, 'BARRANCABERMEJA', 29, '68081');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (916, 'BETULIA', 29, '68092');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (917, 'BOLÍVAR', 29, '68101');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (918, 'BUCARAMANGA', 29, '68001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (919, 'CABRERA', 29, '68121');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (920, 'CALIFORNIA', 29, '68132');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (921, 'CAPITANEJO', 29, '68147');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (922, 'CARCASÍ', 29, '68152');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (923, 'CEPITÁ', 29, '68160');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (924, 'CERRITO', 29, '68162');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (925, 'CHARALÁ', 29, '68167');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (926, 'CHARTA', 29, '68169');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (927, 'CHIMA', 29, '68176');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (928, 'CHIPATÁ', 29, '68179');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (929, 'CIMITARRA', 29, '68190');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (930, 'CONCEPCIÓN', 29, '68207');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (931, 'CONFINES', 29, '68209');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (932, 'CONTRATACIÓN', 29, '68211');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (933, 'COROMORO', 29, '68217');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (934, 'CURITÍ', 29, '68229');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (935, 'EL CARMEN DE CHUCURÍ', 29, '68235');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (936, 'EL GUACAMAYO', 29, '68245');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (937, 'EL PEÑÓN', 29, '68250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (938, 'EL PLAYÓN', 29, '68255');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (939, 'ENCINO', 29, '68264');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (940, 'ENCISO', 29, '68266');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (941, 'FLORIÁN', 29, '68271');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (942, 'FLORIDABLANCA', 29, '68276');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (943, 'GALÁN', 29, '68296');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (944, 'GAMBITA', 29, '68298');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (945, 'GIRÓN', 29, '68307');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (946, 'GUACA', 29, '68318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (947, 'GUADALUPE', 29, '68320');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (948, 'GUAPOTÁ', 29, '68322');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (949, 'GUAVATÁ', 29, '68324');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (950, 'GÜEPSA', 29, '68327');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (951, 'HATO', 29, '68344');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (952, 'JESÚS MARÍA', 29, '68368');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (953, 'JORDÁN', 29, '68370');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (954, 'LA BELLEZA', 29, '68377');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (955, 'LA PAZ', 29, '68397');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (956, 'LANDÁZURI', 29, '68385');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (957, 'LEBRIJA', 29, '68406');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (958, 'LOS SANTOS', 29, '68418');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (959, 'MACARAVITA', 29, '68425');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (960, 'MÁLAGA', 29, '68432');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (961, 'MATANZA', 29, '68444');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (962, 'MOGOTES', 29, '68464');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (963, 'MOLAGAVITA', 29, '68468');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (964, 'OCAMONTE', 29, '68498');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (965, 'OIBA', 29, '68500');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (966, 'ONZAGA', 29, '68502');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (967, 'PALMAR', 29, '68522');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (968, 'PALMAS DEL SOCORRO', 29, '68524');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (969, 'PÁRAMO', 29, '68533');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (970, 'PIEDECUESTA', 29, '68547');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (971, 'PINCHOTE', 29, '68549');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (972, 'PUENTE NACIONAL', 29, '68572');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (973, 'PUERTO PARRA', 29, '68573');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (974, 'PUERTO WILCHES', 29, '68575');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (975, 'RIONEGRO', 29, '68615');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (976, 'SABANA DE TORRES', 29, '68655');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (977, 'SAN ANDRÉS', 29, '68669');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (978, 'SAN BENITO', 29, '68673');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (979, 'SAN GIL', 29, '68679');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (980, 'SAN JOAQUÍN', 29, '68682');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (981, 'SAN JOSÉ DE MIRANDA', 29, '68684');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (982, 'SAN MIGUEL', 29, '68686');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (983, 'SAN VICENTE DE CHUCURÍ', 29, '68689');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (984, 'SANTA BÁRBARA', 29, '68705');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (985, 'SANTA HELENA DEL OPÓN', 29, '68720');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (986, 'SIMACOTA', 29, '68745');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (987, 'SOCORRO', 29, '68755');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (988, 'SUAITA', 29, '68770');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (989, 'SUCRE', 29, '68773');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (990, 'SURATÁ', 29, '68780');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (991, 'TONA', 29, '68820');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (992, 'VALLE DE SAN JOSÉ', 29, '68855');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (993, 'VÉLEZ', 29, '68861');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (994, 'VETAS', 29, '68867');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (995, 'VILLANUEVA', 29, '68872');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (996, 'ZAPATOCA', 29, '68895');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (997, 'BUENAVISTA', 30, '70110');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (998, 'CAIMITO', 30, '70124');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (999, 'CHALÁN', 30, '70230');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1000, 'COLOSO', 30, '70204');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1001, 'COROZAL', 30, '70215');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1002, 'COVEÑAS', 30, '70221');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1003, 'EL ROBLE', 30, '70233');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1004, 'GALERAS', 30, '70235');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1005, 'GUARANDA', 30, '70265');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1006, 'LA UNIÓN', 30, '70400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1007, 'LOS PALMITOS', 30, '70418');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1008, 'MAJAGUAL', 30, '70429');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1009, 'MORROA', 30, '70473');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1010, 'OVEJAS', 30, '70508');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1011, 'PALMITO', 30, '70523');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1012, 'SAMPUÉS', 30, '70670');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1013, 'SAN BENITO ABAD', 30, '70678');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1014, 'SAN JUAN DE BETULIA', 30, '70702');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1015, 'SAN LUIS DE SINCÉ', 30, '70742');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1016, 'SAN MARCOS', 30, '70708');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1017, 'SAN ONOFRE', 30, '70713');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1018, 'SAN PEDRO', 30, '70717');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1019, 'SANTIAGO DE TOLÚ', 30, '70820');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1020, 'SINCELEJO', 30, '70001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1021, 'SUCRE', 30, '70771');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1022, 'TOLÚ VIEJO', 30, '70823');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1023, 'ALPUJARRA', 31, '73024');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1024, 'ALVARADO', 31, '73026');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1025, 'AMBALEMA', 31, '73030');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1026, 'ANZOÁTEGUI', 31, '73043');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1027, 'ARMERO', 31, '73055');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1028, 'ATACO', 31, '73067');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1029, 'CAJAMARCA', 31, '73124');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1030, 'CARMEN DE APICALÁ', 31, '73148');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1031, 'CASABIANCA', 31, '73152');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1032, 'CHAPARRAL', 31, '73168');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1033, 'COELLO', 31, '73200');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1034, 'COYAIMA', 31, '73217');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1035, 'CUNDAY', 31, '73226');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1036, 'DOLORES', 31, '73236');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1037, 'ESPINAL', 31, '73268');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1038, 'FALAN', 31, '73270');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1039, 'FLANDES', 31, '73275');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1040, 'FRESNO', 31, '73283');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1041, 'GUAMO', 31, '73319');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1042, 'HERVEO', 31, '73347');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1043, 'HONDA', 31, '73349');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1044, 'IBAGUÉ', 31, '73001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1045, 'ICONONZO', 31, '73352');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1046, 'LÉRIDA', 31, '73408');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1047, 'LÍBANO', 31, '73411');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1048, 'MARIQUITA', 31, '73443');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1049, 'MELGAR', 31, '73449');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1050, 'MURILLO', 31, '73461');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1051, 'NATAGAIMA', 31, '73483');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1052, 'ORTEGA', 31, '73504');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1053, 'PALOCABILDO', 31, '73520');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1054, 'PIEDRAS', 31, '73547');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1055, 'PLANADAS', 31, '73555');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1056, 'PRADO', 31, '73563');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1057, 'PURIFICACIÓN', 31, '73585');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1058, 'RIOBLANCO', 31, '73616');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1059, 'RONCESVALLES', 31, '73622');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1060, 'ROVIRA', 31, '73624');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1061, 'SALDAÑA', 31, '73671');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1062, 'SAN ANTONIO', 31, '73675');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1063, 'SAN LUIS', 31, '73678');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1064, 'SANTA ISABEL', 31, '73686');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1065, 'SUÁREZ', 31, '73770');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1066, 'VALLE DE SAN JUAN', 31, '73854');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1067, 'VENADILLO', 31, '73861');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1068, 'VILLAHERMOSA', 31, '73870');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1069, 'VILLARRICA', 31, '73873');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1070, 'ALCALÁ', 32, '76020');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1071, 'ANDALUCÍA', 32, '76036');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1072, 'ANSERMANUEVO', 32, '76041');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1073, 'ARGELIA', 32, '76054');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1074, 'BOLÍVAR', 32, '76100');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1075, 'BUENAVENTURA', 32, '76109');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1076, 'BUGALAGRANDE', 32, '76113');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1077, 'CAICEDONIA', 32, '76122');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1078, 'CALI', 32, '76001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1079, 'CALIMA', 32, '76126');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1080, 'CANDELARIA', 32, '76130');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1081, 'CARTAGO', 32, '76147');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1082, 'DAGUA', 32, '76233');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1083, 'EL ÁGUILA', 32, '76243');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1084, 'EL CAIRO', 32, '76246');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1085, 'EL CERRITO', 32, '76248');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1086, 'EL DOVIO', 32, '76250');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1087, 'FLORIDA', 32, '76275');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1088, 'GINEBRA', 32, '76306');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1089, 'GUACARÍ', 32, '76318');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1090, 'GUADALAJARA DE BUGA', 32, '76111');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1091, 'JAMUNDÍ', 32, '76364');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1092, 'LA CUMBRE', 32, '76377');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1093, 'LA UNIÓN', 32, '76400');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1094, 'LA VICTORIA', 32, '76403');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1095, 'OBANDO', 32, '76497');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1096, 'PALMIRA', 32, '76520');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1097, 'PRADERA', 32, '76563');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1098, 'RESTREPO', 32, '76606');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1099, 'RIOFRÍO', 32, '76616');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1100, 'ROLDANILLO', 32, '76622');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1101, 'SAN PEDRO', 32, '76670');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1102, 'SEVILLA', 32, '76736');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1103, 'TORO', 32, '76823');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1104, 'TRUJILLO', 32, '76828');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1105, 'TULUÁ', 32, '76834');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1106, 'ULLOA', 32, '76845');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1107, 'VERSALLES', 32, '76863');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1108, 'VIJES', 32, '76869');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1109, 'YOTOCO', 32, '76890');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1110, 'YUMBO', 32, '76892');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1111, 'ZARZAL', 32, '76895');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1112, 'CARURU', 33, '97161');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1113, 'MITÚ', 33, '97001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1114, 'PACOA', 33, '97511');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1115, 'PAPUNAUA', 33, '97777');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1116, 'TARAIRA', 33, '97666');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1117, 'YAVARATÉ', 33, '97889');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1118, 'CUMARIBO', 34, '99773');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1119, 'LA PRIMAVERA', 34, '99524');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1120, 'PUERTO CARREÑO', 34, '99001');
INSERT INTO public.municipio (mun_id, mun_nombre, dep_id, mun_codigo) VALUES (1121, 'SANTA ROSALÍA', 34, '99624');


--
-- TOC entry 2943 (class 0 OID 16419)
-- Dependencies: 206
-- Data for Name: municipio_paramo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (1, 30, 17);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (2, 696, 15);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (3, 295, 10);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (4, 506, 22);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (5, 820, 2);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (6, 1111, 4);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (7, 145, 32);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (8, 12, 6);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (9, 958, 10);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (10, 1088, 18);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (11, 897, 28);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (12, 952, 18);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (13, 287, 31);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (14, 174, 5);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (15, 154, 11);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (16, 245, 29);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (17, 700, 1);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (18, 1079, 2);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (19, 389, 21);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (20, 192, 9);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (21, 1099, 16);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (22, 182, 8);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (23, 109, 5);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (24, 1080, 13);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (25, 921, 28);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (26, 926, 2);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (27, 464, 14);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (28, 282, 17);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (29, 968, 12);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (30, 193, 13);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (31, 120, 24);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (32, 219, 15);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (33, 626, 7);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (34, 756, 7);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (35, 453, 12);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (36, 843, 19);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (37, 701, 3);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (38, 338, 5);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (39, 363, 3);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (40, 981, 19);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (41, 691, 16);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (42, 662, 26);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (43, 232, 4);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (44, 966, 23);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (45, 546, 11);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (46, 921, 23);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (47, 91, 22);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (48, 543, 2);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (49, 162, 20);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (50, 919, 26);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (51, 953, 32);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (52, 813, 19);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (53, 719, 7);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (54, 732, 3);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (55, 154, 14);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (56, 570, 25);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (57, 273, 24);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (58, 1044, 7);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (59, 577, 28);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (60, 505, 4);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (61, 953, 10);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (62, 572, 6);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (63, 757, 8);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (64, 691, 15);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (65, 736, 27);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (66, 1096, 17);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (67, 857, 11);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (68, 533, 8);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (69, 909, 18);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (70, 360, 12);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (71, 612, 18);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (72, 657, 14);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (73, 439, 18);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (74, 679, 22);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (75, 100, 11);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (76, 792, 22);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (77, 1047, 10);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (78, 352, 1);
INSERT INTO public.municipio_paramo (mxp_id, mun_id, par_id) VALUES (79, 126, 27);


--
-- TOC entry 2945 (class 0 OID 16424)
-- Dependencies: 208
-- Data for Name: paramo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paramo (par_id, par_nombre) VALUES (1, 'El Macizo Colombiano');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (2, 'Sierra Nevada de Santa Marta');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (3, 'Sumapaz');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (4, 'Chingaza');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (5, 'Las Hermosas');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (6, 'Santa Isabel');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (7, 'Tolima');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (8, 'Ruiz');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (9, 'Pisba');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (10, 'Cocuy');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (11, 'Santurbán');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (12, 'Berlín');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (13, 'El Almorzadero');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (14, 'La Rusia');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (15, 'Guantiva');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (16, 'Betulia');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (17, 'Barragán');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (18, 'Chili');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (19, 'Torra');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (20, 'Bordoncillo');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (21, 'Galeras');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (22, 'Azufral');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (23, 'Cruz Verde');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (24, 'Guerrero');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (25, 'Monte de Leona');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (26, 'Pan de Azúcar');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (27, 'Yaguaquer');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (28, 'Guasca');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (29, 'Gachalá');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (30, 'Medina');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (31, 'Tasares');
INSERT INTO public.paramo (par_id, par_nombre) VALUES (32, 'Tatama');


--
-- TOC entry 2947 (class 0 OID 16429)
-- Dependencies: 210
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (1, 'Juan', 'Diaz');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (2, 'Ana', 'Mendez');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (3, 'Carolina', 'Quevedo');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (4, 'Maria', 'Robledo');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (5, 'Sebastian', 'Arnedo');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (6, 'Miguel', 'Piedrahita');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (7, 'Maria', 'Rojas');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (8, 'Juan', 'Chauta');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (9, 'Esteban', 'Paredes');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (10, 'Alexander', 'Paredes');
INSERT INTO public.usuario (usu_id, usu_nombre, usu_apellido) VALUES (11, 'Andrea', 'Perez');


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 197
-- Name: departamento_dep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_dep_id_seq', 34, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 199
-- Name: especie_esp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especie_esp_id_seq', 10, true);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_individuo_esi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_individuo_esi_id_seq', 5, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 203
-- Name: individuo_ind_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individuo_ind_id_seq', 1002, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 205
-- Name: municipio_mun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipio_mun_id_seq', 1951, true);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 207
-- Name: municipio_paramo_mxp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipio_paramo_mxp_id_seq', 79, true);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 209
-- Name: paramo_par_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paramo_par_id_seq', 32, true);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 211
-- Name: usuario_usua_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usua_id_seq', 11, true);


--
-- TOC entry 2791 (class 2606 OID 16443)
-- Name: departamento PK_DEPARTAMENTO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT "PK_DEPARTAMENTO" PRIMARY KEY (dep_id);


--
-- TOC entry 2793 (class 2606 OID 16445)
-- Name: especie PK_ESPECIE; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especie
    ADD CONSTRAINT "PK_ESPECIE" PRIMARY KEY (esp_id);


--
-- TOC entry 2795 (class 2606 OID 16447)
-- Name: estado_individuo PK_ESTADO_INDIVIDUO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_individuo
    ADD CONSTRAINT "PK_ESTADO_INDIVIDUO" PRIMARY KEY (esi_id);


--
-- TOC entry 2797 (class 2606 OID 16449)
-- Name: individuo PK_INDIVIDUO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuo
    ADD CONSTRAINT "PK_INDIVIDUO" PRIMARY KEY (ind_id);


--
-- TOC entry 2799 (class 2606 OID 16451)
-- Name: municipio PK_MUNICIPIO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT "PK_MUNICIPIO" PRIMARY KEY (mun_id);


--
-- TOC entry 2801 (class 2606 OID 16453)
-- Name: municipio_paramo PK_MUNICIPIO_PARAMO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio_paramo
    ADD CONSTRAINT "PK_MUNICIPIO_PARAMO" PRIMARY KEY (mxp_id);


--
-- TOC entry 2803 (class 2606 OID 16455)
-- Name: paramo PK_PARAMO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paramo
    ADD CONSTRAINT "PK_PARAMO" PRIMARY KEY (par_id);


--
-- TOC entry 2805 (class 2606 OID 16457)
-- Name: usuario PK_USUARIO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "PK_USUARIO" PRIMARY KEY (usu_id);


--
-- TOC entry 2806 (class 2606 OID 16458)
-- Name: individuo FK_INDIVIDUO_ESTADO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuo
    ADD CONSTRAINT "FK_INDIVIDUO_ESTADO" FOREIGN KEY (esi_id) REFERENCES public.estado_individuo(esi_id);


--
-- TOC entry 2807 (class 2606 OID 16463)
-- Name: individuo FK_INDIVIDUO_MXP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuo
    ADD CONSTRAINT "FK_INDIVIDUO_MXP" FOREIGN KEY (mxp_id) REFERENCES public.municipio_paramo(mxp_id);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 2807
-- Name: CONSTRAINT "FK_INDIVIDUO_MXP" ON individuo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "FK_INDIVIDUO_MXP" ON public.individuo IS 'ubicación del individuo';


--
-- TOC entry 2808 (class 2606 OID 16468)
-- Name: individuo FK_INDIVIDUO_USUARIO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuo
    ADD CONSTRAINT "FK_INDIVIDUO_USUARIO" FOREIGN KEY (usu_id) REFERENCES public.usuario(usu_id);


--
-- TOC entry 2809 (class 2606 OID 16473)
-- Name: municipio FK_MUNICIPIO_DEPARTAMENTO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT "FK_MUNICIPIO_DEPARTAMENTO" FOREIGN KEY (dep_id) REFERENCES public.departamento(dep_id);


--
-- TOC entry 2810 (class 2606 OID 16478)
-- Name: municipio_paramo FK_MXP_MUNICIPIO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio_paramo
    ADD CONSTRAINT "FK_MXP_MUNICIPIO" FOREIGN KEY (mun_id) REFERENCES public.municipio(mun_id);


--
-- TOC entry 2811 (class 2606 OID 16483)
-- Name: municipio_paramo FK_MXP_PARAMO; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio_paramo
    ADD CONSTRAINT "FK_MXP_PARAMO" FOREIGN KEY (par_id) REFERENCES public.paramo(par_id);


-- Completed on 2019-12-18 21:54:09 UTC

--
-- PostgreSQL database dump complete
--

