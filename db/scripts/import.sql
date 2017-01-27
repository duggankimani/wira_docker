CREATE TABLE buser (
    id bigint NOT NULL,
    created timestamp without time zone,
    createdby character varying(255),
    isactive integer DEFAULT 1,
    refid character varying(45) NOT NULL,
    updated timestamp without time zone,
    updatedby character varying(255),
    email character varying(100),
    firstname character varying(255) NOT NULL,
    isarchived boolean NOT NULL,
    lastname character varying(255) NOT NULL,
    password character varying(255),
    userid character varying(255) NOT NULL,
    orgid bigint,
    pictureurl character varying(255),
    refreshtoken character varying(255)
);

insert into BUser(created,createdBy,updated,updatedBy,firstName,isArchived,lastName,userId,email,password,refId) values (now(),'Administrator',now(), 'Administrator', 'Admin', false, 'Admin','Administrator','mdkimani@gmail.com','pass', 's6o5mvPtV57R23db');

CREATE TABLE bgroup (
    id bigint NOT NULL,
    created timestamp without time zone,
    createdby character varying(255),
    isactive integer DEFAULT 1,
    refid character varying(45) NOT NULL,
    updated timestamp without time zone,
    updatedby character varying(255),
    fullname character varying(255),
    isarchived boolean NOT NULL,
    name character varying(255) NOT NULL
);
insert into BGroup(created,createdBy,updated,updatedBy,fullName,isArchived,name,refId) values(now(),'Administrator',now(), 'Administrator','Administrator', false, 'ADMIN','ULt0xvgQn0uiMA2m');insert into UserGroup(userid,groupid) values(1,1);

CREATE TABLE usergroup (
    userid bigint NOT NULL,
    groupid bigint NOT NULL
);

insert into UserGroup(userid,groupid) values(1,1);

--Case Number Sequence - must always be included
create sequence caseno_sequence increment by 1 minvalue 1 MaxValue 100000000 start with 1;

CREATE INDEX adfieldjson_field_idx
  ON public.adfieldjson
  USING gin
  (field);

-- Index: public.adfieldjson_field_idx1

-- DROP INDEX public.adfieldjson_field_idx1;

CREATE INDEX adfieldjson_field_idx1
  ON public.adfieldjson
  USING gin
  (field jsonb_path_ops);
CREATE TABLE permission (
    id bigint DEFAULT nextval('permission_id_seq'::regclass) NOT NULL,
    createddate date DEFAULT ('now'::text)::date NOT NULL,
    isactive integer DEFAULT 1,
    updated timestamp without time zone,
    updatedby character varying(255),
    description character varying(255),
    name character varying(255) NOT NULL
);

create sequence permission_id_seq;
alter table permission alter id set default nextval('permission_id_seq');

delete from permission;

insert into permission(name,description) 
values ('ACCESSMGT_CAN_VIEW_ACCESSMGT','Can view access management'),
	('ACCESSMGT_CAN_EDIT_USER','Can Create/Edit User'),
	('ACCESSMGT_CAN_EDIT_ROLE','Can Create/Edit Role'),
	('ACCESSMGT_CAN_EDIT_UNITS','Can Create/Edit Units'),
	('PROCESSES_CAN_VIEW_PROCESSES','Can view processes'),
	('PROCESSES_CAN_EDIT_PROCESSES','Can edit processes'),
	('UNASSIGNED_CAN_VIEW_UNASSIGNEDTASKS','Can view unassigned tasks'),
	('UNASSIGNED_CAN_REASSIGN_UNASSIGNEDTASKS','Can reassign unassigned tasks'),
	('DASHBOARDS_CAN_VIEW_DASHBOARDS','Can view admin dashboards'),
	('DATATABLES_CAN_VIEW_DATATABLES','Can view data tables'),
	('DATATABLES_CAN_EDIT_DATATABLES','Can edit data tables'),
	('MAILLOG_CAN_VIEW_MAILLOG','Can view mail log'),
	('MAILLOG_CAN_RESEND_MAILS','Can resend emails'),
	('DATASOURCES_CAN_VIEW_DATASOURCES','Can view datasources'),
	('DATASOURCES_CAN_EDIT_DATASOURCES','Can edit datasources'),
	('REPORTS_CAN_VIEW_REPORTS','Can view reports'),
	('REPORTS_CAN_EXPORT_REPORTS','Can export reports'),
	('CASEREGISTRY_CAN_VIEW_CASES','Can view registry'),
	('FILEVIEWER_CAN_VIEW_FILES','Can view files'),
	('FILEVIEWER_CAN_DOWNLOAD_FILES','Can download files'),
	('SETTINGS_CAN_VIEW','Can view system settings'),
	('SETTINGS_CAN_EDIT','Can edit system settings');
	
insert into role_permissions(permissionid,roleid) values 
((select id from permission where name='ACCESSMGT_CAN_VIEW_ACCESSMGT'),(select id from bgroup where name='ADMIN')),
((select id from permission where name='ACCESSMGT_CAN_EDIT_USER'),(select id from bgroup where name='ADMIN')),
((select id from permission where name='ACCESSMGT_CAN_EDIT_ROLE'),(select id from bgroup where name='ADMIN')),
((select id from permission where name='ACCESSMGT_CAN_EDIT_UNITS'),(select id from bgroup where name='ADMIN')),
((select id from permission where name='SETTINGS_CAN_VIEW'),(select id from bgroup where name='ADMIN')),
((select id from permission where name='SETTINGS_CAN_EDIT'),(select id from bgroup where name='ADMIN'))
; 
