/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     3/09/2024 1:46:45 p. m.                      */
/*==============================================================*/


drop index persona_activdad_FK;

drop index Actividad_PK;

drop table Actividad;

drop index actividad_avance_FK;

drop index Avance_PK;

drop table Avance;

drop index tipo_inconveniente_FK;

drop index avance_inconveniente_FK;

drop index Inconveniente_PK;

drop table Inconveniente;

drop index Persona_PK;

drop table Persona;

drop index TipoInconveniente_PK;

drop table TipoInconveniente;

/*==============================================================*/
/* Table: Actividad                                             */
/*==============================================================*/
create table Actividad (
   id_actividad         SERIAL               not null,
   id_persona           INT4                 not null,
   nombre_actividad     VARCHAR(64)          not null,
   desc_actividad       VARCHAR(256)         not null,
   horas_plan_actividad NUMERIC(4,2)         not null,
   constraint PK_ACTIVIDAD primary key (id_actividad)
);

/*==============================================================*/
/* Index: Actividad_PK                                          */
/*==============================================================*/
create unique index Actividad_PK on Actividad (
id_actividad
);

/*==============================================================*/
/* Index: persona_activdad_FK                                   */
/*==============================================================*/
create  index persona_activdad_FK on Actividad (
id_persona
);

/*==============================================================*/
/* Table: Avance                                                */
/*==============================================================*/
create table Avance (
   id_actividad         INT4                 not null,
   id_avance            INT2                 not null,
   desc_avance          VARCHAR(256)         not null,
   horas_avance         NUMERIC(4,2)         not null,
   constraint PK_AVANCE primary key (id_actividad, id_avance)
);

/*==============================================================*/
/* Index: Avance_PK                                             */
/*==============================================================*/
create unique index Avance_PK on Avance (
id_actividad,
id_avance
);

/*==============================================================*/
/* Index: actividad_avance_FK                                   */
/*==============================================================*/
create  index actividad_avance_FK on Avance (
id_actividad
);

/*==============================================================*/
/* Table: Inconveniente                                         */
/*==============================================================*/
create table Inconveniente (
   id_actividad         INT4                 not null,
   id_avance            INT2                 not null,
   id_inconveniente     INT2                 not null,
   id_tipoinconveniente INT4                 not null,
   desc_inconveniente   VARCHAR(256)         not null,
   constraint PK_INCONVENIENTE primary key (id_actividad, id_avance, id_inconveniente)
);

/*==============================================================*/
/* Index: Inconveniente_PK                                      */
/*==============================================================*/
create unique index Inconveniente_PK on Inconveniente (
id_actividad,
id_avance,
id_inconveniente
);

/*==============================================================*/
/* Index: avance_inconveniente_FK                               */
/*==============================================================*/
create  index avance_inconveniente_FK on Inconveniente (
id_actividad,
id_avance
);

/*==============================================================*/
/* Index: tipo_inconveniente_FK                                 */
/*==============================================================*/
create  index tipo_inconveniente_FK on Inconveniente (
id_tipoinconveniente
);

/*==============================================================*/
/* Table: Persona                                               */
/*==============================================================*/
create table Persona (
   id_persona           SERIAL               not null,
   nombre_persona       VARCHAR(16)          not null,
   apellido_persona     VARCHAR(16)          not null,
   constraint PK_PERSONA primary key (id_persona)
);

/*==============================================================*/
/* Index: Persona_PK                                            */
/*==============================================================*/
create unique index Persona_PK on Persona (
id_persona
);

/*==============================================================*/
/* Table: TipoInconveniente                                     */
/*==============================================================*/
create table TipoInconveniente (
   id_tipoinconveniente SERIAL               not null,
   nombre_tipoinconveniente VARCHAR(16)          not null,
   constraint PK_TIPOINCONVENIENTE primary key (id_tipoinconveniente)
);

/*==============================================================*/
/* Index: TipoInconveniente_PK                                  */
/*==============================================================*/
create unique index TipoInconveniente_PK on TipoInconveniente (
id_tipoinconveniente
);

alter table Actividad
   add constraint FK_ACTIVIDA_PERSONA_A_PERSONA foreign key (id_persona)
      references Persona (id_persona)
      on delete restrict on update restrict;

alter table Avance
   add constraint FK_AVANCE_ACTIVIDAD_ACTIVIDA foreign key (id_actividad)
      references Actividad (id_actividad)
      on delete restrict on update restrict;

alter table Inconveniente
   add constraint FK_INCONVEN_AVANCE_IN_AVANCE foreign key (id_actividad, id_avance)
      references Avance (id_actividad, id_avance)
      on delete restrict on update restrict;

alter table Inconveniente
   add constraint FK_INCONVEN_TIPOINCON_TIPOINCO foreign key (id_tipoinconveniente)
      references TipoInconveniente (id_tipoinconveniente)
      on delete restrict on update restrict;

