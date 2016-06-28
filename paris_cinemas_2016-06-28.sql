--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: map_cinema; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE map_cinema (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    geom geometry(Point,4326) NOT NULL,
    other_name character varying(256),
    open_date character varying(256),
    date character varying(256),
    o_address character varying(256),
    c_address character varying(256),
    city character varying(256),
    postcode character varying(32),
    x double precision,
    y double precision,
    barrabas character varying(256),
    les_deux character varying(256),
    meetings character varying(256),
    crimes character varying(256)
);


--
-- Name: map_cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE map_cinema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: map_cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE map_cinema_id_seq OWNED BY map_cinema.id;


--
-- Name: map_letter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE map_letter (
    id integer NOT NULL,
    letter_id character varying(8),
    geom geometry(Point,4326) NOT NULL,
    month character varying(10),
    year character varying(4) NOT NULL,
    date character varying(10),
    o_address character varying(256),
    c_address character varying(256),
    city character varying(256),
    postcode character varying(32),
    x double precision,
    y double precision,
    name character varying(128) NOT NULL,
    occupation character varying(128),
    sex character varying(16),
    letter_pur character varying(255),
    contrib_no character varying(16),
    persons character varying(255),
    practices character varying(255),
    magazines character varying(255),
    cinema character varying(255)
);


