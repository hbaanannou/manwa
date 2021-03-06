PGDMP                         v            manwa_development    9.5.3    10.1 �    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            
           1262    184045    manwa_development    DATABASE     �   CREATE DATABASE manwa_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 !   DROP DATABASE manwa_development;
             rubyonrails    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            	
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            

           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12623    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    184049    active_storage_attachments    TABLE       CREATE TABLE active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 .   DROP TABLE public.active_storage_attachments;
       public         rubyonrails    false    6            �            1259    184047 !   active_storage_attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.active_storage_attachments_id_seq;
       public       rubyonrails    false    182    6            
           0    0 !   active_storage_attachments_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE active_storage_attachments_id_seq OWNED BY active_storage_attachments.id;
            public       rubyonrails    false    181            �            1259    184062    active_storage_blobs    TABLE     ?  CREATE TABLE active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.active_storage_blobs;
       public         rubyonrails    false    6            �            1259    184060    active_storage_blobs_id_seq    SEQUENCE     }   CREATE SEQUENCE active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.active_storage_blobs_id_seq;
       public       rubyonrails    false    184    6            
           0    0    active_storage_blobs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE active_storage_blobs_id_seq OWNED BY active_storage_blobs.id;
            public       rubyonrails    false    183            �            1259    184257    ar_internal_metadata    TABLE     �   CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         rubyonrails    false    6            �            1259    184074    area_assets    TABLE     �   CREATE TABLE area_assets (
    id bigint NOT NULL,
    area_asset_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.area_assets;
       public         rubyonrails    false    6            �            1259    184072    area_assets_id_seq    SEQUENCE     t   CREATE SEQUENCE area_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.area_assets_id_seq;
       public       rubyonrails    false    186    6            
           0    0    area_assets_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE area_assets_id_seq OWNED BY area_assets.id;
            public       rubyonrails    false    185            �            1259    184086    color_assets    TABLE     �   CREATE TABLE color_assets (
    id bigint NOT NULL,
    color_asset_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE public.color_assets;
       public         rubyonrails    false    6            �            1259    184084    color_assets_id_seq    SEQUENCE     u   CREATE SEQUENCE color_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.color_assets_id_seq;
       public       rubyonrails    false    188    6            
           0    0    color_assets_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE color_assets_id_seq OWNED BY color_assets.id;
            public       rubyonrails    false    187            �            1259    184098    data_assets    TABLE     �  CREATE TABLE data_assets (
    id bigint NOT NULL,
    data_asset_number character varying NOT NULL,
    type_asset_id bigint NOT NULL,
    model_asset_id bigint,
    data_asset_serial character varying,
    data_asset_plate character varying,
    color_asset_id bigint,
    data_asset_manufacture_year character varying,
    data_asset_engine character varying,
    data_asset_power character varying,
    status_asset_id bigint,
    area_asset_id bigint NOT NULL,
    site_asset_id bigint NOT NULL,
    employee_asset_id bigint,
    data_asset_remarks text,
    data_asset_in_use boolean DEFAULT true,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.data_assets;
       public         rubyonrails    false    6            �            1259    184096    data_assets_id_seq    SEQUENCE     t   CREATE SEQUENCE data_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.data_assets_id_seq;
       public       rubyonrails    false    6    190            
           0    0    data_assets_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE data_assets_id_seq OWNED BY data_assets.id;
            public       rubyonrails    false    189            �            1259    184119    employee_assets    TABLE       CREATE TABLE employee_assets (
    id bigint NOT NULL,
    employee_asset_number character varying NOT NULL,
    employee_asset_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 #   DROP TABLE public.employee_assets;
       public         rubyonrails    false    6            �            1259    184117    employee_assets_id_seq    SEQUENCE     x   CREATE SEQUENCE employee_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.employee_assets_id_seq;
       public       rubyonrails    false    192    6            
           0    0    employee_assets_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE employee_assets_id_seq OWNED BY employee_assets.id;
            public       rubyonrails    false    191            �            1259    184132    model_assets    TABLE     �   CREATE TABLE model_assets (
    id bigint NOT NULL,
    model_asset_name character varying NOT NULL,
    type_asset_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE public.model_assets;
       public         rubyonrails    false    6            �            1259    184130    model_assets_id_seq    SEQUENCE     u   CREATE SEQUENCE model_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.model_assets_id_seq;
       public       rubyonrails    false    194    6            
           0    0    model_assets_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE model_assets_id_seq OWNED BY model_assets.id;
            public       rubyonrails    false    193            �            1259    184489    roles    TABLE     �   CREATE TABLE roles (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying
);
    DROP TABLE public.roles;
       public         rubyonrails    false    6            �            1259    184487    roles_id_seq    SEQUENCE     n   CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       rubyonrails    false    206    6            
           0    0    roles_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE roles_id_seq OWNED BY roles.id;
            public       rubyonrails    false    205            �            1259    184499    roles_users    TABLE     W   CREATE TABLE roles_users (
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.roles_users;
       public         rubyonrails    false    6            �            1259    184249    schema_migrations    TABLE     K   CREATE TABLE schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         rubyonrails    false    6            �            1259    184145    site_assets    TABLE     �   CREATE TABLE site_assets (
    id bigint NOT NULL,
    site_asset_name character varying NOT NULL,
    area_asset_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.site_assets;
       public         rubyonrails    false    6            �            1259    184143    site_assets_id_seq    SEQUENCE     t   CREATE SEQUENCE site_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.site_assets_id_seq;
       public       rubyonrails    false    6    196            
           0    0    site_assets_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE site_assets_id_seq OWNED BY site_assets.id;
            public       rubyonrails    false    195            �            1259    184158    status_assets    TABLE     �   CREATE TABLE status_assets (
    id bigint NOT NULL,
    status_asset_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 !   DROP TABLE public.status_assets;
       public         rubyonrails    false    6            �            1259    184156    status_assets_id_seq    SEQUENCE     v   CREATE SEQUENCE status_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.status_assets_id_seq;
       public       rubyonrails    false    198    6            
           0    0    status_assets_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE status_assets_id_seq OWNED BY status_assets.id;
            public       rubyonrails    false    197            �            1259    184170    type_assets    TABLE     �   CREATE TABLE type_assets (
    id bigint NOT NULL,
    type_asset_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.type_assets;
       public         rubyonrails    false    6            �            1259    184168    type_assets_id_seq    SEQUENCE     t   CREATE SEQUENCE type_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.type_assets_id_seq;
       public       rubyonrails    false    200    6            
           0    0    type_assets_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE type_assets_id_seq OWNED BY type_assets.id;
            public       rubyonrails    false    199            �            1259    184182    users    TABLE     �  CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.users;
       public         rubyonrails    false    6            �            1259    184180    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       rubyonrails    false    6    202            
           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       rubyonrails    false    201            #	           2604    184052    active_storage_attachments id    DEFAULT     �   ALTER TABLE ONLY active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('active_storage_attachments_id_seq'::regclass);
 L   ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    182    181    182            $	           2604    184065    active_storage_blobs id    DEFAULT     t   ALTER TABLE ONLY active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('active_storage_blobs_id_seq'::regclass);
 F   ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    183    184    184            %	           2604    184077    area_assets id    DEFAULT     b   ALTER TABLE ONLY area_assets ALTER COLUMN id SET DEFAULT nextval('area_assets_id_seq'::regclass);
 =   ALTER TABLE public.area_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    186    185    186            &	           2604    184089    color_assets id    DEFAULT     d   ALTER TABLE ONLY color_assets ALTER COLUMN id SET DEFAULT nextval('color_assets_id_seq'::regclass);
 >   ALTER TABLE public.color_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    188    187    188            '	           2604    184101    data_assets id    DEFAULT     b   ALTER TABLE ONLY data_assets ALTER COLUMN id SET DEFAULT nextval('data_assets_id_seq'::regclass);
 =   ALTER TABLE public.data_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    190    189    190            )	           2604    184122    employee_assets id    DEFAULT     j   ALTER TABLE ONLY employee_assets ALTER COLUMN id SET DEFAULT nextval('employee_assets_id_seq'::regclass);
 A   ALTER TABLE public.employee_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    192    191    192            *	           2604    184135    model_assets id    DEFAULT     d   ALTER TABLE ONLY model_assets ALTER COLUMN id SET DEFAULT nextval('model_assets_id_seq'::regclass);
 >   ALTER TABLE public.model_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    194    193    194            3	           2604    184492    roles id    DEFAULT     V   ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    206    205    206            +	           2604    184148    site_assets id    DEFAULT     b   ALTER TABLE ONLY site_assets ALTER COLUMN id SET DEFAULT nextval('site_assets_id_seq'::regclass);
 =   ALTER TABLE public.site_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    196    195    196            ,	           2604    184161    status_assets id    DEFAULT     f   ALTER TABLE ONLY status_assets ALTER COLUMN id SET DEFAULT nextval('status_assets_id_seq'::regclass);
 ?   ALTER TABLE public.status_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    198    197    198            -	           2604    184173    type_assets id    DEFAULT     b   ALTER TABLE ONLY type_assets ALTER COLUMN id SET DEFAULT nextval('type_assets_id_seq'::regclass);
 =   ALTER TABLE public.type_assets ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    199    200    200            .	           2604    184185    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       rubyonrails    false    201    202    202            �	          0    184049    active_storage_attachments 
   TABLE DATA               d   COPY active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
    public       rubyonrails    false    182   m�       �	          0    184062    active_storage_blobs 
   TABLE DATA               s   COPY active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
    public       rubyonrails    false    184   A�        
          0    184257    ar_internal_metadata 
   TABLE DATA               K   COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    204   ʬ       �	          0    184074    area_assets 
   TABLE DATA               K   COPY area_assets (id, area_asset_name, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    186   �       �	          0    184086    color_assets 
   TABLE DATA               M   COPY color_assets (id, color_asset_name, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    188   i�       �	          0    184098    data_assets 
   TABLE DATA               U  COPY data_assets (id, data_asset_number, type_asset_id, model_asset_id, data_asset_serial, data_asset_plate, color_asset_id, data_asset_manufacture_year, data_asset_engine, data_asset_power, status_asset_id, area_asset_id, site_asset_id, employee_asset_id, data_asset_remarks, data_asset_in_use, user_id, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    190   ح       �	          0    184119    employee_assets 
   TABLE DATA               j   COPY employee_assets (id, employee_asset_number, employee_asset_name, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    192   t�      �	          0    184132    model_assets 
   TABLE DATA               \   COPY model_assets (id, model_asset_name, type_asset_id, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    194   ӽ      
          0    184489    roles 
   TABLE DATA               G   COPY roles (id, name, created_at, updated_at, description) FROM stdin;
    public       rubyonrails    false    206   z�      
          0    184499    roles_users 
   TABLE DATA               0   COPY roles_users (role_id, user_id) FROM stdin;
    public       rubyonrails    false    207   ��      �	          0    184249    schema_migrations 
   TABLE DATA               -   COPY schema_migrations (version) FROM stdin;
    public       rubyonrails    false    203   #�      �	          0    184145    site_assets 
   TABLE DATA               Z   COPY site_assets (id, site_asset_name, area_asset_id, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    196   {�      �	          0    184158    status_assets 
   TABLE DATA               O   COPY status_assets (id, status_asset_name, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    198   ڿ      �	          0    184170    type_assets 
   TABLE DATA               K   COPY type_assets (id, type_asset_name, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    200   n�      �	          0    184182    users 
   TABLE DATA               `  COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, created_at, updated_at) FROM stdin;
    public       rubyonrails    false    202   ��      
           0    0 !   active_storage_attachments_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('active_storage_attachments_id_seq', 16, true);
            public       rubyonrails    false    181            
           0    0    active_storage_blobs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('active_storage_blobs_id_seq', 16, true);
            public       rubyonrails    false    183            
           0    0    area_assets_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('area_assets_id_seq', 2, true);
            public       rubyonrails    false    185            
           0    0    color_assets_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('color_assets_id_seq', 4, true);
            public       rubyonrails    false    187            
           0    0    data_assets_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('data_assets_id_seq', 1, false);
            public       rubyonrails    false    189            
           0    0    employee_assets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('employee_assets_id_seq', 2, true);
            public       rubyonrails    false    191            
           0    0    model_assets_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('model_assets_id_seq', 7, true);
            public       rubyonrails    false    193            
           0    0    roles_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('roles_id_seq', 3, true);
            public       rubyonrails    false    205             
           0    0    site_assets_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('site_assets_id_seq', 2, true);
            public       rubyonrails    false    195            !
           0    0    status_assets_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('status_assets_id_seq', 6, true);
            public       rubyonrails    false    197            "
           0    0    type_assets_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('type_assets_id_seq', 4, true);
            public       rubyonrails    false    199            #
           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 20, true);
            public       rubyonrails    false    201            5	           2606    184057 :   active_storage_attachments active_storage_attachments_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
       public         rubyonrails    false    182            9	           2606    184070 .   active_storage_blobs active_storage_blobs_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
       public         rubyonrails    false    184            g	           2606    184264 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public         rubyonrails    false    204            <	           2606    184082    area_assets area_assets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY area_assets
    ADD CONSTRAINT area_assets_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.area_assets DROP CONSTRAINT area_assets_pkey;
       public         rubyonrails    false    186            ?	           2606    184094    color_assets color_assets_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY color_assets
    ADD CONSTRAINT color_assets_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.color_assets DROP CONSTRAINT color_assets_pkey;
       public         rubyonrails    false    188            B	           2606    184107    data_assets data_assets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT data_assets_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT data_assets_pkey;
       public         rubyonrails    false    190            M	           2606    184127 $   employee_assets employee_assets_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY employee_assets
    ADD CONSTRAINT employee_assets_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.employee_assets DROP CONSTRAINT employee_assets_pkey;
       public         rubyonrails    false    192            S	           2606    184140    model_assets model_assets_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY model_assets
    ADD CONSTRAINT model_assets_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.model_assets DROP CONSTRAINT model_assets_pkey;
       public         rubyonrails    false    194            j	           2606    184497    roles roles_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         rubyonrails    false    206            e	           2606    184256 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         rubyonrails    false    203            W	           2606    184153    site_assets site_assets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY site_assets
    ADD CONSTRAINT site_assets_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.site_assets DROP CONSTRAINT site_assets_pkey;
       public         rubyonrails    false    196            Z	           2606    184166     status_assets status_assets_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY status_assets
    ADD CONSTRAINT status_assets_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.status_assets DROP CONSTRAINT status_assets_pkey;
       public         rubyonrails    false    198            ]	           2606    184178    type_assets type_assets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY type_assets
    ADD CONSTRAINT type_assets_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.type_assets DROP CONSTRAINT type_assets_pkey;
       public         rubyonrails    false    200            c	           2606    184194    users users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         rubyonrails    false    202            6	           1259    184058 +   index_active_storage_attachments_on_blob_id    INDEX     n   CREATE INDEX index_active_storage_attachments_on_blob_id ON active_storage_attachments USING btree (blob_id);
 ?   DROP INDEX public.index_active_storage_attachments_on_blob_id;
       public         rubyonrails    false    182            7	           1259    184059 +   index_active_storage_attachments_uniqueness    INDEX     �   CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON active_storage_attachments USING btree (record_type, record_id, name, blob_id);
 ?   DROP INDEX public.index_active_storage_attachments_uniqueness;
       public         rubyonrails    false    182    182    182    182            :	           1259    184071 !   index_active_storage_blobs_on_key    INDEX     a   CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON active_storage_blobs USING btree (key);
 5   DROP INDEX public.index_active_storage_blobs_on_key;
       public         rubyonrails    false    184            =	           1259    184083 $   index_area_assets_on_area_asset_name    INDEX     g   CREATE UNIQUE INDEX index_area_assets_on_area_asset_name ON area_assets USING btree (area_asset_name);
 8   DROP INDEX public.index_area_assets_on_area_asset_name;
       public         rubyonrails    false    186            @	           1259    184095 &   index_color_assets_on_color_asset_name    INDEX     k   CREATE UNIQUE INDEX index_color_assets_on_color_asset_name ON color_assets USING btree (color_asset_name);
 :   DROP INDEX public.index_color_assets_on_color_asset_name;
       public         rubyonrails    false    188            C	           1259    184108 "   index_data_assets_on_area_asset_id    INDEX     \   CREATE INDEX index_data_assets_on_area_asset_id ON data_assets USING btree (area_asset_id);
 6   DROP INDEX public.index_data_assets_on_area_asset_id;
       public         rubyonrails    false    190            D	           1259    184109 #   index_data_assets_on_color_asset_id    INDEX     ^   CREATE INDEX index_data_assets_on_color_asset_id ON data_assets USING btree (color_asset_id);
 7   DROP INDEX public.index_data_assets_on_color_asset_id;
       public         rubyonrails    false    190            E	           1259    184110 &   index_data_assets_on_data_asset_number    INDEX     k   CREATE UNIQUE INDEX index_data_assets_on_data_asset_number ON data_assets USING btree (data_asset_number);
 :   DROP INDEX public.index_data_assets_on_data_asset_number;
       public         rubyonrails    false    190            F	           1259    184111 &   index_data_assets_on_employee_asset_id    INDEX     d   CREATE INDEX index_data_assets_on_employee_asset_id ON data_assets USING btree (employee_asset_id);
 :   DROP INDEX public.index_data_assets_on_employee_asset_id;
       public         rubyonrails    false    190            G	           1259    184112 #   index_data_assets_on_model_asset_id    INDEX     ^   CREATE INDEX index_data_assets_on_model_asset_id ON data_assets USING btree (model_asset_id);
 7   DROP INDEX public.index_data_assets_on_model_asset_id;
       public         rubyonrails    false    190            H	           1259    184113 "   index_data_assets_on_site_asset_id    INDEX     \   CREATE INDEX index_data_assets_on_site_asset_id ON data_assets USING btree (site_asset_id);
 6   DROP INDEX public.index_data_assets_on_site_asset_id;
       public         rubyonrails    false    190            I	           1259    184114 $   index_data_assets_on_status_asset_id    INDEX     `   CREATE INDEX index_data_assets_on_status_asset_id ON data_assets USING btree (status_asset_id);
 8   DROP INDEX public.index_data_assets_on_status_asset_id;
       public         rubyonrails    false    190            J	           1259    184115 "   index_data_assets_on_type_asset_id    INDEX     \   CREATE INDEX index_data_assets_on_type_asset_id ON data_assets USING btree (type_asset_id);
 6   DROP INDEX public.index_data_assets_on_type_asset_id;
       public         rubyonrails    false    190            K	           1259    184116    index_data_assets_on_user_id    INDEX     P   CREATE INDEX index_data_assets_on_user_id ON data_assets USING btree (user_id);
 0   DROP INDEX public.index_data_assets_on_user_id;
       public         rubyonrails    false    190            N	           1259    184128 ,   index_employee_assets_on_employee_asset_name    INDEX     w   CREATE UNIQUE INDEX index_employee_assets_on_employee_asset_name ON employee_assets USING btree (employee_asset_name);
 @   DROP INDEX public.index_employee_assets_on_employee_asset_name;
       public         rubyonrails    false    192            O	           1259    184129 .   index_employee_assets_on_employee_asset_number    INDEX     {   CREATE UNIQUE INDEX index_employee_assets_on_employee_asset_number ON employee_assets USING btree (employee_asset_number);
 B   DROP INDEX public.index_employee_assets_on_employee_asset_number;
       public         rubyonrails    false    192            P	           1259    184141 &   index_model_assets_on_model_asset_name    INDEX     k   CREATE UNIQUE INDEX index_model_assets_on_model_asset_name ON model_assets USING btree (model_asset_name);
 :   DROP INDEX public.index_model_assets_on_model_asset_name;
       public         rubyonrails    false    194            Q	           1259    184142 #   index_model_assets_on_type_asset_id    INDEX     ^   CREATE INDEX index_model_assets_on_type_asset_id ON model_assets USING btree (type_asset_id);
 7   DROP INDEX public.index_model_assets_on_type_asset_id;
       public         rubyonrails    false    194            h	           1259    184498    index_roles_on_name    INDEX     E   CREATE UNIQUE INDEX index_roles_on_name ON roles USING btree (name);
 '   DROP INDEX public.index_roles_on_name;
       public         rubyonrails    false    206            k	           1259    184502    index_roles_users_on_role_id    INDEX     P   CREATE INDEX index_roles_users_on_role_id ON roles_users USING btree (role_id);
 0   DROP INDEX public.index_roles_users_on_role_id;
       public         rubyonrails    false    207            l	           1259    184503    index_roles_users_on_user_id    INDEX     P   CREATE INDEX index_roles_users_on_user_id ON roles_users USING btree (user_id);
 0   DROP INDEX public.index_roles_users_on_user_id;
       public         rubyonrails    false    207            T	           1259    184154 "   index_site_assets_on_area_asset_id    INDEX     \   CREATE INDEX index_site_assets_on_area_asset_id ON site_assets USING btree (area_asset_id);
 6   DROP INDEX public.index_site_assets_on_area_asset_id;
       public         rubyonrails    false    196            U	           1259    184155 $   index_site_assets_on_site_asset_name    INDEX     g   CREATE UNIQUE INDEX index_site_assets_on_site_asset_name ON site_assets USING btree (site_asset_name);
 8   DROP INDEX public.index_site_assets_on_site_asset_name;
       public         rubyonrails    false    196            X	           1259    184167 (   index_status_assets_on_status_asset_name    INDEX     o   CREATE UNIQUE INDEX index_status_assets_on_status_asset_name ON status_assets USING btree (status_asset_name);
 <   DROP INDEX public.index_status_assets_on_status_asset_name;
       public         rubyonrails    false    198            [	           1259    184179 $   index_type_assets_on_type_asset_name    INDEX     g   CREATE UNIQUE INDEX index_type_assets_on_type_asset_name ON type_assets USING btree (type_asset_name);
 8   DROP INDEX public.index_type_assets_on_type_asset_name;
       public         rubyonrails    false    200            ^	           1259    184195 !   index_users_on_confirmation_token    INDEX     a   CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);
 5   DROP INDEX public.index_users_on_confirmation_token;
       public         rubyonrails    false    202            _	           1259    184196    index_users_on_email    INDEX     G   CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public         rubyonrails    false    202            `	           1259    184197 #   index_users_on_reset_password_token    INDEX     e   CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public         rubyonrails    false    202            a	           1259    184198    index_users_on_unlock_token    INDEX     U   CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);
 /   DROP INDEX public.index_users_on_unlock_token;
       public         rubyonrails    false    202            r	           2606    184224    data_assets fk_rails_030b18c4e2    FK CONSTRAINT     �   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_030b18c4e2 FOREIGN KEY (status_asset_id) REFERENCES status_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_030b18c4e2;
       public       rubyonrails    false    190    198    2394            u	           2606    184239     model_assets fk_rails_08e7aa0c5d    FK CONSTRAINT     }   ALTER TABLE ONLY model_assets
    ADD CONSTRAINT fk_rails_08e7aa0c5d FOREIGN KEY (type_asset_id) REFERENCES type_assets(id);
 J   ALTER TABLE ONLY public.model_assets DROP CONSTRAINT fk_rails_08e7aa0c5d;
       public       rubyonrails    false    194    200    2397            v	           2606    184244    site_assets fk_rails_20205117ac    FK CONSTRAINT     |   ALTER TABLE ONLY site_assets
    ADD CONSTRAINT fk_rails_20205117ac FOREIGN KEY (area_asset_id) REFERENCES area_assets(id);
 I   ALTER TABLE ONLY public.site_assets DROP CONSTRAINT fk_rails_20205117ac;
       public       rubyonrails    false    2364    196    186            t	           2606    184234    data_assets fk_rails_2791ec5e22    FK CONSTRAINT     p   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_2791ec5e22 FOREIGN KEY (user_id) REFERENCES users(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_2791ec5e22;
       public       rubyonrails    false    190    202    2403            n	           2606    184204    data_assets fk_rails_4fa7eb28e3    FK CONSTRAINT     ~   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_4fa7eb28e3 FOREIGN KEY (color_asset_id) REFERENCES color_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_4fa7eb28e3;
       public       rubyonrails    false    2367    190    188            p	           2606    184214    data_assets fk_rails_7dc061dbfd    FK CONSTRAINT     ~   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_7dc061dbfd FOREIGN KEY (model_asset_id) REFERENCES model_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_7dc061dbfd;
       public       rubyonrails    false    194    2387    190            q	           2606    184219    data_assets fk_rails_9adfd75553    FK CONSTRAINT     |   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_9adfd75553 FOREIGN KEY (site_asset_id) REFERENCES site_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_9adfd75553;
       public       rubyonrails    false    2391    190    196            o	           2606    184209    data_assets fk_rails_b74db5145c    FK CONSTRAINT     �   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_b74db5145c FOREIGN KEY (employee_asset_id) REFERENCES employee_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_b74db5145c;
       public       rubyonrails    false    192    190    2381            m	           2606    184199    data_assets fk_rails_be73f2ad8f    FK CONSTRAINT     |   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_be73f2ad8f FOREIGN KEY (area_asset_id) REFERENCES area_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_be73f2ad8f;
       public       rubyonrails    false    186    190    2364            s	           2606    184229    data_assets fk_rails_c9edf3afe4    FK CONSTRAINT     |   ALTER TABLE ONLY data_assets
    ADD CONSTRAINT fk_rails_c9edf3afe4 FOREIGN KEY (type_asset_id) REFERENCES type_assets(id);
 I   ALTER TABLE ONLY public.data_assets DROP CONSTRAINT fk_rails_c9edf3afe4;
       public       rubyonrails    false    190    200    2397            �	   �   x�m�;n1E�Z\�7�����di�0�����i��^K��������{;���8����hܴI�v��_��2v�m2�:���J��c�.4�X�O�u_Z�ߏ����]����jj4��Xdh��;"5E�9�e��L,�e5�j��md�)b�f)�61�w'��,�?&s���Y�M�w�? ��,�?�Mg��FDOJ#�      �	   y  x���˒�H�u�n�����iD/,/Ш�
"�A����i��w�'ؕ;�����?��8y8�L��b~L�F����m���2��RA|����9;���A쟒2�?�EuzԱ_F�!���SF�`!�/�M�� ��@Q��JY�$�{|[���H����~@��L��!|�C�$��EX���u�,��*y�*C�iI��V�!U�W���\�A/�L��3�,�`�f��#�m�9�U�"�V�m�iQ�ZL��L�կl���x����Rm���TKeΉ�@@�V �G���&AS?�M52���>[�1#�W��!1��)t{���$ydO�
�I
�Yu_R���#s��w�Y&��?Z��[�./�H���Y�֚(���~~�[e�>���L��Aʔ��wz.f�����֦��[���ޓ��1$���J����T�<z�ł	$	�!��e�1�)*4�����^����)AXP���8�_О�/i�]���rJ����0�b�tW��i��M��1!���
c�)0�W��՚/S{��Uhh�,
RȨ!p��C�\d�b2�Βլ�w�޷�XP?)�c�(�}��h��'�<���t�����Q8�Ѷ�*�����,�w�N�jc/�۰�j�m'�8J���L���7;-+�b1v�%�Fn���A.s̵>���Δ��*��[]=�ۦ����q�I� �v�4��ExN0sg��Mn���!�lF�	��Z��[�-�1���Uk�
Wd�%����ܴN#�
�e^�ֺf1{�q�������T���Z�~�ʶ�j|���ϸLA��2 ��fv��b���4����u\����D{�n{f/�^�Ca_���ϸ�"D����$I�"��h       
   <   x�K�+�,���M�+�LI-K��/ ��-t�tM�@�@�������W� �LV      �	   C   x�3�ʬLL��420��50�54U00�26�20�317773�#�e���T��]��P)�=... ��.      �	   _   x�}�Q
�  ���]@�����B*�D��������z�o&7b��D��.$6(��!�Z�vu�w$B��K�k��< ��?�u�*��g�g�0�      �	      x�Ľ�%�q.���)����|_��<'���R�U�?-����H�$�_3dS��54�
"j͓d�͘��Ex����͑�V3+˾��>��ͭ�+��1��Y����脖֯��ZI�G����"�>��SB�WB�:!�,�繟��YI�.�	�d�f���Z�`V���6K�?rm��wI~�e���ub=��I�|m����Mwr�̴� ��RX�V3Kk_���e4�b�0&��*}��p�	�h�im��w�  Ad��%gE*���߇�������b!�R��fs�_ǅ��nJSl��M(�������V�  L���~�2cLS��W�/?}��_}�^������~��S�-�A���Oe���z��B�n�X���/���?��>-����n�q6J��sz���������﮳A��8�`-b��������O~��}�c8���
%x���6�+ywHÔ�Ө$�痧r��b�~Y���e�H{����6^�r�@���;9.��X����~w�~���<),%i<g�����{�[�B�������/��E�b��b
Lb�"�^�����m�P�{��xP��zuU�U-��
��4*���<��LDXV	+�z�u���������:�6j0y`hL	�7+����@�jq4�˪��.�S�f�����ǵ�v�Zm���G�bE�y�0��As~yr��a�<(oEP����2}���/˖m�:������W�UȆz��D����)>�yL��"n�$[��d�J����[y��p����F��mh�s�7�;�� �2S�=��[��[JZ/=���D�GgBx$��_wO��J�8�ҍSy4��N疙)#Xvf�����n��ef�H��ۥ���{���#�g3S&�G/ڞ�bٹ;���+Q숣�v���v�v*�9���e�.��fC��f����P�+��m������4�6�y����[�{���l���r�`��HRz��2��6	�����r[ |�#82��U��t� ���2g��g����Xw��P5�:ʑK� �+����&�h��g�+i�a�3��L���Z#�Y���z;i)��:�k���Y�Qe�΋
�����Q�c��::�s`%|���	o�g�6��#.8њ�������n���n֧���j���\ݟ^��s��)Ya߀7�͓Ff��%��O>��;_�՟�0��'����vw7A3�zAWO�Z�X�xa�+%� ߬-�xa�k)�j��Hj9�d�! Y�<Ւ�xA�7�s�dQ��d:,*Y��d-)9�
����-�r�Y-^�x�臫4���p潠���K^��=K^v��dG�� *D��!��%��ò�]H��A�'f�d˒�ҒK^��@�f����&��ҿN s�B��I�����X���9��L���ǟ:��f�OG�_��0~b
�α �* �r�����>~�����O���?vN��p�H�Ǒ�oḴI���XR28� Y-o��γo�x ���^��y�q6PK_��%��,j�L)��e�� ������U�'�K/�ʒa����UKv,�J��lY��v��,yaS
$���7k����-1m�����T���Z�2��}G)M6�T\��$�+d�.Kx��fKy�`�,1�b���7hJM2C��l�?�K�d��ڥo�?.��@�m�k�Ě�d���`ZP��e+3g�	R����V�`�����bO5Y�م?kQL"��u�DͳmV\8�����Q2�	(Qn���0c�5��z#�?����O�%�����ݼ���*&'|�ġh�oNECi��Ӽ&֗�oP:�W��@�8@
�ysEɏ�%ǌ�A�Ak�X��^X�ٲ-Ɇ�+��-P|fV�,X��`ij����X�*E��t��g��w��������c=��9�V����ĪW2t������kc��dd�_8�&�c�nQ�Jx>����SR�`�B���Pk0L�K��i%�P�zu}�=���3�G��\��꯶��o���r%ˍ�����c�����Ͷ�,].;+��>W3�je��j���/�t�Kg���qk�K�&�A��՛7�,?4͊��G�}�}�'�zv"�χ�����R��!�&k!`=3��<C>C��m��f�����/p4��-�7�+����oZtl��߮ϻ����\���rQ�fJ���%��?~�E���>����O�������=���ן���Ͽz���?vO�����{�ǧ�|����uk��2Y� �#xϓ�jX@���WR�7�ǀ�O �v�@��<�M��;���D����wgFl�/ҡ*�L�4��wM|�<m����3����8H��� `�9���`�~�Q�R�ˆ0 uE��[��X䒾�ȁ�U?v��'���M��ފ������nw��^��~�]������v�k�+��4e_��wo��Z�4�`UPytoVT�0�����E���~7�m�QDӮeB1�ĉ=��&&1�$ty�#��%�I�ʴh�e"����6��F6�
4�K��d�~�����s�á/�\��WM�v#a�_��w��'�������j�lcѩl�ẃɄ<21+b�x,aP�F�����ȱ��y' ^�Q�%$�ﯹؤ�g�H(��8-���Yݛ�]�:�
m��l��!������e=Hd�.�O�l~Q����	F�#�����R �́�U�;VxM�X5��Y���ֺ<�[�ڱ�] �!z;\��Nz�`̀��pj5o&�z e8n�����c��˳R��M�c7��b�/.+���w�C;V|:|uD5�������W3�� ,�<�Okc��!��g��@pzA& �w�M�3�K�M)~Y%~���`M9���.ȫ����c��`\q���F0�d6�m�
���/tӄO����4����g.�Y�oԨ���4 �uwu�[[�����t�Y�_�_�R���D�	:�qWQ�$��- �w*�G�6���O+i�H��)�`�8=����3!Fw�UctpZ�!��_��eA�����vZ�`���*;}�?�ZGa���=5q�=�L�I��2ڰ0�FdZ���5�^��Gi8�̡sG�T`钩�2�lD�ݲ�
��ހ�o������]_EG�t*�H����=��������W*�c��QE�E�qX�.	REW�Y�͌���(�R@F�	��E^Nm�ee��;!�u�[�L7�.D��JGO��F��;� ����]b&g��w�6o�����}�_����^>гߛ����)9��a<`�:&wj`������~ ����AE�sB�X1cy�æ��,��������,��&��|N�
+�%	�m�b�z�O~�尡�n�PF(�7��g��x��WM
��,��6�Gjnz���V�F�%Ό�k+2z������~qU�#���O
�� ���!���׳�̨����j�7�� ����|��O��zX�]ޠ��&�+�ԫ�%R�r����9��+@�|V_�x�^�]J$k���A m�F���C�<�hLy&k-�۞�y�a�L�|�BS���6���k�d��#��F����b}��_��t�[�r���@�"�r���M���<���{�z4�ܞ*	�?��nO�������C�^��ugקW�3�X����A�~����=ź��+N���4��be���Q�� jD��S�oM���2��	 ��:l<�kw����l��PA��� 
�͖��X�#Y��=����0�����7���tm��)xa?W߭�2�X�c���d���3V�Og�4�9�9���ݘ�X������-�����~��d�|0��)z�;�t������C�da8d{���Y>UƁ����e��92,�����F�9ʫ�Sp�z�,��D��>>���;�^0���5��� A�T1G8A-J�I�݅7w��3c]( �ߞúM�\	�mC�����p��՘�o�%YM�	���� /�϶�`cX��f�t[Ԧ��g����\h3(x�|Vp��` MP=��k    w�	ʰnS�6l����,˟�lf�zK6i��mENưrS�B�~ Z�o0�1�usx�ÍuA7�7��\�Ɣ����7�՛"؉hu���y7�e�V�.}��EexH+a�}k�4-�ů@�z(LI���k��W�
N��IA��p��|������O�>��ogb��s�7F��,7X$��bY�uaB�i ���Ͽx���?>���?s���=�������������O���n�09h3tu�'�x[ԩ�z�0C����F�bO6�)��1G��>�c�iLT���ʋ��F"��Y�2*��Z��DA�jJ�n)�缅��`�4=S����ќ��bz���<�Yc"�j}}��h}�mv3C��*�P��S���\����	�J�	�@dS���x�ݎ��d
��C-��޵��?L��(g��1�ҙ�pB�һ���0�����<�z�Fg������"�+U�7_�3�Y�+�,����]�-�����:o�K���J���vHk18�5X�Y��i�xAg��gE��Z�?�+���ךz�En�7���GϺK�9�9���������T����ш��z�bʁ��@hԳ�ާ����v_'�mZVkJ&4���RlM*y�lJ����kg�#w�A>��/�����W���_N"4]�G&W#t�	"|��==:�	ȚO9���Vƽ٫%����u�4X�<ћ����E
�j�g�����zOI���J.����޻�\�n1^	�����1�լX��)Ĳ��af��<���UC8;��T�?���+<%�pIT,��~��=�*������Q�V�C2EqXT�[;��zE�Mw���5qaHgu�E7�zk�K�B�#���ܟ���}�HX�cQ�V�)�W�������q�\�)c��f�p�\��/MV�1��Ur!�A<��`�6�00\'�$v�X�n�H�����ӧ��k������ ,n�M�\)���@LM�ʵ�\�MXڸC� o\ܷJ�\R�\,�U����Dp�D+��>I�ti���8��C")&�v�\:�fm��&�6#,��š���<̯Fp��3U�2��bhY����R�pǉ�_og[������嶬�_����k�"%k��]i�x,� _^�d�,��EJܤT���@F�Bs]TCa��vR�RM����"eR����VU�=R�G��n3˕w��/��[Mj�v��E5Pg�kl�c��.�aw��&���4Z��Om�R*ݼ\n߷�w��r�]��l�'�JrQ>;V5��� �;��h`*�4NX'�EO������sź�Q4�^A��.R>C=n�K��el�/�����p�_*�+=���ʬ�.�a��
�-�E����"1/�.q���ۋ�η��\v��[��񹆞JK��S�\�+L�F�Z�|�{
���בڥ�қr�y�7O>��ds�]�L 8�":w|�L)����-HL�g����W�(��N��+o���"_�GJ�I'�z����"]^I����b�x��������ƀ�䊣xjK�|��{�w��/g�&��E
M��w�*��ȯ�!�΋t��=��ͫ0]�j������~4OZ*��X{.�rM��E�y�X����x��Kr�Z,�7�X�s����]a_ӒT�\���ДS&�;����k�b>pyc?'+�\\ʍQ��^kcf˵{�nn��aO|�Q�P��������;5͙,�E���qc�� ����"ݵ9��ہ�n� �/��f�15PV��� v�%(=�Z���C<i�v=�EJ��!�	�!]K)���HI�¼C�z͘5|Q>,��UhO�Z������q��7Nj���1�r���ʐ�Ў�´���\�9 l���4?�X.�3�W���T�#Ԛ}�\��Ѵܫ�x����:����{��H��Xj�:����R�<�,��>ͧ��5��}�ȹ�	o0J�r��s��N
1$R���9јܰTl'�W�Ӭ���m�|*��� ��i�R���iY������G�A�ɧ���C�F,���T5'E��5z��I���$?v@~�-�q�k��M�;L����(:����ZV���S$�[J�I=��U�*Vt���i�bk��T�!�ٞ�U]j҅���Q�&^q���TW[�e�w �J �zO1���.�x��m��ڊV��؉G)�^=4YL�ـ���^��c:���< ?��W��-{�R4f��g:���w;�|���N�̖F���KewJ���,^g�}-<s����8P�<|$�' 1�굆�g��X5�$�;�E��"(n��r[�Y���4��t'0)��ʪ�B���>�yG�@��5��+񊦌�{aT8:�؜�[G�xx{��h���<�7Lc��IQ4�Kx>5�m�3�G�6@�[�4��N�g��A(�X~����@ ^�� j�<W�|S��{�'(�|����$��|E�0�ݱ4b(�f_�V=r9���9�Al���u����k�߁�'��w�>�t^\����J�>��������Y�e�ؙ}���(��� ^�~۸��^��Y�h��c��D~��r�\�%C��JI�["��}�@�@#���Ճ
�6$��R���*�X����F�5��/���vo3�8z��(����4'X� ��M)'˱Y#B�-�D��ys�%�$�T9oN���0�����v4�\�t�Y��2/�ﰽ�D���	h
��mqڏ�W��NX�.G3u�gJ��T����c45FKS��FnB��8���"���L]�*a9����3�Hm�'����V������p�j
�8Ạ)X��9Asy��N
O�$YĻ���>�X�Q���DO���>)Tc���*�4U*���ī�x�U<NjnKbw��0�őg;(�f�ڦԕ��?T�	x�0�p���9m�J�"9�� �6���-q:'��tI}��"yez��l}��I&"�FHo	iz7�/����/�J���F������_����/�~?��I�mF���OY�'�A(V� �Ņ�A1�hWH�j��v�LA��᭒ҽ�E�-�����1x�-c��j�3�s��b�S�t
���Q�����@�`l1�:ht�WRׂ��3�w7��8�ɇ�s�$����,��z��eCh�rFh%�84W"�=&wKכ�W9�l�z���J|y����'�V/5��R�D ;���ߨ5nr} ��1�鬟�ԮF.D�8����b�R>�����������Ͽ�*��#,��D�� �b޷1P��?nx諿K��p�~���y���	Ƭ�w�˙�|��s��@Q�bp��	�B ��(�,|�T�&�ܟ�
;���H6Xw����R�4S��S̥�V�B��{���V7L#n�|�?3w��J��&*�r��Ҿ�o�vۋ]w���g�6��ܔ�3�/��Yﬖ����I��C���b(�Ň�VU���Pa��z�x�V��ߎ��u/�l��R)�ɬ���m0EP��:�����-��F-x��R�źϕi(<?���뵲-+=ߋ�P�]hY�q1//ymt<��EeK�g�a��x���Y���}˲����c���M(�}S����A��Jl1�C\r\���m�C�0�e7<�&&e��AH�,_�@���T�}d�,�^�̾r�e��G��F�i6��cͣ{������{|t�ޞb'���s2�@u~��i�G�+��EUc��f��Bږj0�8$ͥgQ���J�����({��Ǳv�׍��RaǚL�7
ρ�%�(k0_6���"�aʫ�+��l��lϊ�� {t7p�g��j�9m<k�fƁM3���YaM�.�(\-�@��S�A�K����Y;��+	��<+953r�YE���8.�xVQ3���ȴC�����7�:�>����j��0���g���^��U���k�Gvf��z`�&��gxU$��B�u`M.�dyn)��Ж���da66�yt�5��a�[O$�>��kxJ J,�J�:��$Kڂ����x Z������ճ�$�k�4    �a���P<�r�������Nv��y���޻	bg_
C�/�w볓����lw8�������������4������.Vd�qd)#62���a��0�7���@�ZgܤD��Y L�̸i�I5�@�*���T�@pө
r)/X�C�C�c�D6�8��a�&�3�,���QL7p���1X��DI���jkd��{�(��[J� ��q�&���ˣ��uwsr}=�����>N��]�0����`ŧ8�n'�g�Zl�X�)L���*,/H��i	`�zO/Kτr�5��ȅ,b/%��g:���0��;������O�*����UC3΄��8\�+�d-���}#L��k��)�Yh�,�p�ߚ|h?�p}���~�,0��8F)�1%`;�Pm���1�0����L���g��^��뷻ۓ�y��^�rӝdR������J�	1���+Vv9����Os3�� Y��$s�b7=}���~����ݯ����e��/��c��~��v���ǟ~��	�+�՟��>�%a�#`��N=���+�
%G*|H*�P	��:8GQ�$^�e�bx.�s���X�ә���q6D��3�WouQ/�FL�����{���q*�z�"�����þ\K�@�}�T���jzW�v��7-����x?�\n|[��7��ɷEQp���e�� �%��s��F�rxr׷=��s���W��+�(޲����m_�ڿ�Z�	�XE����0� �_�h�����&���CY��'�[+�|z����o�MA��r����@�#+a|1m8_Vɖ�;oøAU������X�c� ��ٰ�Ӯ��oσa����;������(���k9�ݢ��zR��h�6l.#��z�JÀ�����j{C:o��I�=��W�3����5÷uB�&���+�'p���t�ß�-�r-���2�������m{y,�M���!H��h�U���>=p�a����vw�>�W��``z�I^⓳���ɸvdV2@&/wz)|��l�TKW,=������#m�h�R��$J�o�ž�^����&�b0B(^s�Nǖ������yw��[�{{�+�j�3�-�� �� �����LF�y�m�E��6Y8��}�h���us<P�����m�.d6ؾ�Q�������Љ��8YvY��;�%�N��ں�x��TqZv�o|��;&�4�]�a�j��c]W�9�I#�Q�q���Ӌ����b7� p��taW��hlP
�*�z�p|!勩/���<�rU�LB+R�u'L��ޱ��8hy���߼�X�uq���U�����xVtݛh��qj�T��uԽ�sc��~�^?����6���[��l�+��Vo=��G�?�5Zwy�'燇؝�(�C�� Ld饢�!��S���T�C1 9�":�U��XDvu�}�	�%V����O���o��f�=k7U0��K��_�G�0���nX����� zӦ��u��$a�������H���4����<�D�h��Ұ*�_������T���������%}`�����%���nl|��� �p���C�pkb;��[[r���&��ݐ �?y�W����:O%��T�;��Su�m<+ޜi��NW����� �5�n7_���3J��g3"+:���;?jE;\���}��Z�m���#��©��!9���ߞ��M׊q�o��[���M�!��jN����%>fcFP�~+%�%_�2��p�liJF�p*ϳ���8�]��JN������8��ಭ׭���T9zx��6��4j����Z�� X�){�^������A�PΆ�D@v�z0��|���	�Hns�^�x@��r[4f*`]��	�L�E53������zA0PFj������m� JG�
��h�3�����I!xo�ؼ1+�������oSD�urb�u�L�w`�O��J"�!�GAg��c��x�E�ks��l/���@K�����,?��;�å��Z��kM߷�J=$a���J-�JAӷU��<���?!��ۨE���V�re�雍bO�}�Zz`�ɬE�X�J�,=���3����� M���J#�R�%������UZQ���AP���~Z�zs((��Rb��/��6�2,<�X��Z�W#M�Q��Z�2I���ՓÚ��j�'�a����R�Z�����Q-7*VS�R�зJf���ZJO�XQ>f�X4�)��mJ���v.hVS�O�f�S����KH��tA��R��
W�(ۦ_��R�ZuM��<dk_��@�Ҳ�4�/E��/��V�p#���6vb�T�Shd7^��K�S`�˨����*�fE�׿=���Vc�Q��rJ5�w����^i����jl�z�z<,"�՘�d�QZ��a���<H�j9�R���������w3��-_�jdy��(���zd]/}�@o0�G���Kl���}�`X���wKɷ�Lԇ4ɷn�����>Q�=�waq�X�(� ��h%m�N����0|4R�=�S�>o,������<����׽�`80����󖕟zW�������O���Z�{���Զt{�y�"����R���\�G��F�.R�ˤ�`�@�w���F��1	�"�b��nO� � �������$@�<P;�CT��g��L|��u8]MxיtSQ�c�tŵ��9VdJ��q8#�Ð-���X�)����)�X�)��Ļ�Ȟ-��9{��7bP���0S&ڦ���X�)x���t��[s����>����ϵ�6)0�+rݙŇ�W�lv��jo���_��L	��ֹ�lPD�4d�?�p���U#B�"e���Jl��/�^��Z�uhV(N߀;5����M.9���j�L���Zk�/�����T�e�Gq���,�c�� �9�&֟������mwx������!F藶�U�/�� Y|>�.��1��g�NP,?��.�䊍/u��3Կ03�H������#!�Y.,����\U˷,������T~�Vr,�k!��z���=�/�R�c[�u�B�8A���,� ��Ԓ M�4�g�[k.�>Ӎ	�$i�b�Y��F��LҨ��`�V�_	0�{�*DVf�+� �EX�4�.S��_~�m���~��-=���	Y�)��A:\n�X��@{Ɗ=���)�jݳ^�E�S�(n*moO�μ"��φg����ʭ�-�1�z�(X�)�C�g�`զDNZ	g��`����?:��/���@��F�o��v5E��mT1�iۿ�A��f��ՋQ_�Ц_f�(��U�rQ�B�X�ߋ;U�gM�bX�x"�(X��,���E��lU)��M���ts }[!-��eU�!�(Y�)א���	7�ӻ������w���L Vo[��{���?��t~�����=ׂ�8�w��͛Fs��wН|�Ï?�	���$�Q��#�(��Aw�W?���.C���e��Q���;buW�Y>��:�ol�"�w%�TǄ߯�(.��ʟV�{d$��s��%�p���		�2]��X�%��K��x�y��Q��=c��+	')���ׯ6�~e�W[��vPq�zn��*=j�i�i��e~��cy�ao ��{|��/8�Q5k8]�����FֳR�e@��\s����.e�2�iC��H�=�_*�S�"���8�}�;��v�g��zG���8��^ʽ�*Ѥ���D�)��bƈ���%CPݻ&����ӊ�]��91�hW�9��i�X4#92Nb4��E�6,=����{�ޥ���իm ���]!�����?��#��H�n�ڽƕՓ�Y��w��6Drmd�c�e6+��cmXf�i;7xp!KаJS��5>���X���b�u���v$�U��Qxw2��*�a�����%V#�;6q�a=�*	���W�a�6��$f���4�j�aM�*	綝f�R/�7�O�����*T���8�ǎL)�Ҡ1�H�F`�[u�3v\PZhV�����h�K�x������_WO�ee���3d�N��6����6X�`^D5,�ְ(��lY��/bRd�bj��-튖��ތ��m��    �MaYݹk��W!X�mw��+�T�`>�
�;������5�t�|y��[� y���B�{J�5�5��)PM�݁F��h87l$����ڧ����	R����Ճ�#��t�14ch��+ݳ�+��;�J9��TAL�li�"���o�=��S��bp�!/F��K �_~���w�����1�����d~�n��X���[�����`e����O1$]���}���HL�7�yP��1�(�7�7'+�V썆eF�=��.o�O��3=P�l&��N����*Z8� �.ȈZu�3/P�Ի�_�l6�<3%5�ŝ��z���$�gR�tf���&g/}m��3P�Vֹhx�ҥ��=/=3��>���K�hxg����_������)��:���{�qF5����?V.��m`ϺOYȀ�,;�e��Cل�I�_s�}ލf �ִi-S�� �ވ�G�UF`f��VÎ�g����@*�EodܧJ+ѠT�	����q!����i�X�#8L�^�O�f�Y���UR�;T��6蜖F�����j4���:�ߕ���x �c��j$�k
�ԍ6A��X�ЛT�7A��+"�޴� �.�r�����bdU�CvћXv1N�Ұ�5��|o�6q(��;|�ߝ��Hή���`����v��R=(VI���t�YhZ4��D�J�ޅ���+�,@��6 +��7@'�/��S��1�Y}D)O7:�����M*5�On�Մ��Ի��?�3��2��rl��"� �pR�e<��:����d}q��\���=J�D�Py'� �7�La0�Mbg��A��t�G;TH�ޗ�Iq$�jF����Cѽ'.(^�T�O�naL����U۠��m��%�����[2���v.��BA�7E�=ՁG�3A y�����]|~�� ��'���'�y ��v�X;[���O����Mx0�^Ι;6	��F9q�kC���� .(�Tj�t0,H	��������&G'�,�k\1f5Y���2=P�/�qN�q�L��U)P�0��)H��W��:�
�{&��I�w�0׏��~���LXH��xN�A}��ة�*A�g��o��`4�Ȱz���9(���(��Ie��C��qkEFQ%�yeϘ�����в.*L�0���Cˈo*���xS���.2R~I1jO�oaL"�`�&FUL j`T���d���ٜ�!�_>������ELCi&��h��?�<�ůaA�]��m�bf�8�>�z�<�2_:s]7��#��UЗ����e=�)&
̆�x�M��C`��� k=_*��s�f~���z���~4m[��R
�@��Ҩ�� �L
 Sx�1�qJ�� ��%�����i�J�;%-E(n��U��sd����TO�bSTj����N,�ۚu����@��v�F�Rs�#>zé�64�f_-��5��l`ϻQ�A��:���!��u��g��ge��8�Km���؂qv��g��Y<+^��S��i=���ֻ�oq��ǰ�Q�y��0��p�Zh�J礢�[C�Ŗ��Lq9��*/�o�à�9��tM��0Q�]m���/���&4��a� oT�W�az̽˷m�(�Qb��vG'�պ%P�TT���jaä�T���MťqJ��L7�۪~(����g���Eu�H�,��ܺ���Eq���|���`��g}�z|�AD9n�sU�Oy+����#�W��gH57mJ	.B�2�K�?\��t~�0oF,'��1'9!�K��_�	���پ�1�ǒ-d�S�r�p����v|tT�r���I� ��d��ȍ��14��u��������~w&
+����$]��aXq�v�0VkN� GG9Z�˅lܛ4΄\ܴ�x����<��Q5cs��,�2��}/@״\Ħ(����՜��kܿ�`��g�`U�| ���G����Ǫ�J���{�E���0����orG�RZ��Z�x����W��m�M��i��wg�D��E� �i��)V��h|�� �f.I1KhH�g��6X���R��h��ƃ���_jkq_JG��M?�^�a���O/�.tHp�w�J#�~4��Ú+��q��Gs��f��H�V�n.x{e��t���m@a���������96#�Ï�X��8��>,� \�ƽ�������G+W�q;'��!�L�q;�4E������0�j��R6~�4C�h��)�oË�1	3��z���TQL�\��!�鄉����Si�1���2��	@�]���~�Y�-���^��b;�������3�_���k��a�4=vO~��K�SӖuB��Ki��5~��=̏�}>����O:�gm��gu�D���-�2�5�Tc�J;����}���~�����LVf�_��~\���i�n�\�ֿQ�yL�W�Y���T��Q�A�#u&�A����g���^-~\�\OK�����	ަ���k}� �u�[!h#�JI�)��,��-�Т)���ݻ��z;���\V�)��	�InN7y*��4�j[��d��T��\O�){|prR*�Z��\�����5�\�I��@�[��%H�,�2�%�ܖ3�d�Z��+� ���!ʾ(KhD.�Bɪ�<�(�k���醥S��r��.�l�+��rI����zI��2��a�p����n�_����� �灙��@)���!.�󕊵Z�g����]@wY���6��.+�mHg}�d���Y��6嘧�.�����t}=��,@�RSzqL�%��(��)d�U�����n=����7�v� ���|}�^{!#�G0�Z������t��d�/T-jdTۣ� ��:(|l	X|fL�I���z�p޽{}7�#26�ĳ�:�����
ݛ�n׭;��x,V�Ȉ���y��6{k2>?̴������3�;|�]Q��2�X� �W��<���7$���}d�i��!�f_�p:��{|�um|-`,Ä��t΀sw�v����ʝ[���:��z�����A?:#��c��E��$���ŗ�	�k�%��.��K|���i�P��&ѭ�
 ��ׅ�12�PuB>��0�]\������}@�tD@��X�B��j�P]������0�ym�}�b<7�C;��~�I| m��t� �t%�#Xf��¦�������4�F�N,�Ż��j���XJ�T���gGxR\�W4{۝ �b���i�.C�	$�����M����ԏ� �q[}I �%Q��s��,�Z�T�X�O�Y�a�T��ɪR�ղ`��>�q{�-ۆ��c�bPe�s���Ƞ��<���u�a���2��}���i����Q�]"WN��_ll�
�����_Ļ趠/.������i� �S�01q���"�4FÀv �!F�xj�k�c
�!�j2��2j�U��Wv!��榻�(�= {����n���ff���VZ	'�̛�V�Yq08{ՆUpV;o&|�B%ď�-���2�gN�����ẍ́�#�}@����sq���A����j+t�����a}�M>}e�bL#��Ε�2���|��B�bP��o/�t���(GՌ�gi$T��d{��$c�BJ6r�`��W�����]|��Q�3�~
�-Gu���+���2�tl�f8"0S:xdG:����4oz9��:����rO�.Eb�~����u�wH�	������g��}�4O~���N�t,.�"S��7�^�!D�|�E�֞q�B�)�"S�
�N+,��vo����T��xݗ��u�d����!�;'�u�d��{Ǔ4���h`ud!2i=�FF��b_{�Gȴ��YG�ϫӤ�t'`��Bd�2�3~�	�w�=�Ǆ��~���!���j�5T�����6�Wj�t�{l��6����Q�*�U ��BC��΁hCfE0����^P)m�Pt���"���G��-���j�� �	|"�ڦ۷J0���:GT����b�H��{4�C��֛�O���L<~�Fs[� �M�z	�Q����5���Zt�l�k����    ͐��!|�����/3���Ew~}����TX~�q��FR� B
�T:ġǭݱH$���f�0D�6t�v(f����6��E�
�R�D�v�\[�ĥ��:��a�V�!�ߟ��[0!������7��E�7��N08����ަ��S�utE�|p,��'j{�04cP�i�"1�aT��we�L}��煵�Q��P��:��2�y�uą�&h
"ڐ�;%w�>�_I�
NP�V����]FT�S��f⟱��G���&r d���j,e�MW.�7))�%����;S�_��S��MT^	�e&��b�(���qq�-���E�U������B�Rxϝ+�e��|=*��`q�TZf��>Dze��4F6�bݧRo>pi������jI�$��D8�'�c�HX���� ��j�8(?�A�l3���a�C��K�0����{t90�����b/��oL�^��b�'���Qu��$mQ�|��d2j�aG��M ��C��O
��I�����:v�.aj��0��Al͑?,L��ep|�uF�7
���� ��&-x``p��z����ϫ�K���ϴy�)e1;����e}x����yV��J}!�ZL� ��Q�>hfJDa�}����p�V���5��\�|�1��wʧ������3k˕f҉r���B��r�%o��Z?\&�8�IMVm���Ơ]w~FC�\�|i�x�܂�n~���A�b�p�5:݁���j���9�X�xLZ�����"I�i�\��#�gw�ގI�P1�*U(0_�^�u��=��)L;Ma8��r�h������Mj4�I��iO����!H]h� j�L��(=��Gc�X�h�CZ�yp�[̽Z<'%�Q��}[�ن���r#\Wc-&�7��HF^?Fϐ�Z�'w��s|��.��*���}������s
���J3���ݙ͏��pi�\w�D��=O��O��(|��[�ಂ��v/�#87>� ������HJ�;���?���ք�a�j�2��N���*0	�Rd���E�@�P�T�g�L���P.R���E���rT&�!|�Ƣ��j�m�d��_��,P�5z��,��|���к���p��&�X�����E�9Y(��-��ޤ��p�E����?M�"�a��<w{4x�:��u����#�	�lq�.>	�؝��RYQ�R��f�>VA�����mY�ڲb�if���X [/��E�6�$"�KQr��ݞ����jס�,#O�M��B.�G�8�����Iʯ~��Q�(�-��T�4`�uo�N2p�T�OȻ�8�8�=�lf-�,B��.���	-�,�/�;z�e}x�#�.� ��b�F��wX��9��J�ͬ��#t��vw�f)@"�{0�P-�)`-�����10�XhG���1v���њxW^2��ۼ�`D�@m��Y���w&���G�*�b� ��sL,���p���^�Ul��x�nhh�{�����a{�� ���b���	OD��F���xL����\��;�9/)Z�9U�CBX��H��y�+ml���GV����~��?��è�oJ��� f�t�?��y��p����0�$��rFyf~rI�^!L/�qn�d^UM��������S3p���GH���4��C�)��i�jD�\�v$&~ $~��p�im�b~�nh&�i�rp4v�g�0�Ļ����d��v�ߝ���BYZ 1�z��/Ɲ�:1��ԣ� �)<��X�~b+���O'sU�1�h$���{�Ќ����9} ��r�M��<�v�F���f9�%��)����,��+�g)�n�g"���~0��Y���S���p�1�d��$x��8�M�#�L8ft�D)���70�.���T��wy���(��m	֔�X1ma�1�����>.c^����Ld�{�Ui4����:���E������i�Ip�Ͳ`ƕ��|w���4ߦ�9�yΘ��d��G0^��ohM�h}xx���n}�Tuߝ^uw���w�s���ʄ����a��$��-��G&.;2""bOT������cӬ�	����а��w�G�����k����sú��˚)sx�0���pQm�C�e�[����O���A���ؾKw>�=4�#+�f��Z0�Y7E��+��SN��7�ۙ��Ld��,�S<������:h�i�}�y^���36  �D۲I4�=��0b8�L��D�[����p�j���u�o�8tr���c�t�΍�??��^���UЯ�@S��i��h-���2^q�.E�M�N�V9��і�Sd����=���y:W�I�>1��C�^I�j�Pl�A�����������vfS<-BF7K��Ƃ1�"e���ε�i1��'-^;�KS�Aپks�-�E1��N�ɧ+�5����������\Tɨٞ����>�FA���V��[�&�3�ӓ�:L@��g֭�kpM�`�=Li{|�+ݾZd�Q�Aa���^\���12#Xa��b�Ф�P�a��3�53Ƿwk,�K[��Ʉ�c&���ݠ�	'��>�7An��~`r��!�F$���ˏ}7���R�XG��r���n�J0=t�W��cr�<�%v��BTS}�p���&���bB
�t���.��J3�*�{M��p��ȟE�|jVt���?�oYK�2&�������\s�F+�8}Q9�K%�]b�4�Ӡ��:��:v�ҁ|.���H%�QF=���(0�|Ү��g�H��VUx�?|�8�2�`�@t-�f���j�&����@;����uXLj�X+�K?S�Q��,��S�c�l�cr{.k+�>e���0<E�7B9��̐�;ㆌqp���X�7�E3P�w1�~�X�)�A,;|�YҵS=%�:8Vg���P7�'u�I��lV��zL����g���6){�bB��Ͽ|�g�����	x����}��/��~�?�u���y��\bӬ���,`���@�N�a�/��ؙ����8��H��F[��B	�]��m��a���&0𘲠���x�H��9��X%�U����d������ ���6��Ca��3�Al�b�`Dz��������bb �1X^��_��x�Uu����UGز@D�~�V!
1e;*�S��M�$���>���/�XBm�V���h�3]q�7���U���[�{�ד���ee
e����ep�F4��ymR��S@QM��9)pv/pc���C4g���ј^�[�ܕ�͙kh�c��ʿ�K����Q��	طiG[�&��E��ݜ���{>�S7	�P8�_�:C��;V���V��d����"ކ�}��ˬD� |tG�n��[H�H��&�3���P����V���In�40��|`��Ԋ���A�O�z�Ȉz�'J���A�K�;�X5y������LP'��g����.�ޑ��ǳ�T�p��9�8z��yy�Z7�S�Gg��D������]w�)���c�?���x����x��0��#��r��)1�x��ň^(a�[���Շ���+'Ȑ�͇�s�P������U���D�@2�(��a��pQP?��,Be�b;�42�K\7�9��_s���h�#�xl��S���|m?���L;E��tx�'�����Kϩg2�j|�.�-�ܺ��y��U#<S�1���<�������\S��q�[L��N�����3yV�q}��XcR���Ȕ����H����8��Ȕ�z�S��ʛ+n>65(���2c���������Q�l�Y}1�Q��|86�-��f�����.����`%�g�n���Cj��"����=$��b�۞��ʦw��X��i���Y�E���� �C�U�"�J��Έ�ꮼ߲G��e
���b����n��G����=�=H��!No-z1�@yP&r���
�D۝l�oԁ0��M1�P<�1A�_i��a*!�Q0	�-67g�ԃ0yP�FJ����7a�n_$���$���    ��(�(
Q��(D|�F����#(IL�T�%o���h��z2�����"b ϤR��
VpmCםwg�3W���0t4��E���K��K�7~��U!��@S���?�4�ç�w.��#p�0�gp��m�����ϯa �Ro���ݴ����xt�D��DB:�f=<�[ߵ�P���z/G#M�ց��bzYgT�1]Ԍ�`��t����O_���K�����]*ǫ5sq��t��Azr4Fb �:�=����٬��w���"3��Q�����qnD�d$��,��T��0�}V�|��q�cXߢz�L��O��e�'0_Q�_��:��+�r��mu#ef��>�@�@����5r�Fc�C+=A�f6;0�)�	0���؏	H���1y�����h�����b��FQ.;���AQ��a��vW���ꁙ�(<!V�a��S��t��e��ե5���)���HH��%+g|�R�h��=�)�M����P�A��gr+BQݧ�^��U�޶.X.`E�P2������	�Z��|0�`\&0huqO�9rdr!k.I�s��B)"�������jfͺ�e���7����
�P1gn48�A&���mĭ�TCS_<`X�R_F$�H�r��:���z�r+�PpOil�� ~'��O���9%��9���̭C���ct�:��#��ie�|<��.��	B�$XG`=`�43����@F1WP�$*X �0΅����
L���������;t_j��{�f�̫�AƗ�M�oO#%O,�5���d0������=���	��R2�pYe*�Z�E�L{%�u L&f�\#��b�5X��{�X
P3��ٓJɱ1���������hL*d��.1���v�H�dy��1�p�CC�@bql_N��E/r�j&��t�9��Y�I��7]��_Lnx�A2ǔw�U�9[�'��!��q�ҍfb1�C7+�ρ�$8�v2����s���M*S�"%�b�Ԟ{�J#,l������������ݬOg�?a4S��h�f���E� p�P�߾�����8��Τ��s�e8"�	T��`�f��v��;�Z��_v@Cq!T�D�°����8ck���c���uX�������=�z<���ł3 �E�y &���F�1L:vO#�;e�O��<�b��Fo��.���_a}�G�����kN�aBrb�9�c8�������^�ƺ	gRr�T�K�SN��Ε�<h��\�LcM�y �'u�DH8��R��T�8Oa#�[)���y
c�y�p@�$��b�0c�l\�1$�/8��B���`��;W�/ {�=�� Ѯ��V�?���k3����^��^�&�iaa������rf�c��|_��A��	VR��3�Ag��	���e*����಺�>��'���q.j" �b�9�.��F��O1�c�7����L�FE4�р����!dcd!ע�d5�����}.ʻ7�40�!��7������N��e��dd�P��{/�����-��Z"��P�����N�;$�j��
�
Z��`�[�+TSÊ��_r�31��C�}�����TD=� qEA��L�"ַ���\qjQ�V������6'r�o�U{�,�Ew~����£�7�S3����`���꺻+;P��Q�l,c�e�̰g'�Gg�����%��=@Ըu��l��9F�q�5�o���\�������H6,j^^π�!n����S��<í1Ud�����Z����=��4�Ȁ��4�ِ�сa�M�G�z~%%�fv�2^0d(��X{�s�� �dN�1�#g6�4�ه[����j�s�Jy�o���b��LC�a����ty/�����bW^�}IK�\��I���|e���Es���=M���o��,D9�#q'��z��qx�s�<���\3/��:�&@�0��kJ�������k��y�G۵�a{��f���?��O�ҹ�
`���f	3��M��^(�?�+[]�\�G��1��IO��p}���r�+�P�7U��@�	��5�nO�y�Kk"����y����*ϙh�ц,�U�9���V��O���.��k�B,��������?Ca�h�;�GH 7���c����xq��i�T9��X�s,���4[�,Vx�74������F`�)�:#>5��qwN)yJ���(�"8������m��{�+����ߥ�'�L��q�޹�d`�).�ؘ��h�	���~-��Է��?V���)�\U�1��=�n��X�z1�r�h��|����Z���4�&}_A�v�9W�"N,�1�n"`��m=t�n���R[��܏����c�?��DC��C`'7��x���C?�)�(Ƣ��Xr�*BOkֱ�H��tQ�0R�\��ӛ�3�C�Zl����Ew��c�ɻFu�ҔL�0���9���t/7��w��V�g�T�
f��w�x$�ǇK�n�c_H^�`r��-I#�j�l����jwxߥ���v΄��y S���<�T�#�s��oo�O�ٱ<�W)�����Fl�KQ��vsx,��ibS�OW#pM����2�$H=����@Տ��mS�ʥ�����L�[�9z<�=R,D�N���?L�=����^_]�q>��ܥNUA	�>�����=�?�Q����T1�����A�)0�V��P�o��vÐ~	R��7�z��O?���sa-Æ�"X��~yXǰq���l����r�t!�[Hy�xx����{��@�FA�zHf-�y��FP�Đ]h'1]Q4��,�u�bnve&>�d���(�3�if-�,ޞ�l=$�E@/����<��WP�β̴j�%9�I�zز�A&r���^��(s�?G�O�N�}�p���W��2��-�f~��Ϡt"6�
�������,ާ�h!τ�e(��_�po�����в�7�fc:ƴt֞����;:G�^����
�=Æ�m}=#[�|�>|<�؅6�.o)��B,�ʋ�AJ�L��{H�ddH�y�����Ru�>dH��&ĥ�G�9������q�5��+������KUGr�˞���6%�|��s2=Rˊ c�l�)U�!T�W_-u��MѦOfb2E�a�MM9�T_���LH����&��?Kioĵޠ3�JҌ#),:�t���R��KҎP�*�xf�����w��������w���n}>�3��䘤<}F�n0�wg/|���3G�1GEE��[�0��ll���F���þ2,�j��d|no�����B��OtG�Nc�\G19҇Ċ�H���(��b���L|�)��wTnE�y�qԒ=\�:��*MCg��5|֛|փ�y��z�n���|H�+56/d���=dd�wBn��P��(=Û��y�d�6`z��Jņ���k��(7��y���[j������x$������Q���Qj�H�G�%8���I��(5�2���2UMI߇���U&m�2
�������5�R�T,�EP�^r�L����{iv`��� �����'�#��T#�j� K92F�x(^���g�Vl8�;�yq��ߟ���o�I�P��J��1�B-��p��i�xK��:CDg3D�s���  �G��J�w��ۺ�A�yqwqj�c������"�R7�e�[`�Xé}����L�
��j�6L&�I���!�0�� �9K���+�Mk.MB�^����m���=�%,��JN��^�-ɞ_�E�?� uf��m���A���rM����>�?&K�`h|D�v,X/���$���x�ޞw��ՄB����]�f:<��`�`�O�P�+@���7'�����e(��"4h6#�riɼq�8a}����B��E`���?�c�38>ZI���Vʱ��Sۮe����B\�O�dF�҅��)2B�]��H^[*U8<]��u����U�*,C�U7kCt>��l�/?}��_}�^�����U�#��T΀1����2N��
��B+�xu�YX�*]h[P�g�/q�Kf%vaiɬ��gVy�I��D�t-H:ݹ��{����+�J��C�Ѕ�����������B�!x    ����jɆw9��r��G��k{w�_B�<����0�E�l�K��8�=���h��I�[)p<=�&Z��;R�������D���%��j��40O֥g��X$�O0 ]KR�"��Sʮ���N1�Ǉ��uE?�4���l��G���������Irf����R��~�i�� �W�k��k�S={�<����mڲ�H�o�>ܱ����������bP�$X�?m��}�E}3=���v�P��BE�0j@���A�~�����v�|�a7<��i{��J��J��O4����{<� ( ��6�P�~���32Q���ll�4�����9�١�h������9��y�{7'3�ٴ�jT����{xx,w��`n_?�C����R�����]�=��kKӸ{�=|5�,uc�8u�'�ޝ����_<c�E�$�@&!�� 52f�0Br�DE�H��i�\UY�T$s�>����b�|�m��3Mei����������zN1���h�5� ]k[���Hi���tsO�u�
)�w��RvԵ��t�q�qҰv���CX�z���Q�ץ��0��5�D<���?��%�E�K*UO|��z�h��i��;M酵�Q��3ڽX���6y�п�p�A?
��X#:�%B��S�$����F����[C��9mq��ppu6��b�ш"��򙘧8X��&Z��5m2��][3���F*��C��.�rW��g��n�{W�_b
�RFw��ǿ�S]��
�Ǖ+.Jȯ
��`�&��o�͒����`���ل�4=����/'�p-���c�N�!D�.���c�l�('{[�<����u��-��.�C0���a�x�L;�&�,�,ʯ�w�y@=��^��E���������yxN	�k�G��jQ- ���-�P���h|� M_���3�v��!�j�ބ;�V��Egi|�2w���b��b<"�}���`�)��X~�=9+��+��x�˿^̀�,�m�%Ew6�X������]���=l
�j�y1	\�3pE����g�)�b$l���r2�i��z1
|����6����2I�b��.�? ����Eы��y����"��0�g���+�Ye 8�3�%������j^�Ѝ�P��Z@��n|�<���� � �_��������wrھl�I)ΕM�b�R��-�
�luK�D7����b]t��tE'��jz��d���D4h�TT¢�h�'ɉdW[�ɡ����������35Ms2�tdQ5mT2���LW��h�c�~�[va-t8�=ԛ�(ۆ�v�/�V����"�(���D�J��9d��XuJ$�P��~�"��nE����߾��/����wOV���?�$w+���O��姟�g��?>����K�����s��@�U��Ӵp��tN��'F��l��Ӗ��e�B$%�I�����l$}���|6�ځ9C=\.Y��9cۖK��gΘ��;d�3��rɲ7L�<�<���2���)�{������v�#Tg����%�h*��	�A����(����:�ڕ�9�vg9�W��^<�V�GM�����6��գ��6��ٕO�<���X�G��6ܯnݱ�ʋ����jab
�A,u��� �`�&���sb�9QT�w�XE�K�	��P�y�t�� �.�|�>Z'�j'�Ng����~��z�I��I�_x�:U�n�D��&*E�d�,V:cD|��!��/�#�U��������ˊ�G�6g�n�@����5��L����@�,պz��躼�m{��ɛw����q��"��U�	���1�
U//������Ю��"����>jy�$���o�)��_�屒�������!LTd��[{�=�F��i >�Z�=���3Yz%G*��$��w`��M�z87~,~��I�s�T "[�.._܂pJl�`|i��ś߉�7�9BX<KN�7��\iT�#�1qN4�	��h�!Z�'C}�|�E�#�F�-�(3'?����G49����E�}�_�D�c�
>D�=�vHN���>�X�
e!b��A��|�E���(��u��|�u�� 
��D�9%��P�v�b�z�g�2����=x�gf(�AD*�2�bu���IvS
��1AX�c&yQ�$�)�_�����f6���F���Σի.�^T;I�;���x��
ɋ���'J��-�+8��B�1D��Ŗ*���Qq��"�#[X�����rj���n�yR�}5�Y<��f
Fp��9 ���.kL�Q�~�"��	�a�m(8�pǛ��t��Y�*��*L̖J�v�AwV�kԱ�M�����L��JQ��fK7a�T�c;�F����nv��2$;����W��B]���>��ޗg����%�XH{z��ʌ��g��//�T����˻{jֹ�'�@��.�Tt��p�
\���� 9̨s�/��ys}���/��̞�b�~�|����6����ՎXIk�]ߓ��=���y��4�@i8f�.��11 ��H�F�\��� Y�K�?�������l�zJ5E��T"2�y|+��0o���l�#ލcs�;Ҭ��G�%�n��3�}��ӊP���k�7gz&�t�#|~6�Sm7�ۤ�)�t>1���͛v{M��:��� /O} �h�?��S��ۇ���Ws�#��7W���3��2����ڞ�g9��;����FP�%;ɖT�_��Oi��Hyify�D|��ĭV��m��(0*b�X�]s��ؕ69Ors<�/Gj���+��u��o1�7����\sx~������ЂQ.��3�V����+�uq�\S%_���t��zg}Z7�F�S�d�޿�$U���m*����>�T�����b�x�c��\�mU ������!Z����I�4�����������6�y���Fc\��lq��g������Q�X�L�y����2Z��w�@�|�=����^���G��(��b�3qŚ0kGp�Z��nq�v�*Lǋ��������"-���B\P��:��L�Q6�<��5��ps=P�~���C��S�����5K{��qm\�s��#�ђ.ld�� ,��	O���f��z�5'G��]�ƃ�����:E���H�ؒ�O/'��N�Ll17\��DjxA-��C��.sD��A��>��>�5O�47�m��OU��h�KHοP�I��/�Ó���f �f`��N��P����n�};:��(��3�kz�gĢ�JH���A�k��E��bLvQ���7��=<o�O�i>��V��+b�E��Y�� %p�7�� ��ʪWB�J@)z▽�\�����)���"��m�~�� �`D@���3*{��|�^��>�1��
h3��Y��:FY>c�������ݰc��(i4ofG]+��Y��Q�JGet*�^*�R��үs��}h�"�S��9�}�Q��[��GO�=5���>��VI��}�XmA��.��,��HG ���а}�3�����a{}�ҍ�H=xsyPx]8���(�6�L@#���E�]�q�7/Ö�+�%�-�������>(�Q�@�̟�PL?�8�G��N�Ll6"��z	���C��-��j�x�������# �n�%�<�MZGh���Bw(k� ���$��M{w?��M�I�Q�$R��0:Asǵк[��X%(^vݎv]tbi}l^��8�z@٤Fj���t�LPV������Ш�O�%�稵����N�Ll�V��)��G��n���W�+ւ��o�}��C�;T����S�&#:q4��'�n�uԸS>����3�SN^�H�s��eVL�s��vV����a-��h��� ܗ�P��|7���n��{��>K���k��'��l��Pڠ�F��(�9�$�����Z`���c��{��aو���{�3�i����۷��⺏䃀�.�c������sq��0M��������y}l�u�B.vP�:��5P	�5ޤS�V�N)R�Q���    �wqȽd�����5��2_�w#|��iU!�I���6݉`יrD�&�\j�% =�a�T�z��8��TC`	�6��;[�~���>��蒏٫<5;zQ9��D!���@�s� ���	%;����2w��X�rr�Z{y�8��"&Yj<�dH��܋ �[B��#!C���ፋ�Y̞5Ѣ��DwƼO펪��u�'��;�:h|�{~�@M����#`�<��e�5�g@>Y�nw�`���ro�h�mv�ު|@����U:)��lv����Cқ<�Ԣ1f2�5 I@�q��ǻv��B�f4ϻ���_3sA	`ٌA�o���枽����5�((��Vr�U
��x�����; ��}s}s��Q�'rB�0�u����nB�xz;	3����(���r7�:Ek�/8�����W�l��f3>+���M��<�)�H.4��8t��4��)��Z�н��B�x��57\D��5�Py�u����'� *gz�<;5ۨЌP	��|���^4�,V��X��C�?d�*�e#3O]O4�.z��6�]�� �o���.(9x{kwӾ�"FQ,+����)���f���}s���7E��m�G51�~�E3��Aۼ ��D�J�r`2�NNh�u�bs�2^^6��D���#H[z��]8�������ׂ�#����~��u�'�u���Ӧю�����l�尢���&�~��t����3��2�Y���6 �Y-����l�1	@�옝2�j�]7O8��]��zI�݉ߺ�<���uT��CR��J������	�1х��+
]x�AwB	3��
x?�IC�9����������t@$9i9����u�+�}J�0�����w��0[,G7p�}��З~�~3Џ~�~�W����T0)�L�e�JE��?G�%;�&��\���x�aw�w�����i�gf�k��Z��-��
�m�ׁ�Ů�i�zOZjѠC���<5��s�3t;�l|�ŧ����q�~�|�������7������I����ל��<������#|w���m���\�nj�p�'�Auf�t�y%��;�lѽ���x(�f��9������8Z���!BZ�I�y~<3��ż$ә�Oȗ�����^QR�Jr�&���"����5Y�O���
��`��� �z�IJ�K������y��~i\�^�!nn3�ȋ���I'���1S��x��6OlW�)x��H
�a��f�x�B8��V��0���������Pkӂ��2���D����q�&�]d�8N�߄��@p��f�O�O��
��ǵ!% -�ii�8J�o��E�ETF�U!~ �C��6w��v��/��k�Y����}����i5U�MN0�t.�kxA��ټz"�C�KIE?%�MH��4~����Ȭ�AK:?���W�y�����c�\���xtR��#�h;	�,�#�5����Q��D���vx�?�ƻP�g�c@�
0�"騈�K����u�!�2�ܐ�>`D) @�b��#��"g�|�i��׻��a.�h��h:U�S��L��h�`�zN�2vL�6��Ilƞ�ə/ ����}ޟ.*�BE�qK��J�O���\��`00��jT�$�H�`�0�L�7�00YG`}�
�t�q/m�k�T�agޜ@���!��T�(�%\��Q{��Hbn8��O�B��N�g��v�
�0p@1�v�I���n��q��̼��p3�гs���ݜV�1���_�h$��fuo��g(/��qݡ7�ϫ�Ah��q(�O��4��?��0w��0HRmM���3g�2���<UT}�P����������xц���P�Dnе�( w�pvx(�6Q��_Tu�DP+�Ho�/�����P��X����v�wN����_��ӿ7�vt�x&r")%������������%�B�&H��{W�X�2	�8Wƚ�阝��h h�-�MW	<�R��؎
�-��BM$�2���%�}P_wb�cQX�dT8��u�iwZ� �!�_8�!QW�Q���Y��O�����U�RB�|��TBԖv�❷���nH�C~m��3v�L�����3��ީ�4s�T!\9g.��	!T�@���qH i4&��DU��$r�����6L�A��6��}�*ۆ*j&\��o��6ȉU�v�2כj��Mmkh���E�.�n��������_/�J��}�,�uul#��Ak��	z eOu���6��}���_���3�gI�m�/`l��%v��
9���t�wgLhڻ]Y�S�H�F��t�k���m45#.[
�eQ�H���x�7-�8�����hX!����k�>Q����p�p/��o��� ��F;�n4�K�}��R
^	
ǂ|��.�)�Ƴx�x��Ӄg�!*W2@9/����`������A����bʕ�ѡ�yh��)��O�'/��ـ8+��E8�GϘ_ɑ���15h+\��1�O�'x���:�.p��<����N��AL݊=�Q^�)P$�����Z��Ȓ�`��8�ؘA�d�4&Ѳ�q���9��f��!�������Xyi?��Spq�<��5Y��O>������	��\]�g�װ@�ز�I�s��r��L Vn!d�r���Q��y�6V�側��ͧ(Ū!�v{;٤E�q���-Np4<��+�@`e��@��"zQ����];��U���^��{&��R�2�� VC�4�����ZC���O�J�:B�r[m�A � nI_���(E�XZ
<�O��ʆ��0�A� �Ԍk��,�
�I �[H`&��.K�d1�.�l��F6G>�c\ȉ*�Ɗ� �|��o����������n��O!Ql�u�.=������aN�
w��e�,^/C���bg�X�B�$t~����?����ی:օXP��WGC�wK��R"R8?��Aĸ$I��E�����#���Y$C���R��Rf��]�+�YT~\���5ڔ��$B�(�3Pn�<��*�<�ë��t:�T�����JL��G��P�fKģ��F�o��-��D8���_gDKU[� ���Q�U�la�o�DiO��D\��k��
��
�T��Ե Y߃5c�+�h�zF?ݷ�����_��l��mW�-�	������epT��o~��?|w�������܏c��h��}.�G5A��2��t)��Q�f����n4
�Pe�d��yjx+�\+��w�6�2�(�o��S�Dw �'��C���cs�
^��_6����@�b���T��=�g��X�Ρ+s��P�c��g-H���@[O�G��ܾ?}�̇q�ƓyI������Bƃoո�$��6̀������Q��+|��d{��?��J�8B���Z�d��S-_��%�j�"������
#Q�$xq���4���ir���*��Ӡ/o���g)^t-H66Q�є�<�T��!��!�o߁���7#����u"5��L��I�H+�q�&�����TZT0��T�@U��H��fS���`D�t��e�	��3NP8���̓R��	G(}�L�C���Ey��������ը��=g��@��j��a�"ѵ�bT�8C�
'<��\����&�\P���e\�M(��J�8�T�p�	��3ށ�s�@Z�U��0n�wt(:BGUk�i�)�H��D���+SBIO���j3YAZ�V��͟�LDWc�kN��}�A��s�˗���AԐd�Ӂ�XL��P��l�<\5{ME�9r�?������Qe�3]!��뫧K�G�n�'A��m��m�Y��g�'4���G�'��$����D~�TM�l7gR<b�,���B�$ˏ�on�i{����Y���,�ӽ�悂�r�"q���d���ˇ�%
��
���v��3MWH���-5!��h��	�xX�w��?|�Fp��n�|�딡���v���;����X{�8�pĩL`�B��3b+�-�u��˶t�*!>�*T�1���^�ᩉNt­�����e!zmĂ�4�uk��    ��|��R:+��o���b��DF�T!�d��!ڊM�TI���Z⪄�N�M�k�L������T���z*���:Q�5�Ȋ��J�W��9FY>,+(e׼�����Νi�|6*]����-M^�!&�o�}��k
���^`a�2�˱�hۇ	��%�'��&+���G��[�gu�z���k�=�Ϳ�6	._-��D�̔�`a����@��T�@����`��A©GiC�aA`���`��%?��0Wj���'���r9+���"#B���qUڟ4�\g<�ž���ֲ̡GP 7��9K���J����9��w�\�@=5�� S��]�����n|� �V�o&�њy���I�l����EAI�=�#�W�7�[����j�vb@4S�(��"�܊��p�������=��@�K�(�&La׌͋	�zx��͝�F��ݝ=�!ňh3����_�dr�r���bT��g��[���h��I�M#�5�ms��uf
[��c{i��Ĝ��)�hp���!��7���\)�s5�}�q��q-_4�'f�5�m��u���!5����Bx}�7����;�N'��=T*���X�FC3-� e����Q�:�A���{��n�hT+N� ��C̪11Y⤛��7Y�)����+��;H!��-:�����;*��	�V�`G6����6լ�;���U�/F<T�4��P5w{�L7��W����X
�Xޤ�m���e5oT�6�Uk�3KeT/�����X.�WB��7��z��%����vp�<����
:M=�(z�Bx���l8��E�lΑ�QEc�{��*:��;�ESO�
��1�yX�<���g&��7�A�2He.nV<D��0�����?ۼ�;4���?���o��@���u�T��G��Q���0u��Z�Y���xv媓�o������p����,
<$�P\��^ޘ��\S
� �Tj��	<:�]"*�p�uObݣ��ċ	\$
�\�����7͡�<���]�e�T�:C/��g'x+�$F=������dPqq>���,ӷ��þ�ݽ}s��X_�OWO����9�SDm��d������鄦���њ<Z�gu��=�O��O4s�r�x��C�4ϕFe�(a����s�wB�G�i�j�(1�ip�@�{:��;���;y�\��a�h��˱�ϯ�9�P����(��!/�f�~��fќ@8�ޡ�����ij�l<�m*d��8�]Rt�2��2�/�1�9��$��f�0��\GƎT.(5�f ;:���2*
*�-�P臛L`�V5�1���m�h�����Ù�s�jI٤3�9�:���
�r����O����4�*ey�W��f����f����D#��-d�����~�}��办1�:�ܟvܵn��ML��{
G&����j�M� �C��k���p����㉾�К�wO�g�=C�,���s��r-�n_����q?�\���UB�)Z.��an,H�yB�*�2�!tSH_��<��E�F5�C��*�$ R���[
Jፖ�Я�I=�P�)�/G�������O����������Ή*b�?=��J��΃Ŀ(����sN9�����SHfT��������+jA�J��7���)L3�-��z�l4���eB�K�T����}��~�պ�f��b�[�Q?�|J�t;�tr�>̬�g
��I�p��������T$��ӯ�#�J�b-*lt���%�69F�{��{/��Y��AJ��D/i/y���������K��FD}<M�r�L&a���*�!�A=�8v�fca�a��so!��*���6��-IGqNu��T�V2A�ِZ ��"QY*���NS�N!����GE~̣w-j;ݧQ�"�"�]Yl]K�BL��٪p ��Q�������%���THM���\��P8��&W��e�3����1be����n�����^�[�"EQ��>���/���>������'+>A���QMt�'gQw6�g��tvnn�_c�꘎������'��m�@��.��r�� �%1�s�^<u�Ιm�~�$kc%�ȊU2n��b�4�����*����Y�[[1OƏ�8��U/���ws�M�y�t��b���EyԦ�n����th�+��ċ�e%e�b��%�Ն�U4π�������)�L�u^�q[1[�K����Q�V4]|���Z�,�CR:��n�������!]�[�ʵ�ʅ�j���jX=�`�6X.\ ���z쌶�������J�歕.�qΩ����H,$h�}���k�ؐ>���ʸU�����Kk��5����!�81#֟8�('�W$g���Z<�N�H�߲/����E�bي�[�ZP�~8�6���ȶ��垺-v	�?�5�b?�V���p}�+h��&$=��|~�n����T"Ki<C�$��?�d)�x:F[�lA��}��6�C��lI��؉�rzd*U��o2+7�����^�v":1X�L�/�1����\U,5�O:��ZM3N����6Ovځ���l74��̅��O����,7�@���֙*��BX�5�n!,��h�� �qy������-<,C&p�d���b���y��7�ꤚ���3�	���@����
X1\n�8z����r������JX1[�<W̖��d�Hu�Z��$3}�j�M\E:3^̗ף%�;r�����P�p
*����3^���mH����JJU������pI�B��>�����\~��Byb�I������d	��,�cJ��ᱏʋ�'��~Jͨ��W��n��F�*����/�H�x�r���}�]��\�:Q7����»&���cW��2I�S)�`�l��^��w�H��;%u�8 �f��\k�R^a
�ǰNs�X��>b����0��*�.?�x�0��xZ����¥6���,�"N9��@G�{t�e�(�`�5A��T^�ʱ�In�F#0;��>qf.J�
N{~�9��:����� A��/����"��ϡ�,jAvx:��e��K�ą.!S%<�n�m�55J����,q�1�5Ūcs���
b�$�XѡFOZgӷ�cts�L�$��w���g��9�aa`>��q��Csĩ������z=����I;�Y+���5��]�h��OS���9'o&���y��*!�tdvN�(����,>J�v��xzת�4͗M�.<�B���Q�����:i�~���z���],f��|1����7���tm�I�O���ؼ���N�$go]�F�{ �	F�i6�9�������(������(��ζGI�S&�2T49�^db�k�L�<L�Do23��д빦=��av$�{��w:Lv�Y���G�X���zT�?�z�_f#�鑄���u�J���v���^y�x&����U��^1x?��qwz��\a�Q'�ˇ���qI,'��`�����8�F��S�$��	�$��Dj�6����u�X��v����,1]բW/���&�� e�s�ۚ$V�	����+��w���5sg[�f�z�g�u�Jx�	�=�U�G�@`�u�Q���zZE�� �5�ViA���Yy��Sj������UF��qJ�E�U�<���ˬo���L�*p+ନ:�3P��s+GS=�mc�DI-��*����a��Sjf�,�� ��@��59��a�mWjUL)�D_T��ʛ�v��H��;�L�Ȫ(hI8�D�0���N)��[��*�> �XY��x��W�s��'D����B��v
�
*�⿡�˨���#݂X$�zӭ���!�v䒡2{s3�,�19���2t�|��MfƇ�\��A��%�L]8���\�����t�Ϩ����d꾺�l��&Ĥ1���X�Y����S��fk;�M��@,�\g�h{�:���B�Ĩ����������YC�\�綸� �LK�0e�b���������Kׂ�4��i�$
�9=u6�iAPx���Ꮫ�?h���� N��\���Ԕ��8��av3�R'�I��$�����*������T%�c�DZ4�w��=se�V�3���I    I�~ZT*;y'=���L���1ˑ�L%���"t[�� 7����b��7|�{A�p�8�u�GO�G)��tj�9���hD������Q��u�G3H�u.�,QI#j`4JL�δ�dz��>qU�s����tJOQQJ΋���̈�ю�����$��̟p[ެ�x��晫Z�{��B�!*���ks��疸��z!�^������iŻ�
7�<��\��*�j�Q�W-u�e��������4��������������������n7��� �h�cn��b����u'���k������b���ٜ�V����������!@��ǧ���u3a� M(����>xr�ӟ�uq��7�1�Y���Gɶ������h�'-�n�v�����Z'
���l���e�j�!n7X7-�F�8N������,&�[{�-p�ROo<����ڹ]���J�|,��~Gl���2��eb�g��[�u�b�ݿ�g�g"-�'tq����1!�r���9\f�g��{������+S�l_Ex���H��H�E��{O�'5��RgY��8��1O�{���|���&���h�|��_�^PZ�Z1Mnl������6�ܙ�^���!0a�Cω,��~���.X�'Nj<9VL�����]����-��h+3������s DJ�Bs�G���a�A�8u砟��v!���[s�U��@���:z}|�twr�yC�梉Qb�e��H��i���n����˅p��uK D���?�����鶴��������x�)�#P+���(m����6��<l�"~��V[z&���C~jޟ{�^��o� ^�ƨ,/�Z�¥��O�O8m!�WL�{K�r4���@X[e�
7��Vq7�Lxi��"7TZZ1F~�p�����	z�qR,d��qJ8���ӵG�[q�"�w�F�<V��pL�4x���լ�Q<>���
~|��t�z��f�'�g�}*8L�>�8�s~�)��0Џ���5�B�0��@[EAZ<w�h���ƞ���	��d�05��%Q�gԩ��P)��
���f5$���y��3	��jn+�o`2�%�pUL�O��_��
��8*Z�@������b Vh���NIJ�[��n�]�>�J-x�������l/o$��PSBǛ��l
W�k����l@l�]��q�B�Ӣ��{g�7�q��3y&��P:����s�GX����'۠) r�jt���>�>`��NL7�$�muSw��81�S�uW0Z�4�^���
�TwG�~�Wm
���?V����8��>S�_�Wp����Y��h_ǜ��м������zoQ(�'�����xj�(�k8A�¼�ъc��g�M�֖*�_�CRS�Iyz-�@��qɚ��x�B8��/k(���������6U�Tgj��~Du-�߈GQk�b�ҤBĖ
� =u��d�%�UlS׳�8N);N�} �$�S-MF8���㙞\��aF�E�`FW�A�Z8�q:9�(�6)�O����B�G�.�ZK��|�h��5��!qH�c��Kj�c�u�U���ύb
I\�Ij��7<��R-+'�W�Q��j���
j�Ze�UGA5#�U���Z�m�'��ki̤�uw��k���³��AU��A�]Q�J�;q^撈�ǵ��g�ҹ)����n"�;��
W\�]=U^ j�xs�&ɬ]o ��N���^J$T��G��Aݳ�S�o{�o���Է�e�QG6#�g*�R�/x�i��j�M"�J��ͣѼ:A�u=uB�}��l<U ���Q$[Ul���r���,�@JI����޸�8:lt�QI�AK���Q['�q��?�Āw*L8*_����%�9��k�ius�zk(��2t=Ň)ͳO3��<޾k���n|N�⚉�6Py-��\.�P�����7�sp��\̔Jv9zj�����3vh\�o���'�;�#�����q��钦i泑��֓W��2�ה�q~[��:�k�7zb͸H�#���q�-��%���Z�ԟ3��1�<Y}I�
'<qʹFD��h�&<�Q�̘K97]�	_\�42}�L_&ГU�\���f���\�Ҹnc�y4�]��In�lmj�fn#�['�-��N�9��3TH��V!uk�6fJ��9ڵ�5C���H}��	2���oꍖ����Y'Ln���	�\<~5��Ѓjv��6]%�6W�Ϩu�fG��������2ΟU�7]!Ʒ�:F�|&ᒖ 7z�-Q�_�*E��������P!�����rEy'�n-e<�[-?Z��5��
�����jN�ܚi�İ�TΓZK�#[P�wƆ�4��s7�0���ꞩ�[�D��cK~��� �z�O��zB���X
�e���?��F_5;
S���P���	Ö
%Ss�*�Zi����P*]�KQ��M.<�ǝ�5D1Wv������O�YA���N8�ڎC��B���rG�4)з~�b���]�ޫ���a�<l6mB;���oJ v�i/�]a��I��̓M�����:�I��������mvD.d�1>OKl����7���Ma�7!�o-|G.��l���U=(�4=��}��}����A����;��K���j���xN��z�{t�v�[*_�5^};����a������R,8�t�;�P��p������YG1�D7���<M*�?N1Wn�pti:��m����@e�՗},Fk��� �0g�<N���[$�	\������w�D��yK��ȫ��p�����L�GQ���)�(vˏ�7T<��|��Z�,sזPuB�~l&��1O�E<�<�A�*�f;a��QJ/�h�'��ݑ��˚sB�~L�.��T�ʛ��q���[������TKG��L$�5�b���$�����]d�Z���yK�N%/G��ڏYG.]�pj��������_v��>��)(m��	��o԰�B�~��sy��GD��5O�̻�˔v��~\�r�=�7��\v}ї��ݜ��us�tJ�!OG�n�o��[�	/\��=�t&Qv�fw��)���I�vB�a��d�O�:��`F�w���x?\��"~>ur�b��/Yx8�V;SB�a��%��v ��V�k;�k&*����5�T�+��4�X[��	O\��ɰ�[X��f�"vUq������:s��<��~�c�qz����a��ks�)�<���]�fV��:�[�F�m�K�S�,$�V�΀vB�6j���	D��4���L�ո�K��m��"��1�)��#Fh4��!k��H�t�TR������q�7ۖ����!G�b �:P���Q}>d`H~꿻�����m��K8���+
T2�k.� �R1$���@T-��[��4�fzt=Bw�e���.�4��ɱ��D js�чG�ތEf�{�#�^�X�#$]R����q��p)|@�U�)�� l~��_��_���`.� ~DO��'�
�4z<��a�UwWe�u������K�8��1�	\���扼$OaqxA�=o�܄�l��M:�f<y�vZ��p`���5���f��?���z��O��'}��+���s�!�9sh��j��j�I�ʄ��g��e0�힗���c6��o�HZT�Z�tD<�J=N|7���g���1z�>������F*��q��,V��Dr9��B�	��Q�ۖ���r*�!۶���֐��dIQ|"m7
N�Ah��o��&)�p�S�$�>�������;��?.�!�|���XG=�z_���
��ɣ��ʁ�R��"��R�����溴w	/�_6*FJcCnWZ��6�a�hO�8�kpU���Z���@�	��]�6�(|�z�D�����\A��[��񕣦+��$*C�*�MC�j��y%:�I"���*mo��f�n{Serz���� D����
]��8!��V�� �Ӄ>#�Bd������?^.������WA�����DO�-6"F\�#^EA�'�c�ONu��h����އcmd��2�УPр�ª'�ͻꊣ{+���n�*7    Z�f\BJ �D?�����Qe-�������0+�DՅ�����ѮE��&�{�~�h&�_���v���d]Ϋ>
�f ��sg{w���@��f�k���b3�!$�����i����51C��H8@�k�����^���_Q�M�l"zb��������.�9���O�(v�<,���ŧ��"�T�b#���/^.؊`WY���.Pk{�f�����[��A���y�W�J��� "p�x�|�����jⓈ����7�90��U$��=�_�Ձ�����8#X.Y��󬎦y�d�Υ�� u���	�|� Λ:���+)���Q���(��|�X9���#mtJ�ZL+ڨ�� TUr��Oz+��c�ɶ�5F�=|�(�9u���xV�����|�eK_Yѭ�iN�*z�9	%�`�˸��CyTD�RA^��殖���hj���ٔ��|-��ce�Fěog����Ʊ���X�7�k�\[����\���h�Hֵ%[�ljKv"�V��d���-Y�Y��P�Kf�(��IN*�4Na���S	ْ�����x'�ݷ"ދx���">|s_"�(��ߵ�k������D���ec2i��x٘|XTx�H�+=���-H��-�����Ƥ(_ϙi����\S�ۓ�"_Y��=3f���'-�ͷ��F�ѭ�|"K�zt9�"ً�T[2�}�޻Jr�pZ�_,9��S��5��H6�%�U�,�z�d6ܩ ��o[+�%��)�e%���+E}�y��^;VI�]端��:_7�B4�\ۊ��%yY%��%�W%�|Ɗ.�,:j�`�u0���:�DCmL�����M	�5�hJ��)�DSbeM�E�XYS@�:V��k�N��DSReM���}��� ٲd��4�#� gx募���,�����G����@~���X�Ԁ����i���?��r�~��g����O?����|�է�7���ן�����E���{t;F_>�$�%
��6���!a9�cڸ~6H~�� ]0�V� ����5�o�H�"N��&/|,3��<�~�����	}��7�r~�L���P|�����S�W'��O���:�v�G�	]7���W@�ԗmȵ��ڴ�L��W�����������a�f&�S�zx�9�^���Ψ/�����[��;+GBH�9K�\r�gx3�%'�|�7�XrT!K�%�|)��j��QVП����~=�(����3����M������G�o|���R�����'�be��|��^��۩Au?_�e�	G>���k�sY�������_�]���i�33��u������~�����o��t{_P9��T�71��b���64͟i��͟��&)	�)��
ɔ���g$/w�(��3+�^Ye�4�m�� EI�Wφ��*,*%b��g���"��
׳d��|��K�{K�E|e����+�sU)O�P�
�؉R��9ډ�$:C�Y2{y�K�b��di�p�?=��TC�L,�(�
��/�ZcLT��nr[~�W�~���|��:����~�w��~���_4��@�����;���M���B�1�~U+��k#��&|I��!���X�-��ܸN����}~��J}#�4[�[E̺:��7�o����|h���x�G�4�	=���(���!�X,E�c�z��*@�����f���*�e|8�žUd'�g����m�H�*MFG����5h���ma*Xo7x˧�j�6���*3d#C�������
�d�s�M�5Tg��u �����%��<��V��g�v�r��J�=��Q�w�h]M��&��֓H~_��5e]|U���Q��Nz�DkH����3/6��.�8R$�M5C�F$3��ꢨW0��|N���퍚��$% Z ��uR� @ � �>M���&- nPk(�r�Q�NT�lD2��X��>2�CT��H�]�w��T��u����H/N#T�.�FP��h[K��)g鱖tYWݯ�Oվ݊�8��PK��ŉ���#.��Mdf^RO�0�/n���C���������@� �S ���\m -� yHو�TH��KTA��k&I�J�K��5��%��tٺ��(;�Rj�Y:�,�k�u���N�63�rVR-�FV�uG<m�8"�8�Q��l���TPNO1�\q#��X�ͪMd4V�=��AL-��X���:싊�_[+�y���������1��:������~_M|vQ���2��%x\|g�����~���
,
�R��)�9��e-Պ�S��ʍ�uA$0�VDĔ;]}�*E`��8��R��0ژQ�Z�9���r��o)���N��O��E0�IhF�4�tKZ��%ֵ��a�](�ou\��R-���Pz�0}�z:��{,|�LU�����,���Z�7�C����,*G.mvĠ�r���E_�<�5����b��� _��/���>.VS��SSt�j�0m����a�u�I�nX�~�z-lEp���
&�1^�����c
vJ5X���	#� S�M�fm�\�܃���;��>,�=~�\%=��ލq�%��{/�*GW��3��`+]Tm ]�7m��}�9��or�@����OIU
��E��?y2�O�/����49�*�~\tC����w*�O\v�pIK���u�׭��]�?c��u�<�[u�f��/�M�_��\��������ৗ��iW�3�@�Rq0��������t�
��r�M���G�>�2
j��L��=����v6Q�b�^�o�F�,x��l��刞.������l�_���t�q�O�z�FU�{�.�0tYu���WE|�7��󵨟�^.�t.Uc(_��{齢��"�AE� �C��FW�a��4��0��R��7,�OA�z�Y�9�x��cj�����RG�z�.*%�}0�V|<ҥ�H/{��]0��E�Z��M��ԛ�W#7�H\�Z��+����<�}�7?�ĕ�u���{���f��H]|k�u�3ty���󥋶r�; �ږ7��҆�Xm�޶}�b(uHGA���Ea�0�Փ��V$+QX���v�́���;��T��[��\�Ϲ�GH5���M����>�բ5�:��E���,�E<���u�4��[�K��j�+���Q�{����-���S�-1FkI�"]B����(gX:'8ޫ�oy�V�lyv���4���˖g�,��&]v<�M��I�Z$Չe���TqG�~g��*ގל�.����L5�^�t��=S�����L.�8��N/�*e�b^K��*���v�ff���8�&ES/j�EW�Yuހ��yQVf�٤m�M#����t ]��EY�Ӧ8��fh�(+;�h�����D[�D擥1�>>��rUD��z�� �ꁥ[���ku�*�9�Z����^.!6�%� 
μ�}����������_���(�X�L��(X���PD��B�
%���j�`��C�g��A�gj��A=�׫�"��M}I��I�9�w_�5&YvnދN�U��xY�d�������Bs>o��$Y`��k�V�N�$�Q�(�V�<����������)[��C=��.���Y��f���Z�|��]��aʆܩӝ�Z^B��:�\�>ER ��6�7�Z�曔K�Q�Ɛ�_;'��"�7�:���v�t-ҋ��~���lu�����U*�6��3QC4!sK����1$�p-�Pm���	��7���\	�ȗT�Hv�w#��#p|��< ��\i�t���"A�_� ^ګ��cV�Eb�	�V�F�Jds���t=���n��xm{�aV� �SH��CJ�]XmD|тk�+b�4�V!XA([g������7������P��8�,&H����֫� 0=)[G�u����NײJ:+2�ϲ�6���}e-���?Nt�.FI��(�bM���=(���R�|�r` ncr�*_͏OF�|�n��r�
���H�&�G��Ŗ�X�o;�pLN[��N�?F4��-g�t/�}��DO�:�W7B��߆���ڴ�dD���K6��r-�-*��������6R�e��aE�9����n��@��q
�xDV    ������zY���8�wop�o���X�ʭk��s�s#{��wJBfh��#؂�?Noނ��!��+�!��?���T�^����g�'��3�I�CX�����㇄�?��!��f��&g�A���!�_���2�#��c��㙰!�^h�&�V:�v��1���Ҝ"4�K�Ǡ����>*�_�ծ�3� �J;�A���%+�|��>��Vc�X�#3�h/~���1�NGi!�_���_�zA�A��+�S܍!�j�����9�zd��V��t���i?Kj���t����·�����Ӊc�x�u.�z��kA�HV�h�*"�N'�o�͕�������g�N�ڶ>RP+���V_J=+u�.�����)�F���/��r���:���z�T��2,�tb:(�9pXW��݇+ ��X���$P�>���2.LZ���ߝ�t7�w^�m?�_M��yAt��\�e>�h�.G���`y��4����kΒ�6�~dŕ�=��X�	���XIc�����a� ��z\�ާYｆ�� �\��X��I�9��]�b������\��{1K��͹�6]m���Z/w�k�4	��K�U�C��[=S�;_��m7W�p�lw�W�?��0�z����HN�ˡC%5������7�C/��F@�	H�X�0
#���6�=#-�� e�#z�~ ��tD�mALdG@�d�5�ȍ���0а�Z(�8��f(��cZ�0�A��ݻk4qG��ū�� �c �l�Z\tj2P�0P�����h5j	Ȃ�v%/@����%+�y�7C���]�P�zi�J2PmyD��Lȳg�4z_�l% �1P�&��y�Ё���}�'U'd(�m�P�u�]�PS-���|����V��l	������F�Nf+}PKg?��	����Xbk1����O_P����=��e߯����R�C̍�k�{��\)*8����|`����0nکz(���ŸTe�*J{��c�ŋZP�x,NW\0�'(*������3�Gg`o߼P$@������ڕ8��˗D4>r�7�����y�$���V!%W��EϓT�R�O��r��LDG���R�+KgU�A��J��ҝq��{q� ]���+��T%���$�Z*C�(q�R��`)��`H�����j�r�N��M�SN{������B�|����ZH&����Y�"{٧���J7K��bxz�$�s.�0J0��8v��M��C7]��p�?|�&���,}�_����������ǿ��������������1�����wn�o��:#�������/)�ң�0P��=���]#6 ���n]�9��������ޕe[��(�0���ؼ��J��H��UbR�b�ת�W\��Q��!�'Ne��NX֥n�E�	�|����b�n0��\Lxc���VhH2��X�0 "h���q�jU/�9D`W��r�(V�!xA�Z�U��S�x�!.:B�%$׿4��~����ɺ��dU7y������^��������������ǹxQ�B?0o�Lp߾�k���m{��n�}:^�_5��}�ܯH���2���5؃V96�}Ϡ�z:�ʇ|�� ��M��c�`uoݜ�+؉m?���O���� l��O�	eq�ۖ���>����u���Tz-�ʱa��T���0��tK����:;䤞S��@b	8O�6p��䦕<6��h9�u�/�o��ڻ�+ج��.��M��n��Q���E�]:T���D�}o����B��E�쇻~Ca��:�E�M�-MhaJ�p0��=��ڶ��%�}��uV�Eq�Q�a�o��a�cq�de���\�P��N��$��#�}h�5sQ"�H�77��{Lr[H}�T1F�R���8���׏�����*�=��rU+m�<�����h�h���Ň����m�M�j���J���
���PF��8��,��p�H�넏���/�޾�-�m��G�f>1�o(ᢚE��r�"��#�Z�7���D�?�ґuI�ˇX�����L|�NF�����j�s��_X}qu{���C��y�V��SZ��^�AP�z[�}!1����g.��Ez��ޟ�K7E�Ђ�\]Q���׃�2߷��fw���a�м{z�n.���c����G��"���Gh���������_�6�Ї���;�0۠�^��v���now;ʋWGP��E��͚uJ!,�7�r,gs�qZ,?��>M��y�=' ;6fT�Il	���ͻ�^�vZ���$f���`{�6�h����Έc�8 ��m]�����/,�{�Ib<�&q[�ᘿ�||b����}T�������S�Tɜ���|�_�?l�&i�f���}�?�ܽ��6x����\�$�e�DxA�a���~##�')���� sr�BQ�5��{�}u��d�p��W`h���,Q����i5�a��ő(�����+�ԊW4 JAxN��=dXj>���VX*��A�T#�o)�N���}����氭X#"��Y~�nL|U�" ��=Y�������Շ4(V��_a���֫���rP�a:����x� D~��qb��·`�N\G؛�~�!�ˠF|(���X�����i{�Y>Qg&��*kg�T��$E��Nz��.G)��\�f��v�/�t����.C�e��v+`���x]3CZ	Dу;Tܓ�!��,������0���H��"�M�嗣g�jE}Рe]���<�ѵ6�0+��n������Cp� ��>lp��u
��e!�P��j����j��P��ZD�Q�s/���W�[�
�ԕ��!��5_��#$DI�ri��h���^���..ƙ������'*H�xe��慪Պ�Qͺ"�m^Y�E8�^�B#�-�d"�V�Q�y�D��9ͻ��'pn��\>����(�/���W񾖢Qt�n�^��9FԜ)f�X����*ر�ػ��Z��*.�9�oN%�-�|+���~Ӫ��O���.K�@�*����e�. k3(ի�;~t%Z���;�TI�dNC�5�V���u�6�M�/�#'�kp�>�jlY��;�?��ǌ*B;�K�;��%����G[M�m�|ypw���]���k4��	��/⪭����4�[}�2������^M�.-��89��z8�[_��D����>����k
�8�%0P���#����(�r�º���B8*־\��6'	'��O�(�r�ض���׫Zi^�D��+�u8Y._[
u>�T-�Z|̉6oOL�z��E{�����#�W׋�i B�
�(�Y�NE��|�/[z���K�嘒�p���ֲ=^4�y)o�>*���Á�*�jy�@��\�K������#}[���� *�,Z;���y�h��A�c���u�uZ�l_�s�꣠�$�9,p{��"WZ��D|�HL�;D\jk\��B�ʭ9t�De�Ux.K��!�Ԛ�����:>wDw��#��=�����_�����z�L&kպ;AH2僛 �8�/���I� �ǳ�-=�,��8W�J��*�.�蹄�
���cm���ɭgk�D�� �8x���X�ze���|Z=��JQ� �8�_�.�(|6��&]4=�~��9���0��G3X�Xw�Eӣ�(���F�b ��Q�m4����v��x{�[+��C�J�/�튉O�����Hjx�s��<s�ǓD�%󗠒R0
�UY<�$�Ω�e�������|$��)� ��4�ºn8x�QRu+(Э
��_ZkU����>�
��� ��{E�  ��Ы��
$���NW�8IMu�LM�z�Z��x�/�a�7�Ą��Q�TU֘/�5��8���)�e�\������۹8��Ѕ��B�M�,PNz�n?|wŔ��3�/�*4�(�X+�Z��3���8�a�.e(f�a���=�cQB�J���[����h%��S]Qz��Ѥ�����V��L��q�`��h5�ʛ��kM*�+�xD�9p�d��o�>�����O�.r�1D�9DM6_��}�GY�&    ��������+Z�!�n��;�-�	:,�m�}��������8�����+j-�U���.�6�ZB�>m���ƌ��K3tV������aq
�.\��H\�lo��o��{g=<"�Q-Ja�}�m(J�rg ��ӿ4��|�e���aN�t�Yl�W`����=���A���7m1}����(�[p}��)�فK*���c���O�n>�����:i �Xs8l�rp���rA4�?m>���ts��6m���&>��a�lr�IB������ÿ��Sk�phb��A?��6�`Е&���O8��v���Z��F.5��]
h���2�.y��|�O�����A����_��eFu%�8����0��f��Ɩ�T�4-�\"2u�~i�����n>�� ��R�D���a4ͨS�*Xj�-���4�MN���u�b͛��]�qm�H�;�0p���t��dj���0��2|�v�]A�7��2F��� ��x�&<�df��lқRN�hI�n�#����^k*-�`w4b<�����i�7�@�-��Z�b���&VFQv�����T��J�M�VQ'��
��,����+O���c�R�ƿ�5�l������ۻ-�r\١�诨����ɼ_�V 6`۸�����v+�;�l+�*����� ����c�
�� srf�Xk�B�*k¢B���X�9��˜9����M_V	��)*9`m֮`uOY#��:����e���=�P�yi�2�Oݣ0�#�������sX���ti��ϵUH�s%�{e��2R>��t[ޯn:���N3�dЦ:-����*m!���fO絮{:��/�Y=a66}���Vf����n�<�Ms$۪�������A��@G��f[h9���25j<�f
`�o����ҕ��e9�t�e��o�?���`k���j�6[H�ҵ]�8Z��ܿ�g��!\�:�T[�L�wt6q��.M��@�����T��2AZ�����
׻�'囷�T��Ƌ��4�Ť��[���[Ҳ$v��-�s���Ѫ��^���v��3IM%՛m��T�ɚh�Tz�l����-��Gi*�8l�Dl����t<�.�l��DL��q��}�\���.�:��P?x��|E����yu�U4�n�d�[�z.c�P�mx��頯����^�CT]�=$nw#��m���ibm:&���h�"���Ŕt����Ku�-^�t _�*�>��(z.��z"'�C�ش6vgS��TU�(v	��&y_�]r�i����NQ�;�����&���6)�.y�tj�]:D�Y�u]���\�ꯜ�OX��,�����?����� �|�)��)e=}M��|wd�J��bӂ����֘侸�=�|j�\]�PN�m>M~�j�uv�G���������f�쪃r�K�:KG��S�p@�>��1�ͮ�S�4K�@U/���zˇ�W����R�f6�ֽ��Ӿ�΄���Lv�%����o��z���XZn���V��6*G��}�O.��א�%��.��;����`ZD�A�	�3y$r(e��0��I�oV�ؽ���/�<p��S��U
�%�@)D۟�?��*�����lSVY%���u�&�k.rr5 ���������������-��#�݀�er�r���K{Z+Xك ���Me�[����� A�Z\�X%�c:��'�w\�շy)F�<_�lq������C���W�-s'�����29eEm�frr���=�+Z��M�=7��zo���A���+�φwێ�SD{�{��w�����7��vx~��;�DZT8�c�/R��M�R�t�H�-���5�!�ma�.�J�ך��QHm.BC��h�����M���nnW+:?�eW�-�N?UB�����Sa��ۗA��+e5��Rn��%�&i���Cܼ��2�\C⣥���2O�I�������o�`���ܧ6�j�d��ML��1�U�Z�F*���!���`��k��+���j�J�mƕ�S�gC�#J�/|5"��K�_��7Y�<H����~e���_�e���z#)2�1�FK���H?���q���6L��/?��_�����g�x?��g�����J�9��w$� ���+��߰�Z.=(�2��i8�����^@��Ұ�G��=���[q�m�b��5��z�C�TG��]��ݾ����wa�;�;f��:z*�Yݺ�tO�F���]�ڿт���G� e*w��_�m�3��_U��]#�ʒ�H����=ћ�ʈ��6��d��f�.9���r�2��j�*���[�	��B��A8�*�Joy%��p�*Mb�J?�-���lf�aiS��P��J��-'�s��`+���eR�k�ɛ�|�,uPL�)�����R|L�2/������X?�[���ɸ�XWsI�wΌ������,FN�V)�O�QّR���V;�L��vq&��><G��7�pp��O�=��	�_2�rb����Kr>ўk�6W�B7P�V�Ҙ�{�ľ��;;=�O���?99�7�W~(����tF<��,�^�뻍p��g�y��졁
��e�n����(�O��j%Y��Ǖ��>>-���>�Z	���k�4��������?~��/���9�1�(C�7���(��º6\��*����%��%/�-�_�
����C����0*rNmtr���K1)Q�)�ˊ'�.�ŦYv^�T���]�S���O�K �1�B:�qs�g"鈯��t��HL�M���m���Jl �~Γ#H]Z:����80B���WÕ'Y�����f[�k@W����G釉���7Yzu�����s��.m��ub�岻������d��Yn�]��%���q>ܦeȭ��&��H7ϱ �zu@��<R�����;�}���+��ٵ���roR�,�l'n�?j./��Jv-����`�A�l^:{��o�޴�H�')]��0m�mɿ��-�����2��I���C�������^z[G���W���N�Oި���D�PQj��SiO��3�^�e3yvi�Q{;��'�&����U���ñh���W����?q����E�$�ã��;�(նAQ��I[t�+I����㥗MZGP�]�()G��C�L�b���X^
�;�J�45]j�$ޝ����^=�,�V}�5�LL�.�Ѫ��n�Y������CV�zB.�Ze�q(p�!���~�v{��u��r�:��5�]���m=�SXPԧ�i��Z(Q��X��O��*KmO{+�e?n���R3G�¸�	��&d�Ɏ�G1,�xE%�bn����a��/^����=0oO�G7'i%s��
z�o\���� �
��{Mh�9��?zEMi��S�bD_3ďN���pİ��A��Aa%I��&ٸz�H�uOy�E-&m�z��q|-�����f�J�
�F�x�Ɗv#�M�b+���bش�c``�ןQo�>�&���f�o�(/�p/@�)�}B�<�^�����n�Ŧ��J�ʡ*G���n��N�#6v�����J*#�T�_��5�o���P�DE�����RU�9��xxM�]�S�S9Pmۃ��iU�V�*|S���M^L�{�\+U� ��q��*!'��Jn��X9����wҼ��!�%�M+E��Ed�R���w+�x-���'զ3�\̠�`���f�v��I1��/0�|%��'kŷ�>� ۷�h6r���᷏�/��.ST�G��F�����#���p^<���QuL�����t�jԆ!l5�_ΐ�l�5q��v���������:�N�*U}�\�fd�`���9�TNmff�:���c��J�l]�Y�V�`�E!��jt����$?�妡��m\��(�K�H�3�r��7:1�Bo}E��z�[ov[)b�P5�����d�~춬����������U��v���n3�T�[Ġ�Pq|��^ YF�,o���{�v��wDi���6J��*�g���ʂ��l�R�F�@�T�R=��N�A�Tb=�J�-�T��R�z-T�\��&2R�JU� 0���E࣒T;�^���J�J�\֕��(��`�T5�H�`|����9�Ǉ    ����B�@-��Ϝ����)6��s8sʻ"b��qI5�<t1Z���T����Vݓ�ʭ��r�W����ÕV���۴W����y�M�M.�ư0J�����X镢t�t�K3���V�0'�uOd(��gC��n��ʨs�߻��OǓ�Ӿ��뚍��H�Z�{ѧ�ʬ���4Y5�8xݟ�4�ٚ�/uX�8���E6cz�L�����fL�V��V�xs�߻M뒔��"�_$�Sk֫��H/����ڐi���>~���v��VU�����P{o�q"N�u3LK�S���=+�K/��J��6�ߜ��y(Vw^;�����Y�7t���#�|ǡL%���7�'����Z���R���gg���9�Ťl!�5�|v�:=�,mJ�$�f��E�u)�Jɩ_��XL�*q=G�|8+K����H~��P��V��X>þ�Z�����e��>x��K�#g�|W��R[yx5x�=�"?.$�>8;<��IIt%E���LZE0��	VD������S����������B�3IĊ�^S�vy��fZ���^n>Y��΅	t�K�w]��!��
�~��{�p�O^�z�M�j���3k0��efV��En��Rw��p�M��P��2�՘7iZ	��J��:�o���S��4��I?ѥϬ���2���:*<��o��[���i����}Y��o� �n�?���;{x��k�U�����1�v�C+q�QN��<LN�ٴ���?�׷�����˿��(WO;���xr&�iƓ��v��3��]��F����/?�e8����ݡ:��8��X&���\�߳�2�]���#W��C�RA��?�Զ�U���
�f�����ݥMTH�r�����b���Y7��xtN%�#E�H�!���-����M9'6� ��Q~>��ӻĜΥ���D����WN�UbV����?�F[.>8)���{�GV������a�q�K�[;����V5�[fw|紡<���([�g�j�j�q���F���׊Z���:�y���J̝�.ʛ��\�U���Hxv}������G�ߖ,\TM��&f��O����K{�X����Q����&��՝r9YY��5[�o���al����wlep��������}�˓�dn�f�iO=[3]�[8�P�H�����߹U���39����t������B./@ꍕ+Z�(�@���UR��+�E�����I\���m�^���B��׼z��S$V�:^�~��[|��н��3.� �0h�:���D�'�� �����6�3�V�V(Ws��ӋO�E����'�N7�!�G��^q�:����J�����C����>��e��.��\��a�z������Z�M���t�����^I*M��x�]�[�$�����X�w�6�
&ߞ���H��p5l�9�캔T�u����W�[����b4������ƴp��IN�V�B��g+%�\�t���{�	���\A׫�T��]���$���6���>�s"F)��K�֔��]�����@3?����}�Dp���a���B��˳ۓ�7�9H��_���z� �~8��+q�DIC��{u��	�<���־27��`��ɽ���F��Ȟ�/��9��X������B�#����!9��۾KNC�a�\̪2���7o+�;�i�Keӌ׊6#!�׫�����eWꏟ�]���S�Q��T�\���^�@�#���i�G��?�t����7f���]OiW�8�m����
��I_��&'������o�ʌ��9_N�@��b"��B�7��3���}��D\}��@LC�}���6k��}9���\��[ǭ�$�C�!-g�}��K]+qݤ���\mA�ٰ���d^��3՛ю���x`�i>��ST�2�2(�񜯸��7�1��(W���1���S�N&���Pqc����Ix:c�_�1H_�Y�x��_��˛��~p�8�?���e��3x��-��|�"��Blw�����LL��� n��깼����A
��&��9_s�vu^���$n��q�_誉J�z���o̗sW���K�Uv_�^�G�n���)����۹#���\aO�yt>@~���z��y�cvaZ�Lsv����,M��9}�-�)���a����,����o��*�ZOEAD���K�^f�UjiR�����g	�U�����T�'��6�m�g!,e|r�����s��?�&�ܧp��w��t�r�iӑ��Td�yR�̀�З�y>I��b�غ��z��3�#��K9����LwT�|��P�|�B�p+U�L9O��r#u�9L���|b_�ke|u����O�>�g�*�eO�<�!�;	�����4���</}�G9v�X��Nĉܩ��MO�����<dn�d+��ֳ2��>Y��F0�6_Z4��$ǅ�l�q��3)�W�G��	�h����Y�i�7 n5k+�sF�XErc��N��w���q���u��P���G9w5�����XQ7����x�I5�1.fN_S�9/��)�Tۃ�.yT��Îd9��0�¬<1ۨ;1�V����dZ���|����`����gY��R&F���dL��-�l��LQ!��0cs��X�K�Zd��.7�L�Bw�ŝ�U�T��ӧJdWGTH5}�M��E)m5��aJA�R���]a����O�LQ7*�Y����§쁏eI��5�W�ʪĀ՜$VK�|G��骾쮿�	Pؒ�N�%�G�m��	��'W���9z�n4�~�z�ͤ5�v��Th}�;��A����u��dz.�����ut5��nkɉ��q.��ЪcM��*TH٭>L��e��K�A�����Χ�8Ѫ}�v.k ��5��B�{j�~�9H���6w[����ǛIAk�n�u��)U>���J�MPb7��\=�_[��7���.��c�?���it�z�*J�����-ؒ��)h�I':M*�uvZ��^�i_4�V�6l�-ߙ_ѽ4]��[�A-ן���?�۹? �J�}O��������]�r7�} }{���\z8,5tX����>����z�a����g���Ӻ*��˕�������Ηf�ͷl8-5tZ��,�Xڰ�vˆ��˙��"���������7�J<�&�J6}�2��i?&N�t�d�M)7UC���b�*�?�Lp������+b������?�����̟��j��,S\VZ������I1��>�s \�
�=�QZ��oJ�o������^}�K�r��k���n]���Z��g^�
��t��PS ��� uܡh��RNL��5��T�̕R,_a+EXS�@!�R����dS:���-e�(�w���^(��g��B	L7ݝ�H�Wp����nЕ��������V�'�N�慢x݋S���Ko�,��g
�5TT��0�T����sG�
�M�ڝ���Ҡ����"�Uyiml�d�SfK=����:8����:Ry�+�l�dh^M�r�t��ٽPo��YP��pp��W2JT�ez�`Mvi��T�瑧���t�"':�!��@6"{ ;^d�HS�rLܴJbi��z2���ӑ���&��juL=掍����ͧ/����<ɰd�E]��6��wk�e��d���6m4�%u݌�7�Ҭm��l%��Fb��T�Q�^�i�.��}�����:�]�4����C�TZ�CEVb`vK:!��,#7�r�vddύl�츑5�-7���EI:���)����Q��V��%���q'ݎ�l�����j�������~ѥ?���sY,X��x��=�_ĒV��2�*�\X��X�ۑ%!�Z�}ddڑ�-3��9_$s�Fr+Yp�)�T�wЊ�7+ +nd	�=ڜ�,�̼Ƈ�/)ȃ5~�v8! O����3+E��<u8hG�@�Vw�^E6��Р���Р�X+ۑ�A1��v�A*	��7�ָ"Kn� d������~�S+2��?![ 3�7|4@f�>j 3�}T@f^�}�@f^���E��`�@��`@��`�Äۑ��0��vdh0pk0@��[��>��#ϊ̭� nh0pk�C��[���Р�֠�=�=4�5�AϭAzn    zh�sk�C��[���tР�V���R4踕�Aǭ:n�8h�q+�A��[)t�JqРcW
4�W+:nZh�rk�B��[����Р�֠�-�-4h�5h�A˭AZnZh�rk�@�f"Ҏn�h�p+�@��[)�ܷ=��юj�M��+��hG����hG����hF�Р����Р����Р�^�54���n*n���A��44��=���ڭ�AŽvkh�;ZJ%P*2�ڭ�AŭA*n*hp*ZڎJn*h�;��+hp_���o�ߜz�����*��������}��;JJ�?>��ʬ|���􏾢��_?~����v?��?�D�'���;��N��u��ǯ��?��<��uɭu�Kn�+h�;��*lVdn�Kh]r��%�.��.�u��u	�O%7�#C�[�Z�Ό���� wv��Р�֠�ٳ4Ȟe �=˩�};�2�=dn{
���,$����-�;b��"�"���<����w�m��{����w�m��{����w�m��{����w�m�S�v{��#��-�;b��"�#��-�;b��"�#��-�;>��"��c�-�;>��"��c�-�;>��"��c�-�;��"�c �-�r�3r[�agh�;���"��+�-�;���"�:��i�}r[���u�m��[��m��[��m��[��m��[��m�S1�vdhp*�׎N��ڑ�ACn���9��AL��ݨCn����5�3r[�TL���9�HCn���9�HCn����[48�kG��bz����TL϶"#�EN���3r[�TL��6��"�cz�-�;���"�cz�-�;����"�#�-�;����"�#�-�;����"�#�-�;����"�#�-�b�GBn���NQu�_|��s�йu��1�hd�U�-�;���"�"��W��mxw޽�h^mG��"؃ Hu��R]�T�y2��"A�# R]�T�r�
��#C�SA�vd�q*Ҏ9�A��2YD��7#ELAڑ��� H;248iG��� ����T��z�؎N=[lG���-�#C�S�ۑ���g���HAS�ۑ���g���Р�֠���-:���g�i3��٢Cڌ�~��6#��-:����,�fwX�"mF8�9i3�1ȱH�n�HU;24h�cY�͈��Edh�2��H�܏-�f��B����q��?�}���_��?�%�����3�;�n�=#����3�;
n�=#����3�;
n�=#����3�;
n�=#����3�;
n�=#����3�;
n�=#����3�;
n�=#����3�;
n�=#�������T��z�ڎrG�-�gw�"{FpG�-�gw�"{FpG�-�gw�"{Fp�l�Ȟ�/[-�g��V���:��3�u�-�gw�"{FpG�-�g&� �#C��Qp������3���-�g��S������"{��~�E���~qj�=#�_�Zd����3��ũE��d;�vdh�;_�"{���E�����Ȟa��o�=#��E,�gw��E������jZ+�������Ԯ"3?�e]E.�|#�{%������9Y�kl$���H�N�]�95kUJ�qp��s+Sy �Q��^���o\,��6,�H������9��W�"i�Pv�M3� ��@]�+r��׷��m����E��Z�"f���ov��t�;N"%����u%6M��;�d�d��N�HS$� ODwڑ��7'o.��.���y�QF#W�y���׏_Q��y��Ï��=|���ῥ�����w?<~����?D�p�M)����)m�B��_ךD�;��o�{����~�BG�?�����e�<F�ݴ�#�9����'���1��<��V�%�P���%����%�ФdnFe"� ƥ�u���{u}�����YWjm+��`}uæDx��o;�x]sxq�~uݽ�/N�.�n?��M�m2�O�	I��}<�900�M0@����#k +�J'�ɡk�����\԰ ��\�Y.�4�d��>�9)�x��|zd�s39FDL��<cEf�S!����w*dqy̭�j�dkx�Z�}!"�W�G(��b�K�%���w�$���|�I�����r��[��N��c�j�b�����$d���MB����$dH��냢���W�	d���b�83g�%d�3s�]B�83g�%d�3s�]B��cκK��u�Yw	�9�ME�Ĝ���au��`�[��M[��[�M[���j��$`,����K~1,y�q��!3��$d,�̩>	.�9�'!C|̩>	�cN�IȐs�OB���S}28���Ĝ!��|�%���.R-�0�zB�a0g�$d�h�Ȓ��]�&�,�]0G�2�9GDE�̜#��ᚙsD2\�`��H��3��Yl<~��0O��c�[�5���g��F�[~F �[~:�[~: �[~��{���?�"�	d.����@�"�	d.����A��!	d.u���A��**h�� yB���'dh���xB��[�'dh���xB��[�'dh�9D�����ՂVA���%�P�T%�fd	2�&O�P o�*C�!��_����� c�F�����c���`�A �5^S`�O��FK
,d��hE��_�������3	�zqW*H�X�F�K+����%�X�F_�/�DF�K�!�Ѩ�� Kfnޜ�a�̅�2LY�&�'d�#S���3D2���*�z�ݎ�L=�nG�N�K�'d���yB�b�\�\�,'u�#C�̥�24�ܮ8!C�S��vdhp*�ӎ���/B��"=����ԣ���ՀX�����N=�nFF�u�t;248�@�d~ ���A� U@�u����ܯ�2$��7e:�hLf2*�O�yo��Z@����uB�������F�ɰ�p�6 �{����)dS�[Qddύ,�lƑ�gP y,1a	����u,Ȱ��������IB�=�	�k��ȼ�Z2�2��p2�2H�a�פ��� �㼄�H~CC����ihPp�:2אI�� s��\mc���a�Z ��?��	��<* y�?�#{ s�
T��a��m(d�/e��}�VȎ���������@A�a��/!$4ȝF$4���#!C�~��#C�~��0������{{�_��%��W���M.����nNW�ݿQs	 PϽ,H�so�%깗	�N��m����H2h���d�#�@!O懰	�q�iG�\���:q:iG�N��I@'�[':q��'!�n	J��G�;�����G�c�y��#$h��>B�����GHЎ?}i��x�v`�>_��u��:�H�y�=�3	�h�����h����ǯ������aT/����<�����o�RBMS��[w�>@M���9��}���8�h�L��i�`��0/k>@U�yY�r2�˚��4�͜���^�<�5�|3�=������#C��yk��y��d;2�y��d;2�Y��K��A�d�A�g_~��_������g_�]w��G�T���LF�@5ђ��[��6,��Z�O_�4��r��w�{�g��r��wn{8�Bx|��, <�K �+5?q��8 xl����y�\����U �0��Az�WK�����%�P���`(o�~a	0�7z�� X@y��ʳ㞾��[X�q_-(o�ja	0�7z����XX�M�+�Cyv��͑�n������m�.B��y��"�h��C.B����#C���8�"�h��C.B��W�.B��W�.B��W�.B���K���������X��^F,��F�"� c����������7�����ǎ�K�1y��uz�w>��p������u*n���:�M���S9���p�S9����Tn;28���fu��ݛ棄s���ѡ�ћ�����h��bthr����
���9H�;	�9Hu���"dHU23��TG��-B�T%sލs��dN    �s2�'�vdHt*%��J�nG�4ŞE��\g�D���Y(Qp/mJ�K����f�D��t屍۹�	��F.W�:���X�a����M9����Qn�t�?�S��aU~��7��(l9���φgZf�Z�zX��l��'b��%�b�=�h��\�%Ő~����� ��D�k:����}�R�Kl#��{w����m�Y����6���o����w�]���NNy�gi��.�ŗ���qw�X���`��,��������ur�}8>��G��E�t�ȕ�R�:��<��Bi��iۗ|ˇ�C��Tt�Ξ��P�����M;7>�F.�:sS#O���精�﷌g	+]�d��J�w'g���<��pӧ/>�$eR1Q:P��(�:x�c�Я��?s����}^*���/D��ۮK�h5hŀ�Z:Ĉ ��>~5�z�O?�����ݯ>�ǹ�0��x:���i���|��EU�
�H�
E��?t7Y��P
��RW����g�<{��ko���Wc��<���SX�z�je5`���Ϭ��M[�hta�!����e�*s3��7��k�O..����Ny.�lId3���B�و�c2������>2W���j,ˤ}�e�.[�k�ﴣ��p����W��W���AIA
ݿ�^��g.�g�L�XJ����r�Ú�E2Rځ����|�V(!+ ;�Y�0~A6̳,�'��#ۊ<u�hG�h��g s�ŕ!b���{�Kdޛ7�+ �1߳�D|�ђ`;�5'�$`��l|���2',�cryIӣ],1��_a�`�SJ���'���_mA��%�PKP�}Affֈ��3�hK�%��E[�_r�L�t*�zꏭ��U�����z&~�3��}Y�>%PG��\SE�ɻ��þ�>�L-eB���e��(0��v��D;Z <��.N�fA�@�(*ӎ,���I���.�q}��U:h��S��ptBOn'����]2��kMgЊ�[.6![ �v��]�{��˻�������<��?�|�]�y��~r5�؀��t������N#mG�@�u0	Y ���y�Hf;���hl����m����<��\��0~{rc�ǆ{	�0s�wc�U���!���l�zb0� �����؊��k�2o��,��m:k\��8�maE�؞4n����S%v��Y ׫DKi�\C�^�#�`� � _���.	���Qg;9^��"�'.��S9 3W	6�V�Q/�`P��6%�<�r��2��j��i	먾���l��em�BI��1�$��03��Lj ��L��H�	���q�`K s/6T�[?I@eA�@��k[?.����g�|%�L���A�\
dPy�p�� u� ^{%�aa(U�{�_Q.z`����v�T�/��2�~[G	d�k��,�<q��j�:Ċ���A�MiEf^�up@�]�u� &�,[��X&-TFO���X	���������������{�_��]6���ur�kϛWi����4���g>k��m��Wdv��ȼݟ�2�X�uS��J����G�gWJ�����G*F �9�%��e���K�ER� �\TY��Z��`(D������� ��{�n���V�؀�0r��ȏ����p��nWo>�\�%� �C/����*���Z�eI�lo��[�,Aj��^�Pe�Q;/9��c���%dd�H���� �1�U=���p�5Sy	�b¼�y��������Ewx�_�o�T�Cf�2�"��s��r�M�[}�c�B��2�9d��y��m��ɄT�Ͱ�eO�����������Y?�h}Efn������)
4d�fc	� ��ccBV�,�ǹyY����ʐm<�mʱ�]��Nkͣ�#!� ���]�����ۏjd�pE�)�	`����\�����AQ�B^�/)�2��.m�-9K,�ˀ�@�v���e6�M�_{��ꦓ�]��-����=��s�^ק��)E�gnpF��)9���Nn'(��o<�ct�]�����J�= �0�ϙ�Z�
?u���%�y��h�\��=x��Ԋ�� _��^52����v"s8�L,[�,�D*������=�'�7��O�TS�r�FK��}�(s����[.3!��l�?����T�ɗz�e�������y� �=e�^�ڃz�T� 5,�#�R[P3�?H��kqtuy�:���r{�)ڴ�t�I�A�'��#0����|q�������I?_����;���Qf8���/�ߤ�߻� 3\�h�e�gRc�?/��5Z`�E�����	-/�/6U��y[�द�
��-T1U��V?U��3<z�{��������tw��N�����Q���MV�d=wM���Ѽ���T��n��c����_���^]�F���������_�����>�)}��׏ߤ����������ܟ��S�=�~X$�%�X��^���^��-��q�Y&b����
��gA-+�h��E�ȼ��5Ui���W�R ���N�ȼG�2��P����`�ܗ�R������,aS���oH�saׄ�K�F��Dh��7+ 3�����TB���Y y��V�U]�0E�㻔v� ���H;��x��v``�ֲ	���dZ�E��y���n�̆,�g�c&"@"v"����,sF��0�Ѧҋ�as�9�\�v ���ZMxXs���mK�.��"dسa��n���ޡr�@f��4̵w��5��sРf�<jn/�����vdhP3�!	jnZ�s��}��T,5�ζ�c�s����ћ�E�mż1O1'�Q�����?�|dx������'�����I����I�q���aN�o�@Hp��F;0ȝN�)*2�eh(��
������4(�mNW�Ƚ�����(�]���Z�{ϡ����Z���+=a0�U2s9���%�<��%� ��}@V�`�-_�)J]���� ��K�EȐ���"dHp�Zm24��"���G)T<��fu��%���4@��y�$!H�[�L � 'nI�1���(!G�+�d��0vcn�d�ӷ�=��\�]��>v?��}�,�� }ϣ��ˋOs+ˏ�2�V����(�?͈ÇR,��vc���$�^�c�Z����^#&o+��SC�u�}�t�H�GH׎Iw����Z�+>BW��1iB�����#CB�������T���a�T�v��w#��!��HU;2l�9Α�a�q���d�F�mfP��{�c�ũ�A�,z����>���w���RB�.E�ޑ'dxR�[�5!C-S��ڑ����g���{���!s�'�B�C昏�<׊̽:h�9擐���"U��Р�g���[�{�*��>��g����ۘz�ݘߔ�aSU�ۑaS�M�g��6���$d���&����5�B�n��O꠶�J���}�~� 2���D s�KM 2��e�b����=���9]]w�F�%� `nb�2��30��}�40��-v��b�0��}(��܇"���oH��퇥'9Q��5#ۊ,�[+;�~dύ��l���y��:
tX�`7��x�/u�y�ʒ;��+�����t��+���,��,4�����;��:�_F�M�L&�=��]&5�9ebR` �������������s�$�/5Jg�l:�=�ȝq�i�<�I��%o�,!ü�����ÜwR�~�q_�ͳ��� 3�`�;G�ʷ��X1s5����)��a�b8���^j��[��ؑb�O?��������>����Ͼ����
%����yu��:oZDBv@�M^H�ȼi>	� yO���'��nM��i�2�HW�}/�h�&rq��*���y1s��Q�hϹig��� �s�ڝ#5�(D�9U�~�ܡ��P!b>d� us�l����B6@�~�M������ ��=��]C�y�@��J��ڐ�Ź�G���<��^%@�~�]s� v?K�.��*b��a~g��\��;w�y�!v���C����̂�=��h��3�A��)\��
bM�Z�u�Kݚ�9O�5�=�Tε"����AF��<˛�'�Ɏ�\޾��oo��ә͂t5�4�E�ŗv�s)�����8��Ue��� <  AU�	E�!k��ˎ�e�v�l*��Ye*�I0R���"l��1��c}O=�ӿ$����C��#c� i��s�\�8wCf!m��I-=ULv��Z(z��<t<�V���n?�^u�VןvW��N({*�l�B՚��:�kn�[(|4����@���x5��e�@ݣ�g{o{�P$>���`�=�����c7B�w��@�S���������.S5�=�w'�D�a��3���ܖ<!C���` �8��S�K���ܳ���k�@ҳ޿\�����i��;ӊ�Wd�ñ����@���g?���ĥ��x�Ր���C1��f�&��!婜�vdy�;�"d���TB�����I� [�<:��O�<:��>w�{� ; ��`� ��}��.���́�Jv��>/~�.&� �Hߙ���ˈR����rB�@��UJ ��n���W?w�*#�\]i�>=��*��mWB���GBȣm�86g喓cnn���YD��"=g=钹<I��$!�����x� ����(�Ƚ䔠���XUZ*2[���R��s�G@��=e/��SlN����f���n�)��ȣ9����xTN����c�E��LϽ��	R�j��dC�n��ܻ� �-t�ɩP�5�mG@f6{��z(uƠ��-�w�w�P�����)u��i)R�\������@��А�_�˽r?��"��P�{�o�_=�s77e��k[a����c:��զ,�{|�lZ�ݲk��Ew�������zw�]�8S��x\��W���a�m�L_k,����X�._x�6�,�i@f�M��o��4�d0	�[۽>��(r뙕�*����
�k�vq߿���wg����ɲmC�@~�M��3�ڐ%���� ��@n�'��g^�J�b,t��E6}�%fd9^Ʃ�x��S��3�cm���N���/��t]X��s!�?����zWa���V
	��@>�]���ib���|b��M� �������U����ذ����V�b��=|��[�N�Z�'��7+ O4�m� ���jx�Cr+p�Ox�[��%�T��y���l������ �َ%�7ռ��*o��8m�4�"�1���Ȇ��ˣ�t�m�bk�"q��+_� �=}y�#{ Olۑ-��Y_^]���C��y��Й�%�yˋ$dd�V�Ɗ<���o��̭.��@fn
��&�"37�����z&! ��w&ddn�Xh��.@B���hj�^���蘍l�����P���C���m�G��M�Eh��Qk~*��I'ߟ��[���HܞH�ld��-��N��^fB��ͮ_��g'n$ۑᚘ�e&`��hZ�"dXs%NM��̜(��i4���7g�h���4��*�˼O�t��c�� �N����zE�ޫ
�
s)<:�Ud�RxʗFda���k�������U.�W�yOu��d�S]B@�]T.X�y��\� O�NhG�@�(�Ўl�<"hG�Y���R�B�SY3�Ȑ swn�-4�|����R�X+�%��@)�Cd(���wB�J�;��,�ȼ��/-���5'��D{�vdY��7�,����.M�y���"� dn�&r��mϥ��߹�dA�@�gm��mϺjpx�ɂ���n��`�^�448�5�@V�`�֠��4�5�����A^ʬA�����ݓU;2j�2ߚ�<y��Gsac��\�&K����������d��t4��N����⋏:���a�D�ߩ�"O�3����m�iE��S����(�;u�yi�'s�h!உL� 2�<9C�����{3���ޙ}��KN�ӷ�S:Zc�~d��u��9/@�z�L�h�U��9� Ȯ���0���JX�����X�A
����8}���c+��.X&w�!�h�%�?Vȩ�C[�o�n�������-��0��N>��r�\����ldt.��zݎ���rݎ����Je���>�Y��KE����-���_��^�"{��~Sz�0wn� �3��,"��)�� ̜[(<��s�0s���i�Ë``n�@�e�
(/L���V`(/pO��y3NU��<o���P��pB��P��0�f`(�O�[30���R�7/�݋�"U�c�̀��&'�yT���/]L Y����G~o��/~�_>����r&	$�x��
���]�U�Dݘ��f{P����*@���m�
P��}۠�鞗�l\HҍIf��$9����wC�vlc�����ԓxhюiq�=��������&>j�¥n��C��/\���C�v⼰x�!\���us	�\�L��)��͞�h34l����5�f`��𞀔�\�J�Sü�:�0���4�'y�H�{�WJ4Jl|Q��'�l�P�fV���4�a�By��0h�<�|�P��P^30��'��
l0ƣW��֗%�k��P���$���Dǰ�=+��a�Cb~ׯ�~e���_�+��\O�&`8��Ҷ k8$��bk��V�M�P	�~�ᐘ��+�1��W�c~ׯtV��9���U��<�o� fV� {M� XE �R* ���dM�����(TY��yY�l�,�R���.9��3�QP�y�f0�g��fs�P�T�f`(�L</j���4Cy���$����MBy��@Kv�
�ϼ�k��P���˯�$�X�=ҥ��в��.�*�hfo*��l������+:3�W�uR�}��cs?%`��/4ƙ��Ƹ��c��cq�S�q�e���+��8@2��G4�ۼ�X+F�?/��?�H�	6���&`�sO���aݣ�۫kFX�s�Z�̙�bB�1s�>`�S�s�&fk����������s�����VG���fcY��~�X 8��@��7�O��e	���.�̅��u޵jN)r�������� X2k �Ʌ�F G5�|�R��g�fOz�S�kh�^�ACʼ��8��R/�Q�W�e�a��e���������d���/�,s��5M��s��S�տ��[�Kn��a#ga5"���ck��"30�DX^`������*�+B1É�����N�hc�g��6k �^G��W;�C!�|�-�y�|����WϿjl� f6�?W;}d8�!�{�,52U6�������M\�p�uQ��n٭n����t��f`���Ts�� ��RA S�{��%R*wb�]�<��'�4wBp  3/M%��[	�X�7gL��n�``�5��Dw�=p C ���W@ SAܥ�s�;�CN(q4Z��6B@��{��)�T̺��s������-#ÈC��;������!��hݖ�o�PiZ�9�'B�������W��D�	�N�X�N.�*�lQZGj��I�"4+y���J�/B�S���oy4:��߸���f���zBЊsf�q�1s8=�~���[qa�SY����ߩ }#����}�d�	��=ߪ<K��zj�*K����W����fꦝ��x7&�-���
�\^�Iq^����/pK�݂�{V���~r�<�¹�.c�Y�~rˀ���R�Ao�-��6�۹ zcn������󽱃��=���F��/��ޘSM-�Ɯij���>;������/������/����lP{�A{��``S=_Zq���ۂ�˼w5�7�����g�-��Bo�nK�:���Yf��j\���6��}o�����>��J�2�	��}�+jn .�CA\޻e�˻P��
�3�ٟQH-79H�X����[����S�����m\�<n�������^����=*CZ�YG��2e��X�J�N��ܿ��#����~��_��_�� �Z�      �	   O   x�3�446�4��U��K�*�420��50�54U00�26�20�3576��-�e�ilffb������C����1)�=... ���      �	   �   x���K�0��)�@+�Χt�I�H������غ�3~8>>� �:�θ�(~$�G������5�SH��@��T�z�A����%ϩ�;��Sw��~���*Sm �|�;=�������Z"V
7��z��Z�^x���g[�      
   r   x�U��	�0���^ �Y���J�I��zh ��=(�����|O��)���Y�P+�P	P��L�k�8�k���?���#��Zu3���K�U�0,ݎQ��'�k���Y#/      
      x�3�4�2�4�2�=... $      �	   H   x�U���0��� �����ϡ^Z��8!R�=J���Dr�`+�e$�����m�:�F���$�      �	   O   x�3��rt��4�420��50�54U00�26�20�3�4�05�#�e������\TZ��Z�i�C���!.;@R\1z\\\ Ն      �	   �   x���A� @���)��f�DwD�!iC������� ���|%]�d�H<7��W���Y��2���i��;ki�-s�P ~R�G�;9��������&����֡�3����Ik�'���j<�6t�"� j^Q      �	   u   x�}˱� @њ��l�!��!�D����sDJm���J�Ѹ�Z�}L%B��E��k��^nd݄��3r�䙹\���h�k	ҷo��JG�=!�DO�>
�h��+ � 
K7i      �	     x����O�@���_�W������@�k�Fj�e���J���[H�`�e2�K~o���»�Wu[�u���z�z �zyy?G5.=M�`~�۫�&O�kJ�"}�4�1	�X7��.�4I�M�H��r�}�}�HKƢf��>X*��blI�
 cƻ���ډ���"Iq�,J+`�H��\�9�-���W�=}4e1����M�	��m���HZ'
�~�J��(��M����^:�c".,�%#���g�v.(1���W��M�Q�5��J(.X�_C�qA     