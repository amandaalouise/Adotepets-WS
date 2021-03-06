--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-08-20 10:33:37 -03

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 30715)
-- Name: animal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.animal (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    castrado boolean NOT NULL,
    cor character varying(255),
    descricao character varying(255),
    idade character varying(255),
    nome character varying(255),
    porte character varying(255),
    raca character varying(255),
    sexo character varying(255),
    tipo character varying(255),
    vacinado boolean NOT NULL,
    usuario_id bigint
);


--
-- TOC entry 198 (class 1259 OID 30724)
-- Name: animal_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.animal_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    castrado boolean,
    cor character varying(255),
    descricao character varying(255),
    idade character varying(255),
    nome character varying(255),
    porte character varying(255),
    raca character varying(255),
    sexo character varying(255),
    tipo character varying(255),
    vacinado boolean,
    usuario_id bigint
);


--
-- TOC entry 196 (class 1259 OID 30713)
-- Name: animal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 196
-- Name: animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.animal_id_seq OWNED BY public.animal.id;


--
-- TOC entry 199 (class 1259 OID 30732)
-- Name: animal_imagens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.animal_imagens (
    animal_id bigint NOT NULL,
    imagens character varying(255)
);


--
-- TOC entry 200 (class 1259 OID 30735)
-- Name: animal_imagens_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.animal_imagens_audit (
    revision bigint NOT NULL,
    animal_id bigint NOT NULL,
    imagens character varying(255) NOT NULL,
    revision_type smallint
);


--
-- TOC entry 202 (class 1259 OID 30742)
-- Name: anuncio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.anuncio (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    ativo boolean NOT NULL,
    cidade character varying(255),
    data_publicacao date,
    estado character varying(255),
    lat numeric(19,2),
    lng numeric(19,2),
    resgatado boolean,
    animal_id bigint
);


--
-- TOC entry 203 (class 1259 OID 30751)
-- Name: anuncio_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.anuncio_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    dtype character varying(31) NOT NULL,
    revision_type smallint,
    ativo boolean,
    cidade character varying(255),
    data_publicacao date,
    estado character varying(255),
    animal_id bigint,
    lat numeric(19,2),
    lng numeric(19,2),
    resgatado boolean
);


--
-- TOC entry 201 (class 1259 OID 30740)
-- Name: anuncio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anuncio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 201
-- Name: anuncio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anuncio_id_seq OWNED BY public.anuncio.id;


--
-- TOC entry 205 (class 1259 OID 30761)
-- Name: autorizacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.autorizacao (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    id_permissao bigint NOT NULL,
    id_usuario bigint NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30767)
-- Name: autorizacao_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.autorizacao_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    id_permissao bigint,
    id_usuario bigint
);


--
-- TOC entry 204 (class 1259 OID 30759)
-- Name: autorizacao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.autorizacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 204
-- Name: autorizacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.autorizacao_id_seq OWNED BY public.autorizacao.id;


--
-- TOC entry 208 (class 1259 OID 30774)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.denuncia (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    anuncio_denunciado_id bigint,
    usuario_denunciante_id bigint
);


--
-- TOC entry 209 (class 1259 OID 30780)
-- Name: denuncia_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.denuncia_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    anuncio_denunciado_id bigint,
    usuario_denunciante_id bigint
);


--
-- TOC entry 207 (class 1259 OID 30772)
-- Name: denuncia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.denuncia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 207
-- Name: denuncia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.denuncia_id_seq OWNED BY public.denuncia.id;


--
-- TOC entry 212 (class 1259 OID 30795)
-- Name: item_meta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_meta (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    ativo boolean NOT NULL,
    progresso integer NOT NULL,
    quantidade integer NOT NULL,
    tipo character varying(255),
    unidade character varying(255)
);


--
-- TOC entry 210 (class 1259 OID 30785)
-- Name: item_meta_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_meta_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    ativo boolean,
    progresso integer,
    quantidade integer,
    tipo character varying(255),
    unidade character varying(255)
);


--
-- TOC entry 211 (class 1259 OID 30793)
-- Name: item_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 211
-- Name: item_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_meta_id_seq OWNED BY public.item_meta.id;


--
-- TOC entry 214 (class 1259 OID 30806)
-- Name: mensagem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mensagem (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    ativo boolean NOT NULL,
    data_pergunta date,
    texto character varying(255),
    anuncio_id bigint,
    usuario_pergunta_id bigint
);


--
-- TOC entry 215 (class 1259 OID 30812)
-- Name: mensagem_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mensagem_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    ativo boolean,
    data_pergunta date,
    texto character varying(255),
    anuncio_id bigint,
    usuario_pergunta_id bigint
);