--
-- Name: map_letter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE map_letter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: map_letter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE map_letter_id_seq OWNED BY map_letter.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY map_cinema ALTER COLUMN id SET DEFAULT nextval('map_cinema_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY map_letter ALTER COLUMN id SET DEFAULT nextval('map_letter_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add cinema	7	add_cinema
20	Can change cinema	7	change_cinema
21	Can delete cinema	7	delete_cinema
22	Can add letter	8	add_letter
23	Can change letter	8	change_letter
24	Can delete letter	8	delete_letter
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 24, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$JVm8X0przIFX$wWy9crDkya9qVTP71297RjZI494uVhEqfqxscPQ+1HA=	2016-06-22 16:48:59.326615+01	t	duncan			hay.duncan@gmail.com	t	t	2016-06-20 16:59:44.61004+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	map	cinema
8	map	letter
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 8, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-06-20 16:34:18.778346+01
2	auth	0001_initial	2016-06-20 16:34:18.923432+01
3	admin	0001_initial	2016-06-20 16:34:18.977593+01
4	contenttypes	0002_remove_content_type_name	2016-06-20 16:34:19.166921+01
5	auth	0002_alter_permission_name_max_length	2016-06-20 16:34:19.230014+01
6	auth	0003_alter_user_email_max_length	2016-06-20 16:34:19.261677+01
7	auth	0004_alter_user_username_opts	2016-06-20 16:34:19.29464+01
8	auth	0005_alter_user_last_login_null	2016-06-20 16:34:19.321481+01
9	auth	0006_require_contenttypes_0002	2016-06-20 16:34:19.326945+01
10	map	0001_initial	2016-06-20 16:34:19.379305+01
11	sessions	0001_initial	2016-06-20 16:34:19.409927+01
12	map	0002_auto_20160620_1545	2016-06-20 16:45:55.737153+01
13	map	0003_auto_20160623_1028	2016-06-23 11:29:01.335763+01
14	map	0004_letter	2016-06-23 14:29:23.590529+01
15	map	0005_auto_20160623_1332	2016-06-23 14:32:42.497973+01
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
awy0oniudchrarujv7dzkvtk7lkieho3	MmFiYmJhZWUwOWU5MjMzZDM2ZTY4YzIzMGFiZjRiYmEwMzhhOTA4Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZTk2MjJhMTM3NTQ3MmE2MTUxOTUxNjFiN2ZkNzE3ODBhOTcyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-07-04 17:00:09.037115+01
hvcl0z1ijy7rf8fqsalmvn7jve0vd0sc	MmFiYmJhZWUwOWU5MjMzZDM2ZTY4YzIzMGFiZjRiYmEwMzhhOTA4Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZTk2MjJhMTM3NTQ3MmE2MTUxOTUxNjFiN2ZkNzE3ODBhOTcyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-07-06 16:48:59.330246+01
\.


--
-- Data for Name: map_cinema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY map_cinema (id, name, geom, other_name, open_date, date, o_address, c_address, city, postcode, x, y, barrabas, les_deux, meetings, crimes) FROM stdin;
31	Cyrano-Journal	0101000020E61000009506239B50CD0240A9AB96CF4D6E4840	Cyrano-Sébastopol, Alpha Sébastopol, Septième Art Beaubourg (Meusy, p 528)	Opens 1917 (Meusy, p 528)	\N	40 bld de Sébastopol	40 bld de Sébastopol	Paris	75001	48.8617496000000031	2.35025139999999988	\N	\N	\N	\N
32	Salle Marivaux	0101000020E61000003A67FADB54B30240D8220E7E876F4840	\N	1919	\N	13-15 bld des Italiens	13 bld des Italiens	Paris	75002	48.8713223999999968	2.33756420000000009	\N	Week 1, Les Deux Gamines, 1921	\N	\N
33	Cinéma / Théâtre de la presse	0101000020E610000041B96DDFA3BE0240C26625523F6F4840	Café-restaurant de la presse in 1886. Grand concert de la presse in 1899. Café-Concert de la Presse in 1910. Tambourin in 1921.	\N	\N	125 rue Montmartre	125 rue Montmartre	Paris	75002	48.8691199000000012	2.343086	\N	Week 2, Les Deux Gamines, 1921	\N	\N
34	Omnia Pathé	0101000020E61000009E1BE43FEEBC02404DE5A37B8C6F4840	ex-théâtre du cinématographe pathé, later cinéphone petit parisien, cinéphone montmartre,California, Arcades (Meusy, p. 527)	1906	\N	5 bld Montmartre	5 bld Montmartre	Paris	75002	48.8714747000000003	2.34225130000000004	\N	\N	\N	\N
35	Electric Palace	0101000020E6100000ADB4D66196B702405391AFA9986F4840	Electric-Palace-in 1914 annuaire. Electric-Palace-Aubert in 1927-28. Studio Universel in 1937	Opens 1911	\N	5 bld des Italiens	5 bld des Italiens	Paris	75002	48.8718464000000026	2.33964229999999995	\N	\N	\N	\N
36	Parisiana	0101000020E6100000FB3DB14E95BF0240C26279FC836F4840	Normandin Cinématographe in 1897	1910	\N	27 bld Poissonnière (carrefour Montmartre)	27 bld Poissonnière	Paris	75002	48.871215399999997	2.34354649999999998	\N	\N	\N	\N
37	Gaumont Théâtre	0101000020E610000091306711E5C602408412C193716F4840	Cinématographe Théâtre (Meusy), then Chronophone Gaumont in 1914 annuaire..same name 1928, 1937	1906	\N	7 bld Poissonnière	7 bld Poisonnière	Paris	75002	48.8706535999999971	2.34711660000000011	Barrabas Week 1	Week 1, Les Deux Gamines, 1921	\N	\N
38	Le Pavillon	0101000020E61000001448E4164EAD0240D76F815F7E6F4840	Nouveau Pavillon du Cinéma in 1927	\N	\N	33 bld des Italiens and 32 rue louis-le-grand	33 bld des Italiens and 32 rue louis-le-grand	Paris	75002	48.8710440999999989	2.33462160000000019	\N	\N	\N	\N
39	Ciné Reiss	0101000020E6100000C60D092989B60240F67D3848886F4840	Théâtre La Bonbonnière in 1915?	Listed 1921, 1922	\N	Passage des princes	Passage des princes	Paris	75002	48.8713465000000014	2.33912880000000012	\N	\N	\N	\N
40	Select Cinéma (1916-)	0101000020E61000007BCCF6D7E1AE0240D88F5E1E7C6F4840	Kinéma-Théâtre Gab-Ka in 1906 and 1913.cabaret la boîte à Fursy  in 1918.  Ciné des boulevards in 1923 then Ciné-Opéra-Le-Corso  in 1927, then cinéma des enfants in late 1927.	opens Dec 1906	\N	27 bld des italiens	27 bld des italiens	Paris	75002	48.8709752999999978	2.33539170000000018	\N	\N	\N	\N
41	Perron	0101000020E6100000EEE2A2FF8AD10240DE9046054E6F4840	Central Cinéma 1909-1913	1909	\N	3 bld bonne nouvelle	3 bld de bonne nouvelle	Paris	75002	48.8695684999999997	2.35231589999999979	\N	\N	\N	\N
42	Splendid Cinéma	0101000020E610000077476BB180CE024003BE912F576F4840	Studio called Photo-Midget 1912-1914	around 1913	\N	9 bld bonne nouvelle, 6 rue de la lune	9 bld de bonne nouvelle	Paris	75002	48.8698481999999998	2.35083140000000013	\N	\N	\N	\N
43	Ciné-Éclair	0101000020E610000079BC7FE2B6AC0240CA856F06246F4840	\N	\N	\N	12 rue Gaillon	12 rue Gaillon	Paris	75002	48.8682869000000011	2.33433320000000011	\N	\N	\N	\N
44	Robineau	0101000020E610000071DD3939E8F702401878EE3D5C6F4840	\N	cinema in 1921 and 1922	\N	73 faubourg du temple, 152 ave parmentier	73 rue du faubourg du temple	Paris	75002	48.8700024999999982	2.37104839999999983	\N	\N	\N	\N
45	Palais des arts / Palais de la Mutualité	0101000020E6100000A12DE7525CD5024033F0EDA7106F4840	Paris-Palace-Cinéma in 1915. still Palais de la Mutualité in 1920,  1928	Opens 13 Feb 1914	\N	325-327 rue saint martin	325 rue saint martin	Paris	75003	48.8676957999999999	2.35417999999999994	Barrabas Week 1, 1920	\N	\N	\N
46	Kinérama	0101000020E6100000E5F857456EDC0240C048C3842C6F4840	Théâtre du Kinérama. Kinérama-Pathé in 1915, Kinérama in 1918, 1920,  1937	Opens 30 Sept 1911	\N	37 Faubourg/bld St. Martin	37 bld St. Martin	Paris	75003	48.8685461000000032	2.35763219999999984	\N	\N	\N	\N
47	Majestic-Cinéma-Palace	0101000020E6100000827A8E2331EC0240838F1C44C66E4840	Cinéma-Concert in 1914. cinéma-concert du restaurant bonvalet. Cinéma Majestic in Feb 1918 (Carnet de la semaine 3 Feb)	11 Oct 1912	Majestic in 1928	31/33 bld du Temple	31/33 bld du Temple	Paris	75003	48.8654256000000018	2.36532810000000016	Barrabas Week 1, 1920	Les Deux Gamines, Week 2	\N	\N
48	Béranger Cinéma	0101000020E6100000E521F88491E302400572E4DC816E4840	Public showers in 1899. Joret cinéma  in 1919. Maison Commune, American Cinéma 1907-1918. Béranger Cinéma in 1922, 1926	1907. building permission 1918.	\N	49 rue de Bretagne	49 rue de Bretagne	Paris	75003	48.8633381	2.36111739999999992	\N	Les Deux Gamines, Week 2	Yes	\N
49	Palais des fêtes	0101000020E6100000EA9F96D52AD00240486DE2E47E6E4840	3hrs of spectacle in 1910	1910	\N	8 rue aux ours (Bld Sébastopol, 199 rue saint-martin)	8 rue aux ours	Paris	75003	48.8632474999999999	2.35164419999999996	Barrabas Week 1	Les Deux Gamines, Week 1	Yes	\N
50	Cinématographe des adrets	0101000020E6100000CA3D135097DB0240E8C479933A6F4840	Cinéma-concert Alexandrette in 1910, formerly Café Auberge des Adrets. In 1930s becomes Théâtre Porte Saint Martin	exists 1910, 1911, 1913 and into 1920s	\N	14 bld Saint Martin	14 bld Saint Martin	Paris	75003	48.8689751000000001	2.35722219999999982	\N	\N	\N	\N
51	Cinéma Saint-Paul	0101000020E6100000229FFC8282E70240D305ABA0586D4840	inaugurated 24 Dec 1915 (Meusy, p 528) exists 1916, 1928	5837	\N	73 rue saint-antoine	73 rue saint-antoine	Paris	75004	48.8542672000000024	2.36304189999999981	\N	\N	\N	\N
52	Cinéma des familles	0101000020E6100000B1B49D00D4DE0240C1B79F42646D4840	1922 annuaire	\N	\N	1 rue de Fourcy	1 rue de Fourcy	\N	75004	48.8546222000000014	2.35880279999999987	\N	\N	\N	\N
53	Cinéma de l'Hôtel de Ville	0101000020E6100000A2AC29DA66D40240EFD00BD2E76D4840	Permis de construire 19 March 1920 by Goldberg, Lichtenberg, Vergnes	1913. Or 1911 (Meusy)	exists in 1926, 1928	20 rue du Temple	20 rue du Temple	Paris	75004	48.8586371000000028	2.35371180000000013	Barrabas, Week 1	Les Deux Gamines, Week 2	Yes	\N
54	Magic Cinéma Palace	0101000020E6100000E621533E04750240E0D74812846D4840	Ciné-Magic (Palace) 1919- 1922	\N	\N	28 ave de la Motte Piquet	28 ave de la Motte Piquet	Paris	75005	48.8555929999999989	2.30713699999999999	Barrabas, Week 1	Les Deux Gamines, Weeks 4 +	\N	Yes
55	Cinéma Saint-Michel	0101000020E6100000813FFCFCF7C00240B05417F0326D4840	same name 1917	4353	22/12/11	7 Place St. Michel	7 Place St. Michel	Paris	75005	48.8531169999999975	2.34422299999999995	\N	Week 1, Les Deux Gamines	\N	\N
56	Monge Palace	0101000020E61000003C88F8E2E6CF02401640E7244A6C4840	exists 1937	\N	\N	34 rue Monge	\N	Paris	75005	48.8460127000000028	2.35151459999999979	\N	\N	\N	\N
57	Coquet Cinéma	0101000020E61000009A5C8C8175BC02404298DBBDDC6B4840	ex- cinéma des ursulines	later studio des ursulines	opens around 1913 (Meusy, 528)	10 rue des Ursulines	10 rue des Ursulines	Paris	75005	48.8426740000000024	2.34202099999999991	\N	Les Deux Gamines, Weeks 4 +, 1921	\N	\N
58	Cinéma Linné	0101000020E6100000AE9AE7887CD70240319413ED2A6C4840	Linné from July 1920	\N	\N	12 rue Guy de la Brosse	\N	Paris	75005	48.8450599999999966	2.35521799999999981	Barrabas, Week 1, 1920	Les Deux Gamines, Weeks 4 +, 1921	\N	\N
59	Cinéma Pathé Cluny	0101000020E6100000E50AEF7211BF0240CB30EE06D16C4840	Programmes in Comoedia July 1914	1913	Cluny in 1928	60 rue des écoles	60 rue des écoles	Paris	75005	48.8501290000000026	2.34329499999999991	Barrabas, Week 1, 1920	Les Deux Gamines, Week 1, 1921	\N	\N
60	Magic Cinéma	0101000020E6100000B5C35F9335CA02403430F2B2266C4840	with attractions in 1920	Ciné-Latin in 1928 for "afficianados" (Cinémagazine, 19 Oct 1928)	opened 1911 (Meusy, p. 528)	12 rue Thouin	12 rue Thouin	Paris	75005	48.8449310000000025	2.34873500000000002	\N	Les Deux Gamines, Weeks 4 +, 1921	\N	\N
118	Eldorado-Cinéma	0101000020E6100000FCC56CC9AAE80240EC2FBB270F6F4840	exists wartime and 1924	place de la république	\N	\N	\N	\N	\N	48.8676499999999976	2.36360700000000001	\N	\N	\N	\N
61	Danton-Cinéma-Palace	0101000020E610000094BDA59C2FB6024096D1C8E7156D4840	Danton Palace 1926,  1937	1920	11/11/1920 with Léon Brézillon present	99-101 bld saint germain, carrefour de l'Odéon	99-101 bld saint germain	Paris	75005	48.8522310000000033	2.33895799999999987	\N	Les Deux Gamines, Week 1, 1921	\N	\N
62	Chez nous	0101000020E61000009AD8D7158ECB02402ED0494AD56B4840	Chez Nous until early Jan 1923, then becomes "La Maison pour tous" (BMPVP, 5 Jan 1923)	opened in 1920 or 1921 (BMPVP, 5 Jan 1923	not in Meusy so after 1918	76, rue Mouffetard	76, rue Mouffetard	Paris	75005	48.8424466000000024	2.34939210000000021	\N	\N	Yes	\N
63	Cinéma du Panthéon	0101000020E610000091819774EFBC0240F18FAD1D7B6C4840	Programmes in Comoedia July 1914. Ex-Omnia Victor Cousin. Opens early 1907 (Meusy, p. 528)	Still exists 1937	Listed in 1909 Annuaire des artistes..	13 rue Victor Cousin	13 rue Victor Cousin	Paris	75005	48.8475072000000026	2.34225359999999982	\N	\N	\N	\N
64	La Mésange	0101000020E6100000E910381268D002404A09C1AA7A6C4840	exists as la mésange in 1911, 1914 and still in 1928	previously église du père Hyacinthe	called Cinéma Pathé 1918	3-5 rue d'Arras	5 rue d'Arras	Paris	75005	48.8474934999999988	2.35176100000000021	\N	\N	\N	\N
65	Tournon	0101000020E61000002334DD465EB10240FA08FCE1E76C4840	(Concert rouge 1899, 1911, 1914, oct 1920)	exists 1920 JCC 25/06/20 says matinée dimanche seulement	\N	6 rue Tournon	6 rue de Tournon	Paris	75006	48.8508264999999966	2.33660559999999995	\N	\N	\N	\N
66	Étoile Cinéma	0101000020E6100000F7E6374C34C8024049E87816CE6C4840	A catholic cinema with branches in Lyon, Toulouse and Strasbourg (Études / publiées par les pères de la compagnie de Jesus, July 1923)	\N	\N	49 bld Saint Germain	49 bld Saint Germain	Paris	75005	48.8500392999999988	2.34775599999999995	\N	\N	\N	\N
67	Théâtre du Vieux Colombier	0101000020E6100000C4E0AB6752A40240D412865C046D4840	exists 1926, 1928	Opened as cinema 14 Nov 1924 (Cinéa, 1 Nov 1924)	\N	21 rue du Vieux Colombier	21 rue du Vieux Colombier	Paris	75006	48.8516955999999993	2.33023530000000001	\N	\N	\N	\N
68	Raspail Palace	0101000020E6100000DD3F16A243A00240D7C22CB4736C4840	exists nov 1913 as Raspail Palace. 1913 (le magasin pittoresque). Programmes in Comoedia July 1914	The cercle internationale des arts founded by Paul Bornet with exhibitions (Les Temps nouveaux, 1 April 1911). 1906 until early 191 (Air France, 1965)	Cinéma Raspail in 1920 and 1928	91 bld Raspail	91 bld Raspail	Paris	75006	48.8472810000000024	2.32825399999999982	Week 1, Barrabas, March 1920	Week 2, Les Deux Gamines, 1921	\N	\N
69	Grand Cinéma Bosquet	0101000020E6100000DC172BC5E96F02408533AE6EAB6D4840	Grand Cinéma Bosquet in 1927 and 1937	Cinéma Bosquet in 1918	Grand-Cinéma-Aubert in Oct 1928	55-59 ave Bosquet	55-59 ave Bosquet	Paris	75007	48.8567942000000031	2.30464510000000011	\N	\N	\N	\N
70	Cinéma Bosquet	0101000020E61000000DE9A683AB720240232C2AE2746D4840	programmes in Ciné pour tous	exists 1914. 1922, 1923	Programmes 1923 in Le Petit Parisien	83 Ave Bosquet	83 Ave Bosquet	Paris	75007	48.8551294999999968	2.3059911999999998	\N	\N	\N	\N
71	Cinéma Sainte Anne	0101000020E610000075AE282504CB0240761A69A9BC694840	Cinéma Saint-Bernard in 1920	Cinéma Sainte-Oeuvre Humanité 6 June 1919	Cinéma Sainte Anne in 1928	23 rue Martin Bernard	23 rue Martin Bernard	Paris	75007	48.8260700000000014	2.34912900000000002	Barrabas, week 1, 1920	Les Deux Gamines,Weeks 4 +, 1921	Yes	\N
72	Cinéma Pompadour	0101000020E61000005107C3CAB29102401C8C22B59A6D4840	CPT 1920 programmes	« Spectacle exclusivement réservé aux familles qui peuvent sans crainte amener leurs enfants(JCC, 24 déc 1920).	\N	91 rue de Grenelle (angle de la rue du bac)	\N	Paris	75007	48.8562837999999999	2.32114179999999992	\N	\N	\N	\N
73	Sèvres Cinéma	0101000020E610000018B6C1E4A18A024077BD3445806C4840	permis de construire by Guido, del Valle and Prinvault 17 mai 1923	Sèvres Palace in 1926, 1928	\N	12 avenue Daniel-Lesueur et 80 bis rue de Sèvres	\N	Paris	75007	48.8476645000000005	2.31769159999999985	\N	\N	\N	\N
74	Cinéma Hortensia	0101000020E6100000965E9B8D959802407FC39F3C876D4840	later Mimosa	\N	\N	84 rue de Grenelle	84 rue de Grenelle	Paris	75007	48.8556895999999981	2.32450400000000013	\N	\N	\N	\N
75	Dominique Cinéma	0101000020E6100000741B1E0C86740240B9E3A837FE6D4840	1922 annuaire	\N	\N	99 rue Saint-Dominique	99 rue Saint-Dominique	Paris	75007	48.8593205999999967	2.30689630000000001	\N	\N	\N	\N
76	Magic City	0101000020E61000004B13002DA76E024013C1EE2A5A6E4840	1914 and still in 1922 annuaire	\N	75 quai d'orsay in July 1914	67-91 Quai d'Orsay	67-91 Quai d'Orsay	Paris	75007	48.8621266999999975	2.30402979999999991	\N	\N	\N	\N
77	Ciné-Magic	0101000020E61000009BFE918E177702406E7E0DD29D6D4840	Ciné-Magic in Dec 1916 and 1923, Magic Palace in 1926, 1928	\N	\N	28 ave de la Motte Picquet (also a cinema at 18 called Palace?)	28 ave de la Motte Picquet	Paris	75007	48.8563788000000017	2.30815040000000016	\N	\N	\N	\N
78	Cinéma Récamier	0101000020E6100000E133C813F79E024073A5F9BE136D4840	opened 31 Dec 1910, same name 1928, 1933	\N	Ligue de l'enseignement rented the cinema out to private exhibitor	3 rue Récamier	3 rue Récamier	Paris	75007	48.8521651000000006	2.32761970000000007	week 1 Barrabas, Match 1920	\N	\N	\N
79	Cinéma de la Pépinière	0101000020E610000088F19A5775960240E17EC00303704840	still exists 1937	4505	opposite the gare saint lazare	9 rue de la Pépinière (or 8?)	9 rue de la Pépinière	Paris	75008	48.8750920000000022	2.32346599999999981	\N	Les Deux Gamines, Week 1, 1921	\N	\N
80	Alcazar d'été	0101000020E610000064AE0CAA0D8E02408A969757096F4840	Comoedia 16 June 1921	outdoor cinema in summer	Listed in 1909 Annuaire des artistes..as "Établissement d'été"	8 Avenue Gabriel	\N	Paris	75008	48.8674725999999993	2.31936199999999992	\N	\N	\N	\N
81	Le Bon Cinéma	0101000020E6100000D4F9A69F2679024006B6EFF6C56E4840	opens May 1913 La Croix, (31 May 1913)	1922 annuaire	\N	10 rue François 1er	10 rue François 1er	Paris	75008	48.8654164000000009	2.30915569999999981	\N	\N	\N	\N
82	Madeleine Palace	0101000020E6100000657A7885F49A0240971B0C75586F4840	Gaumont-Loew-Métro Théâtres Cinéma-Madeleine in 1927	Still exists 1928	\N	14 bld de la Madeleine	14 bld de la Madeleine	Paris	75008	48.8698869999999985	2.32566169999999994	\N	\N	\N	\N
83	Salle Gaveau	0101000020E6100000C156091687830240AD5FFAA8D06F4840	reported installed with cinema April 1921	\N	\N	45 rue de la Boétie	45 rue de la Boétie	Paris	75008	48.8735552999999996	2.31422250000000007	\N	\N	\N	\N
84	Théâtre des Champs-Élysées	0101000020E61000006E6704C01D6D0240089DC6ACCD6E4840	\N	\N	\N	15 ave Montaigne	\N	Paris	75008	48.8656517000000008	2.30327940000000009	\N	\N	\N	\N
85	Le Colisée	0101000020E6100000D847A7AE7C760240B25B15F2526F4840	publicity material at CF	Théâtre du colisée in 1915, 1918, colisée in 1928	Colisée cinéma 1913 (Comoedia, 5 Aug 1913)  and in 1914 annuaire.	38 ave des Champs-Élysées and rue du colisée.	38 ave des Champs-Élysées	Paris	75008	48.8697188000000011	2.30785499999999999	\N	\N	\N	\N
86	Delta Palace	0101000020E61000006C239EEC66C602404D327216F6704840	also 1928	11/1/1920 see JDCC 12 Nov 1920	\N	Place du Delta, 17 bld Rochechouart	17 bis, boulevard Rochechoua-rt	Paris	75009	48.8825100000000035	2.34687599999999996	\N	Les Deux Gamines, Week 1, 1921	\N	\N
87	(Cinéma des Nouveautés) Aubert Palace	0101000020E61000005CC3B1D3B4B002408D5830968E6F4840	Same spot as Théâtre des nouveautés (Le Petit Parisien, 16 May 1915).	opened 21/05/1915 as Cinéma des Nouveautés Aubert Palace with La Femme Nue. Still Aubert Palace in 1928 and 1937	built by établissements Jacopozzi (Le Matin and Le Journal, 8 May 1914). Opening slowed down by war declaration.	24 bld des Italiens	24 bld des Italiens	Paris	75009	48.8715388999999973	2.33628239999999998	Barrabas Week 1, 1920	\N	\N	\N
88	Artistic Cinéma Pathé	0101000020E61000008F82F11D46A20240F8E0B54B1B714840	publicity material at CF. BnF picture	Cinémagazine offered half price tickets to readers	still called Artistic in 1914, 1928, 1932	61 rue de Douai	61 rue de Douai	Paris	75009	48.8836455000000001	2.32923530000000012	\N	\N	\N	\N
89	Cinéma Pigalle	0101000020E6100000132A38BC20B2024089618731E9704840	exists 1916, 1920, 1928	Cinéma Pigalle Jan 1912	another at 6 place Pigalle?	11 place Pigalle	11 place Pigalle	Paris	75009	48.8821165000000022	2.33697650000000001	\N	\N	\N	\N
90	Pathé-Palace	0101000020E6100000CD5DA6817AAE02404CF3D8E08E6F4840	Cinéma Pathé in 1913-14, Pathé Palace in 1917	Caméo in 1927 and 1937	Called Le Helder in 1937. 34 bld des Italiens.	32 bld des Italiens, 62 rue du Helder	32bld des Italiens	Paris	75009	48.8715478000000019	2.3351945999999999	\N	\N	\N	\N
91	ciné-salon Robert Houdin	0101000020E610000010C41E7F0EB8024067BB9DD89E6F4840	Ciné-Salon in March 1920. Robert-Houdin in 1922 annuaire.	Showed La Plus Belle Femme de France	Séances permanentes 1 fr. in March 1920	8 bld des Italiens	8 bld des Italiens	Paris	75009	48.872035099999998	2.33987139999999982	\N	\N	\N	\N
92	Ciné-Opéra	0101000020E6100000F9B4D48BEBA90240EBD275977A6F4840	programmes in Ciné pour tous 6 Dec 1919	\N	\N	8 bld des Capucines	8 bld des Capucines	Paris	75009	48.8709287000000003	2.33296880000000018	\N	\N	\N	\N
93	American Theater	0101000020E6100000BEC7F4DFDEB00240014576EFF2704840	American cinema in 1922 annuaire	American Theater in 1913 (Comoedia, 5 Aug 1913)	\N	23 bld de Clichy	\N	Paris	75009	48.8824138000000019	2.33636260000000018	\N	\N	\N	Yes
94	Cinéma des alliés	0101000020E6100000EB4669801CAE0240CE59FA2BBF704840	1922 annuaire	\N	\N	6 rue Fontaine	6 rue Pierre Fontaine	Paris	75009	48.8808341000000013	2.33501529999999979	\N	\N	Yes	\N
95	Ciné Max Linder	0101000020E61000002CD269824DC20240BFC062C3896F4840	authorization given 1917	A cinema called Kosmorama in 1913 (Comoedia, 5 Aug 1913) still ciné max linder in 1923 and 1937	open 17 Dec 1914  (Le Petit Parisien, 15; 20 Dec 1914)	24 bld Poissonnière	24 bld Poissonnière	Paris	75009	48.8713916999999967	2.34487440000000014	\N	\N	\N	\N
96	Novelty	0101000020E6100000CF08803B9AB40240D56A5908BC6F4840	Called the American Biograph in  July 1913 and Novelty In 1917. In Comoedia 24/09/1920 and in Carnet de la Semaine (1 July 1917)	Showed only Jeanne d'arc and Fatty when first opened	Opens 2 Dec 1911 (Meusy, 529)	Called Kino Plastikon à American Biograph. 2pm - 12am en continu (Comoedia, 16 March 1914)	19 rue le Peletier	Paris	75009	48.8729257999999973	2.33818480000000006	\N	\N	\N	\N
97	Mogador Palace	0101000020E6100000A91A18D412A60240B756C56526704840	publicity material at CF. Exists 1922 annuaire.	exists 1917 as a theatre	Opens 15 nov 1919 with La sultane de l'amour (Comoedia, 5 nov 1919)	75 rue Mogador	75 rue de Mogador	Paris	75009	48.8761718000000016	2.33109060000000001	\N	\N	\N	\N
98	Ciné du petit journal	0101000020E6100000030EFC0340C00240512FF83427704840	\N	\N	\N	21 rue Cadet	\N	Paris	75009	48.8761964999999989	2.34387210000000001	\N	\N	\N	\N
99	Brunin Cinéma	0101000020E6100000FB31F7DA7DF80240F5EC03DA676F4840	Brunin Cinéma Pathé in 1915, Brunin in 1918, and Cinéma Pathé in1919. Cinéma-Palace Temple in Dec 1919. Brunin Cinéma in 1921	Former Concert Brunin	Pathé Temple in Jan 1921	77 faubourg du temple	77 rue du faubourg du temple	Paris	75010	48.8703568000000033	2.37133379999999994	\N	\N	\N	\N
100	Pathé-Journal	0101000020E61000001B800D8810D7024050357A35406F4840	publicity material at CF	1922 annuaire.	\N	6 faubourg St. Denis	6 bld st. denis	Paris	75010	48.8691469999999981	2.35501199999999988	\N	\N	\N	\N
101	Louxor	0101000020E61000005E7DE13A6BCC02406A6B44300E714840	Permis de construire by Silberberg 7 Jan 1920	exists 1928	\N	170 boulevard Magenta	170 boulevard de Magenta	Paris	75010	48.883245500000001	2.34981390000000001	\N	\N	\N	\N
102	Cinéma	0101000020E6100000B32D5E87C5D30240A26EB1EC936F4840	1922 annuaire	\N	\N	47 faubourg st. denis	47 rue du faubourg st. denis	Paris	75010	48.8717017999999968	2.35340410000000011	\N	\N	\N	\N
103	Pucch	0101000020E6100000CAD69F692EDC0240AB460AC09A704840	In 1914 annuaire as "cinéma artistique"	Pucch in 1922 annuaire.	\N	168 faubourg st. denis	168 rue du faubourg st. denis	Paris	75010	48.8797226000000009	2.35751039999999978	\N	\N	\N	\N
104	Tivoli Cinéma	0101000020E61000007EA3C27D89ED024005E91846306F4840	opened a "jardin d'été" in Aug 1920 (Comoedia, 6 aug 1920)	\N	also listed 16 rue de la Douane	17-19 Faubourg du Temple and 14 rue de la Douane	19 rue du Faubourg du Temple	Paris	75010	48.8686606999999995	2.36598489999999995	\N	\N	\N	\N
105	Cinéma Théâtre du Château d'eau	0101000020E6100000A96917D34CD70240367689EAAD6F4840	still exists 1926, 1928 as Cinéma du Château d'eau	Cinéma Théâtre du Château d'eau in 1921. 1922 annuaire.	\N	61 rue du Château d'eau	61 rue du Château d'eau	Paris	75010	48.8724950000000007	2.35512699999999997	\N	Week 2, Les Deux Gamines, 1921	\N	\N
106	Cinéma Saint Martin	0101000020E6100000B8CA13083BE50240BC3FDEAB56704840	Cinéma Saint Martin in 1921, 1926	\N	\N	29-31 bis  rue du Terrage	31 rue du Terrage	Paris	75010	48.8776450000000011	2.36192899999999995	Week 1 Barrabas March 1920	Les Deux Gamines Week 2, 1921	\N	\N
107	Cinéma Parmentier	0101000020E6100000C66CC9AA08F70240020CCB9F6F6F4840	Permis de construire Société Cinéma exploitation 4 Oct 1907. Still cinéma parmentier in 1926.	1907	In Meilleurs Cinémas 8/8/1919	156-158 Ave Parmentier	158 Ave Parmentier	Paris	75010	48.870593999999997	2.37062200000000001	Week 1 Barrabas March 1920	Les Deux Gamines Week 2, 1921	\N	\N
108	Cinema(tographe) de la Porte St. Denis	0101000020E6100000C701AA6EE4D00240102ACCD6556F4840	or Porte Sain- Denis	Ciné Saint-Denis in 1923. called Saint-Denis in 1937	In 1914 annuaire as Cinéma-Théâtre de la Porte Saint Denis	8 Bld Bonne Nouvelle	8 Bld de Bonne Nouvelle	Paris	75010	48.8698071000000027	2.35199820000000015	\N	\N	\N	\N
109	Paris-Ciné	0101000020E610000069D3C732B3D5024033B044566D6F4840	1914, 1923, 1928	Scala 13 bld de Strasbourg in 1937.	Still Paris-Ciné in 1926.	17 boulevard de Strasbourg	17 boulevard de Strasbourg	Paris	75010	48.8705241999999984	2.3543457000000001	\N	\N	\N	\N
110	Excelsior-Palace	0101000020E6100000F009230736E8024086CB852579704840	1923, 1924	exists 1926-1937	Excelsior-Pathé in 1937	23 rue Eugène Varlin	\N	Paris	75010	48.8786970999999966	2.36338429999999988	\N	\N	\N	\N
111	Crystal (Cristal) Palace Cinéma	0101000020E6100000447122556FD80240AB459FEAEB6F4840	exists 1916, 1917, 1920 with attractions. Crystal in 1924, 1926, 1928	\N	\N	96, Faubourg St. Denis	9 Rue de la Fidélité	Paris	75010	48.8743870999999999	2.35568109999999997	\N	\N	\N	\N
112	Palais des glaces	0101000020E6100000AEA877A7F1F1024071DF0FE4456F4840	Permis de construire in name of Heidet 2 February 1920	Still cinema Palais des glaces in 1928	\N	37 rue du Faubourg-du-Temple	\N	Paris	75010	48.8693203999999994	2.36813669999999998	\N	\N	\N	\N
113	Cinéma-Théâtre Folies-dramatiques	0101000020E61000003C33C170AEE10240DE1FEF552B6F4840	becomes cinema in October 1915, still exists 1937. Called Innovation in 1922 annuaire.	Oct-15	22/10/15	40 rue de bondy	40 rue rené boulanger	Paris	75010	48.8685100000000006	2.36019600000000018	Week 1, Barrabas, March 1920	Week 1, Les Deux Gamines, 1921	\N	\N
114	Cinéma-Palace	0101000020E61000007F3D152642C90240180EDF1D746F4840	1911-1920 called Cinéma-Palace. Boulvardia in 1928, 1937	1907	Programme in Le Gaulois from March 1916	42 bld Bonne Nouvelle	42 bld Bonne Nouvelle	Paris	75010	48.8707311000000004	2.34827070000000004	\N	\N	\N	\N
115	Cinémax	0101000020E6100000829F820D99CC0240E70D411F766F4840	Cinémax belongs to Georges Lordier (10/07/29 Comoedia)	exists 1920	Cinémax in 1914 annuaire. Also in 1915, and 1922. then Carillon in 1926, 27 and 28	30 bld Bonne Nouvelle	30 bld de Bonne Nouvelle	Paris	75010	48.870792299999998	2.34990129999999997	\N	\N	\N	\N
116	Folies dramatiques	0101000020E6100000E5F857456EDC0240C048C3842C6F4840	exists as cinema Dec 1914	Programme in Le Matin Nov 1916	Programme in Le Gaulois from March 1916. In Le Petit Parisien  1 Aug 1915.	37 bld saint-martin	37 bld saint-martin	Paris	75010	48.8685461000000032	2.35763219999999984	\N	\N	\N	\N
117	Ciné-Parodi	0101000020E61000009BA9108FC4EB0240C009E0C1AA704840	called Étoile Parodi in 1928	\N	\N	rue Alexandre Parodi	20 rue Alexandre Parodi	\N	75010	48.8802110999999968	2.36512099999999981	\N	\N	\N	\N
119	Excelsior	0101000020E6100000F8F9EFC16B17034050E09D7C7A6E4840	Excelsior-Cinéma-Music-Hall	Jan-11	22/1/11	105 ave de la république	105 ave de la république	Paris	75011	48.8631129999999985	2.38643599999999978	Barrabas, Week 1, March 1920	Les Deux Gamines, Week 1	\N	\N
120	Cinéma Soleil	0101000020E61000008DB5BFB33DFA0240CEFFAB8E1C6D4840	strikes and serials	\N	\N	41 Faubourg Saint Antoine	41 Faubourg Saint Antoine	Paris	75011	48.8524340000000024	2.37218799999999996	\N	Les Deux Gamines, Week 2	Yes	\N
121	Cinéma Cyrano	0101000020E6100000AFEDED96E4000340CA349A5C8C6D4840	Cyrano in 1922, 1926. Grand cinéma théâtre de la roquette 1925?	1912	In 1914 annuaire Cinéma Colonnes at 78 rue de la roquette. Same?	76 rue de la roquette	76 rue de la roquette	Paris	75011	48.8558459999999997	2.3754360000000001	Barrabas Week 1	Les Deux Gamines Week 1	\N	\N
122	Triomphe / Triumph Cinéma	0101000020E61000004BAB21718F25034080D8D2A3A96C4840	1917 same name	Oct-13	14/2/13 opens. Still open 1928. 9/10/2016 (reopening)	315 Faubourg Saint-Antoine	315 Faubourg Saint-Antoine	Paris	75011	48.8489270000000033	2.3933399999999998	Barrabas Week 1	Les Deux Gamines Week 1	\N	\N
123	Casino de la Nation	0101000020E6100000C1745AB7412D0340AC58FCA6B06C4840	\N	1912 devotes itself to cinema	ticket price increase 1912	2, bis ave de Taillebourg	2, ave de Taillebourg	Paris	75011	48.849141000000003	2.39709800000000017	\N	Les Deux Gamines Week 1	\N	\N
124	Magic Ciné / Ciné Magic	0101000020E61000001D90847D3B0903405F7F129F3B6D4840	Ciné Majic in 1922 annuaire	\N	\N	70 rue de Charonne	70 rue de Charonne	Paris	75011	48.8533820000000034	2.37950799999999996	Barrabas Week 1	Les Deux Gamines Week 2	\N	\N
125	Artistic Cinéma	0101000020E61000009A71642F250C03401283C0CAA16D4840	programmes in JDCC 1920. In 1922 annuaire.	In 1914 annuaire as "Dehuysser, Pertus et Klein"	Same name 1913 (Comoedia, 5 Aug 1913)	45 bis rue Richard Lenoir	45 rue Richard Lenoir	Paris	75011	48.8564999999999969	2.38093030000000017	\N	\N	yes	\N
126	Voltaire-Aubert-Palace	0101000020E610000079909E2287080340DDB243FCC36D4840	Opened 1 October 1920 (Comoedia)	called  Cinéma Plaisir in 1916, Grand Cinéma Plaisir in 1920. Cinéma plaisir in 1922 annuaire.	Voltaire-Aubert-Palace 1926, 1928	95 bis rue de la roquette	95 rue de la roquette	Paris	75011	48.8575434999999985	2.37916399999999983	\N	\N	\N	\N
127	Cirque d'hiver (Cinéma Pathé)	0101000020E61000000536E7E099F00240CFBA46CB816E4840	Cinéma-exploitation rented it from 1909. 1915 forced to pay back rent (Le Petit Parisien, 25 Nov 1915) 1913, 1920	Cirque d'hiver Cinéma Pathé 1913-1917. Called "Palace" in March 1914	Listed in 1909 Annuaire des artistes.. As "Cinéma-Exploitation (Ancien Cirque d'Hiver)"	bld des filles du calvaire /place Pasd loup	Called Cirque d'hiver cinéma Pathé with soirées et matinées (Comoedia, 4 Feb 1908) Opened 28 Dec 1907 as a Pathé cinema (Comoedia, 20 Dec 1907)	Paris	75011	48.8633359999999968	2.36748100000000017	\N	\N	\N	\N
128	Cinéma du Commerce	0101000020E6100000AEA877A7F1F1024071DF0FE4456F4840	Opens 1921?	Now the Théâtre de Belleville	\N	94 faubourg du temple	94 rue du faubourg du temple	Paris	75011	48.8693203999999994	2.36813669999999998	\N	\N	\N	\N
129	Karcher Cinéma	0101000020E610000060DE2DDA2D0303404A157B1E926F4840	Called Brasserie Karcher in 1919. Karcher cinema in 1922 annuaire.	\N	\N	124 faubourg du temple	124 rue du faubourg du temple	Paris	75011	48.8716466999999994	2.37655230000000017	\N	\N	\N	\N
130	Modern	0101000020E6100000DBB9D51819F90240911216702A6F4840	1922 annuaire	\N	\N	4 rue Auguste Barbier	\N	Paris	75011	48.8684826000000001	2.37162989999999985	\N	\N	\N	\N
131	Eden Concert	0101000020E610000011E2CAD93B030340D93F4F03066D4840	In 1912 had screenings after music hall programme	1912-1913	Eden Concert in 1914 annuaire.	94 ave Ledru Rollin	\N	Paris	75011	48.8517459999999986	2.376579	\N	\N	Yes	\N
132	Consortium	0101000020E6100000B96FB54E5CEE0240BFB51325216F4840	In 1914 annuaire as Consortium Cinéma. Pathé-Consortium-Cinéma in 1921?	Becomes a music hall in 1922	1912	18 faubourg du temple	18 rue du faubourg du temple	Paris	75011	48.8681989999999971	2.36638700000000002	\N	\N	Yes	\N
133	Voltaire Palace	0101000020E610000072D014F021F702406F9C14E63D6D4840	open around March 1920 Ciné pour tous	owned by L. Aubert	\N	8 rue de la roquette	\N	Paris	75011	48.8534514999999985	2.37067020000000017	\N	\N	\N	\N
134	Cinéma Saint-Sabin	0101000020E61000002857C224A6F50240D9C7AFC4A86D4840	\N	\N	\N	27 rue Saint-Sabin	27 rue Saint-Sabin	Paris	75011	48.856712899999998	2.36994579999999999	\N	\N	\N	\N
135	Cinéma de l'Univers	0101000020E61000008ACC5CE0F2180340D882DE1B436E4840	Populaire de l'Univers in 1920	Cinéma de l'Univers in 1922 annuaire.	\N	53 bld Menilmontant	\N	Paris	75011	48.861423000000002	2.38718200000000014	\N	\N	\N	\N
136	Succès Palace / Taine Palace	0101000020E6100000B6BFB33D7A230340263ACB2C426B4840	Bercy Palace until 1918. Then from 1918, 1921, 1923 Succès Palace. Still Succès Palace in March 1924. Then Taine Palace in Autumn 1924, 1926, 1937	1910?	\N	14 rue Taine	14 rue Taine	Paris	75012	48.8379570000000029	2.3923230000000002	\N	Les Deux Gamines, Week 1, 1921	\N	Yes
137	Lyon Palace	0101000020E61000004A438D4292F902400798F90E7E6C4840	November	1919	not open yet in Feb 1920 ..still exists 1926, 1928	12 rue de Lyon	12 rue de Lyon	Paris	75012	48.8475970000000004	2.371861	\N	Les Deux Gamines, Week 1, 1921	\N	\N
138	Cinéma Rambouillet	0101000020E61000008330B77BB90F0340200C3CF71E6C4840	still exists 1917,1924, 1926, 1928	\N	\N	12 rue de Rambouillet and place rambouillet	12 rue de Rambouillet and place du colonel-bourgoin	Paris	75012	48.8446950000000015	2.38267799999999985	\N	\N	Yes	\N
139	Cinéma Daumesnil	0101000020E6100000CD89E2FA1C340340DB3E9AA03C6B4840	In 1914 annuaire as Daumesnil (Cinématographe). Cinéma Société in Dec 1915 and 1916	Still exists 1926, 1928 as Daumesnil Palace	Cinéma Stow in 1926 (13-20 Aug Cinémagazine)	216 ave Daumesnil	216 ave Daumesnil	Paris	75012	48.8377876999999998	2.4004458999999998	Week 1 Barrabas March 1920	\N	\N	Yes
140	Bonbonnière	0101000020E6100000D2510E6613000340758AFAC9BD6C4840	called Modern Cinéma in jan 1917 and Bonbonnière in Feb 1917 and 1922 annuaire.	called salle François-Coppée in Jan 1916 and Modern Cinéma in Dec 1916.	\N	48 rue traversière,  9 rue de Prague	48 rue traversière,  9 rue de Prague	Paris	75012	48.8495418999999984	2.37503699999999984	\N	\N	\N	\N
141	Cinéma des familles	0101000020E61000006205099B4B2B0340519DB3AACA6A4840	1922 annuaire	\N	\N	13 rue des jardiniers	13 rue des jardiniers	Paris	75012	48.8343099000000009	2.39614029999999989	\N	\N	\N	\N
142	Nouveau cinéma	0101000020E6100000E2444F255EF9024039793650856C4840	Grand Cinéma in 1915, Cinéma de Lyon in 1914,1918, 1920, 1924. Nouveau-Théâtre-Cinéma in 1926. Nouveau cinéma in 1922 annuaire.	Called Nouveau théâtre in 1919 CPT	called Cinéma-Concert in 1913 (Ordonnances et arrêtés émanés du Préfet de police). Called Buisson in 1914 Annuaire.	18 rue de Lyon	18 rue de Lyon	Paris	75012	48.8478184000000013	2.37176160000000014	Week 1 Barrabas March 1920	\N	\N	\N
143	Palais du trône	0101000020E61000003DCC03FD2A250340B9347EE1956C4840	1922 annuaire	\N	\N	133 Bld Diderot	\N	Paris	75012	48.8483239999999981	2.39314839999999984	\N	\N	\N	\N
144	Cinéma Saint-Antoine	0101000020E6100000682E26EC910C034010D9F62CBE6C4840	1922 annuaire	\N	\N	39 rue de citeaux	39 rue de citeaux	Paris	75012	48.8495537000000013	2.38113770000000002	\N	\N	Yes	\N
145	Cinéma Jeanne d'Arc	0101000020E6100000DA379C9E1CDA0240192AB5CD436B4840	JDCC 11/02/21	In 1914 and 1922 annuaire. Still exists 1926,1928	Called Brocard-Cinéma- Jeanne d'Arc in 1924	45 bld Saint Marcel	45 bld Saint Marcel	Paris	75013	48.8380067000000011	2.3564999000000002	\N	\N	\N	\N
146	Cinéma Saint-Marcel	0101000020E6100000D811876C20DD0240BE1248895D6B4840	still exists 1926, 1929	1921	\N	67 bld Saint-Marcel, rue de la reine blanche 10-12	67 bld Saint-Marcel	Paris	75013	48.838791999999998	2.35797200000000018	\N	Week 1, Les Deux Gamines, 1921	\N	\N
147	Palais des Gobelins	0101000020E6100000BD4A880332D50240F01472A59E6A4840	still exists 1928	\N	\N	66 bis ave des Gobelins	\N	Paris	75013	48.8329664999999977	2.35409930000000012	\N	\N	\N	\N
148	Eden Cinéma	0101000020E6100000AE9D280989D4024013286211C36A4840	Eden Cinéma in 1914 annuaire. Eden Cinéma and Éden des Gobelins in 1920. Eden in 1926.	\N	Gobelins-Cinéma-Palace as 61 ave des Gobelins Comoedia (24/07/1914) showed Rocambole	57 ave des Gobelins	57 ave des Gobelins	Paris	75013	48.8340779999999981	2.35377700000000001	Week 1 Barrabas, March 1920	Week 2, Les Deux Gamines, 1921	\N	\N
149	Cinéma Clisson	0101000020E6100000456BA05456EE0240B7B3AF3C486A4840	In 1913, 1918 Ciné-National. In 1914 annuaire as Cinéma-Concert-National.	In 1922 annuaire as Cinéma Clisson.	\N	61, 63, 65 rue Clisson	\N	Paris	75013	48.8303294999999977	2.36637560000000002	\N	\N	Yes	Yes
150	Cinéma des Bosquets	0101000020E61000005307793D98F4024037FA980F086A4840	1920 or earlier Meusy	Nov 1920 exists. 1926, 1928 same name	exists in 1914 Annuaire	60 rue Donrémy and corner of rue Cantagrel, now rue Jean Colly	60 rue Domrémy	Paris	75013	48.8283709999999971	2.36943100000000006	Week 1 Barrabas March 1920	Week 2, Les Deux Gamines, 1921	Yes	Yes
151	Family Cinéma	0101000020E6100000DF35E84B6FDF02406A6CAF05BD694840	Cinéma Concert des familles in 1914 annuaire, 1920 and 1922 annuaire	Cinéma Tolbiac in 1912?	\N	141 rue de Tolbiac	\N	Paris	75013	48.8260810000000021	2.35909900000000006	Week 1 Barrabas March 1920	\N	\N	\N
152	Cinéma des Alpes	0101000020E6100000535DC0CB0CDB02409D836742936A4840	then Cinéma Excelsior	7 rue Fagon was Excelsior concert in 1913	Cinéma des Alpes in 1922 annuaire	3 rue Fagon	\N	Paris	75013	48.8326190000000011	2.35695800000000011	\N	\N	Yes	\N
153	Bobillot Cinéma	0101000020E61000005793A7ACA6CB0240DE150B8D71694840	exists 1914 Bobillot Cinéma	1922 annuaire.	\N	66 rue de la colonie	\N	Paris	75013	48.823777800000002	2.34943899999999983	\N	\N	\N	\N
154	Magic Cinéma	0101000020E61000003B730F09DF1B0340BE4AE3BCA46A4840	1921 annuaire	\N	\N	12 rue de Thorins	\N	Paris	75013	48.833152400000003	2.3886090000000002	\N	\N	\N	\N
155	Maison Blanche	0101000020E610000000CEE6CCD1DE02409917BBD80F694840	Madelon-Cinéma-Concert	Italie Cinéma in 1926	\N	174 ave d'Italie	174 ave d'Italie	Paris	75013	48.8207961000000026	2.35879860000000008	\N	\N	Yes	\N
156	Gobelins-Cinéma-Exploitation	0101000020E61000000D18247D5AD50240F59D5F94A06A4840	Cinéma des Gobelins in jan 1909	Pathé -Gobelins in 1926-7	\N	66 bis ave des Gobelins	now 68 ave des gobelins	Paris	75013	48.833025499999998	2.35417649999999989	\N	\N	\N	\N
157	Cinéma des Fleurs	0101000020E61000006596F37B51E10240376046674F6B4840	then American Cinéma	In 1914 annuaire as Cinéma-Théâtre-Saint-Marcel.	built by établissements Jacopozzi (Le Matin and Le Journal , 8 May 1914)	58 bld de l'hôpital	\N	Paris	75013	48.8383607000000026	2.36001869999999991	\N	\N	\N	\N
158	Modern Cinéma	0101000020E61000000B2EB18DD3DB024046B64EB7476A4840	called Casino in 1916, Modern Cinéma in 1917. Ciné-Modern in 1928.	In 1914 annuaire as "cinéma"	\N	190 ave de Choisy	\N	Paris	75013	48.8303135999999967	2.35733710000000007	\N	\N	\N	\N
159	Cinéma de la glacière	0101000020E61000006479573D60BE0240FC3559A31E6A4840	Cinéma de la glacière in 1914 and 1922 annuaire	1909	\N	106 rue de la glacière	\N	Paris	75013	48.8290599999999984	2.34295700000000018	\N	\N	Yes	Yes
160	Royal Cinéma	0101000020E610000078AC63A6FECB0240E7F1C528196B4840	Cinéma du Port-Royal in 1916, 1920	Still exists 1928 as Royal Cinéma	\N	11 bld Port-Royal	\N	Paris	75013	48.8367052999999984	2.34960680000000011	Week 1 Barrabas March 1920	\N	\N	\N
161	Cinéma Gaumont	0101000020E6100000327216F6B4D302404343B577FC6A4840	Gobelins Palace in 1917, Cinéma Gaumont in 1919. Gobelins Palace in 1922 annuaire.	\N	\N	37 ave des Gobelins	\N	Paris	75013	48.8358296999999979	2.35337249999999987	\N	\N	\N	\N
162	Cinéma de l'Univers / Univers Palace	0101000020E61000009146054EB6A1024033880FECF8694840	Univers-Cinéma-Théâtre in 1915, Univers Palace and Cinéma Univers in 1918. Univers cinéma in 1921. Univers in 1926.	Concert de l'Univers in 1912?	Univers Cinéma and Cinéma de l'univers in 1922 annuaire	42, rue d'Alésia	42, rue d'Alésia	Paris	75014	48.8279089999999982	2.32896100000000006	\N	Week 1 Les Deux Gamines 1921	\N	\N
163	Palais Montparnasse	0101000020E6100000A4FB3905F9990240F6D03E56F06B4840	Permis de construire by Ratel, Orlhac and Duron 26 April 1913	Nov-13	still exists 1926, 1928, 1933	3 rue d'Odessa	3 rue d'Odessa	Paris	75014	48.8432719999999989	2.32518199999999986	\N	Les Deux Gamines Week 1	\N	\N
164	Olympia Cinéma	0101000020E6100000A8DF85ADD98A024027D87F9D9B6A4840	Olympia cinema owned by Jacques Charles programmes in Comoedia July 1913, Olympia cinéma in 1924. Written as Olympic in 1922 annuaire.	1911	\N	10 rue Boyer-Barret	10 rue Boyer-Barret	Paris	75014	48.8328739999999968	2.3177979999999998	\N	Week 1, Les Deux Gamines, 1921	\N	\N
165	Orléans Palace, cinéma-théâtre	0101000020E6100000041C42959A9D0240676325E659694840	Cinéma de la Porte d'Orléans in 1920	Orléans Palace in 1922 annuaire	\N	100-102 bld Jourdan	100 bld Jourdan	\N	75014	48.8230560000000011	2.32695499999999988	Week 1, Barrabas, March 1920	Week 2, Les Deux Gamines, 1921	\N	\N
166	Maine Palace	0101000020E6100000FB592C45F2950240807F4A95286B4840	1922 annuaire	exists 1916	still exists 1926, 1937	93 -95 ave du Maine	or 97? Or 96?	\N	75014	48.8371759999999995	2.32321599999999995	\N	Week 3, Les Deux Gamines, 1921	\N	\N
167	Mille Colonnes	0101000020E6100000C1E7E2CA34950240608F8994666B4840	Programmes in Comoedia July 1914	open 1907-1930 (wiki)	Mille colonnes in 1909, 1926,  1928	20 rue de la gaîté	20 rue de la gaîté	Listed in 1909 Annuaire des artistes..	75014	48.8390679999999975	2.32285459999999988	Week 1 Barrabas March 1920	\N	\N	\N
168	Cinéma Pernety	0101000020E6100000F86F5E9CF88A0240C8FB276ECB6A4840	Still Pernety in 1922, 1926. Plaisance Cinéma in Oct 1928	\N	\N	46 rue Pernety	46 rue Pernety	Paris	75014	48.8343332000000032	2.31785700000000006	Week 1 Barrabas March 1920	\N	Yes	Yes
169	Régina-Aubert-Palace	0101000020E610000085663277889A02407ECFFEF62B6C4840	opens 4 April 1920 (JDCC, 20 Feb 1920)	authorisation in 1917, same name in 1928	changed name to Aubert in 1921 and still in 1941	155 rue de Rennes	155 rue de Rennes	Paris	75014	48.8450916999999976	2.32545560000000018	\N	\N	\N	\N
170	Montrouge Palace	0101000020E61000009758198D7C9E02400FB56D18056A4840	Permis de construire 15 June 1914	Société générale des grands cinémas in name of Rouillard	still exists 1928	73-75 ave d'Orléans	73-75 ave du Général Leclerc	Gaîté	75014	48.8282804999999982	2.32738600000000018	\N	\N	\N	\N
171	Théâtre de Montrouge	0101000020E61000006840BD19359F024000602B572E6A4840	ticket price increase 1912	still exists 1937	Opens Sept 1911 (Meusy, p 533)	70 ave d'Orléans	70 ave du général Leclerc	Paris	75014	48.8295391999999993	2.32773800000000008	\N	\N	\N	\N
172	Splendide	0101000020E6100000D113E0055B960240037F53B3626B4840	Splendide, 3 rue de la rochelle JDCC 11 Nov 1920. Casino-Cinéma in 1922 annuaire,	1910 location de films Ch. Roux et cie. Ex- American Kinetographopened 1907,(Meusy, 533)  exists 1911	called Brasserie de la gaîté in 1917. Splendide in 1926, 27, 28	35/31 rue de la gaîté and 3 rue de la rochelle	Gaîté in 1914, 1918, also Casino-Palace?	Paris	75014	48.8389495999999994	2.32341579999999981	\N	\N	\N	\N
173	Cinéma	0101000020E6100000C928852F02890240EF22A70AA1694840	JDCC 31 Dec 1920	In 1922 annuaire	\N	123 bld Brune	\N	Paris	75014	48.8252270999999993	2.31689869999999987	\N	\N	\N	\N
174	Idéal Cinéma	0101000020E61000006F34DB70B3930240D324C2D0346A4840	same name 1916, 1926 and 1922 annuaire.	Comoedia Théâtre in 1914 annuaire cinema list.	\N	114 rue d'Alésia	\N	Paris	75014	48.8297367999999992	2.32211960000000017	Week 1 Barrabas, March 1920	\N	\N	\N
175	Concert des Mousquetaires	0101000020E61000001A040C811295024078352F3D506B4840	1922 annuaire	\N	\N	77 ave du Maine	\N	Paris	75014	48.8383862000000022	2.32278919999999989	\N	\N	\N	\N
176	Vanves Cinéma Palace	0101000020E6100000EC0CF8A1778F0240F9A81A18D46A4840	Permis de construire for rdz 12 Dec 1907, still exists 1928. Vanves Cinéma Pathé in 1918.	By Société Cinéma-Exploitation	Cinéma Pathé in 1918	53 rue de Vanves	53 Rue Raymond Losserand	Paris	75014	48.8345976000000022	2.32005239999999979	\N	\N	\N	\N
177	Gaîté Palace	0101000020E61000001C9029C4C897024049B65FE39F6B4840	still exists 1926 same name	Gaîté Cinéma in 1921	\N	6-8 rue de la gaîté	6 rue de la gaîté	Paris	75014	48.8408169000000001	2.32411339999999988	\N	\N	\N	\N
178	Grand cinéme Lecourbe	0101000020E6100000E8A221E3516A02404F5DF92CCF6B4840	Cinéma Lecourbe in 1920 (from 1914) and Grand Cinéma Lecourbe in 1923. Still Lecourbe in 1926. Lecourbe -Pathé in 1929.	Opens 7 Feb 1913 (Meusy, p. 534) 1913. Company established  1914 Annuaire de commerce. Description of projection cabin moved from coulisses and screen enlarged (L'indépendant du Xve, 16 May 1914)	The Théâtre de la comédie mondaine, previously the artistic théâtre  reopens under dir. Charles Champagne on 14 May 1914  as "Cinéma-Music Hall" (L'indépendant du Xve, 2 May 1914)	115-119 rue Lecourbe	Cinéma-Concert in 1913	Paris	75015	48.8422600000000031	2.30191400000000002	Barrabas Week 1	Les Deux Gamines Week 1	\N	\N
179	Casino de Grenelle	0101000020E610000090769263A14C0240F19D98F5626C4840	1925, 1928	Casino de Grenelle-Javel in 1912 (Comoedia, 14 oct 1912)	Université populaire du Xve inaugurated 22 Nov 1899 (L'Union Coopérative, 1 Dec 1899)	83 ave Emile Zola	83 ave Emile Zola	Paris	75015	48.8467699999999994	2.28741720000000015	\N	\N	\N	\N
180	Grand Cinéma de Beaugrenelle	0101000020E6100000DA86F656C94C0240D6A7C1D9526C4840	Permis de construire 11 Aug 1920	Société des Grands Cinémas populaires (Jean Déchelette)2 floors	Grand Cinéma de Grenelle in 1922, 1928	86-88 ave Emile Zola	\N	Paris	75015	48.8462784000000028	2.28749339999999979	\N	\N	\N	\N
181	Grand Cinéma Lecourbe	0101000020E61000004698A25C1A5F02405305A3923A6B4840	Called Cinéma Convention in 1924-1928	1919	\N	27-29 rue Alain Chartier	\N	Paris	75015	48.8377249999999989	2.29643700000000006	\N	Week 1, Les Deux Gamines, 1921	Yes	\N
182	Central Cinéma Palace	0101000020E6100000C66E9F55664A0240D5777E51826C4840	Also St. Charles Palace. Cinéma Saint Charles in 1919.	Central Cinéma or Central Palace in 1914-1920	Saint-Charles  in 1928, Saint-Charles Pathé in 1930s	72 rue Saint Charles	72 rue Saint Charles	Paris	75015	48.847726999999999	2.28632800000000014	Week 1, Barrabas, March 1920	Week 2, Les Deux Gamines, 1921	\N	Yes
183	Splendid Cinéma Palace	0101000020E610000046E97706B263024070A82913C86C4840	permis de construire 18 June 1914 by Société Alexandra-Théâtre and 7 Aug 1919 by Messie	existed in Sept 1920	pathé cinema, then called Splendid Palace Gaumont in 1926,  1927.	60-62 ave de la Motte Picquet	60 ave de la Motte Picquet	Paris	75015	48.8498558000000003	2.29867940000000015	\N	\N	\N	\N
184	Cinéma Salon	0101000020E61000000D535BEA204F0240D34D6210586D4840	also Idéal cinéma in 1922 annuaire	In 1914 annuaire as Cinéma de la Passerelle de Passy	\N	2 bld de Grenelle	\N	Paris	75015	48.8542500000000004	2.28863700000000003	\N	Week 2, Les Deux Gamines, 1921	\N	\N
185	Folies Javel	0101000020E6100000B8CF85EC17470240003219332E6C4840	exists 1914, 1915, 1920, 1926	Called Javel in 1926	Folies-Javel and Javel-Cinéma in 1914 annuaire	109 bis rue st. Charles	109 rue St. Charles	Paris	75015	48.8451598999999987	2.2847135999999999	\N	\N	\N	\N
186	Suffren Palace	0101000020E61000000DC9247E20640240BA0908F7146D4840	Salle Prévost, 72 ave de Suffren was where the socialist party meetings were held in 1920	72 ave de Suffren listed in 1909 Annuaire des artistes..as "Établissement d'été" called Alcazar du Champs de Mars	1922 annuaire as Cinéma	74 ave de Suffren / 86 rue de la fédération	74 ave de Suffren	Paris	75015	48.8522023000000019	2.29889009999999994	\N	\N	\N	\N
187	Cinéma Cambronne	0101000020E6100000E1DFB1E9526D02403D258C0BAC6B4840	in 1914 annuaire. still exists 1937	Cinéma-Théâtre Cambronne programmes IL'Indépendant du Xve, 18 April 1914)	\N	100 rue Cambronne	\N	Paris	75015	48.8411879000000013	2.30338079999999978	\N	\N	\N	\N
188	Grenelle Aubert Palace	0101000020E6100000DE1335E2135C02401F1F3EFA706C4840	Permis de construire in name of Belloc 20 April 1920	Société française des Théâtres électriques	Opened 1921-22, same name 1928	141 avenue Emile-Zola (rue de commerce) et 44 rue Fondary	Corner of avenue Emile-Zola and rue Fondary	Paris	75015	48.8471977999999964	2.29495979999999999	\N	\N	\N	\N
189	Émile Zola	0101000020E6100000EA753007E65D02408D2958E36C6C4840	\N	\N	\N	161  avenue Emile-Zola	\N	Paris	75015	48.8470730000000017	2.29584890000000019	\N	\N	\N	\N
190	Grenelle Palace	0101000020E61000008C8A9356D75C024000868A16456C4840	Grenelle Palace in 1914, Pathé Grenelle in 1918.Grenelle-Pathé en juin 1920 and Grenelle Pathé Palace in 1926, 1928	Permis de construire 14 Aug 1907 by Cinéma-Exploitation and called Grenelle-Cinéma-Exploitation. Same in 1922 annuaire.	Théâtre de Grenelle in 1919	122 rue du théâtre	\N	Paris	75015	48.8458583999999973	2.29533260000000006	\N	\N	\N	\N
191	Cinéma Gallia	0101000020E610000076A8A624EB700240D24554F2FB6B4840	Gallia still in 1922,  1926	\N	\N	78 rue Lecourbe	78 rue Lecourbe	Paris	75015	48.8436262999999968	2.30513600000000007	\N	\N	\N	\N
192	Magique Convention Cinéma	0101000020E6100000DE99BFF858600240AE92D96A206B4840	Magique (or Magic) Cinéma (1911, 1915, 1918 and still in 1920), Magique Convention in 1926, 1928. Cinéma de la convention in 1921.	1911. Programme in L'Indépendant du Xve ( 21 March 1914)	Magique théâtre in 1914, then Pathé Magique Théâtre and Cinéma Magic Théâtre in 1923, still Magique in 1937	204-206 rue de la convention	204 rue de la convention	Paris	75015	48.8369268000000005	2.29704469999999983	\N	\N	\N	\N
193	Magic Théâtre	0101000020E61000007183EB9B45390240BB2473D1356C4840	In 1922 annuaire as no 24	\N	\N	2-4 rue de la convention	2 rue de la convention	Paris	75015	48.8453924000000015	2.2779647999999999	\N	\N	\N	\N
194	Vaugirard Cinéma	0101000020E6100000735996F9586B0240854F841E7B6B4840	\N	\N	\N	273 rue de Vaugirard	273 rue de Vaugirard	Paris	75015	48.8396947999999966	2.3024157999999999	\N	\N	\N	\N
195	Cinéma de Vaugirard	0101000020E6100000BED82038D379024071242B1AC66A4840	\N	\N	\N	35 rue Castagnary	35 rue Castagnary	Paris	75015	48.8341706000000002	2.30948490000000017	\N	\N	\N	\N
196	Ciné Magic	0101000020E61000008B3ED5D7A9680240E7069ED6C86C4840	\N	\N	\N	22 rue de la Motte Piquet (or 202?)	22 rue du Général-de-Castelnau	Paris	75015	48.8498791000000026	2.30110519999999985	\N	\N	\N	\N
197	Victoria	0101000020E6100000A8774C384F400240296101A7D26D4840	exists 1926, 1928	Victoria Hall in 1922 annuaire	\N	33 rue de Passy	33 rue de Passy	Paris	75016	48.8579910999999996	2.28140110000000007	\N	\N	\N	\N
198	Le Régent	0101000020E6100000D2EA9A7FAA400240E654D746E16D4840	Le Régent in 1921, 26 and 28	1920 Plus belle femme de France contest screened	exists in 1913 as Passy Cinéma Théâtre then Passy Cinéma in 1916, 1917	22 rue de Passy	22 rue de Passy	Paris	75016	48.8584373999999997	2.2815751999999998	\N	\N	\N	\N
199	Cinérama Théatre	0101000020E610000050920953EF44024008D6276F366F4840	Cinéo in 1918. Called Cinéo-Théâtre in 1922 annuaire and  Cinéo in 1923, 1924	Called Cines in 1914 annuaire.	\N	101 ave Victor Hugo	\N	Paris	75016	48.8688487000000009	2.28365960000000001	\N	\N	\N	\N
200	Cinéma Mirabeau	0101000020E610000054BEB1B15C3002404A73D0CA626C4840	1922 annuaire	\N	\N	71 ave de Versailles	\N	Paris	75016	48.8467648999999966	2.2736143000000002	\N	\N	\N	\N
201	Cinéma Balzac	0101000020E6100000FEB5BC72BD3D0240ABC486B8836D4840	1922 annuaire	\N	\N	50 rue Raynouard	\N	Paris	75016	48.8555823000000018	2.28014649999999985	\N	\N	\N	\N
202	Cinéma	0101000020E6100000026AC592CD200240B4FE3B47896B4840	Théâtre Lyrique du XVIe	Concert des Bateaux Parisiens in Dec 1915.	156-160, Quai d'Auteuil-Point-du-jour, 16e(aujourd'hui Quai Louis Blériot), puis 14 bld Exelmans	11 bld Exelmans	Programme in L'Indépendant du Xve (18 April 1914) at 14 bld Exelmans next to quai de javel	Paris	75016	48.8401269000000013	2.26601710000000001	\N	\N	\N	\N
203	Cinéma du jardi de l'acclimatation (also called Palais d'hiver)	0101000020E610000026732CEFAA270240B091240857704840	1922 annuaire	Bois de Bologne	\N	\N	\N	Paris	75016	48.8776560000000018	2.26936900000000019	\N	\N	\N	\N
204	Passy Palace	0101000020E6100000994B05700E420240079F419EB86D4840	Previously Alexandra Passy Palace?	Alexandra Passy Palace in 1922 annuaire with 1600 places	\N	4 rue Cernovitz	4 rue Chernovitz	Paris	75016	48.8571966000000018	2.28225409999999984	Week 1 Barrabas, March 1920	\N	\N	\N
205	Cinéma de la Convention	0101000020E61000006BD784B4C6400240B1355B79C96D4840	Alexandra-Passy-Cinéma in 1918. Called Alexandra in 1924,  1926, 1928	pre-1917	Passy Palace at this address in 1922 annuaire	12 rue Cernovitz	12 rue Chernovitz	Paris	75016	48.8577110000000019	2.28162900000000013	\N	Week 1, Les Deux Gamines, 1921	\N	\N
206	Le Palladium	0101000020E6100000466117450F1C024059FB3BDBA36B4840	called Le Palladium in 1920, 26, 28	1919-1920 (building permission 09/1919)	Alexandra Cinéma at one point?	83 rue Chardon Lagache	83 rue Chardon Lagache	Paris	75016	48.8409380000000013	2.26370100000000019	\N	Week 1, Les Deux Gamines, 1921	\N	\N
207	Théâtre des États-Unis	0101000020E6100000D0D03FC1C54A024090662C9ACE6E4840	exists 1920	Cinéma des États-Unis in 1921 and 1922 annuaire	\N	56 bis, avenue Malakoff	56 avenue Raymond Poincaré	Paris	75016	48.8656799999999976	2.28650999999999982	\N	Week 2, Les Deux Gamines, 1921	\N	\N
208	Grand Royal	0101000020E61000008E3F51D9B04602400B0BEE073C704840	Programmes in Comoedia November 1912. Called Consortium Théâtre in 1913 (Comoedia, 5 Aug 1913)	Cinérama-Théatre in 1912 and in 1914. Owned by Gabriel Kaiser in 1913.	still Grand Royal in 1922, 1926, 1928	83 ave de la grande armée	83 ave de la grande armée	Paris	75016	48.8768320000000003	2.28451700000000013	\N	Week 3, Les Deux Gamines, 1921	\N	\N
209	Imperia	0101000020E610000099CEF34CD4370240940E7B46C76D4840	existed 20/02/20. Impéria Palace in 1923, Impéria in 1926, Impérial in 1928	Permis de construire 19 June 1919	\N	71-73 rue de Passy and 4 rue Bois-le-Vent	71-73 rue de Passy and 4 rue Bois-le-Vent	Paris	75016	48.8576438999999993	2.27726039999999985	\N	\N	\N	\N
210	Mozart Palace	0101000020E6100000C46059C40B1D02404E8FB7A68A6C4840	15 May 1913 permis de construire (Société des cinémas modernes by Girard)	same name in 1926, 28, 29	\N	49-51 rue d'Auteuil	49-51 rue d'Auteuil	Paris	75016	48.8479813000000007	2.26418259999999982	Week 1 Barrabas	\N	\N	\N
211	Maillot Palace Cinéma	0101000020E61000008109DCBA9B470240A8A55E5C4F704840	Cinérama in 1914 next to metro Maillot.  (Le Journal, 8 May 1914) .Maillot Palace in 1926, 1928	Opened 24 March 1916 (Le Petit Parisien, 31 March 1916)	opening advertised Le Gaulois 3 March 1916	74 ave de la Grande Armée	74 ave de la Grande Armée	Paris	75016	48.8774219000000016	2.28496500000000013	Week 1 Barrabas	\N	\N	\N
212	Palladium	0101000020E6100000C03C64CA87600240E9F351465C704840	Théâtre des Ternes in 1914-1920, Ternes Cinéma 1914,1915, 1922	Begins cinema screenings in 1910 (Meusy)	Théâtre des Ternes(Comoedia, 1 Sept 1908)- screenings began earlier than 1910, perhaps sept 1908	5 ave de Ternes	5 ave de Ternes	Paris	75017	48.8778160000000028	2.29713399999999979	\N	Les Deux Gamines, Week 1	\N	\N
213	Royal Cinéma Wagram	0101000020E61000007072648ADE5E02400CEC8C4A45704840	1923	\N	Royal Wagram in 1926, 1928	37 ave de Wagram	37 ave de Wagram	Paris	75017	48.8771145999999987	2.29632289999999983	\N	\N	\N	\N
214	Lutetia Wagram	0101000020E610000061191BBAD95F0240C6FA062637704840	Cinéma Théâtre des Ternes (Lutetia Royal Wagram in 1921, CPT??)	1913	Lutetia Wagram in 1914, 1918, 1926, 1928	31 - 33 ave de Wagram	31 ave de Wagram	Paris	75017	48.8766829999999999	2.29680200000000001	Barrabas Week 1, March 1921	Week 1, Les Deux Gamines, 1921	\N	\N
215	Royal Monceau	0101000020E610000019A2540CA184024034AE6EAB0F714840	\N	\N	\N	38 - 40 rue de Lévis	38 - 40 rue de Lévis	Paris	75017	48.8832907000000034	2.3147603000000001	\N	\N	\N	\N
216	Batignolles Cinéma / Batignolles Palace	0101000020E61000001990BDDEFD91024040A0336953714840	attractions in 1920. Salle des Batignolles in 1916. Batignolles Palace in 1924. Still exists 1926, 1928	Permis de construire  by Auscher  16 May 1913. Built 11/1/1913. In 1914 annuaire as "cinéma"	22/11/13	59 rue la condamine	59 rue de la condamine	Paris	75017	48.8853579999999965	2.32128500000000004	\N	Les Deux Gamines, Week 1, 1921	\N	\N
217	Le Select	0101000020E610000026AC8DB1139E0240B4588AE42B714840	Name changes from Métropole to Le Sélect on 14 May 1920 because the management had an agreement to show "Select Pictures" films (Comoedia, 14 mai 1920)	1921 (Meusy). Le Select in 1926, 1928	\N	8 ave de Clichy	8 ave de Clichy	Paris	75017	48.8841520000000003	2.3271860000000002	L’Enfant roi (Le Matin, 25 October 1923) from 26 Oct 1st week	Les Deux Gamines, Week 1, 1921	Yes	\N
218	Demours Palace	0101000020E61000007D45121846550240B01AF09EA8704840	Ternes Palace in July 1914, Ternes-Cinéma-Demours and Demours Palace in 1916, 1923, 1926, still in 1937	Jules Mélodia director in March 1916	see description 3 March 1916 Le Gaulois	7 rue Demours	7 rue Pierre Demours	Paris	75017	48.8801459000000023	2.29163760000000005	\N	\N	\N	\N
219	Cinéma Legendre	0101000020E6100000709692E524940240439259BDC3714840	CPT 1 Aug 1919 built over Lavoir	Legendre-Pathé in Oct 1920, Cinéma Légendre in 1922,  1928	Opens Feb 1920 (JDCC, 20 Feb 1920) as Legendre-Clichy-Palace	128 rue Legendre	\N	\N	75017	48.8887860000000032	2.32233599999999996	\N	\N	\N	\N
220	Villiers Cinéma	0101000020E61000009C1727BEDA8102408CDCD3D51D714840	Villiers cinéma 1920, 1926, until 1937	also Malesherbes cinéma?	\N	21 rue Legendre / place Levis	21 rue Legendre	Paris	75017	48.8837230000000034	2.3134055	\N	\N	\N	\N
221	Grand Cinéma (de Saint-Ouen)	0101000020E61000002DB308C556A0024079196AB9D8724840	\N	\N	\N	147 ave de Saint-Ouen	147 ave de Saint-Ouen	Paris	75017	48.8972388999999978	2.32829050000000004	\N	\N	\N	Yes
222	Fééric Cinéma	0101000020E6100000FA449E245D930240029F1F4608714840	existed 1910 with orchestra. Same name in 1914 annuaire. with live attractions 1920	1909	publicity material at CF	6 rue de puteaux	and 54 bld de batignolles	Paris	75017	48.883065000000002	2.32195499999999999	\N	\N	Yes	\N
223	Smart Cinéma	0101000020E6100000E3248392B88D0240E4B8F880E5704840	1922 annuaire	\N	\N	78 bld des Batignolles	\N	Paris	75017	48.8820039000000008	2.31919969999999998	\N	\N	\N	\N
224	Clichy Palace	0101000020E610000016B8E11C1A9B024057E311818F714840	1924, 1928, 1937	2500 seats (Ciné pour tous, 13 March 1920) and (JDCC 10 Feb 1920) opening date isn't fixed	\N	49 ave de Clichy	49 ave de Clichy	Paris	75017	48.8871918999999977	2.32573339999999984	\N	\N	\N	\N
225	Chantecler	0101000020E6100000E07B24CA83990240E97129F8B7714840	. 1908 opens as  Clichy Cinéma Pathé until 1914. Exists 1915-1920 as Chantecler and Clichy-Chanteclerc	Chanteclerc at 75 ave de clichy (cinémagazine, 1926)	72 ave de Clichy in Comoedia (24/07/1914)	76-78 ave de Clichy	Clichy cinéma in 1914 annuaire. Clichy Cinéma Pathéand Chantecler  in 1922 annuaire	Paris	75017	48.8884267999999977	2.32495839999999987	\N	\N	\N	\N
226	Cinéma Fortuny	0101000020E6100000410C1934997602400196A652FD704840	opened 23 April 1920 by Adolphe Osso (Comoedia, 23 April 1920) under his direction until 19/11/20 (Comoedia)	later became theatre	\N	42 rue Fortuny, Place Malesherbes	\N	Paris	75017	48.8827307999999974	2.30790940000000022	\N	\N	\N	\N
227	Idéal Cinéma	0101000020E61000009510ACAA979F02407A8A1C226E724840	existed 1920	same name in 1917, 1926, 1937	\N	100 ave de Saint Ouen	100 ave de Saint Ouen	Paris	75018	48.8939859999999982	2.32792600000000016	Barrabas Week 1	Week 1, Les Deux Gamines, 1921	\N	\N
228	Gaumont Palace	0101000020E6100000C18BBE8234A30240FE2B2B4D4A714840	\N	1911	\N	3 rue Caulaincourt	3 rue Caulaincourt	Paris	75018	48.8850800000000021	2.32968999999999982	Barrabas Week 1	Week 1, Les Deux Gamines, 1921	\N	\N
289	Family Cinéma	0101000020E6100000C4E4B276803C0340EB4669801C6D4840	still exists in 1926, 1928	\N	\N	81 rue d'Avron	81 rue d'Avron	Paris	75020	48.8524322999999967	2.4045418999999999	\N	\N	\N	\N
229	Théâtre / Cinéma Montmartre	0101000020E6100000F5143944DCBC02406EA6423C12714840	\N	1915 begins cinema	tous les soirs, matinées jeudis, dimanches et fêtes	Place Dancourt	Place Charles Dullin	Paris	75018	48.8833690000000018	2.34221700000000022	Barrabas Week 1	Week 1, Les Deux Gamines, 1921	Yes	\N
230	Nouveau Cinéma Ordener	0101000020E61000000341800C1DBB0240280D350A49724840	Nouveau cinéma 1924, 1926, 1928.	1911	just "cinéma" in 1916 and "cinéma ordener" in 1920	123-125 rue ordener	125 rue ordener	Paris	75018	48.8928539999999998	2.341364	\N	Week 1, Les Deux Gamines, 1921	\N	\N
231	Barbès Palace	0101000020E61000002310AFEB17CC02402312859675714840	same name in 1937	1914	\N	34 Boulevard Barbès	34 Boulevard Barbès	Paris	75018	48.8864009999999993	2.34965499999999983	Barrabas Week 1	Week 1, Les Deux Gamines, 1921	Yes	\N
232	Marcadet Cinéma Palace	0101000020E61000006D718DCF64BF0240902E36AD14724840	Le Métropole in 1922. exists 1926,  1928	1920	\N	110 rue Marcadet	110 rue Marcadet	Paris	75018	48.8912559999999985	2.34345399999999993	\N	Week 1, Les Deux Gamines, 1921	Yes	\N
233	Le Métropole	0101000020E61000000EA0DFF76F9E02401E7123C044724840	Métropole in 1923-1937	\N	Still owned by Lutetia in 1922	86-88 ave de Saint-Ouen	86-88 ave de Saint-Ouen	Paris	75018	48.8927230999999978	2.32736199999999993	\N	\N	\N	\N
234	Cinéma Ramey	0101000020E6100000F8A57EDE54C40240BEA25BAFE9714840	Cinéma Ramey in 1921, 1923, 1926	exists 1911. Grand Cinéma Concert Ramey.	\N	49 rue Ramey, Impasse Pers.	\N	Paris	75018	48.8899439999999998	2.34586499999999987	\N	Week 2, Les Deux Gamines, 1921	\N	Yes
235	Olympia de Clichy	0101000020E6100000BF6378EC67B10240933D9D8603714840	exists 1923	\N	\N	34 bld de clichy	\N	Paris	75018	48.8829200999999998	2.33662400000000003	\N	\N	\N	\N
236	Coliséum	0101000020E6100000F7E461A1D6C402401A8C6C42B5704840	Cinéma et concert (Le Temps, 30 Jan 1913)	\N	Also in 1914 annuaire as Coliséum	65 rue Rochechouart	65 rue Rochechouart	Paris	75018	48.8805315999999976	2.34611249999999982	\N	\N	\N	\N
237	Cinéma Ordener	0101000020E6100000924C987A27E0024096557D53FD714840	former Brasserie Karcher, called Cinéma Ordener in 1914, 1920. Also Cinéma de la Chapelle in 1921.	1914	Called Ordener-Lachapelle in July 1914. Called Ordener in 1926. Ordener La Chapelle in 1922 annuaire.	77 rue de la Chapelle	3 rue de la Chapelle	Paris	75018	48.8905433999999985	2.35945029999999978	Barrabas Week 1, March 1920	Week 2, Les Deux Gamines, 1921	\N	\N
238	Cinéma Montcalm	0101000020E610000097E315889EB402407E71A94A5B724840	still exists in 1926, 1928	same name 1917	listed on rue Montcalm in 1922 annuaire and Moderne Cinéma listed at 132 rue ordener	134 rue Ordener	134 rue Ordener	Paris	75018	48.8934110000000004	2.33819299999999997	Barrabas Week 1, March 1920	Week 2, Les Deux Gamines, 1921	\N	\N
239	Artistic Cinéma Myrrha	0101000020E6100000C5CE6FF321D30240B67581DC8F714840	\N	1912	\N	36 rue Myrrha	36 rue Myrrha	Paris	75018	48.8872027999999972	2.35309210000000002	\N	\N	Yes	\N
240	Cinéma Lamarck	0101000020E61000004D6A6803B0B10240A515DF50F8714840	Montmartre Palace in 1926.	1913 - 1922.	\N	1 rue Duhesme / 94 rue lamarck	1 rue Duhesme	Paris	75018	48.8903905000000023	2.33676150000000016	\N	\N	Yes	\N
241	Gaîté Parisienne	0101000020E6100000F0A2AF20CDC802406A172E066A724840	Gaîté Parisienne 1914-1928 later Ornano Palace until at least 1937?	1910	Gaîté Parisienne in 1914 annuaire.	34 bld Ornano and 125 rue clignancourt	34 bld Ornano	Paris	75018	48.8938605999999965	2.34804749999999984	Week 1 Barrabas, March 1920	\N	\N	\N
242	Grand Cinéma Ornano	0101000020E6100000AB52C433B2C502408F25620097724840	Kinema	1911	ticket price increase 1912	43 bld Ornano	43 bld Ornano	Paris	75018	48.8952331999999998	2.3465313000000001	\N	\N	Yes	\N
243	Cinéma de Saint Ouen	0101000020E6100000FA2AF9D85DA00240B10342469B724840	existed 1920 and 1922 as Petit Cinéma too	Cinéma de Saint Ouen  and Petit Cinéma in 1922 annuaire	\N	124 ave Saint Ouen	124 ave de Saint-Ouen	Paris	75018	48.8953636000000031	2.32830400000000015	\N	\N	\N	\N
244	Cinéma Stephenson	0101000020E610000069667792BEDA024083C4D1B073714840	still exists 1926, 1937	1910	\N	18 rue Stephenson	18 rue Stephenson	Paris	75018	48.8863430999999977	2.35680880000000004	\N	\N	Yes	\N
245	Cinéma Dufayel	0101000020E61000009EAFFE74A8CB0240B0181AF44A714840	ex-cinématographe lumière	In 1914 annuaire as Dufayel and in 1922 annuaire	\N	11 bis bld Barbès, 22 rue de clignancourt	11 bld Barbès	Paris	75018	48.8850999000000002	2.34944240000000004	\N	\N	\N	\N
246	Lion d'or	0101000020E61000004074F7EFB0DF02409EE51EB704724840	Cinéma-Chope du Lion d’Or in 1914	\N	\N	7-9 rue de la Chapelle	7 rue de la chapelle	Paris	75018	48.8907688999999976	2.35922419999999988	\N	\N	Yes	\N
247	Moncey	0101000020E6100000381B86EA419C0240BBAAFDE77A714840	Serge Sandberg put a screen into this music hall in november 1919 (Comoedia, 4 nov 1919)	listed 1920. and 1922 annuaire	called le Forum in 1937	4-6 Pierre Ginier	50 ave de Clichy	Paris	75018	48.8865632999999988	2.32629760000000019	\N	\N	\N	\N
248	Palace Torcy	0101000020E610000083024A9E46E502404B7DB4931C724840	In 1922 annuaire	1913 - end of ww1	\N	38 rue Torcy	38 rue de Torcy	Paris	75018	48.8914971000000023	2.36195110000000019	\N	\N	Yes	\N
249	La Cigale	0101000020E61000004FB6DCF4C2B80240BEA59C2FF6704840	in 1928	\N	\N	120  bld rochechourat	120  bld de rochechourat	Paris	75018	48.882513000000003	2.34021560000000006	\N	\N	\N	\N
250	Palais Rochechouart	0101000020E61000009FE8BAF083C3024002D6AA5D13714840	Palais Rochechouart in 1921	Palais Rochechouart in 1913, 1918 and in 1923, 1926, 1928	Palais de la mutualité in 1922 annuaire	56-58 bld rochechourat	56-58 bld de rochechourat	Paris	75018	48.8834035	2.34546650000000012	\N	\N	\N	\N
251	Magenta Palace	0101000020E6100000D45C137761E002409F9FF36448714840	Le Capitole in 1921 and 1922 annuaire	until 1937	\N	18 place de la chapelle( also  6 rue de la Chapelle)	2 rue marx dormoy	Paris	75018	48.885021799999997	2.35956089999999996	\N	\N	\N	\N
252	Paris-Cinéma	0101000020E61000003402E08E269D02403800D18206724840	Brasserie in 1922 annuaire	1909 / 1910	called Chez Nous in 1922	56 ave saint-ouen	56 ave de saint-ouen	Paris	75018	48.8908236999999986	2.32673370000000013	\N	\N	Yes	\N
253	Cinéma Rochechouart	0101000020E6100000833463D174C60240F7370DF6CB704840	also Brasserie Cinéma Rochechouart until at least 1923. Ciné Rochechouart in 1926. Taken over by Pathé in August 1929	1907	cinéma rochechouart in 1928- 1929	66 rue Rochechouart	66 rue de Rochechouart	Pathé-Rochechouart in 1937, became music-hall (Ce soir, 6 October 1937)	75018	48.8812244000000007	2.34690250000000011	Week 1 Barrabas, March 1920	\N	Yes	\N
254	Olympic Cinéma	0101000020E610000092B245D26E14034049A12C7C7D714840	CPT programmes 1919	1909	Olympic Cinéma Théâtre in 1915 until at least 1937	136 ave Jean Jaurès	136 ave Jean Jaurès	Paris	75019	48.8866420000000019	2.38497700000000012	Week 1 Barrabas, March 1920	Les Deux Gamines, Week 1, 1921	\N	\N
255	Flandre Palace	0101000020E6100000775380DE0AF7024040ACEDDC6A714840	exists 1920, 1926, 1928	In 1914 annuairecinema list as Folies-Parisiennes.	\N	29 rue de Flandre (corner of rue de Mogador, now rue du Maroc)	29 ave de Flandre	Paris	75019	48.8860736999999972	2.37062619999999979	\N	\N	\N	\N
256	Cinéma Palace	0101000020E6100000D63BDC0E0D0B0340EE93A30051724840	with live attractions in 1920. In 1922 annuaire,	Association des Opérateurs professionelsdu Cinématographe held a fundraiser there (Comoedia, 30 July 1914)	Palace cinéma in 1926	140 rue de Flandre	140 ave de Flandre	Paris	75019	48.8930969999999974	2.38039600000000018	Barrabas, Week 1	Les Deux Gamines, Week 3	\N	\N
257	Cinéma Gloriod	0101000020E61000004BBE2374E101034007616EF772704840	1922 annuaire	\N	\N	46 av. Mathurin Moreau	46 av. Mathurin Moreau	Paris	75019	48.8785085000000024	2.37591829999999993	\N	\N	\N	\N
287	Bagnolet Cinéma	0101000020E6100000C88C012379280340798E6DBEB66D4840	Same name in 1914. Cinéma Pathé in 1918. Ciné-Palace in 1919.	1909	\N	3-5 rue de Bagnolet	3 rue de bagnolet	Paris	75020	48.8571394000000012	2.39476230000000001	\N	\N	\N	\N
258	Cinéma des Folles Buttes	0101000020E610000007D2C5A6950203401329CDE671704840	still exists in 1926	0.50 fr. entrée avec une attraction gratuite en 1912	(Buttes-Chaumont, au bout de la rue Lafayette)	av. Mathurin Moreau	av. Mathurin Moreau	Paris	75019	48.8784759999999991	2.3762620000000001	\N	Les Deux Gamines Week 2	Yes	\N
259	Royal Tandou	0101000020E61000007C597FF0460B03409917169282714840	Tandou-Cinéma	In 1914 annuaire as "cinéma". Permis de construire 17 Aug 1920	Built by Lorach, Duris et Weil who lived in the building	31 rue Tandou	31 rue Tandou	Paris	75019	48.8867971999999966	2.3805063999999998	\N	\N	\N	\N
260	Cinéma de la Villette	0101000020E61000002D98F8A3A8F3024025E99AC937714840	Just "Cinéma" in 1916. Cinéma Regerat or Rogerat in 1917, 1920	Opened 1908	Became Rialto	7 rue de Flandre	7 ave de Flandre	Paris	75019	48.8845150000000004	2.36897400000000014	Barrabas Week 1	Les Deux Gamines Week 2	\N	\N
261	Alhambra Cinéma	0101000020E6100000D6F8F13C5D0203404B051555BF6F4840	Barrasford's Alhambra in Nov 1909? Alhambra in 1922.	1907	Alhambra cinéma in 1914 and in 1913 Comoedia (5 Aug 1913)	22 bld de la villette	22 bld de la villette	Paris	75019	48.8730265000000017	2.37615439999999989	Barrabas Week 1	\N	\N	\N
262	Secrétan-Cinéma-Exploitation	0101000020E6100000268BFB8F4CF70240A6BFF27BF6704840	Cinéma Pathé in 1918, 1922 Secrétan Pathé in 1920, 1926 and still in 1937	Cinéma Exploitation 1 rue Secrétan in 1914 annuaire.	\N	1 ave Secrétan	1 ave Secrétan	Paris	75019	48.8825221000000028	2.3707514999999999	\N	\N	\N	\N
263	Renaissance	0101000020E61000008E6E298CD2FA0240D0E341C417714840	Previously Renaissance  Music Hall. Cinema programmed at end of music hall programme in 1912	opened 20 April 1912, closed 1964	750 seats	12 ave Jean Jaurès	12 rue d'allemagne until 1914	Paris	75019	48.8835377999999992	2.37247189999999986	\N	\N	\N	\N
264	Cinéma Palace	0101000020E610000034828DEBDFF50240ED61D45A3D714840	1921 annuaire	\N	\N	10 rue de Flandre	10 ave de Flandre	Paris	75019	48.8846849000000034	2.37005599999999994	\N	\N	\N	\N
265	Métropol	0101000020E61000007338A91E1F23034088BF812447704840	In 1922 annuaire	\N	\N	5 rue de crimée	\N	Paris	75019	48.8771710999999982	2.39214919999999998	\N	\N	\N	\N
266	Eden Cinéma	0101000020E61000009EF1D82A1CFC02402A5D555117714840	In 1914 and 1922 annuaire.	In Meilleurs Cinéma 8/8/1919	\N	34 ave Jean Jaurès , rue d'allemagne in 1914	\N	Paris	75019	48.8835241000000025	2.37310059999999989	Barrabas Week 1	\N	\N	\N
267	Combat Cinéma	0101000020E61000009DEC0B8DCCF802408FC93DB896704840	Combat Cinéma in 1919. Cinéma in 1922 annuaire	In Meilleurs Cinéma 8/8/1919	\N	25 rue de Meaux	\N	Paris	75019	48.8795995999999988	2.37148389999999987	\N	\N	\N	\N
268	Bijou Cinéma	0101000020E6100000E4446051B6FD0240A77C6363B9714840	Bijou Cinéma in 1914, 1916, 1922	Not to be confused with Bijou Cinéma rue du Fort de l'Est (Saint Denis PC meetings held)(L'Humanitee, 19.12.34)	Another Bijou Cinéma, 47 ave Pierre Larousse, Malakoff (existed 1922), locataire meetings (Le Populaire, 20.06.34 )	22 bis rue Riquet	22 rue Ricquet	Paris	75019	48.8884700999999993	2.37388289999999991	\N	\N	\N	\N
269	Palais du travail (1919)	0101000020E610000002278007AB060340ADEEA2F9AD6F4840	Concert Verner in 1903,called Palais du Travail in 1912 as cinema,  Palais du Cinéma 1915, Cinéma élite in 1922, 1923-1925 music-hall, 1925- Le Floréal	Floréal 1500 places closed 1968	Palais du Travail	13 rue de Belleville	13 rue de Belleville	Paris	75019	48.8724968000000004	2.37825590000000009	\N	\N	\N	\N
270	Théâtre Nouveau	0101000020E610000098CBFC59E2070340107A9164B16F4840	Then the Belleville-Pathé	Théâtre Nouveau in 1922 annuaire	\N	23-25 rue de Belleville	\N	Paris	75019	48.8726010999999971	2.37884969999999996	\N	\N	\N	\N
271	Cinématographe Parisien	0101000020E6100000EBF6A3F2C0F1024026C1C01836714840	1922 annuaire	\N	\N	214 bld de la Villette	\N	Paris	75019	48.8844634000000013	2.36804380000000014	\N	\N	\N	\N
272	Americ-Cinéma	0101000020E6100000EDB199E898180340F52C08E57D714840	1914, 1922	\N	\N	146 rue d'allemagne in 1914	146 ave Jean Jaurès in 1916 and today	Paris	75019	48.8866544999999988	2.38701039999999987	\N	\N	\N	\N
273	Belleville Cinéma	0101000020E6100000B8019F1F46080340A27DACE0B76F4840	Belleville Palace in 1937	\N	\N	23 rue de Belleville	23 rue de Belleville	\N	75019	48.8727990000000005	2.37903999999999982	\N	\N	\N	\N
274	Stella	0101000020E6100000EA80DA5EC13C0340E2A47A7C8C6D4840	Stella Palace or Stella Maris in 1923	Stella in 1922, 1926, 1928, 1929	\N	111 rue des pyrenées	111 rue des pyrenées	Paris	75020	48.8558498000000014	2.4046656999999998	\N	\N	\N	\N
275	Cocorico	0101000020E6100000E9126976380503404787D1BD986F4840	exists 1923, 1928	\N	\N	128 bld de Belleville	128 bld de Belleville	Paris	75020	48.8718488000000022	2.37754909999999997	\N	\N	Yes	\N
276	Belleville Palace	0101000020E610000067B45549641F0340705CC64D0D704840	attractions in 1920	exists in 1915, 1922 and 1929	\N	130, bld de Belleville	130, bld de Belleville	Paris	75020	48.8754059999999981	2.39032799999999979	\N	Les Deux Gamines, Week 1	Yes	\N
277	Féérique Cinéma	0101000020E6100000785E2A36E6150340ECFB7090106F4840	live attractions in 1920	1909	still exists 1937	146, rue de Belleville	146, rue de Belleville	Paris	75020	48.8676930000000027	2.38569299999999984	Barrabas Week 1, March 1920	Les Deux Gamines, Week 1	Yes	\N
278	Ménil Cinéma or Ménil Palace	0101000020E6100000672CF587C117034036954561176F4840	Ménil Palace in 1922 annuaire	\N	\N	38 rue de Menilmontant	38 rue de Menilmontant	Paris	75020	48.8679010000000034	2.38659959999999982	\N	\N	\N	\N
279	Phénix Cinéma	0101000020E6100000AC90F2936A3F034007EDD5C7436D4840	exists 1941	(1909)exists in 1911	ticket price increase 1912	28 rue de menilmontant	28 rue de menilmontant	Paris	75020	48.853631	2.40596500000000013	Week 1 Barrabas, March 1920	Week 1, Les Deux Gamines, 1921	Yes	\N
280	Gambetta Palace	0101000020E61000008A027D224F3203406478EC67B16E4840	Splendid Cinéma, then Gambetta Palace in 1923, then Gambetta-Aubert-Palace in 1928	1909, demolished in 1920 and rebuilt as Gambetta Palace	called Gambetta in 1937	6-8, rue Belgrand	6, rue Belgrand	Paris	75020	48.8647890000000018	2.39956499999999995	\N	Week 1, Les Deux Gamines, 1921	\N	\N
281	Parisiana	0101000020E61000003CDA38622D1E03405B0BB3D0CE6F4840	opened 1908, 380 seats (Blattin)	Parisiana in 1922, 1926. Le Florida in 1930s with 450 seats	\N	373 rue des Pyrenées and 3 rue Levert	373 rue des Pyrenées	Paris	75020	48.8734990000000025	2.38973499999999994	\N	\N	\N	\N
282	Cinéma Gambetta	0101000020E61000001BE5AAC31B33034043CDEBE3FC6E4840	called Gambetta Étoile in 1927 and 28	opened 1909. In 1914 annuaire as Cinéma Gambetta.	ticket price increase 1912	105 ave Gambetta	105 ave Gambetta	Paris	75020	48.8670925999999994	2.39995529999999979	Week 1 Barrabas, March 1920	\N	\N	\N
283	Alcazar Cinéma	0101000020E61000009D84D217421E034037781508F16F4840	exists 1916	In 1914 annuaire as Cinéma-Théâtre, dir. Bègue	1922 annuaire as Alcazar cinéma	6 rue du Jourdain	6 rue du Jourdain	Paris	75020	48.874543199999998	2.38977450000000013	\N	\N	\N	\N
284	Modern Cinéma	0101000020E6100000F7894D75121B0340F7915B936E6F4840	\N	Bébé Cinéma in 1914 and 1922 annuaire, Cinéma Moderne in 1916	also Alcazar?	4 bis rue Henri Chevreau	4 bis rue Henri Chevreau	Paris	75020	48.8705619999999996	2.3882188000000002	\N	\N	\N	\N
285	Splendid Cinéma	0101000020E610000044D48E2CAA3F0340DECF8481426D4840	1922 annuaire	\N	\N	70 rue des pyrenées	70 rue des pyrenées	Paris	75020	48.8535921000000002	2.40608630000000012	Week 1 Barrabas, March 1920	\N	\N	\N
286	Paradis-Aubert-Palace	0101000020E610000038E1B9522A0C03401D5FD61FBC6F4840	Paradis cinema ticket price increase 1912 (same?)	Cinéma Paradis in 1920, 1922 and 1923, Paradis-Aubert-Palace in 1926, 1928	Re-opens under L. Aubert Feb 1920 (JDCC, 20 Feb 1920) as Paradis-Cinéma.	42 rue de Belleville	42 rue de Belleville	Paris	75020	48.8729286000000016	2.38094010000000011	\N	\N	\N	\N
288	Cinéma Parisien	0101000020E6100000B2ECEEA6000D0340896B6BFAA26F4840	1922 annuaire	\N	\N	9 rue Lesage	9 rue Lesage	Paris	75020	48.8721612000000007	2.38134889999999988	\N	\N	\N	\N
290	Luna Cinéma	0101000020E610000033C34659BF490340AC5D6E8B8D6C4840	Casino des alliés	opened 1911 or 1912. Luna cinéma in 1922, 1926.	900 places Meusy()	9 cours de Vincennes	Luna-Park Music-Hall cinéma (Le Temps, 30 Jan 1913)	Paris	75020	48.8480696000000023	2.41100950000000003	\N	\N	\N	\N
291	Zénith Cinéma	0101000020E6100000871744A4A62D0340D544FA48A56E4840	ticket price increase 1912	same name 1913, 1914, 1922. Also concerts in 1922.	still exists 1937	17 rue Malte-brun	\N	Paris	75020	48.8644190999999992	2.39729049999999999	\N	\N	\N	\N
292	Théâtres de vues aster film	0101000020E6100000F4C473B6803003407A8EC877296F4840	1922 annuaire	\N	\N	91-93 rue villiers de l'isle adam	\N	Paris	75020	48.8684530000000024	2.39868300000000012	\N	\N	\N	\N
293	Cinéma Buzenal	0101000020E6100000150D0863FA340340A5D12EF0266D4840	exists 1920	Cinéma Buzenal in 1914-1915, 1926, 1928	previously Casino Buzenal. Casino Buzenal in 1922 annuaire.	61 rue de Buzenval	\N	Paris	75020	48.8527508000000026	2.40086820000000012	Week 1 Barrabas, March 1920	\N	\N	\N
294	Cinéma du lac Saint-Fargeau	0101000020E6100000CBD1883EC43B03407C86CB8525704840	Saint Fargeau Cinéma in 1914	Cinéma du lac Saint-Fargeau in 1922 annuaire	\N	296 rue de Belleville	\N	Paris	75020	48.8761451000000022	2.4041828999999999	\N	\N	\N	\N
295	Palais Avron	0101000020E61000005DFA97A4323503405C4FBEEA126D4840	open 1913	Avron Palace in 1922 annuaire. Palais Avron in 1937	\N	35-37 rue d'Avron	\N	Paris	75020	48.8521398000000033	2.40097549999999993	\N	\N	\N	\N
296	Eden-Lyrique	0101000020E6100000486E4DBA2D310340E9F17B9BFE6C4840	Cinéma-Lyrique in 1914 annuaire. Then Avron Palace	1908	Eden-Lyrique in 1922 annuaire	7 rue d'Avron	7 rue d'Avron	Paris	75020	48.8515200000000007	2.39901300000000006	\N	\N	Yes	\N
297	Familia Concert	0101000020E6100000A675C01A0C2A0340FB71A02C216F4840	In 1914 and 1922 annuaire. Owned by Pacra.	In Meilleurs Cinéma 8/8/1919	Also Pyrenées-Cinéma-Music-Hall in 1922 annuaire	277 rue des Pyrenées	\N	Paris	75020	48.8681999000000005	2.3955308999999998	\N	\N	\N	\N
298	Phénix Cinéma	0101000020E6100000CC0D863AAC40034065E08096AE6C4840	1922 annuaire	\N	\N	28 rue des Pyrenées	\N	Paris	75020	48.8490779999999987	2.40657850000000018	\N	\N	\N	\N
299	Pyrenées Palace	0101000020E61000008434BE8AE7270340C5EF5CCE5B6F4840	Pyrenées Palace in 1920, 1928	programme in JDCC 24/12/20	129 rue Menilmontant	272 rue des pyrenées	\N	Paris	75020	48.8699891999999991	2.39448460000000019	\N	\N	\N	\N
300	Ciné Parisien	0101000020E6100000EAE8B81AD905034014556419876F4840	Gavroche Cinéma in 1922 annuaire. became the ciné bellevue and then a synagogue	concert du Progrès pre-1920	1905- at least 1921	118 bld de Belleville	see Meusy 113, 210, 219	Paris	75020	48.8713103999999987	2.3778554999999999	\N	\N	\N	\N
301	Magic Cinéma	0101000020E61000002A34B511F41C03403145B9347E6D4840	1922 annuaire	\N	\N	148 rue de Charonne	\N	Paris	75020	48.8554140000000032	2.38913740000000008	\N	\N	\N	\N
302	L'Épatant	0101000020E61000003B408B0002110340D30C4EE9056F4840	programme in JDCC 12/11/20	Cinéma-théâtre l'Épatant in 1914 annuaire. In 1922 annuaire l'Épatant.	still exists 1928	4 bld de Belleville (or rue de belleville)	\N	Paris	75020	48.8673678999999979	2.38330460000000022	\N	\N	\N	\N
\.


