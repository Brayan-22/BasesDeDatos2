/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     6/09/2024 1:05:09 a.�m.                      */
/*==============================================================*/


drop index if exists RESPONSABLE_ACTIVIDAD_FK;

drop index if exists ACTIVIDAD_PK;

drop table if exists ACTIVIDAD;

drop index if exists INCONVENIENTE_PROGRESO_FK;

drop index if exists TIPOINC_INCONVENIENTE_FK;

drop index if exists INCONVENIENTE_PK;

drop table if exists INCONVENIENTE;

drop index if exists ACTIVIDAD_PROGRESO_FK;

drop index if exists PROGRESO_PK;

drop table if exists PROGRESO;

drop index if exists RESPONSABLE_PK;

drop table if exists RESPONSABLE;

drop index if exists TIPO_INCONVENIENTE_PK;

drop table if exists TIPO_INCONVENIENTE;

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   ID_ACTIVIDAD         INT4                 not null,
   ID_RESPONSABLE       INT8                 not null,
   NOMBRE_ACTIVIDAD     VARCHAR(20)          not null,
   DESCRIPCION          VARCHAR(50)          not null,
   HORAS_PLANEADAS      INT4                 not null,
   constraint PK_ACTIVIDAD primary key (ID_ACTIVIDAD)
);

/*==============================================================*/
/* Index: ACTIVIDAD_PK                                          */
/*==============================================================*/
create unique index ACTIVIDAD_PK on ACTIVIDAD (
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: RESPONSABLE_ACTIVIDAD_FK                              */
/*==============================================================*/
create  index RESPONSABLE_ACTIVIDAD_FK on ACTIVIDAD (
ID_RESPONSABLE
);

/*==============================================================*/
/* Table: INCONVENIENTE                                         */
/*==============================================================*/
create table INCONVENIENTE (
   ID_INCONVENIENTE     INT4                 not null,
   ID_TIPOINCONVENIENTE INT4                 not null,
   ID_PROGRESO          INT4                 not null,
   ID_ACTIVIDAD         INT4                 not null,
   DESC_INCONVENIENTE   VARCHAR(50)          not null,
   constraint PK_INCONVENIENTE primary key (ID_INCONVENIENTE)
);

/*==============================================================*/
/* Index: INCONVENIENTE_PK                                      */
/*==============================================================*/
create unique index INCONVENIENTE_PK on INCONVENIENTE (
ID_INCONVENIENTE
);

/*==============================================================*/
/* Index: TIPOINC_INCONVENIENTE_FK                              */
/*==============================================================*/
create  index TIPOINC_INCONVENIENTE_FK on INCONVENIENTE (
ID_TIPOINCONVENIENTE
);

/*==============================================================*/
/* Index: INCONVENIENTE_PROGRESO_FK                             */
/*==============================================================*/
create  index INCONVENIENTE_PROGRESO_FK on INCONVENIENTE (
ID_PROGRESO,
ID_ACTIVIDAD
);

/*==============================================================*/
/* Table: PROGRESO                                              */
/*==============================================================*/
create table PROGRESO (
   ID_PROGRESO          INT4                 not null,
   ID_ACTIVIDAD         INT4                 not null,
   TIEMPO_EJECUTADO     INT4                 not null,
   DESC_PROGRESO        VARCHAR(20)          not null,
   constraint PK_PROGRESO primary key (ID_PROGRESO, ID_ACTIVIDAD)
);

/*==============================================================*/
/* Index: PROGRESO_PK                                           */
/*==============================================================*/
create unique index PROGRESO_PK on PROGRESO (
ID_PROGRESO,
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: ACTIVIDAD_PROGRESO_FK                                 */
/*==============================================================*/
create  index ACTIVIDAD_PROGRESO_FK on PROGRESO (
ID_ACTIVIDAD
);

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/
create table RESPONSABLE (
   ID_RESPONSABLE       INT8                 not null,
   NOMBRE_RESPONSABLE   VARCHAR(20)          not null,
   APELLIDO_RESPONSABLE VARCHAR(20)          not null,
   CARGO_RESPONSABLE    VARCHAR(25)          not null,
   constraint PK_RESPONSABLE primary key (ID_RESPONSABLE)
);

/*==============================================================*/
/* Index: RESPONSABLE_PK                                        */
/*==============================================================*/
create unique index RESPONSABLE_PK on RESPONSABLE (
ID_RESPONSABLE
);

/*==============================================================*/
/* Table: TIPO_INCONVENIENTE                                    */
/*==============================================================*/
create table TIPO_INCONVENIENTE (
   ID_TIPOINCONVENIENTE INT4                 not null,
   TIPO_IMPACTO         VARCHAR(20)          not null,
   constraint PK_TIPO_INCONVENIENTE primary key (ID_TIPOINCONVENIENTE)
);

/*==============================================================*/
/* Index: TIPO_INCONVENIENTE_PK                                 */
/*==============================================================*/
create unique index TIPO_INCONVENIENTE_PK on TIPO_INCONVENIENTE (
ID_TIPOINCONVENIENTE
);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_RESPONSAB_RESPONSA foreign key (ID_RESPONSABLE)
      references RESPONSABLE (ID_RESPONSABLE)
      on delete restrict on update restrict;

alter table INCONVENIENTE
   add constraint FK_INCONVEN_INCONVENI_PROGRESO foreign key (ID_PROGRESO, ID_ACTIVIDAD)
      references PROGRESO (ID_PROGRESO, ID_ACTIVIDAD)
      on delete restrict on update restrict;

alter table INCONVENIENTE
   add constraint FK_INCONVEN_TIPOINC_I_TIPO_INC foreign key (ID_TIPOINCONVENIENTE)
      references TIPO_INCONVENIENTE (ID_TIPOINCONVENIENTE)
      on delete restrict on update restrict;

alter table PROGRESO
   add constraint FK_PROGRESO_ACTIVIDAD_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD)
      on delete restrict on update restrict;