--
-- TOC entry 213 (class 1259 OID 30804)
-- Name: mensagem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mensagem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 213
-- Name: mensagem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mensagem_id_seq OWNED BY public.mensagem.id;


--
-- TOC entry 216 (class 1259 OID 30817)
-- Name: mensagem_respostas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mensagem_respostas (
    mensagem_id bigint NOT NULL,
    respostas_id bigint NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30820)
-- Name: mensagem_respostas_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mensagem_respostas_audit (
    revision bigint NOT NULL,
    mensagem_id bigint NOT NULL,
    respostas_id bigint NOT NULL,
    revision_type smallint
);


--
-- TOC entry 221 (class 1259 OID 30837)
-- Name: meta_mensal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_mensal (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    ano integer NOT NULL,
    mes integer NOT NULL,
    progresso_total numeric(19,2),
    prestador_id bigint
);


--
-- TOC entry 218 (class 1259 OID 30825)
-- Name: meta_mensal_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_mensal_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    ano integer,
    mes integer,
    progresso_total numeric(19,2),
    prestador_id bigint
);


--
-- TOC entry 220 (class 1259 OID 30835)
-- Name: meta_mensal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meta_mensal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 220
-- Name: meta_mensal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meta_mensal_id_seq OWNED BY public.meta_mensal.id;


--
-- TOC entry 222 (class 1259 OID 30843)
-- Name: meta_mensal_itens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_mensal_itens (
    meta_mensal_id bigint NOT NULL,
    itens_id bigint NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 30830)
-- Name: meta_mensal_itens_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_mensal_itens_audit (
    revision bigint NOT NULL,
    meta_mensal_id bigint NOT NULL,
    itens_id bigint NOT NULL,
    revision_type smallint
);


--
-- TOC entry 224 (class 1259 OID 30848)
-- Name: permissao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissao (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    regra character varying(150) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 30854)
-- Name: permissao_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissao_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    regra character varying(150)
);


--
-- TOC entry 223 (class 1259 OID 30846)
-- Name: permissao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 223
-- Name: permissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permissao_id_seq OWNED BY public.permissao.id;


--
-- TOC entry 227 (class 1259 OID 30861)
-- Name: resposta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resposta (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    data date,
    texto character varying(255)
);


--
-- TOC entry 228 (class 1259 OID 30867)
-- Name: resposta_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resposta_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    revision_type smallint,
    data date,
    texto character varying(255)
);


--
-- TOC entry 226 (class 1259 OID 30859)
-- Name: resposta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resposta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 226
-- Name: resposta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resposta_id_seq OWNED BY public.resposta.id;


--
-- TOC entry 230 (class 1259 OID 30874)
-- Name: revision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revision (
    id bigint NOT NULL,
    created_by character varying(45) NOT NULL,
    created_on timestamp without time zone NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 30872)
-- Name: revision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 229
-- Name: revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.revision_id_seq OWNED BY public.revision.id;


--
-- TOC entry 232 (class 1259 OID 30882)
-- Name: th_registros_usos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.th_registros_usos (
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    operacao character varying(45) NOT NULL,
    quantidade integer NOT NULL,
    verbo_http character varying(45)
);


--
-- TOC entry 231 (class 1259 OID 30880)
-- Name: th_registros_usos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.th_registros_usos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 231
-- Name: th_registros_usos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.th_registros_usos_id_seq OWNED BY public.th_registros_usos.id;


--
-- TOC entry 234 (class 1259 OID 30890)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone,
    ativo boolean NOT NULL,
    auth_token character varying(255),
    celular character varying(255),
    cod_confirmacao character varying(255),
    email character varying(255) NOT NULL,
    facebook character varying(255),
    imagem character varying(255),
    nome character varying(255),
    senha character varying(255),
    telefone character varying(255),
    agencia character varying(255),
    banco character varying(255),
    cep character varying(255),
    cidade character varying(255),
    conta character varying(255),
    cpf_responsavel character varying(255),
    estado character varying(255),
    logradouro character varying(255),
    numero character varying(255),
    responsavel character varying(255),
    tipo character varying(255)
);