--
-- Name: map_cinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('map_cinema_id_seq', 302, true);


--
-- Data for Name: map_letter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY map_letter (id, letter_id, geom, month, year, date, o_address, c_address, city, postcode, x, y, name, occupation, sex, letter_pur, contrib_no, persons, practices, magazines, cinema) FROM stdin;
100	2	0101000020E61000002D60730E9E69024084D21742CE6B4840	January	1921	31/01/21	123 rue Lecourbe	123 rue Lecourbe	Paris	75015	48.8422320000000028	2.30157100000000003	K. Alady	\N	Male	Photo	One	\N	\N	\N	\N
101	3	0101000020E6100000270FD253E410034003E78C28ED6F4840	February	1921	02/02/2021	17 bis rue bolivar	ave simon bolivar	Paris	75020	48.8744250000000022	2.38324800000000003	Robert Blanc	\N	Male	Photo	One	Biscot	\N	\N	Féerique cinéma
102	4	0101000020E6100000CED9ACFA5C2D0240837F1134666C4840	February	1921	02/04/2021	7 rue Mirabeau	7 rue Mirabeau	Paris	75016	48.8468689999999981	2.27214999999999989	Mady Galtier	\N	Female	Photo	One	\N	Album	\N	\N
103	5	0101000020E6100000093FFF3D788D0240AAFBC742746A4840	February	1921	02/05/2021	82 rue du moulin vert	82 rue du moulin vert	Paris	75014	48.8316730000000021	2.31907700000000006	Marcel Wilbault	\N	Male	Photo	One	\N	\N	\N	\N
104	6	0101000020E61000000818CFA0A1DF02409A3A8F8AFF6F4840	February	1921	02/11/2021	140 rue du faubourg st. martin	140 rue du faubourg st. martin	Paris	75010	48.8749859999999998	2.35919500000000015	Paul Thierry	\N	Male	Photo	One	\N	\N	Ciné pour tous	\N
105	9	0101000020E61000008DAD122C0E870240FA5A971AA16B4840	February	1921	14/2/21	50 bld de vaugirard	50 bld de vaugirard	Paris	75015	48.8408540000000002	2.31594500000000014	Jacques Salvadory	\N	Male	Photo	One	\N	\N	\N	\N
106	10	0101000020E61000000C55BFD2F9700240D6976C3CD86A4840	February	1921	15/2/21	21 rue de vouillé	21 rue de vouillé	Paris	75015	48.8347240000000014	2.30516399999999999	Louis Fromigny	\N	Male	Photo	One	\N	\N	\N	\N
107	12	0101000020E610000010D446753AD00240D0510E6613724840	February	1921	18/2/21	78 Rue des Poissonniers	78 Rue des Poissonniers	Paris	75018	48.8912169999999975	2.35167400000000004	René Sez	Employé au chemin de fer du Nord	Male	\N	One	\N	\N	\N	\N
108	15	0101000020E6100000F95A971AA1DF02400FDA722EC56F4840	March	1921	42796	63 rue des vinaigriers	63 rue des vinaigriers	Paris	75010	48.8732049999999987	2.35919400000000001	Raymond Alleaume	\N	Male	Photo	One	\N	Photo collection	Ciné-club and Ciné pour tous	\N
109	17	0101000020E61000002D0C7558E1160340780261A7586D4840	March	1921	42827	173 bld voltaire	173 bld voltaire	Paris	75011	48.8542679999999976	2.38617200000000018	Cécile Billot	\N	Female	Photo	One	\N	\N	\N	\N
110	18	0101000020E61000006BCEDE196D350240551D7233DC6E4840	March	1921	42827	78 rue Spontini	78 rue Spontini	Paris	75016	48.8660950000000014	2.27608699999999997	Mlle Maya	\N	Female	Photo or signature on card	One	\N	\N	\N	\N
111	19	0101000020E61000009B7BD6355A8E02403BC1FEEBDC704840	February	1921	28/02/21	45 Bld des Batignolles	45 Bld des Batignolles	Paris	75008	48.8817420000000027	2.3195079999999999	no name	\N	Male	Meeting	One	\N	\N	\N	\N
112	21	0101000020E61000006F5CE333D97F02400F62670A9D714840	March	1921	43010	9 Bld Pereire	9 Bld Pereire	Paris	75017	48.8876050000000006	2.31242599999999987	Anita Croharé	\N	Female	Photo	One	\N	Photo collection	\N	\N
113	23	0101000020E6100000F14F3750E0BD0240D3FF722D5A724840	March	1921	42949	13 rue du poteau	13 rue du poteau	Paris	75018	48.893377000000001	2.34271299999999982	Fernande Courtois	midinette	Female	Photo	One	\N	Photo on bedroom wall	\N	\N
114	25	0101000020E6100000CB4142942FC802405BE49EAEEE6A4840	February	1921	22/02/21	35 bld Arago	35 bld Arago	Paris	75013	48.8354089999999985	2.34774700000000003	R. Maîstres	\N	Female	Photos of particular scenes in Les Deux Gamines	One	\N	\N	Ciné pour tous	\N
115	26	0101000020E6100000FB258DD13ACA0240ED3191D26C6C4840	March	1921	13/3/21	11 rue Descartes	11 rue Descartes	Paris	75005	48.8470709999999997	2.34874500000000008	Julien Portefaix	\N	Male	Signed photo, other film projects	One	\N	\N	\N	\N
116	29	0101000020E6100000D503E62153DE0240828769DFDC6F4840	March	1921	\N	116 Rue du Faubourg Saint-Martin	116 Rue du Faubourg Saint-Martin	Paris	75010	48.8739279999999994	2.35855699999999979	J. Bost	\N	Male	Photo	One	\N	\N	\N	\N
117	29a	0101000020E6100000D503E62153DE0240828769DFDC6F4840	March	1921	21/03/21	116 Rue du Faubourg Saint-Martin	116 Rue du Faubourg Saint-Martin	Paris	75010	48.8739279999999994	2.35855699999999979	J. Bost	\N	\N	Advice to become actor, thanks for photo	One	\N	\N	\N	\N
118	30	0101000020E6100000494CC11A673303400B6ABFB5136B4840	March	1921	42980	6 rue edouard robert	6 rue edouard robert	Paris	75012	48.8365390000000019	2.40009899999999998	Gabrielle Février	schoolgirl	Female	Photo	One	\N	\N	\N	\N
119	34	0101000020E6100000F0D7817346B4024059EA20AF076D4840	March	1921	42918	8 rue des 4 vents	8 rue des 4 vents	Paris	75006	48.8517969999999977	2.33802500000000002	André Fleury	\N	Male	Photo	One	\N	\N	\N	\N
120	35	0101000020E6100000A72023A0C2510240B1D5E594806A4840	March	1921	42857	17 bld lefevbre	17 bld lefevbre	Paris	75015	48.8320489999999978	2.28992199999999979	Jean Louis Boissy	\N	Male	Information about next film	\N	\N	\N	\N	\N
121	35a	0101000020E6100000A72023A0C2510240B1D5E594806A4840	March	1921	22/3/21	17 bld lefevbre	17 bld lefevbre	Paris	75015	48.8320489999999978	2.28992199999999979	Jean Louis Boissy	\N	\N	Thanks for photo sent	One	\N	Goes to the cinema with his mother	\N	\N
122	39	0101000020E61000002108E57D1CAD02404B840D4FAF6C4840	February	1921	\N	46 rue de Vaugirard	46 rue de Vaugirard	Paris	75006	48.8491	2.33452700000000002	Edmée Andrieux	\N	Female	Photo and advice on how to become an actress	One	\N	\N	\N	\N
123	41	0101000020E6100000CAD30FEA224502406314048F6F6B4840	March	1921	03/03/2021	93 ave Felix Faure	93 ave Felix Faure	Paris	75015	48.839342000000002	2.28375800000000018	Suzanne Brochart	\N	Female	Photo. Penpal.	One	\N	Fan knowledge	\N	\N
124	42	0101000020E610000030D13C80457E02407965DEAAEB6A4840	March	1921	03/03/2021	2 rue de l'Orne	2 Rue Alphonse Bertillon	Paris	75015	48.8353170000000034	2.31165600000000016	Marcelle Sève	\N	Female	Photo	One	\N	\N	\N	\N
125	46	0101000020E6100000B148DA8D3EE602400C789961A3704840	March	1921	15/3/21	8 Rue du Château Landon	8 Rue du Château Landon	Paris	75010	48.8799860000000024	2.36242399999999986	Suzanne Simonin	\N	Female	Wants to become an actress. Advice. Photo.	One	\N	Includes self description, she watches les deux gamines every week, school work is suffering	Cinémagazine	\N
126	52	0101000020E6100000D3B4A7E49CF802405D79909E226F4840	March	1921	15/3/21	29 rue de la Fontaine au Roi	29 rue de la Fontaine au Roi	Paris	75011	48.8682439999999971	2.37139299999999986	A. Le Breton	\N	Male	Photo for their bedroom	Two	\N	\N	\N	\N
127	57	0101000020E610000001001C7BF6FC02405F9E95B4E2694840	March	1921	23/03/21	46 rue cantagrel	46 rue cantagrel	Paris	75013	48.8272309999999976	2.3735170000000001	C. Arberet and M.Ludas	\N	Unknown	Photo (souvenir)	Two	\N	\N	\N	\N
128	60	0101000020E61000002BB6BB07E8DE024026CCB4FD2B714840	March	1921	24/03/21	Bouffes du nord concert, 37 bis Bld de la Chapelle	\N	Paris	75010	48.8841549999999998	2.35884099999999997	Suzanne Prévost, Suzy Four, Raymonde Sauzède	\N	Female	Photos to remember her.	Three	\N	Read in a revue that SM sends photos to admirateurs	\N	\N
129	61	0101000020E61000003FAC1A84B91D03406E09C03FA56E4840	March	1921	26/3/21	22 rue des amandiers	22 rue des amandiers	Paris	75020	48.8644180000000006	2.38951400000000014	Georgette Lefebvre	Dactylo-aide-comptable	Female	Photo	One	\N	Photo collection, wants to be an actress	\N	\N
130	61a	0101000020E61000003FAC1A84B91D03406E09C03FA56E4840	May	1921	05/07/2021	22 rue des amandiers	22 rue des amandiers	Paris	75020	48.8644180000000006	2.38951400000000014	Georgette Lefebvre	Dactylo-aide-comptable	\N	Thanks for photo sent, asks to correspond with SM.	One	\N	Wants to be an actress	\N	\N
131	71	0101000020E610000028739EB12FF902408A3A730F096F4840	April	1921	04/01/2021	11 cité des trois bornes	11 cité des trois bornes	Paris	75011	48.8674639999999982	2.37167299999999992	Paulette and Renée Hubert	\N	Female	Photo	Two	\N	"passionnées de l'art muet"	\N	\N
132	75	0101000020E6100000A42F67B62BF402404BE0D6DD3C714840	April	1921	04/04/2021	9 rue de Flandre	9 Ave de Flandre	Paris	75019	48.8846699999999998	2.369224	Simone Alliot	\N	Female	photo	One	\N	\N	\N	\N
133	78	0101000020E61000002E90BDDEFD110340AB47E17A14704840	April	1921	04/11/2021	18 rue clavel	\N	Paris	75019	48.8756249999999994	2.38378500000000004	Yvonne Beaufort	\N	Female	Photo as souvenir (last episode at Féerique on april 15th)	One	\N	\N	\N	Féerique
134	80	0101000020E61000000F404D2D5BAB0240410FB56D186F4840	April	1921	04/08/2021	30 ave de l'opéra	\N	Paris	75002	48.8679330000000007	2.33367000000000013	Mlle Gradt	\N	Female	Autographe	One	\N	\N	\N	\N
135	82	0101000020E6100000AF116C5CFF2E0340409770E82D704840	April	1921	04/09/2021	14 cité lemière	14 Rue du Docteur Potain	Paris	75019	48.8764010000000013	2.39794799999999997	Marcelle Grimaut	\N	Female	Photo	One	\N	\N	\N	\N
136	85	0101000020E6100000A2060C923EED02406BEEE87FB96E4840	April	1921	04/11/2021	30 boulevard du temple	30 boulevard du temple	Paris	75011	48.8650360000000035	2.36584199999999978	Mlle F. Targan	\N	Female	Photo of SM and Gaby, Père, Prince Charmant	One	\N	\N	\N	\N
137	87	0101000020E61000004023D8B8FEDD0240EB6AF294D56E4840	April	1921	04/06/2021	60 rue Turbigo	60 rue Turbigo	Paris	75003	48.8658929999999998	2.35839599999999994	Léa, Madeleine, Clara, Marie Soeur	\N	Female	Photos	Four	\N	\N	\N	\N
138	89	0101000020E61000008DE716BA12010340BF0CC688446D4840	April	1921	14/4/21	3 Rue des Taillandiers	3 Rue des Taillandiers	Paris	75011	48.8536539999999988	2.37552399999999997	Lucette Thomas	\N	Female	Photo	\N	\N	\N	\N	\N
139	90	0101000020E610000048C8409E5DBE02404D7974232C724840	May	1921	14/5/21	10 rue Lapeyrere	10 rue Lapeyrere	Paris	75018	48.8919720000000027	2.34295199999999992	Marguerite, Lise Farfara	\N	Female	Photos	Two	\N	\N	\N	\N
140	100	0101000020E61000004F280B5F5FCB0240FD428F183D714840	Avril	1921	20/4/21	Palais de la nouveauté, Magasins Dufayel, Rayon de friandises,	\N	Paris	\N	48.8846770000000035	2.34930299999999992	Renée Crouzet, Georgette Berthin, Simone Gavily	\N	Female	Advice on getting into cinema, ask her to visit them in hteir department store	Three	\N	\N	\N	\N
\.


--
-- Name: map_letter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('map_letter_id_seq', 140, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: map_cinema_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY map_cinema
    ADD CONSTRAINT map_cinema_pkey PRIMARY KEY (id);


--
-- Name: map_letter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY map_letter
    ADD CONSTRAINT map_letter_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: map_cinema_geom_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX map_cinema_geom_id ON map_cinema USING gist (geom);


--
-- Name: map_letter_geom_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX map_letter_geom_id ON map_letter USING gist (geom);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

