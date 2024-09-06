/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     25/08/2024 4:40:00 a.�m.                     */
/*==============================================================*/


drop index if exists CATEGORIA_PK;

drop table if exists CATEGORIA;

drop index if exists DEP_CIUDAD_FK;

drop index if exists CIUDAD_PK;

drop table if exists CIUDAD;

drop index if exists CIUDAD_CLIENTE_FK;

drop index if exists CLIENTE_PK;

drop table if exists CLIENTE;

drop index if exists DEPARTAMENTO_PK;

drop table if exists DEPARTAMENTO;

drop index if exists PRODUCTO_CATEGORIA_FK;

drop index if exists PRODUCTO_PK;

drop table if exists PRODUCTO;

drop index if exists CLIENTE_VENTA_FK;

drop index if exists VENTA_PK;

drop table if exists VENTA;

drop index if exists VENTA_PRODUCTO_FK;

drop index if exists VENTA_PRODUCTO2_FK;

drop index if exists VENTA_PRODUCTO_PK;

drop table if exists VENTA_PRODUCTO;

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   IDCATEGORIA          INT4                 not null,
   NOMBRE               VARCHAR(30)          not null,
   IMPUESTO             FLOAT8               not null,
   constraint PK_CATEGORIA primary key (IDCATEGORIA)
);

/*==============================================================*/
/* Index: CATEGORIA_PK                                          */
/*==============================================================*/
create unique index CATEGORIA_PK on CATEGORIA (
IDCATEGORIA
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   IDCIUDAD             INT4                 not null,
   IDDEPARTAMENTO       INT4                 not null,
   NOMBRE               VARCHAR(30)          not null,
   CODCIUDAD            INT4                 not null,
   constraint PK_CIUDAD primary key (IDCIUDAD)
);

/*==============================================================*/
/* Index: CIUDAD_PK                                             */
/*==============================================================*/
create unique index CIUDAD_PK on CIUDAD (
IDCIUDAD
);

/*==============================================================*/
/* Index: DEP_CIUDAD_FK                                         */
/*==============================================================*/
create  index DEP_CIUDAD_FK on CIUDAD (
IDDEPARTAMENTO
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDCLIENTE            INT8                 not null,
   IDCIUDAD             INT4                 null,
   NOMBRE               VARCHAR(30)          not null,
   APELLIDO             VARCHAR(30)          not null,
   constraint PK_CLIENTE primary key (IDCLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
IDCLIENTE
);

/*==============================================================*/
/* Index: CIUDAD_CLIENTE_FK                                     */
/*==============================================================*/
create  index CIUDAD_CLIENTE_FK on CLIENTE (
IDCIUDAD
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   IDDEPARTAMENTO       INT4                 not null,
   NOMBRE               VARCHAR(30)          not null,
   CODDEP               INT4                 null,
   constraint PK_DEPARTAMENTO primary key (IDDEPARTAMENTO)
);

/*==============================================================*/
/* Index: DEPARTAMENTO_PK                                       */
/*==============================================================*/
create unique index DEPARTAMENTO_PK on DEPARTAMENTO (
IDDEPARTAMENTO
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   IDPRODUCTO           INT8                 not null,
   IDCATEGORIA          INT4                 not null,
   NOMBRE               VARCHAR(30)          not null,
   PRECIO               FLOAT8               not null,
   constraint PK_PRODUCTO primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
IDPRODUCTO
);

/*==============================================================*/
/* Index: PRODUCTO_CATEGORIA_FK                                 */
/*==============================================================*/
create  index PRODUCTO_CATEGORIA_FK on PRODUCTO (
IDCATEGORIA
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   IDVENTA              INT8                 not null,
   IDCLIENTE            INT8                 not null,
   FECHAVENTA           DATE                 not null,
   constraint PK_VENTA primary key (IDVENTA)
);

/*==============================================================*/
/* Index: VENTA_PK                                              */
/*==============================================================*/
create unique index VENTA_PK on VENTA (
IDVENTA
);

/*==============================================================*/
/* Index: CLIENTE_VENTA_FK                                      */
/*==============================================================*/
create  index CLIENTE_VENTA_FK on VENTA (
IDCLIENTE
);

/*==============================================================*/
/* Table: VENTA_PRODUCTO                                        */
/*==============================================================*/
create table VENTA_PRODUCTO (
   IDPRODUCTO           INT8                 not null,
   IDVENTA              INT8                 not null,
   constraint PK_VENTA_PRODUCTO primary key (IDPRODUCTO, IDVENTA)
);

/*==============================================================*/
/* Index: VENTA_PRODUCTO_PK                                     */
/*==============================================================*/
create unique index VENTA_PRODUCTO_PK on VENTA_PRODUCTO (
IDPRODUCTO,
IDVENTA
);

/*==============================================================*/
/* Index: VENTA_PRODUCTO2_FK                                    */
/*==============================================================*/
create  index VENTA_PRODUCTO2_FK on VENTA_PRODUCTO (
IDVENTA
);

/*==============================================================*/
/* Index: VENTA_PRODUCTO_FK                                     */
/*==============================================================*/
create  index VENTA_PRODUCTO_FK on VENTA_PRODUCTO (
IDPRODUCTO
);

alter table CIUDAD
   add constraint FK_CIUDAD_DEP_CIUDA_DEPARTAM foreign key (IDDEPARTAMENTO)
      references DEPARTAMENTO (IDDEPARTAMENTO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_CIUDAD_CL_CIUDAD foreign key (IDCIUDAD)
      references CIUDAD (IDCIUDAD)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_PRODUCTO__CATEGORI foreign key (IDCATEGORIA)
      references CATEGORIA (IDCATEGORIA)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_CLIENTE_V_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

alter table VENTA_PRODUCTO
   add constraint FK_VENTA_PR_VENTA_PRO_PRODUCTO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO)
      on delete restrict on update restrict;

alter table VENTA_PRODUCTO
   add constraint FK_VENTA_PR_VENTA_PRO_VENTA foreign key (IDVENTA)
      references VENTA (IDVENTA)
      on delete restrict on update restrict;

alter table venta_producto 
	add column cantidad INT4 not null;