--
-- TOC entry 235 (class 1259 OID 30899)
-- Name: usuario_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_audit (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    dtype character varying(31) NOT NULL,
    revision_type smallint,
    ativo boolean,
    auth_token character varying(255),
    celular character varying(255),
    cod_confirmacao character varying(255),
    email character varying(255),
    facebook character varying(255),
    imagem character varying(255),
    nome character varying(255),
    senha character varying(255),
    telefone character varying(255),
    agencia character varying(255),
    banco character varying(255),
    cep character varying(255),
    cidade character varying(255),
    conta character varying(255),
    cpf_responsavel character varying(255),
    estado character varying(255),
    logradouro character varying(255),
    numero character varying(255),
    responsavel character varying(255),
    tipo character varying(255)
);


--
-- TOC entry 233 (class 1259 OID 30888)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 233
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 2932 (class 2604 OID 30718)
-- Name: animal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal ALTER COLUMN id SET DEFAULT nextval('public.animal_id_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 30745)
-- Name: anuncio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio ALTER COLUMN id SET DEFAULT nextval('public.anuncio_id_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 30764)
-- Name: autorizacao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorizacao ALTER COLUMN id SET DEFAULT nextval('public.autorizacao_id_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 30777)
-- Name: denuncia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.denuncia ALTER COLUMN id SET DEFAULT nextval('public.denuncia_id_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 30798)
-- Name: item_meta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_meta ALTER COLUMN id SET DEFAULT nextval('public.item_meta_id_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 30809)
-- Name: mensagem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem ALTER COLUMN id SET DEFAULT nextval('public.mensagem_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 30840)
-- Name: meta_mensal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal ALTER COLUMN id SET DEFAULT nextval('public.meta_mensal_id_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 30851)
-- Name: permissao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissao ALTER COLUMN id SET DEFAULT nextval('public.permissao_id_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 30864)
-- Name: resposta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resposta ALTER COLUMN id SET DEFAULT nextval('public.resposta_id_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 30877)
-- Name: revision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revision ALTER COLUMN id SET DEFAULT nextval('public.revision_id_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 30885)
-- Name: th_registros_usos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.th_registros_usos ALTER COLUMN id SET DEFAULT nextval('public.th_registros_usos_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 30893)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 2947 (class 2606 OID 30731)
-- Name: animal_audit animal_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal_audit
    ADD CONSTRAINT animal_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2949 (class 2606 OID 30739)
-- Name: animal_imagens_audit animal_imagens_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal_imagens_audit
    ADD CONSTRAINT animal_imagens_audit_pkey PRIMARY KEY (revision, animal_id, imagens);


--
-- TOC entry 2945 (class 2606 OID 30723)
-- Name: animal animal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 30758)
-- Name: anuncio_audit anuncio_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio_audit
    ADD CONSTRAINT anuncio_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2951 (class 2606 OID 30750)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 30771)
-- Name: autorizacao_audit autorizacao_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorizacao_audit
    ADD CONSTRAINT autorizacao_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2955 (class 2606 OID 30766)
-- Name: autorizacao autorizacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorizacao
    ADD CONSTRAINT autorizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 2961 (class 2606 OID 30784)
-- Name: denuncia_audit denuncia_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.denuncia_audit
    ADD CONSTRAINT denuncia_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2959 (class 2606 OID 30779)
-- Name: denuncia denuncia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 30792)
-- Name: item_meta_audit item_meta_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_meta_audit
    ADD CONSTRAINT item_meta_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2965 (class 2606 OID 30803)
-- Name: item_meta item_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_meta
    ADD CONSTRAINT item_meta_pkey PRIMARY KEY (id);


--
-- TOC entry 2969 (class 2606 OID 30816)
-- Name: mensagem_audit mensagem_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_audit
    ADD CONSTRAINT mensagem_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2967 (class 2606 OID 30811)
-- Name: mensagem mensagem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem
    ADD CONSTRAINT mensagem_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 30824)
-- Name: mensagem_respostas_audit mensagem_respostas_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_respostas_audit
    ADD CONSTRAINT mensagem_respostas_audit_pkey PRIMARY KEY (revision, mensagem_id, respostas_id);


--
-- TOC entry 2975 (class 2606 OID 30829)
-- Name: meta_mensal_audit meta_mensal_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_audit
    ADD CONSTRAINT meta_mensal_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2977 (class 2606 OID 30834)
-- Name: meta_mensal_itens_audit meta_mensal_itens_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_itens_audit
    ADD CONSTRAINT meta_mensal_itens_audit_pkey PRIMARY KEY (revision, meta_mensal_id, itens_id);


--
-- TOC entry 2979 (class 2606 OID 30842)
-- Name: meta_mensal meta_mensal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal
    ADD CONSTRAINT meta_mensal_pkey PRIMARY KEY (id);


--
-- TOC entry 2985 (class 2606 OID 30858)
-- Name: permissao_audit permissao_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissao_audit
    ADD CONSTRAINT permissao_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2983 (class 2606 OID 30853)
-- Name: permissao permissao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT permissao_pkey PRIMARY KEY (id);


--
-- TOC entry 2989 (class 2606 OID 30871)
-- Name: resposta_audit resposta_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resposta_audit
    ADD CONSTRAINT resposta_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2987 (class 2606 OID 30866)
-- Name: resposta resposta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resposta
    ADD CONSTRAINT resposta_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 30879)
-- Name: revision revision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 30887)
-- Name: th_registros_usos th_registros_usos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.th_registros_usos
    ADD CONSTRAINT th_registros_usos_pkey PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 30912)
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- TOC entry 2981 (class 2606 OID 30910)
-- Name: meta_mensal_itens uk_64ra2asc5ufqaiyaaknnnu6hc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_itens
    ADD CONSTRAINT uk_64ra2asc5ufqaiyaaknnnu6hc UNIQUE (itens_id);


--
-- TOC entry 2971 (class 2606 OID 30908)
-- Name: mensagem_respostas uk_lv1966hovrtfvceh7votnf6ps; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_respostas
    ADD CONSTRAINT uk_lv1966hovrtfvceh7votnf6ps UNIQUE (respostas_id);


--
-- TOC entry 2999 (class 2606 OID 30906)
-- Name: usuario_audit usuario_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_audit
    ADD CONSTRAINT usuario_audit_pkey PRIMARY KEY (id, revision);


--
-- TOC entry 2997 (class 2606 OID 30898)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 31008)
-- Name: meta_mensal_audit fk20wp7n1wktqgvpda4whh2012r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_audit
    ADD CONSTRAINT fk20wp7n1wktqgvpda4whh2012r FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3022 (class 2606 OID 31023)
-- Name: meta_mensal_itens fk3sbm78npj1jsxywswqmeb9xp4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_itens
    ADD CONSTRAINT fk3sbm78npj1jsxywswqmeb9xp4 FOREIGN KEY (itens_id) REFERENCES public.item_meta(id);


--
-- TOC entry 3024 (class 2606 OID 31033)
-- Name: permissao_audit fk4h3j0wg1mbjpexb88spjqjdpy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissao_audit
    ADD CONSTRAINT fk4h3j0wg1mbjpexb88spjqjdpy FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3021 (class 2606 OID 31018)
-- Name: meta_mensal fk6is0of9d6vv222pcyhc4a6d6y; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal
    ADD CONSTRAINT fk6is0of9d6vv222pcyhc4a6d6y FOREIGN KEY (prestador_id) REFERENCES public.usuario(id);


--
-- TOC entry 3014 (class 2606 OID 30983)
-- Name: mensagem fk7jgenw1tla511yh0qblgtjtjn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem
    ADD CONSTRAINT fk7jgenw1tla511yh0qblgtjtjn FOREIGN KEY (usuario_pergunta_id) REFERENCES public.usuario(id);


--
-- TOC entry 3007 (class 2606 OID 30948)
-- Name: autorizacao fk82cy3wxri40li4cb8ael3fa0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorizacao
    ADD CONSTRAINT fk82cy3wxri40li4cb8ael3fa0e FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 3026 (class 2606 OID 31043)
-- Name: usuario_audit fk8g3gtpx61e0oqkfvp5nsejvm8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_audit
    ADD CONSTRAINT fk8g3gtpx61e0oqkfvp5nsejvm8 FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3001 (class 2606 OID 30918)
-- Name: animal_audit fk8r6r938iv7yxf5agc0q8w2ito; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal_audit
    ADD CONSTRAINT fk8r6r938iv7yxf5agc0q8w2ito FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3008 (class 2606 OID 30953)
-- Name: autorizacao_audit fk94vm3dcd3xb26324k1x0adykm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorizacao_audit
    ADD CONSTRAINT fk94vm3dcd3xb26324k1x0adykm FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3017 (class 2606 OID 30998)
-- Name: mensagem_respostas fk9q54m1mnlqfah4aldu9dpbxry; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_respostas
    ADD CONSTRAINT fk9q54m1mnlqfah4aldu9dpbxry FOREIGN KEY (mensagem_id) REFERENCES public.mensagem(id);


--
-- TOC entry 3003 (class 2606 OID 30928)
-- Name: animal_imagens_audit fk9tja8o1ciqj7dvye536w2yr82; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal_imagens_audit
    ADD CONSTRAINT fk9tja8o1ciqj7dvye536w2yr82 FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3012 (class 2606 OID 30973)
-- Name: item_meta_audit fka8jqqpmoc2popf6ug8avwg1p2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_meta_audit
    ADD CONSTRAINT fka8jqqpmoc2popf6ug8avwg1p2 FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3016 (class 2606 OID 30993)
-- Name: mensagem_respostas fkafvxd1ho5fmmt27h4c5qt40tt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_respostas
    ADD CONSTRAINT fkafvxd1ho5fmmt27h4c5qt40tt FOREIGN KEY (respostas_id) REFERENCES public.resposta(id);


--
-- TOC entry 3009 (class 2606 OID 30958)
-- Name: denuncia fkbtl9d4pfoaveqrcvysts12vbg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT fkbtl9d4pfoaveqrcvysts12vbg FOREIGN KEY (anuncio_denunciado_id) REFERENCES public.anuncio(id);


--
-- TOC entry 3015 (class 2606 OID 30988)
-- Name: mensagem_audit fkekbws1nkosk5fidmcuxmy0yfn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_audit
    ADD CONSTRAINT fkekbws1nkosk5fidmcuxmy0yfn FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3025 (class 2606 OID 31038)
-- Name: resposta_audit fkfavdwifhce6ddgwp85fmbelln; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resposta_audit
    ADD CONSTRAINT fkfavdwifhce6ddgwp85fmbelln FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3006 (class 2606 OID 30943)
-- Name: autorizacao fkgcu3vaio69cwyd4aramwf1x6u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autorizacao
    ADD CONSTRAINT fkgcu3vaio69cwyd4aramwf1x6u FOREIGN KEY (id_permissao) REFERENCES public.permissao(id);


--
-- TOC entry 3000 (class 2606 OID 30913)
-- Name: animal fkgsmdg0fb7a70kuahxl2tccb00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT fkgsmdg0fb7a70kuahxl2tccb00 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 3020 (class 2606 OID 31013)
-- Name: meta_mensal_itens_audit fkj43lui4xbxj21s4ywphc3vuwx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_itens_audit
    ADD CONSTRAINT fkj43lui4xbxj21s4ywphc3vuwx FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3023 (class 2606 OID 31028)
-- Name: meta_mensal_itens fkjh6huwy2d490270ho9jlom8qc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_mensal_itens
    ADD CONSTRAINT fkjh6huwy2d490270ho9jlom8qc FOREIGN KEY (meta_mensal_id) REFERENCES public.meta_mensal(id);


--
-- TOC entry 3010 (class 2606 OID 30963)
-- Name: denuncia fkjjecgr2y32rsoot2x4st1p9pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT fkjjecgr2y32rsoot2x4st1p9pr FOREIGN KEY (usuario_denunciante_id) REFERENCES public.usuario(id);


--
-- TOC entry 3002 (class 2606 OID 30923)
-- Name: animal_imagens fknin3gee4ckjqsww4jigjagbfi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animal_imagens
    ADD CONSTRAINT fknin3gee4ckjqsww4jigjagbfi FOREIGN KEY (animal_id) REFERENCES public.animal(id);


--
-- TOC entry 3005 (class 2606 OID 30938)
-- Name: anuncio_audit fkqrhcknmf97lp3fodw7lfo9q5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio_audit
    ADD CONSTRAINT fkqrhcknmf97lp3fodw7lfo9q5b FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3018 (class 2606 OID 31003)
-- Name: mensagem_respostas_audit fkrvm5xdxy9uag88hwr2di6dx86; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem_respostas_audit
    ADD CONSTRAINT fkrvm5xdxy9uag88hwr2di6dx86 FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3004 (class 2606 OID 30933)
-- Name: anuncio fks0gsnu6cdi7p6bfpocqk6d75f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fks0gsnu6cdi7p6bfpocqk6d75f FOREIGN KEY (animal_id) REFERENCES public.animal(id);


--
-- TOC entry 3011 (class 2606 OID 30968)
-- Name: denuncia_audit fkt1inxpq5mhw3fdj3u85q6sy4n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.denuncia_audit
    ADD CONSTRAINT fkt1inxpq5mhw3fdj3u85q6sy4n FOREIGN KEY (revision) REFERENCES public.revision(id);


--
-- TOC entry 3013 (class 2606 OID 30978)
-- Name: mensagem fkwff1jtw3ecfoiq9rjp2ak1w5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem
    ADD CONSTRAINT fkwff1jtw3ecfoiq9rjp2ak1w5 FOREIGN KEY (anuncio_id) REFERENCES public.anuncio(id);


-- Completed on 2019-08-20 10:33:38 -03

--
-- PostgreSQL database dump complete
--

