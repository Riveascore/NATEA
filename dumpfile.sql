--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: billing_addresses; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE billing_addresses (
    id integer NOT NULL,
    donator_id integer,
    main_contact boolean,
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    state character varying(255),
    zip integer,
    country character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.billing_addresses OWNER TO riveascore;

--
-- Name: billing_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE billing_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_addresses_id_seq OWNER TO riveascore;

--
-- Name: billing_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE billing_addresses_id_seq OWNED BY billing_addresses.id;


--
-- Name: cause_categories; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE cause_categories (
    id integer NOT NULL,
    category_name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cause_categories OWNER TO riveascore;

--
-- Name: cause_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE cause_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cause_categories_id_seq OWNER TO riveascore;

--
-- Name: cause_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE cause_categories_id_seq OWNED BY cause_categories.id;


--
-- Name: causes; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE causes (
    id integer NOT NULL,
    name character varying(255),
    city character varying(255),
    state character varying(255),
    zip integer,
    monthly_sponsorship numeric,
    employer_identification_number integer,
    mission_description text,
    cause_category_id integer,
    executive_id integer,
    phone_number_id integer,
    contact_email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cause_image character varying(255)
);


ALTER TABLE public.causes OWNER TO riveascore;

--
-- Name: causes_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.causes_id_seq OWNER TO riveascore;

--
-- Name: causes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE causes_id_seq OWNED BY causes.id;


--
-- Name: donations; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE donations (
    id integer NOT NULL,
    donator_id integer,
    donation_amount numeric,
    donation_date timestamp without time zone,
    payment_method_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cause_id integer,
    donation_recurrence character varying(255)
);


ALTER TABLE public.donations OWNER TO riveascore;

--
-- Name: donations_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE donations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_id_seq OWNER TO riveascore;

--
-- Name: donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE donations_id_seq OWNED BY donations.id;


--
-- Name: donators; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE donators (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.donators OWNER TO riveascore;

--
-- Name: donators_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE donators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donators_id_seq OWNER TO riveascore;

--
-- Name: donators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE donators_id_seq OWNED BY donators.id;


--
-- Name: executives; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE executives (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.executives OWNER TO riveascore;

--
-- Name: executives_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE executives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.executives_id_seq OWNER TO riveascore;

--
-- Name: executives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE executives_id_seq OWNED BY executives.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    donator_id integer,
    expiration_date date,
    billing_address_id integer,
    phone_number_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name_on_card character varying(255),
    credit_card_number character varying(255),
    security_code integer,
    email character varying(255)
);


ALTER TABLE public.payment_methods OWNER TO riveascore;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO riveascore;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE phone_numbers (
    id integer NOT NULL,
    donator_id integer,
    main_contact boolean,
    country_code integer,
    area_code integer,
    number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.phone_numbers OWNER TO riveascore;

--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: riveascore
--

CREATE SEQUENCE phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phone_numbers_id_seq OWNER TO riveascore;

--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riveascore
--

ALTER SEQUENCE phone_numbers_id_seq OWNED BY phone_numbers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO riveascore;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY billing_addresses ALTER COLUMN id SET DEFAULT nextval('billing_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY cause_categories ALTER COLUMN id SET DEFAULT nextval('cause_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY causes ALTER COLUMN id SET DEFAULT nextval('causes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY donations ALTER COLUMN id SET DEFAULT nextval('donations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY donators ALTER COLUMN id SET DEFAULT nextval('donators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY executives ALTER COLUMN id SET DEFAULT nextval('executives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riveascore
--

ALTER TABLE ONLY phone_numbers ALTER COLUMN id SET DEFAULT nextval('phone_numbers_id_seq'::regclass);


--
-- Data for Name: billing_addresses; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY billing_addresses (id, donator_id, main_contact, address1, address2, city, state, zip, country, created_at, updated_at) FROM stdin;
1	\N	\N	102 East Prospect Ave	Appartment #1	Pierre	\N	57501	United States	2013-11-25 04:19:29.092711	2013-11-25 04:19:29.092711
2	\N	\N	123	123	Dales	Alaska	12345	\N	2013-11-25 05:03:06.275901	2013-11-25 05:03:06.275901
\.


--
-- Name: billing_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('billing_addresses_id_seq', 2, true);


--
-- Data for Name: cause_categories; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY cause_categories (id, category_name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: cause_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('cause_categories_id_seq', 1, false);


--
-- Data for Name: causes; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY causes (id, name, city, state, zip, monthly_sponsorship, employer_identification_number, mission_description, cause_category_id, executive_id, phone_number_id, contact_email, created_at, updated_at, cause_image) FROM stdin;
1	Native Organic Gardens	Pierre	SD	57501	500.24	165	Bring jobs to Pine Ridge through an organic produce based economy.	889	315	45	agaxx010@morris.umn.edu	2013-11-24 06:37:32.052527	2013-11-24 21:47:49.194	Still_life_with_vegetables_by_kopalov.jpg
2	Pine Ridge Wind Energy	Pierre	SD	57501	250.0	335	Create jobs around a wind turbine industry to create an economy for the Pine Ridge Native American Reservation in South Dakota.	998	1154	21	agaxx010@morris.umn.edu	2013-11-24 22:03:01.294993	2013-11-24 22:03:01.294993	wind_turbine_by_java_jim.jpg
\.


--
-- Name: causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('causes_id_seq', 2, true);


--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY donations (id, donator_id, donation_amount, donation_date, payment_method_id, created_at, updated_at, cause_id, donation_recurrence) FROM stdin;
1	\N	35.0	2013-11-24 23:33:14.604759	889	2013-11-24 23:33:14.605878	2013-11-24 23:33:14.605878	\N	\N
2	\N	0.0	2013-11-25 00:07:36.272916	12	2013-11-25 00:07:36.274167	2013-11-25 00:07:36.274167	\N	\N
3	\N	\N	2013-11-25 05:03:06.35087	2	2013-11-25 05:03:06.352184	2013-11-25 05:03:06.352184	\N	\N
4	\N	200.0	2013-11-25 05:12:12.354895	2	2013-11-25 05:12:12.355925	2013-11-25 05:12:12.355925	\N	\N
\.


--
-- Name: donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('donations_id_seq', 4, true);


--
-- Data for Name: donators; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY donators (id, first_name, last_name, email, created_at, updated_at) FROM stdin;
1	Chris	Aga	agaxx010@morris.umn.edu	2013-11-24 05:07:41.716723	2013-11-24 05:07:41.716723
\.


--
-- Name: donators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('donators_id_seq', 1, true);


--
-- Data for Name: executives; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY executives (id, first_name, last_name, phone_number_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: executives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('executives_id_seq', 1, false);


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY payment_methods (id, donator_id, expiration_date, billing_address_id, phone_number_id, created_at, updated_at, name_on_card, credit_card_number, security_code, email) FROM stdin;
1	\N	2016-09-01	\N	\N	2013-11-25 03:08:57.599306	2013-11-25 03:08:57.599306	\N	\N	\N	\N
2	\N	2019-12-01	\N	\N	2013-11-25 05:12:12.34144	2013-11-25 05:12:12.34144	Christopher Aga	\N	285	\N
\.


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('payment_methods_id_seq', 2, true);


--
-- Data for Name: phone_numbers; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY phone_numbers (id, donator_id, main_contact, country_code, area_code, number, created_at, updated_at) FROM stdin;
\.


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riveascore
--

SELECT pg_catalog.setval('phone_numbers_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: riveascore
--

COPY schema_migrations (version) FROM stdin;
20131124043648
20131124043716
20131124043924
20131124043941
20131124043959
20131124044017
20131124044032
20131124044051
20131124201444
20131124202658
20131124203215
20131124204057
20131125013941
20131125014242
20131125014627
\.


--
-- Name: billing_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY billing_addresses
    ADD CONSTRAINT billing_addresses_pkey PRIMARY KEY (id);


--
-- Name: cause_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY cause_categories
    ADD CONSTRAINT cause_categories_pkey PRIMARY KEY (id);


--
-- Name: causes_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY causes
    ADD CONSTRAINT causes_pkey PRIMARY KEY (id);


--
-- Name: donations_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (id);


--
-- Name: donators_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY donators
    ADD CONSTRAINT donators_pkey PRIMARY KEY (id);


--
-- Name: executives_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY executives
    ADD CONSTRAINT executives_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: riveascore; Tablespace: 
--

ALTER TABLE ONLY phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: riveascore; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

