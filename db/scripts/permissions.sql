
--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE permission (
    id bigint NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permission_id_seq OWNED BY permission.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission ALTER COLUMN id SET DEFAULT nextval('permission_id_seq'::regclass);


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permission (id, description, name) FROM stdin;
1	Can view access management	ACCESSMGT_CAN_VIEW_ACCESSMGT
2	Can Create/Edit User	ACCESSMGT_CAN_EDIT_USER
3	Can Create/Edit Role	ACCESSMGT_CAN_EDIT_ROLE
4	Can Create/Edit Units	ACCESSMGT_CAN_EDIT_UNITS
5	Can view processes	PROCESSES_CAN_VIEW_PROCESSES
6	Can edit processes	PROCESSES_CAN_EDIT_PROCESSES
7	Can view unassigned tasks	UNASSIGNED_CAN_VIEW_UNASSIGNEDTASKS
8	Can reassign unassigned tasks	UNASSIGNED_CAN_REASSIGN_UNASSIGNEDTASKS
9	Can view admin dashboards	DASHBOARDS_CAN_VIEW_DASHBOARDS
10	Can view data tables	DATATABLES_CAN_VIEW_DATATABLES
11	Can edit data tables	DATATABLES_CAN_EDIT_DATATABLES
12	Can view mail log	MAILLOG_CAN_VIEW_MAILLOG
13	Can resend emails	MAILLOG_CAN_RESEND_MAILS
14	Can view datasources	DATASOURCES_CAN_VIEW_DATASOURCES
15	Can edit datasources	DATASOURCES_CAN_EDIT_DATASOURCES
16	Can view reports	REPORTS_CAN_VIEW_REPORTS
17	Can export reports	REPORTS_CAN_EXPORT_REPORTS
18	Can view registry	CASEREGISTRY_CAN_VIEW_CASES
19	Can view files	FILEVIEWER_CAN_VIEW_FILES
20	Can download files	FILEVIEWER_CAN_DOWNLOAD_FILES
21	Can view system settings	SETTINGS_CAN_VIEW
22	Can edit system settings	SETTINGS_CAN_EDIT
\.


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permission_id_seq', 22, true);


--
-- Name: permission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_name_key UNIQUE (name);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

