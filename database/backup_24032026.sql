--
-- PostgreSQL database dump
--

\restrict HoueZAowmnZyb7xGwxMuhIL4fMHiFLXzlcnan3DFelfun3HHBdgyMig4aL7MhQm

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    actor character varying(255),
    details text,
    entity_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audit_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: class_decisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.class_decisions (
    id integer NOT NULL,
    document_id character varying(255),
    decision_number character varying(255),
    training_course character varying(255),
    signed_date date,
    signer_name character varying(255),
    notes text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    type character varying(255),
    start_date date,
    end_date date,
    class_type character varying(255)
);


--
-- Name: class_decisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.class_decisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: class_decisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.class_decisions_id_seq OWNED BY public.class_decisions.id;


--
-- Name: class_decisions_related_decision_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.class_decisions_related_decision_lnk (
    id integer NOT NULL,
    class_decision_id integer,
    inv_class_decision_id integer
);


--
-- Name: class_decisions_related_decision_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.class_decisions_related_decision_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: class_decisions_related_decision_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.class_decisions_related_decision_lnk_id_seq OWNED BY public.class_decisions_related_decision_lnk.id;


--
-- Name: class_decisions_school_class_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.class_decisions_school_class_lnk (
    id integer NOT NULL,
    class_decision_id integer,
    school_class_id integer
);


--
-- Name: class_decisions_school_class_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.class_decisions_school_class_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: class_decisions_school_class_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.class_decisions_school_class_lnk_id_seq OWNED BY public.class_decisions_school_class_lnk.id;


--
-- Name: class_decisions_students_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.class_decisions_students_lnk (
    id integer NOT NULL,
    class_decision_id integer,
    student_id integer,
    student_ord double precision
);


--
-- Name: class_decisions_students_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.class_decisions_students_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: class_decisions_students_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.class_decisions_students_lnk_id_seq OWNED BY public.class_decisions_students_lnk.id;


--
-- Name: class_subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.class_subjects (
    class_id character varying(255),
    subject_id character varying(255),
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: class_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.class_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: class_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.class_subjects_id_seq OWNED BY public.class_subjects.id;


--
-- Name: classes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    document_id character varying(255),
    code character varying(255),
    name character varying(255),
    notes text,
    status character varying(255),
    start_date character varying(255),
    end_date character varying(255),
    student_count integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: classes_subjects_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classes_subjects_lnk (
    id integer NOT NULL,
    school_class_id integer,
    subject_id integer,
    subject_ord double precision
);


--
-- Name: classes_subjects_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classes_subjects_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classes_subjects_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classes_subjects_lnk_id_seq OWNED BY public.classes_subjects_lnk.id;


--
-- Name: classrooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classrooms (
    id integer NOT NULL,
    document_id character varying(255),
    code character varying(255),
    name character varying(255),
    capacity integer,
    building character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: classrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classrooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classrooms_id_seq OWNED BY public.classrooms.id;


--
-- Name: exam_approvals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exam_approvals (
    id integer NOT NULL,
    document_id character varying(255),
    approvals jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: exam_approvals_decision_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exam_approvals_decision_lnk (
    id integer NOT NULL,
    exam_approval_id integer,
    class_decision_id integer
);


--
-- Name: exam_approvals_decision_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exam_approvals_decision_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exam_approvals_decision_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exam_approvals_decision_lnk_id_seq OWNED BY public.exam_approvals_decision_lnk.id;


--
-- Name: exam_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exam_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exam_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exam_approvals_id_seq OWNED BY public.exam_approvals.id;


--
-- Name: exam_grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exam_grades (
    id integer NOT NULL,
    document_id character varying(255),
    grades jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: exam_grades_decision_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exam_grades_decision_lnk (
    id integer NOT NULL,
    exam_grade_id integer,
    class_decision_id integer
);


--
-- Name: exam_grades_decision_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exam_grades_decision_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exam_grades_decision_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exam_grades_decision_lnk_id_seq OWNED BY public.exam_grades_decision_lnk.id;


--
-- Name: exam_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exam_grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exam_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exam_grades_id_seq OWNED BY public.exam_grades.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text text,
    caption text,
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url text,
    preview_url text,
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    focal_point jsonb
);


--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: nations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nations (
    id integer NOT NULL,
    document_id character varying(255),
    code character varying(255),
    name character varying(255),
    abbr character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: nations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nations_id_seq OWNED BY public.nations.id;


--
-- Name: print_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.print_templates (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    name character varying(255),
    content jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: print_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.print_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: print_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.print_templates_id_seq OWNED BY public.print_templates.id;


--
-- Name: strapi_ai_localization_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_ai_localization_jobs (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255) NOT NULL,
    source_locale character varying(255) NOT NULL,
    target_locales jsonb NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_ai_localization_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNED BY public.strapi_ai_localization_jobs.id;


--
-- Name: strapi_ai_metadata_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_ai_metadata_jobs (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone
);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_ai_metadata_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_ai_metadata_jobs_id_seq OWNED BY public.strapi_ai_metadata_jobs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_sessions (
    id integer NOT NULL,
    document_id character varying(255),
    user_id character varying(255),
    session_id character varying(255),
    child_id character varying(255),
    device_id character varying(255),
    origin character varying(255),
    expires_at timestamp(6) without time zone,
    absolute_expires_at timestamp(6) without time zone,
    status character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_sessions_id_seq OWNED BY public.strapi_sessions.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: student_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student_documents (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    url text,
    date character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: student_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.student_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.student_documents_id_seq OWNED BY public.student_documents.id;


--
-- Name: student_documents_student_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student_documents_student_lnk (
    id integer NOT NULL,
    student_document_id integer,
    student_id integer,
    student_document_ord double precision
);


--
-- Name: student_documents_student_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.student_documents_student_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_documents_student_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.student_documents_student_lnk_id_seq OWNED BY public.student_documents_student_lnk.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    document_id character varying(255),
    stt integer,
    "group" character varying(255),
    class_code character varying(255),
    class_name character varying(255),
    card_number character varying(255),
    student_code character varying(255),
    id_number character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    full_name character varying(255),
    gender character varying(255),
    dob character varying(255),
    pob character varying(255),
    ethnicity character varying(255),
    nationality character varying(255),
    company character varying(255),
    address text,
    score character varying(255),
    photo text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    phone character varying(255),
    is_approved boolean
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: students_school_class_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students_school_class_lnk (
    id integer NOT NULL,
    student_id integer,
    school_class_id integer
);


--
-- Name: students_school_class_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_school_class_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_school_class_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_school_class_lnk_id_seq OWNED BY public.students_school_class_lnk.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    document_id character varying(255),
    code character varying(255),
    name character varying(255),
    sessions integer,
    total_hours numeric(10,2),
    theory_hours numeric(10,2),
    practice_hours numeric(10,2),
    exercise_hours numeric(10,2),
    exam_hours numeric(10,2),
    notes text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    has_theory boolean,
    has_practice boolean
);


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    document_id character varying(255),
    code character varying(255),
    name character varying(255),
    tax_id character varying(255),
    phone character varying(255),
    email character varying(255),
    address text,
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: teacher_subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teacher_subjects (
    teacher_id character varying(255),
    subject_id character varying(255),
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: teacher_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teacher_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teacher_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teacher_subjects_id_seq OWNED BY public.teacher_subjects.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    document_id character varying(255),
    code character varying(255),
    name character varying(255),
    specialization character varying(255),
    phone character varying(255),
    email character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: teachers_subjects_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers_subjects_lnk (
    id integer NOT NULL,
    teacher_id integer,
    subject_id integer,
    subject_ord double precision
);


--
-- Name: teachers_subjects_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_subjects_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachers_subjects_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_subjects_lnk_id_seq OWNED BY public.teachers_subjects_lnk.id;


--
-- Name: training_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_assignments (
    id integer NOT NULL,
    document_id character varying(255),
    schedule jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: training_assignments_decision_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_assignments_decision_lnk (
    id integer NOT NULL,
    training_assignment_id integer,
    class_decision_id integer
);


--
-- Name: training_assignments_decision_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_assignments_decision_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_assignments_decision_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_assignments_decision_lnk_id_seq OWNED BY public.training_assignments_decision_lnk.id;


--
-- Name: training_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_assignments_id_seq OWNED BY public.training_assignments.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    permissions jsonb
);


--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: class_decisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions ALTER COLUMN id SET DEFAULT nextval('public.class_decisions_id_seq'::regclass);


--
-- Name: class_decisions_related_decision_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_related_decision_lnk ALTER COLUMN id SET DEFAULT nextval('public.class_decisions_related_decision_lnk_id_seq'::regclass);


--
-- Name: class_decisions_school_class_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_school_class_lnk ALTER COLUMN id SET DEFAULT nextval('public.class_decisions_school_class_lnk_id_seq'::regclass);


--
-- Name: class_decisions_students_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_students_lnk ALTER COLUMN id SET DEFAULT nextval('public.class_decisions_students_lnk_id_seq'::regclass);


--
-- Name: class_subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_subjects ALTER COLUMN id SET DEFAULT nextval('public.class_subjects_id_seq'::regclass);


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: classes_subjects_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes_subjects_lnk ALTER COLUMN id SET DEFAULT nextval('public.classes_subjects_lnk_id_seq'::regclass);


--
-- Name: classrooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classrooms ALTER COLUMN id SET DEFAULT nextval('public.classrooms_id_seq'::regclass);


--
-- Name: exam_approvals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals ALTER COLUMN id SET DEFAULT nextval('public.exam_approvals_id_seq'::regclass);


--
-- Name: exam_approvals_decision_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals_decision_lnk ALTER COLUMN id SET DEFAULT nextval('public.exam_approvals_decision_lnk_id_seq'::regclass);


--
-- Name: exam_grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades ALTER COLUMN id SET DEFAULT nextval('public.exam_grades_id_seq'::regclass);


--
-- Name: exam_grades_decision_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades_decision_lnk ALTER COLUMN id SET DEFAULT nextval('public.exam_grades_decision_lnk_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: nations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nations ALTER COLUMN id SET DEFAULT nextval('public.nations_id_seq'::regclass);


--
-- Name: print_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_templates ALTER COLUMN id SET DEFAULT nextval('public.print_templates_id_seq'::regclass);


--
-- Name: strapi_ai_localization_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_localization_jobs_id_seq'::regclass);


--
-- Name: strapi_ai_metadata_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_metadata_jobs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions ALTER COLUMN id SET DEFAULT nextval('public.strapi_sessions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: student_documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents ALTER COLUMN id SET DEFAULT nextval('public.student_documents_id_seq'::regclass);


--
-- Name: student_documents_student_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents_student_lnk ALTER COLUMN id SET DEFAULT nextval('public.student_documents_student_lnk_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: students_school_class_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_school_class_lnk ALTER COLUMN id SET DEFAULT nextval('public.students_school_class_lnk_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Name: teacher_subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_subjects ALTER COLUMN id SET DEFAULT nextval('public.teacher_subjects_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: teachers_subjects_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers_subjects_lnk ALTER COLUMN id SET DEFAULT nextval('public.teachers_subjects_lnk_id_seq'::regclass);


--
-- Name: training_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments ALTER COLUMN id SET DEFAULT nextval('public.training_assignments_id_seq'::regclass);


--
-- Name: training_assignments_decision_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments_decision_lnk ALTER COLUMN id SET DEFAULT nextval('public.training_assignments_decision_lnk_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	ul339tyrrx0brdpbpxj89llt	plugin::upload.read	{}	\N	{}	[]	2026-02-09 15:13:37.147	2026-02-09 15:13:37.147	2026-02-09 15:13:37.147	\N	\N	en
2	juzt4gjrcnebt62klf27qt7a	plugin::upload.configure-view	{}	\N	{}	[]	2026-02-09 15:13:37.157	2026-02-09 15:13:37.157	2026-02-09 15:13:37.157	\N	\N	en
3	bpkm1pr3limemy7dq7t66krv	plugin::upload.assets.create	{}	\N	{}	[]	2026-02-09 15:13:37.163	2026-02-09 15:13:37.163	2026-02-09 15:13:37.163	\N	\N	en
4	fwqrqkpq0iz9a3p8lmvj6vz8	plugin::upload.assets.update	{}	\N	{}	[]	2026-02-09 15:13:37.166	2026-02-09 15:13:37.166	2026-02-09 15:13:37.167	\N	\N	en
5	qrsv4w8rtrdzmnhost3z65av	plugin::upload.assets.download	{}	\N	{}	[]	2026-02-09 15:13:37.178	2026-02-09 15:13:37.178	2026-02-09 15:13:37.178	\N	\N	en
6	lqs4z89jdzm0oe9xeow14rmf	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-02-09 15:13:37.181	2026-02-09 15:13:37.181	2026-02-09 15:13:37.181	\N	\N	en
7	booyfw4r3rz9cna9gcrkdaa7	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2026-02-09 15:13:37.185	2026-02-09 15:13:37.185	2026-02-09 15:13:37.186	\N	\N	en
330	ux70d5yxkymq465w0qoktco3	plugin::content-manager.explorer.update	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 09:59:06.976	2026-02-26 09:59:06.976	2026-02-26 09:59:06.976	\N	\N	en
331	cl5tfer7jogs451h912oob4w	plugin::content-manager.explorer.delete	{}	api::print-template.print-template	{}	[]	2026-02-26 09:59:06.98	2026-02-26 09:59:06.98	2026-02-26 09:59:06.98	\N	\N	en
332	xhkqe54v3t644p4dqnkavyh9	plugin::content-manager.explorer.publish	{}	api::print-template.print-template	{}	[]	2026-02-26 09:59:06.983	2026-02-26 09:59:06.983	2026-02-26 09:59:06.983	\N	\N	en
333	zlsby8p28siklm75lv1g6pe7	plugin::content-manager.explorer.create	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-26 09:59:06.986	2026-02-26 09:59:06.986	2026-02-26 09:59:06.986	\N	\N	en
334	l94k1zbqamvvmti7acqd6abe	plugin::content-manager.explorer.read	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-26 09:59:06.99	2026-02-26 09:59:06.99	2026-02-26 09:59:06.99	\N	\N	en
335	zjeotd2255p4cikvpshq80fe	plugin::content-manager.explorer.update	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-26 09:59:06.994	2026-02-26 09:59:06.994	2026-02-26 09:59:06.995	\N	\N	en
54	al99fq1sfx4d7acb0a13y73n	admin::roles.read	{}	\N	{}	[]	2026-02-09 15:13:37.346	2026-02-09 15:13:37.346	2026-02-09 15:13:37.346	\N	\N	en
55	w69z67y6l50f4gnumvd5v2r1	admin::roles.update	{}	\N	{}	[]	2026-02-09 15:13:37.349	2026-02-09 15:13:37.349	2026-02-09 15:13:37.349	\N	\N	en
56	e9vvinp2ukbkyl89t7b4kyfh	admin::roles.delete	{}	\N	{}	[]	2026-02-09 15:13:37.352	2026-02-09 15:13:37.352	2026-02-09 15:13:37.352	\N	\N	en
57	ngm979m98lji1h15djiw5yq0	admin::api-tokens.access	{}	\N	{}	[]	2026-02-09 15:13:37.354	2026-02-09 15:13:37.354	2026-02-09 15:13:37.354	\N	\N	en
58	rbazmqzj27h5odwnu19iah2w	admin::api-tokens.create	{}	\N	{}	[]	2026-02-09 15:13:37.356	2026-02-09 15:13:37.356	2026-02-09 15:13:37.356	\N	\N	en
59	e7ttv2nyp20krmcg9dax3ibo	admin::api-tokens.read	{}	\N	{}	[]	2026-02-09 15:13:37.358	2026-02-09 15:13:37.358	2026-02-09 15:13:37.358	\N	\N	en
171	j0tdk4iycoiywkn2dxylrpdy	plugin::content-manager.explorer.update	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-15 20:40:37.491	2026-02-15 20:40:37.491	2026-02-15 20:40:37.491	\N	\N	en
173	cliu0xqrgn0lju6zcata82h5	plugin::content-manager.explorer.update	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-15 20:40:37.498	2026-02-15 20:40:37.498	2026-02-15 20:40:37.498	\N	\N	en
174	at85btn5vu1u2mxk6dr0ifcu	plugin::content-manager.explorer.update	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-15 20:40:37.503	2026-02-15 20:40:37.503	2026-02-15 20:40:37.503	\N	\N	en
210	vb4bjsyxo5ytzr3moahd6q0o	plugin::content-manager.explorer.publish	{}	api::school-class.school-class	{}	[]	2026-02-16 12:19:57.562	2026-02-16 12:19:57.562	2026-02-16 12:19:57.562	\N	\N	en
350	csrveqwmc9400le3agb22sds	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-26 09:59:24.679	2026-02-26 09:59:24.679	2026-02-26 09:59:24.679	\N	\N	en
351	xjtum61xh7alp0d0crsztasi	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-26 09:59:24.682	2026-02-26 09:59:24.682	2026-02-26 09:59:24.682	\N	\N	en
352	l5oprwd9oo16885dafc4zk2m	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2026-02-26 09:59:24.684	2026-02-26 09:59:24.684	2026-02-26 09:59:24.684	\N	\N	en
353	zfpp829n96hs06hutjseu0he	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2026-02-26 09:59:24.688	2026-02-26 09:59:24.688	2026-02-26 09:59:24.688	\N	\N	en
354	xpb0lxk77dbwxuf1q9mgmvfb	plugin::content-manager.explorer.create	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-26 09:59:24.691	2026-02-26 09:59:24.691	2026-02-26 09:59:24.691	\N	\N	en
355	vsbgkh46h9dk15skzmcu9sn4	plugin::content-manager.explorer.read	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-26 09:59:24.694	2026-02-26 09:59:24.694	2026-02-26 09:59:24.694	\N	\N	en
356	qwyl6cqc6bn13k5gzkytewby	plugin::content-manager.explorer.update	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-26 09:59:24.699	2026-02-26 09:59:24.699	2026-02-26 09:59:24.699	\N	\N	en
357	ki6zc5wilewy1ql5n6obn2be	plugin::content-manager.explorer.delete	{}	api::audit-log.audit-log	{}	[]	2026-02-26 09:59:24.702	2026-02-26 09:59:24.702	2026-02-26 09:59:24.702	\N	\N	en
358	bozjhcrvnuu1ez9wkidhnolx	plugin::content-manager.explorer.publish	{}	api::audit-log.audit-log	{}	[]	2026-02-26 09:59:24.705	2026-02-26 09:59:24.705	2026-02-26 09:59:24.705	\N	\N	en
359	h6nzo9un0jdvvs21r2fr9n4w	plugin::content-manager.explorer.create	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision"]}	[]	2026-02-26 09:59:24.707	2026-02-26 09:59:24.707	2026-02-26 09:59:24.707	\N	\N	en
360	obngcttryhwtm4fbf3oqxqww	plugin::content-manager.explorer.read	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision"]}	[]	2026-02-26 09:59:24.71	2026-02-26 09:59:24.71	2026-02-26 09:59:24.71	\N	\N	en
412	xl2nz29jtu6wzt5wyrv51e0r	plugin::content-manager.explorer.delete	{}	api::subject.subject	{}	[]	2026-02-26 09:59:24.856	2026-02-26 09:59:24.856	2026-02-26 09:59:24.856	\N	\N	en
245	e3po8ldmerdo2r84ha5zgbq1	plugin::content-manager.explorer.delete	{}	api::class-decision.class-decision	{}	[]	2026-02-17 13:44:20.642	2026-02-17 13:44:20.642	2026-02-17 13:44:20.643	\N	\N	en
246	da64zr28cwtjb2lz5656vew2	plugin::content-manager.explorer.publish	{}	api::class-decision.class-decision	{}	[]	2026-02-17 13:44:20.646	2026-02-17 13:44:20.646	2026-02-17 13:44:20.646	\N	\N	en
300	nddh88l0tcsik1t4kplq1xv4	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-26 09:59:06.837	2026-02-26 09:59:06.837	2026-02-26 09:59:06.837	\N	\N	en
301	x9hs095uu6f0boh8x26wd9ug	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-26 09:59:06.853	2026-02-26 09:59:06.853	2026-02-26 09:59:06.853	\N	\N	en
302	fdel3lhnchbwcpud9z8r4beg	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-26 09:59:06.856	2026-02-26 09:59:06.856	2026-02-26 09:59:06.856	\N	\N	en
303	da3aax2aetdtpa07w14iry2j	plugin::content-manager.explorer.create	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-26 09:59:06.858	2026-02-26 09:59:06.858	2026-02-26 09:59:06.859	\N	\N	en
304	fndypoqi8a0o5g0pr66rbcj9	plugin::content-manager.explorer.read	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-26 09:59:06.861	2026-02-26 09:59:06.861	2026-02-26 09:59:06.861	\N	\N	en
305	no0orim8lq6zr0338s99j122	plugin::content-manager.explorer.update	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-26 09:59:06.864	2026-02-26 09:59:06.864	2026-02-26 09:59:06.865	\N	\N	en
306	jf7xz6kpmvhr7f52722u0nc3	plugin::content-manager.explorer.delete	{}	api::audit-log.audit-log	{}	[]	2026-02-26 09:59:06.867	2026-02-26 09:59:06.867	2026-02-26 09:59:06.868	\N	\N	en
307	qz9i0023d0qzoft93wokvxft	plugin::content-manager.explorer.publish	{}	api::audit-log.audit-log	{}	[]	2026-02-26 09:59:06.873	2026-02-26 09:59:06.873	2026-02-26 09:59:06.873	\N	\N	en
308	m58x4vzz5pigvi9qeb8frrkb	plugin::content-manager.explorer.create	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision"]}	[]	2026-02-26 09:59:06.878	2026-02-26 09:59:06.878	2026-02-26 09:59:06.878	\N	\N	en
309	yv76x9p6qhapa2a62avlqonb	plugin::content-manager.explorer.read	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision"]}	[]	2026-02-26 09:59:06.882	2026-02-26 09:59:06.882	2026-02-26 09:59:06.882	\N	\N	en
310	g154o38qqyld9pktnl3tk4zl	plugin::content-manager.explorer.update	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision"]}	[]	2026-02-26 09:59:06.886	2026-02-26 09:59:06.886	2026-02-26 09:59:06.886	\N	\N	en
311	ppy0oo3sz5psnncas5q22il3	plugin::content-manager.explorer.delete	{}	api::class-decision.class-decision	{}	[]	2026-02-26 09:59:06.89	2026-02-26 09:59:06.89	2026-02-26 09:59:06.89	\N	\N	en
8	s0a8pgbtxwkjegzunbcmwcy8	plugin::upload.configure-view	{}	\N	{}	[]	2026-02-09 15:13:37.188	2026-02-09 15:13:37.188	2026-02-09 15:13:37.189	\N	\N	en
9	fj3mq4u890ljiw61gcfjatyb	plugin::upload.assets.create	{}	\N	{}	[]	2026-02-09 15:13:37.192	2026-02-09 15:13:37.192	2026-02-09 15:13:37.192	\N	\N	en
10	ks1y3eltwewaq6myg1cfxwqf	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2026-02-09 15:13:37.195	2026-02-09 15:13:37.195	2026-02-09 15:13:37.195	\N	\N	en
11	hhg1io9ef52zi62vtu43cjec	plugin::upload.assets.download	{}	\N	{}	[]	2026-02-09 15:13:37.2	2026-02-09 15:13:37.2	2026-02-09 15:13:37.2	\N	\N	en
12	jxakg38mrpmbq94o2ikyo9pl	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-02-09 15:13:37.203	2026-02-09 15:13:37.203	2026-02-09 15:13:37.203	\N	\N	en
16	k0wfwqm686q7zq2zkib2cwcf	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2026-02-09 15:13:37.237	2026-02-09 15:13:37.237	2026-02-09 15:13:37.237	\N	\N	en
17	z36xcix77oowuudzf05kwbx2	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2026-02-09 15:13:37.24	2026-02-09 15:13:37.24	2026-02-09 15:13:37.24	\N	\N	en
18	qylkcdtmyk5n7oqdgqg8hy5c	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2026-02-09 15:13:37.243	2026-02-09 15:13:37.243	2026-02-09 15:13:37.243	\N	\N	en
19	q2cllnezhhjtmqmxx21jjkiy	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2026-02-09 15:13:37.247	2026-02-09 15:13:37.247	2026-02-09 15:13:37.247	\N	\N	en
20	cih2syuc4bonqfo2ipwmgchm	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2026-02-09 15:13:37.25	2026-02-09 15:13:37.25	2026-02-09 15:13:37.25	\N	\N	en
21	pspayc9wvj9s4rzhcqa9m4tj	plugin::content-type-builder.read	{}	\N	{}	[]	2026-02-09 15:13:37.254	2026-02-09 15:13:37.254	2026-02-09 15:13:37.254	\N	\N	en
22	m4wnd2molz4zrxxreyoj5nok	plugin::email.settings.read	{}	\N	{}	[]	2026-02-09 15:13:37.256	2026-02-09 15:13:37.256	2026-02-09 15:13:37.256	\N	\N	en
23	b627e6k49t9ppshz85lhp8p2	plugin::upload.read	{}	\N	{}	[]	2026-02-09 15:13:37.259	2026-02-09 15:13:37.259	2026-02-09 15:13:37.259	\N	\N	en
24	xl4s3fi0w1s4xlbux70axdit	plugin::upload.assets.create	{}	\N	{}	[]	2026-02-09 15:13:37.262	2026-02-09 15:13:37.262	2026-02-09 15:13:37.262	\N	\N	en
25	ae5w6ua7dd4kud0nno5aqp8p	plugin::upload.assets.update	{}	\N	{}	[]	2026-02-09 15:13:37.265	2026-02-09 15:13:37.265	2026-02-09 15:13:37.265	\N	\N	en
26	quahq5o59uu0exfqfdtwxbr7	plugin::upload.assets.download	{}	\N	{}	[]	2026-02-09 15:13:37.268	2026-02-09 15:13:37.268	2026-02-09 15:13:37.268	\N	\N	en
27	scxmsbupycpb74sgb1yixy04	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-02-09 15:13:37.271	2026-02-09 15:13:37.271	2026-02-09 15:13:37.271	\N	\N	en
28	kiu8lyoio30hz2pib73pm95v	plugin::upload.configure-view	{}	\N	{}	[]	2026-02-09 15:13:37.273	2026-02-09 15:13:37.273	2026-02-09 15:13:37.273	\N	\N	en
29	zoerlwhh8r42hmd8gzrzw9p7	plugin::upload.settings.read	{}	\N	{}	[]	2026-02-09 15:13:37.276	2026-02-09 15:13:37.276	2026-02-09 15:13:37.276	\N	\N	en
30	uzzr1nj09uikip04ugipjoys	plugin::i18n.locale.create	{}	\N	{}	[]	2026-02-09 15:13:37.279	2026-02-09 15:13:37.279	2026-02-09 15:13:37.279	\N	\N	en
31	hxwpcplgyfk8woiqigsm4jjv	plugin::i18n.locale.read	{}	\N	{}	[]	2026-02-09 15:13:37.281	2026-02-09 15:13:37.281	2026-02-09 15:13:37.281	\N	\N	en
32	ucrzxrxvch4k55xjopbpni2v	plugin::i18n.locale.update	{}	\N	{}	[]	2026-02-09 15:13:37.283	2026-02-09 15:13:37.283	2026-02-09 15:13:37.283	\N	\N	en
33	bsbctqcau1x9kmtctcwx26gx	plugin::i18n.locale.delete	{}	\N	{}	[]	2026-02-09 15:13:37.286	2026-02-09 15:13:37.286	2026-02-09 15:13:37.286	\N	\N	en
34	wfi083ldv0vaa81pm0tj0d8y	plugin::users-permissions.roles.create	{}	\N	{}	[]	2026-02-09 15:13:37.288	2026-02-09 15:13:37.288	2026-02-09 15:13:37.288	\N	\N	en
289	hifdvpvxdslle08cfl1rxz6x	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-24 10:22:29.207	2026-02-24 10:22:29.207	2026-02-24 10:22:29.207	\N	\N	en
290	w2pggwz798cqh6msheivp7sv	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-24 10:22:29.214	2026-02-24 10:22:29.214	2026-02-24 10:22:29.214	\N	\N	en
295	wss3oeqj06vafvee9432wufr	plugin::content-manager.explorer.create	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 08:33:37.819	2026-02-26 08:33:37.819	2026-02-26 08:33:37.82	\N	\N	en
35	uje256pf1un93gotabz3rmim	plugin::users-permissions.roles.read	{}	\N	{}	[]	2026-02-09 15:13:37.293	2026-02-09 15:13:37.293	2026-02-09 15:13:37.293	\N	\N	en
36	yxph19doqy2zrw6rguxar50d	plugin::users-permissions.roles.update	{}	\N	{}	[]	2026-02-09 15:13:37.296	2026-02-09 15:13:37.296	2026-02-09 15:13:37.296	\N	\N	en
37	r6pw0gdlkvg6qy1zl7k6ng0l	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2026-02-09 15:13:37.298	2026-02-09 15:13:37.298	2026-02-09 15:13:37.298	\N	\N	en
38	dj1ctvf48h2ejp2xf7v4t767	plugin::users-permissions.providers.read	{}	\N	{}	[]	2026-02-09 15:13:37.301	2026-02-09 15:13:37.301	2026-02-09 15:13:37.301	\N	\N	en
39	h9ohr9e88xutl9mxyn0wd0xu	plugin::users-permissions.providers.update	{}	\N	{}	[]	2026-02-09 15:13:37.303	2026-02-09 15:13:37.303	2026-02-09 15:13:37.303	\N	\N	en
40	bj7m89yj6rwlh5mmkepau6iu	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2026-02-09 15:13:37.306	2026-02-09 15:13:37.306	2026-02-09 15:13:37.306	\N	\N	en
41	fvp5uvpzg0870x7h6pth3v5g	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2026-02-09 15:13:37.309	2026-02-09 15:13:37.309	2026-02-09 15:13:37.309	\N	\N	en
42	vc7gu5ftwjcn0mm51erwx601	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2026-02-09 15:13:37.312	2026-02-09 15:13:37.312	2026-02-09 15:13:37.312	\N	\N	en
43	nba7d3brh351s4di3cqejsh9	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2026-02-09 15:13:37.315	2026-02-09 15:13:37.315	2026-02-09 15:13:37.315	\N	\N	en
44	pdav50ny0tun4eul2kr0losm	admin::marketplace.read	{}	\N	{}	[]	2026-02-09 15:13:37.318	2026-02-09 15:13:37.318	2026-02-09 15:13:37.318	\N	\N	en
45	eqb28x8e4ki8udvzpjwjjnlt	admin::webhooks.create	{}	\N	{}	[]	2026-02-09 15:13:37.32	2026-02-09 15:13:37.32	2026-02-09 15:13:37.321	\N	\N	en
46	ng9atmqutlnxbkuovcdzktxe	admin::webhooks.read	{}	\N	{}	[]	2026-02-09 15:13:37.323	2026-02-09 15:13:37.323	2026-02-09 15:13:37.323	\N	\N	en
47	wtbjj13tj2epifebn2t1tbiv	admin::webhooks.update	{}	\N	{}	[]	2026-02-09 15:13:37.327	2026-02-09 15:13:37.327	2026-02-09 15:13:37.327	\N	\N	en
48	eltk48kgazwj2hpjfj8ererx	admin::webhooks.delete	{}	\N	{}	[]	2026-02-09 15:13:37.331	2026-02-09 15:13:37.331	2026-02-09 15:13:37.331	\N	\N	en
49	s3l4syyjzjpgxehwwm7qmoe6	admin::users.create	{}	\N	{}	[]	2026-02-09 15:13:37.334	2026-02-09 15:13:37.334	2026-02-09 15:13:37.334	\N	\N	en
50	e4ah0hw8mh34df9d38v81pzw	admin::users.read	{}	\N	{}	[]	2026-02-09 15:13:37.337	2026-02-09 15:13:37.337	2026-02-09 15:13:37.337	\N	\N	en
51	c2w9oagz7ntpvhf9x6ar5y74	admin::users.update	{}	\N	{}	[]	2026-02-09 15:13:37.34	2026-02-09 15:13:37.34	2026-02-09 15:13:37.34	\N	\N	en
52	tp2lx2miotrat8jmxvi1o33r	admin::users.delete	{}	\N	{}	[]	2026-02-09 15:13:37.342	2026-02-09 15:13:37.342	2026-02-09 15:13:37.342	\N	\N	en
53	y2ait0bkoegh7suszc4wavoc	admin::roles.create	{}	\N	{}	[]	2026-02-09 15:13:37.344	2026-02-09 15:13:37.344	2026-02-09 15:13:37.344	\N	\N	en
60	kbm32aqn2x5figqthurikpbe	admin::api-tokens.update	{}	\N	{}	[]	2026-02-09 15:13:37.36	2026-02-09 15:13:37.36	2026-02-09 15:13:37.361	\N	\N	en
61	wzmpz4yyw56j80lvpllgzmei	admin::api-tokens.regenerate	{}	\N	{}	[]	2026-02-09 15:13:37.363	2026-02-09 15:13:37.363	2026-02-09 15:13:37.363	\N	\N	en
62	qdjzukjvdf8y9cjecpi9wrnl	admin::api-tokens.delete	{}	\N	{}	[]	2026-02-09 15:13:37.366	2026-02-09 15:13:37.366	2026-02-09 15:13:37.366	\N	\N	en
63	jj298kq7vyjwdmqctrjjx583	admin::project-settings.update	{}	\N	{}	[]	2026-02-09 15:13:37.368	2026-02-09 15:13:37.368	2026-02-09 15:13:37.368	\N	\N	en
64	g71uadv3x41aj24qtczh1j35	admin::project-settings.read	{}	\N	{}	[]	2026-02-09 15:13:37.372	2026-02-09 15:13:37.372	2026-02-09 15:13:37.372	\N	\N	en
65	rhfr016gc48vyaaq2dvf7xlx	admin::transfer.tokens.access	{}	\N	{}	[]	2026-02-09 15:13:37.375	2026-02-09 15:13:37.375	2026-02-09 15:13:37.375	\N	\N	en
66	p07mkdv1ica74kn412ot5s6y	admin::transfer.tokens.create	{}	\N	{}	[]	2026-02-09 15:13:37.378	2026-02-09 15:13:37.378	2026-02-09 15:13:37.379	\N	\N	en
67	m0gwuyosaldgt3vevmcyua0a	admin::transfer.tokens.read	{}	\N	{}	[]	2026-02-09 15:13:37.382	2026-02-09 15:13:37.382	2026-02-09 15:13:37.382	\N	\N	en
68	k1ueavi72hqlnlk6i694nfr4	admin::transfer.tokens.update	{}	\N	{}	[]	2026-02-09 15:13:37.385	2026-02-09 15:13:37.385	2026-02-09 15:13:37.385	\N	\N	en
69	ngtc05occdeeaink4galuayg	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2026-02-09 15:13:37.388	2026-02-09 15:13:37.388	2026-02-09 15:13:37.388	\N	\N	en
70	cwqbpuz06yhba04b4dg0o57j	admin::transfer.tokens.delete	{}	\N	{}	[]	2026-02-09 15:13:37.391	2026-02-09 15:13:37.391	2026-02-09 15:13:37.391	\N	\N	en
151	q0yttmtzewltzgxvaanz3gqr	plugin::content-manager.explorer.create	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-15 20:40:37.393	2026-02-15 20:40:37.393	2026-02-15 20:40:37.394	\N	\N	en
152	m279x9rho8szabqqrtk3iis9	plugin::content-manager.explorer.create	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-15 20:40:37.426	2026-02-15 20:40:37.426	2026-02-15 20:40:37.426	\N	\N	en
153	jgq9xv785rcaktau3rct6zg2	plugin::content-manager.explorer.create	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-15 20:40:37.429	2026-02-15 20:40:37.429	2026-02-15 20:40:37.43	\N	\N	en
155	jt2k6y42kehiua4kdbo52c0b	plugin::content-manager.explorer.create	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-15 20:40:37.437	2026-02-15 20:40:37.437	2026-02-15 20:40:37.437	\N	\N	en
157	mar0yjxlwri2pnuijfgs3pgh	plugin::content-manager.explorer.create	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-15 20:40:37.444	2026-02-15 20:40:37.444	2026-02-15 20:40:37.444	\N	\N	en
158	xuzhbg0gg4vjrpwnuvxy04wl	plugin::content-manager.explorer.create	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-15 20:40:37.448	2026-02-15 20:40:37.448	2026-02-15 20:40:37.448	\N	\N	en
159	zt0du9b4qt90mxa35nz1fmc1	plugin::content-manager.explorer.read	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-15 20:40:37.452	2026-02-15 20:40:37.452	2026-02-15 20:40:37.452	\N	\N	en
160	fx2ypslonp2u7emnbtaxnddc	plugin::content-manager.explorer.read	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-15 20:40:37.455	2026-02-15 20:40:37.455	2026-02-15 20:40:37.455	\N	\N	en
161	v8d08ohsdfu2uc3k7ozwi0eq	plugin::content-manager.explorer.read	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-15 20:40:37.458	2026-02-15 20:40:37.458	2026-02-15 20:40:37.458	\N	\N	en
163	pql69rrqprq3vxnhh8df85x2	plugin::content-manager.explorer.read	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-15 20:40:37.464	2026-02-15 20:40:37.464	2026-02-15 20:40:37.464	\N	\N	en
165	c908m7k000qrjx7t02eoqr3h	plugin::content-manager.explorer.read	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-15 20:40:37.469	2026-02-15 20:40:37.469	2026-02-15 20:40:37.47	\N	\N	en
166	okv5nyfungatnl5wn6eymdjc	plugin::content-manager.explorer.read	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-15 20:40:37.472	2026-02-15 20:40:37.472	2026-02-15 20:40:37.472	\N	\N	en
167	uniljhrf1vy7eyshes6bk21t	plugin::content-manager.explorer.update	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-15 20:40:37.475	2026-02-15 20:40:37.475	2026-02-15 20:40:37.475	\N	\N	en
168	st5ndgntthmb437rf2ag4bxc	plugin::content-manager.explorer.update	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-15 20:40:37.477	2026-02-15 20:40:37.477	2026-02-15 20:40:37.477	\N	\N	en
169	p4o6cuwp9pne4tzf6chnmyw4	plugin::content-manager.explorer.update	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-15 20:40:37.481	2026-02-15 20:40:37.481	2026-02-15 20:40:37.482	\N	\N	en
209	yjt1jw4p8m6757rgca4munq9	plugin::content-manager.explorer.delete	{}	api::school-class.school-class	{}	[]	2026-02-16 12:19:57.559	2026-02-16 12:19:57.559	2026-02-16 12:19:57.559	\N	\N	en
175	lwhy2c7rfwx1gtl3oj69m2sg	plugin::content-manager.explorer.delete	{}	api::classroom.classroom	{}	[]	2026-02-15 20:40:37.51	2026-02-15 20:40:37.51	2026-02-15 20:40:37.511	\N	\N	en
176	c10vcjk84jfj3pa7894n38gn	plugin::content-manager.explorer.delete	{}	api::nation.nation	{}	[]	2026-02-15 20:40:37.515	2026-02-15 20:40:37.515	2026-02-15 20:40:37.515	\N	\N	en
177	bjxy5ibivagsm5zf1zpx14cd	plugin::content-manager.explorer.delete	{}	api::school-class.school-class	{}	[]	2026-02-15 20:40:37.52	2026-02-15 20:40:37.52	2026-02-15 20:40:37.52	\N	\N	en
178	fth3q266nz8g1k7pnwku32df	plugin::content-manager.explorer.delete	{}	api::student.student	{}	[]	2026-02-15 20:40:37.524	2026-02-15 20:40:37.524	2026-02-15 20:40:37.524	\N	\N	en
179	sp284xj38lmj16c4sfm4a6c4	plugin::content-manager.explorer.delete	{}	api::student-document.student-document	{}	[]	2026-02-15 20:40:37.528	2026-02-15 20:40:37.528	2026-02-15 20:40:37.528	\N	\N	en
180	txjxmbljbawva38g0lac0kcu	plugin::content-manager.explorer.delete	{}	api::subject.subject	{}	[]	2026-02-15 20:40:37.531	2026-02-15 20:40:37.531	2026-02-15 20:40:37.531	\N	\N	en
181	vab8cinodaq2015jb9uc6voe	plugin::content-manager.explorer.delete	{}	api::supplier.supplier	{}	[]	2026-02-15 20:40:37.534	2026-02-15 20:40:37.534	2026-02-15 20:40:37.535	\N	\N	en
182	plmqe04v3wqy5y5eibxe7c32	plugin::content-manager.explorer.delete	{}	api::teacher.teacher	{}	[]	2026-02-15 20:40:37.541	2026-02-15 20:40:37.541	2026-02-15 20:40:37.541	\N	\N	en
183	pk5arp1mrurj4laj0218qb6i	plugin::content-manager.explorer.publish	{}	api::classroom.classroom	{}	[]	2026-02-15 20:40:37.544	2026-02-15 20:40:37.544	2026-02-15 20:40:37.544	\N	\N	en
184	mdm0p8ccldw9id9y8hg49f6k	plugin::content-manager.explorer.publish	{}	api::nation.nation	{}	[]	2026-02-15 20:40:37.548	2026-02-15 20:40:37.548	2026-02-15 20:40:37.548	\N	\N	en
185	col2p10tvejqflr9s3cnmoj0	plugin::content-manager.explorer.publish	{}	api::school-class.school-class	{}	[]	2026-02-15 20:40:37.551	2026-02-15 20:40:37.551	2026-02-15 20:40:37.552	\N	\N	en
186	tlhin99dltuwdwc7tt71tj8a	plugin::content-manager.explorer.publish	{}	api::student.student	{}	[]	2026-02-15 20:40:37.557	2026-02-15 20:40:37.557	2026-02-15 20:40:37.557	\N	\N	en
187	mzjzrt0848bh2rigqaa2z4gh	plugin::content-manager.explorer.publish	{}	api::student-document.student-document	{}	[]	2026-02-15 20:40:37.56	2026-02-15 20:40:37.56	2026-02-15 20:40:37.56	\N	\N	en
188	n2ygrketbsfjcp93cfotqyfc	plugin::content-manager.explorer.publish	{}	api::subject.subject	{}	[]	2026-02-15 20:40:37.563	2026-02-15 20:40:37.563	2026-02-15 20:40:37.563	\N	\N	en
189	o2mo2jw7q5cxklz0xpuc5ix7	plugin::content-manager.explorer.publish	{}	api::supplier.supplier	{}	[]	2026-02-15 20:40:37.566	2026-02-15 20:40:37.566	2026-02-15 20:40:37.566	\N	\N	en
190	yvj48lj61l3mtg5ugal23dp6	plugin::content-manager.explorer.publish	{}	api::teacher.teacher	{}	[]	2026-02-15 20:40:37.568	2026-02-15 20:40:37.568	2026-02-15 20:40:37.568	\N	\N	en
194	xhw2crlj1wpxg07qen9uqng8	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2026-02-16 12:19:57.467	2026-02-16 12:19:57.467	2026-02-16 12:19:57.468	\N	\N	en
195	qu3fws8c4duiqnp7g98zesi4	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2026-02-16 12:19:57.472	2026-02-16 12:19:57.472	2026-02-16 12:19:57.472	\N	\N	en
196	bzm0nsmt7lu4uh8p6wyw0nym	plugin::content-manager.explorer.create	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-16 12:19:57.476	2026-02-16 12:19:57.476	2026-02-16 12:19:57.476	\N	\N	en
197	v1zglx9x8r3j0vmlfb6ghx6e	plugin::content-manager.explorer.read	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-16 12:19:57.479	2026-02-16 12:19:57.479	2026-02-16 12:19:57.48	\N	\N	en
198	cz39e79wjq1ccvd3wfrsjksp	plugin::content-manager.explorer.update	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-16 12:19:57.489	2026-02-16 12:19:57.489	2026-02-16 12:19:57.491	\N	\N	en
199	gvwljmncupwduic2s7fe64ob	plugin::content-manager.explorer.delete	{}	api::classroom.classroom	{}	[]	2026-02-16 12:19:57.508	2026-02-16 12:19:57.508	2026-02-16 12:19:57.508	\N	\N	en
200	sxgn6m1o44a3q8wagrayj8jg	plugin::content-manager.explorer.publish	{}	api::classroom.classroom	{}	[]	2026-02-16 12:19:57.516	2026-02-16 12:19:57.516	2026-02-16 12:19:57.517	\N	\N	en
201	hjop4l5bszaznrsaickze9xp	plugin::content-manager.explorer.create	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-16 12:19:57.521	2026-02-16 12:19:57.521	2026-02-16 12:19:57.521	\N	\N	en
202	e5eljii9o22m3yel9jnbichq	plugin::content-manager.explorer.read	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-16 12:19:57.525	2026-02-16 12:19:57.525	2026-02-16 12:19:57.526	\N	\N	en
203	xmquaw84bklznig0y6jv1dp5	plugin::content-manager.explorer.update	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-16 12:19:57.53	2026-02-16 12:19:57.53	2026-02-16 12:19:57.53	\N	\N	en
204	b1bh8nh0909q10p39q59qebw	plugin::content-manager.explorer.delete	{}	api::nation.nation	{}	[]	2026-02-16 12:19:57.535	2026-02-16 12:19:57.535	2026-02-16 12:19:57.535	\N	\N	en
205	ttqchcfv0e30hzyole7dj9e0	plugin::content-manager.explorer.publish	{}	api::nation.nation	{}	[]	2026-02-16 12:19:57.54	2026-02-16 12:19:57.54	2026-02-16 12:19:57.541	\N	\N	en
206	ik56taru9xtqfn4c0gn1cu5e	plugin::content-manager.explorer.create	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-16 12:19:57.545	2026-02-16 12:19:57.545	2026-02-16 12:19:57.545	\N	\N	en
207	s5v372ox31894jte2ivkf9el	plugin::content-manager.explorer.read	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-16 12:19:57.549	2026-02-16 12:19:57.549	2026-02-16 12:19:57.55	\N	\N	en
208	na7t4n2nq1ywy8e2gmal8974	plugin::content-manager.explorer.update	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-16 12:19:57.555	2026-02-16 12:19:57.555	2026-02-16 12:19:57.556	\N	\N	en
214	vq0ubeatl4h2wkk9r6paxj07	plugin::content-manager.explorer.delete	{}	api::student.student	{}	[]	2026-02-16 12:19:57.581	2026-02-16 12:19:57.581	2026-02-16 12:19:57.581	\N	\N	en
215	vfndff5mb8ybf05e9bkotnd1	plugin::content-manager.explorer.publish	{}	api::student.student	{}	[]	2026-02-16 12:19:57.584	2026-02-16 12:19:57.584	2026-02-16 12:19:57.584	\N	\N	en
216	mbvz3ajtq30kmiaogg1hq1b0	plugin::content-manager.explorer.create	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-16 12:19:57.587	2026-02-16 12:19:57.587	2026-02-16 12:19:57.587	\N	\N	en
217	biiwjt0avghfn2s0m1xpxpql	plugin::content-manager.explorer.read	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-16 12:19:57.589	2026-02-16 12:19:57.589	2026-02-16 12:19:57.589	\N	\N	en
218	ext3frgye9c1xtxz1mad4vef	plugin::content-manager.explorer.update	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-16 12:19:57.592	2026-02-16 12:19:57.592	2026-02-16 12:19:57.592	\N	\N	en
219	imfn416fq9s4ntz4z83oic3c	plugin::content-manager.explorer.delete	{}	api::student-document.student-document	{}	[]	2026-02-16 12:19:57.595	2026-02-16 12:19:57.595	2026-02-16 12:19:57.595	\N	\N	en
220	najdbup3x3syyrfpj5ebo98s	plugin::content-manager.explorer.publish	{}	api::student-document.student-document	{}	[]	2026-02-16 12:19:57.599	2026-02-16 12:19:57.599	2026-02-16 12:19:57.599	\N	\N	en
224	cjazn63bi9oigol09id8qcdu	plugin::content-manager.explorer.delete	{}	api::subject.subject	{}	[]	2026-02-16 12:19:57.612	2026-02-16 12:19:57.612	2026-02-16 12:19:57.612	\N	\N	en
225	gciq3jetuj87v6mg6slkgu1z	plugin::content-manager.explorer.publish	{}	api::subject.subject	{}	[]	2026-02-16 12:19:57.615	2026-02-16 12:19:57.615	2026-02-16 12:19:57.615	\N	\N	en
226	xerfwy1bq6uph6rrx88ed8fw	plugin::content-manager.explorer.create	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-16 12:19:57.618	2026-02-16 12:19:57.618	2026-02-16 12:19:57.618	\N	\N	en
227	t4wmt9shhq21vqkzvd6s0iqm	plugin::content-manager.explorer.read	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-16 12:19:57.621	2026-02-16 12:19:57.621	2026-02-16 12:19:57.621	\N	\N	en
228	pmazka4gvr5mr26o9qq970cf	plugin::content-manager.explorer.update	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-16 12:19:57.624	2026-02-16 12:19:57.624	2026-02-16 12:19:57.624	\N	\N	en
229	jhwug2nt2q9vkqvorxe12z7a	plugin::content-manager.explorer.delete	{}	api::supplier.supplier	{}	[]	2026-02-16 12:19:57.627	2026-02-16 12:19:57.627	2026-02-16 12:19:57.627	\N	\N	en
230	hv333a88z8dkzgtkm4ex98pl	plugin::content-manager.explorer.publish	{}	api::supplier.supplier	{}	[]	2026-02-16 12:19:57.63	2026-02-16 12:19:57.63	2026-02-16 12:19:57.63	\N	\N	en
231	pircpnrg16bfhwyc1blcnkxn	plugin::content-manager.explorer.create	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-16 12:19:57.633	2026-02-16 12:19:57.633	2026-02-16 12:19:57.633	\N	\N	en
232	qkjjiohaqschn69noxrgilr6	plugin::content-manager.explorer.read	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-16 12:19:57.638	2026-02-16 12:19:57.638	2026-02-16 12:19:57.638	\N	\N	en
233	wrfeutrqjcts7cjc5msn8j7h	plugin::content-manager.explorer.update	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-16 12:19:57.642	2026-02-16 12:19:57.642	2026-02-16 12:19:57.642	\N	\N	en
234	urdf17t85i9j0320zqylhicb	plugin::content-manager.explorer.delete	{}	api::teacher.teacher	{}	[]	2026-02-16 12:19:57.645	2026-02-16 12:19:57.645	2026-02-16 12:19:57.645	\N	\N	en
235	l5wgl1a2h5jf08b8c3cancnj	plugin::content-manager.explorer.publish	{}	api::teacher.teacher	{}	[]	2026-02-16 12:19:57.648	2026-02-16 12:19:57.648	2026-02-16 12:19:57.649	\N	\N	en
239	hbiucn4e882l8fmqcstz0kvj	plugin::content-manager.explorer.create	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-17 08:36:48.66	2026-02-17 08:36:48.66	2026-02-17 08:36:48.66	\N	\N	en
240	pyiiy18l8s9d9237kqpuplak	plugin::content-manager.explorer.read	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-17 08:36:48.667	2026-02-17 08:36:48.667	2026-02-17 08:36:48.667	\N	\N	en
241	vdnk0k2uflmfvvxie4f2szc6	plugin::content-manager.explorer.update	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-17 08:36:48.671	2026-02-17 08:36:48.671	2026-02-17 08:36:48.671	\N	\N	en
247	w7p79di92o21yfb6lnfuijp2	plugin::content-manager.explorer.create	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-17 14:35:18.286	2026-02-17 14:35:18.286	2026-02-17 14:35:18.287	\N	\N	en
248	ex0i47hjddlmwtlqm7y3ly86	plugin::content-manager.explorer.read	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-17 14:35:18.315	2026-02-17 14:35:18.315	2026-02-17 14:35:18.315	\N	\N	en
249	jzk6yzeef5z2jx8dtf5nuy3u	plugin::content-manager.explorer.update	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-17 14:35:18.319	2026-02-17 14:35:18.319	2026-02-17 14:35:18.32	\N	\N	en
250	j35rjvb0si0pqc8wri28meoh	plugin::content-manager.explorer.delete	{}	api::training-assignment.training-assignment	{}	[]	2026-02-17 14:35:18.324	2026-02-17 14:35:18.324	2026-02-17 14:35:18.325	\N	\N	en
251	k5p3w27jqcmmxzu85evr7x9b	plugin::content-manager.explorer.publish	{}	api::training-assignment.training-assignment	{}	[]	2026-02-17 14:35:18.329	2026-02-17 14:35:18.329	2026-02-17 14:35:18.329	\N	\N	en
252	jieo8ee8ywubx5q95jd9fjc5	plugin::content-manager.explorer.create	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-17 15:12:10.978	2026-02-17 15:12:10.978	2026-02-17 15:12:10.979	\N	\N	en
253	tn8tb5ifl54szr0592bnns2d	plugin::content-manager.explorer.read	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-17 15:12:10.987	2026-02-17 15:12:10.987	2026-02-17 15:12:10.987	\N	\N	en
254	uwzh8mvrm2q5zi6z0rtwqlu8	plugin::content-manager.explorer.update	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-17 15:12:10.993	2026-02-17 15:12:10.993	2026-02-17 15:12:10.993	\N	\N	en
255	bvdi8b98o85qvy9d34vfzucf	plugin::content-manager.explorer.delete	{}	api::exam-approval.exam-approval	{}	[]	2026-02-17 15:12:10.998	2026-02-17 15:12:10.998	2026-02-17 15:12:10.998	\N	\N	en
256	x26ppg39073cisocz5879xjg	plugin::content-manager.explorer.publish	{}	api::exam-approval.exam-approval	{}	[]	2026-02-17 15:12:11.002	2026-02-17 15:12:11.002	2026-02-17 15:12:11.002	\N	\N	en
257	lbp5uozjkix4aqxqckgrjdxm	plugin::content-manager.explorer.create	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-17 15:16:18.432	2026-02-17 15:16:18.432	2026-02-17 15:16:18.432	\N	\N	en
258	m16pnurmgxmhcf5pds0pzkop	plugin::content-manager.explorer.read	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-17 15:16:18.449	2026-02-17 15:16:18.449	2026-02-17 15:16:18.45	\N	\N	en
259	qg24g60t0nh0a8g6pqlnwkuf	plugin::content-manager.explorer.update	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-17 15:16:18.453	2026-02-17 15:16:18.453	2026-02-17 15:16:18.454	\N	\N	en
260	pltq1fx1agblya5nfhek7697	plugin::content-manager.explorer.delete	{}	api::exam-grade.exam-grade	{}	[]	2026-02-17 15:16:18.458	2026-02-17 15:16:18.458	2026-02-17 15:16:18.458	\N	\N	en
261	k72ec5c8m2ad0e8m9490au50	plugin::content-manager.explorer.publish	{}	api::exam-grade.exam-grade	{}	[]	2026-02-17 15:16:18.461	2026-02-17 15:16:18.461	2026-02-17 15:16:18.462	\N	\N	en
268	zlb24wa7qi74dyg57ijet80t	plugin::content-manager.explorer.create	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-19 15:08:12.778	2026-02-19 15:08:12.778	2026-02-19 15:08:12.779	\N	\N	en
269	h6kycq1hnxj926yn1gz8alrm	plugin::content-manager.explorer.read	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-19 15:08:12.803	2026-02-19 15:08:12.803	2026-02-19 15:08:12.803	\N	\N	en
270	keuqfph7c0vray41vwg5fjq2	plugin::content-manager.explorer.update	{}	api::audit-log.audit-log	{"fields": ["action", "actor", "details", "entity_id"]}	[]	2026-02-19 15:08:12.807	2026-02-19 15:08:12.807	2026-02-19 15:08:12.807	\N	\N	en
271	kmmn00hsb9bq0fzg26valkcx	plugin::content-manager.explorer.delete	{}	api::audit-log.audit-log	{}	[]	2026-02-19 15:08:12.811	2026-02-19 15:08:12.811	2026-02-19 15:08:12.811	\N	\N	en
272	wew2f03mlbikjnixmxya4rzk	plugin::content-manager.explorer.publish	{}	api::audit-log.audit-log	{}	[]	2026-02-19 15:08:12.814	2026-02-19 15:08:12.814	2026-02-19 15:08:12.814	\N	\N	en
291	qzttowl7xaiyhxkg6vm7ubs8	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-24 10:22:29.218	2026-02-24 10:22:29.218	2026-02-24 10:22:29.218	\N	\N	en
292	vmc470rtp7adbrfo5llnkb5j	plugin::content-manager.explorer.create	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-25 09:36:21.89	2026-02-25 09:36:21.89	2026-02-25 09:36:21.89	\N	\N	en
293	sc5czmzo00ejzq7k9kczc4pv	plugin::content-manager.explorer.read	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-25 09:36:21.915	2026-02-25 09:36:21.915	2026-02-25 09:36:21.915	\N	\N	en
294	f14ymb7ahied4gkk60cbq4g1	plugin::content-manager.explorer.update	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-25 09:36:21.919	2026-02-25 09:36:21.919	2026-02-25 09:36:21.919	\N	\N	en
296	bf00noxyvue0imsxaowa1oxc	plugin::content-manager.explorer.read	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 08:33:37.845	2026-02-26 08:33:37.845	2026-02-26 08:33:37.846	\N	\N	en
297	q33svrvy8x1bujtc3x3b5h2a	plugin::content-manager.explorer.update	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 08:33:37.849	2026-02-26 08:33:37.849	2026-02-26 08:33:37.849	\N	\N	en
298	z9b3etd7pnax6gaa1meoyhz1	plugin::content-manager.explorer.delete	{}	api::print-template.print-template	{}	[]	2026-02-26 08:33:37.852	2026-02-26 08:33:37.852	2026-02-26 08:33:37.852	\N	\N	en
299	gwq24ceponriajo9d6udfjmy	plugin::content-manager.explorer.publish	{}	api::print-template.print-template	{}	[]	2026-02-26 08:33:37.856	2026-02-26 08:33:37.856	2026-02-26 08:33:37.856	\N	\N	en
312	ohdpn1uwzv51ar49y4jmqwgk	plugin::content-manager.explorer.publish	{}	api::class-decision.class-decision	{}	[]	2026-02-26 09:59:06.894	2026-02-26 09:59:06.894	2026-02-26 09:59:06.894	\N	\N	en
318	z95a19edmlv2q97hd7vui6y7	plugin::content-manager.explorer.create	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-26 09:59:06.944	2026-02-26 09:59:06.944	2026-02-26 09:59:06.944	\N	\N	en
319	wja3st7561yvuqvf1cmhosdh	plugin::content-manager.explorer.read	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-26 09:59:06.946	2026-02-26 09:59:06.946	2026-02-26 09:59:06.946	\N	\N	en
320	ojm1g9m1847puqwnct5kkc6v	plugin::content-manager.explorer.update	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-26 09:59:06.949	2026-02-26 09:59:06.949	2026-02-26 09:59:06.949	\N	\N	en
321	a53skkevyfelq7egs8u4pywx	plugin::content-manager.explorer.delete	{}	api::exam-approval.exam-approval	{}	[]	2026-02-26 09:59:06.952	2026-02-26 09:59:06.952	2026-02-26 09:59:06.952	\N	\N	en
322	nggzcpunl107icuemvdk96pd	plugin::content-manager.explorer.publish	{}	api::exam-approval.exam-approval	{}	[]	2026-02-26 09:59:06.955	2026-02-26 09:59:06.955	2026-02-26 09:59:06.955	\N	\N	en
323	eclqkd243ibty9nqzh1sedrk	plugin::content-manager.explorer.create	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-26 09:59:06.957	2026-02-26 09:59:06.957	2026-02-26 09:59:06.957	\N	\N	en
324	jr83n0ag2xt9u96n66pap7o9	plugin::content-manager.explorer.read	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-26 09:59:06.96	2026-02-26 09:59:06.96	2026-02-26 09:59:06.96	\N	\N	en
325	w806b4renpx7bg0cy0nq5ubx	plugin::content-manager.explorer.update	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-26 09:59:06.962	2026-02-26 09:59:06.962	2026-02-26 09:59:06.963	\N	\N	en
326	d05vqmu8gdogsfjhxc2rn4rx	plugin::content-manager.explorer.delete	{}	api::exam-grade.exam-grade	{}	[]	2026-02-26 09:59:06.965	2026-02-26 09:59:06.965	2026-02-26 09:59:06.965	\N	\N	en
327	u3dwyzl6ui6fg5yhzwcbsekd	plugin::content-manager.explorer.publish	{}	api::exam-grade.exam-grade	{}	[]	2026-02-26 09:59:06.968	2026-02-26 09:59:06.968	2026-02-26 09:59:06.968	\N	\N	en
328	k2m9nl1je6ff8jt0ajnev2r1	plugin::content-manager.explorer.create	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 09:59:06.97	2026-02-26 09:59:06.97	2026-02-26 09:59:06.97	\N	\N	en
329	qhhqvmjxsv0ukjf29wtdkjyx	plugin::content-manager.explorer.read	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 09:59:06.973	2026-02-26 09:59:06.973	2026-02-26 09:59:06.973	\N	\N	en
336	wulscvqz4fiicf6oh6tla803	plugin::content-manager.explorer.create	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-26 09:59:06.998	2026-02-26 09:59:06.998	2026-02-26 09:59:06.998	\N	\N	en
337	q5cwa2vrqvgbjvnndgihiqew	plugin::content-manager.explorer.read	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-26 09:59:07	2026-02-26 09:59:07	2026-02-26 09:59:07	\N	\N	en
338	pru2228w4wp95xq7wiwxqtdu	plugin::content-manager.explorer.update	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-26 09:59:07.003	2026-02-26 09:59:07.003	2026-02-26 09:59:07.003	\N	\N	en
344	xw59qnr2g11jbfs4nbd6xszi	plugin::content-manager.explorer.create	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-26 09:59:07.021	2026-02-26 09:59:07.021	2026-02-26 09:59:07.021	\N	\N	en
345	j66o9lm5hzb8zcwkanxyt1ze	plugin::content-manager.explorer.read	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-26 09:59:07.025	2026-02-26 09:59:07.025	2026-02-26 09:59:07.025	\N	\N	en
346	gy1sxe18ao903op0q1tfwurs	plugin::content-manager.explorer.update	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-26 09:59:07.027	2026-02-26 09:59:07.027	2026-02-26 09:59:07.028	\N	\N	en
347	ubfr0iyrledx9zqw6m7j0d12	plugin::content-manager.explorer.delete	{}	api::training-assignment.training-assignment	{}	[]	2026-02-26 09:59:07.03	2026-02-26 09:59:07.03	2026-02-26 09:59:07.03	\N	\N	en
348	b5jg8fl05vn0gr3azi74mbtw	plugin::content-manager.explorer.publish	{}	api::training-assignment.training-assignment	{}	[]	2026-02-26 09:59:07.033	2026-02-26 09:59:07.033	2026-02-26 09:59:07.033	\N	\N	en
349	gu8sa8i47yo6k3ozvp2at98n	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "permissions"]}	[]	2026-02-26 09:59:24.674	2026-02-26 09:59:24.674	2026-02-26 09:59:24.674	\N	\N	en
361	jyadp3v0qac0giyqrgq0of1c	plugin::content-manager.explorer.update	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision"]}	[]	2026-02-26 09:59:24.713	2026-02-26 09:59:24.713	2026-02-26 09:59:24.713	\N	\N	en
362	lzir87zzfv4jhu0wm4wxik4s	plugin::content-manager.explorer.delete	{}	api::class-decision.class-decision	{}	[]	2026-02-26 09:59:24.716	2026-02-26 09:59:24.716	2026-02-26 09:59:24.716	\N	\N	en
363	i2lus5i3xo56b9xssldpgvl8	plugin::content-manager.explorer.publish	{}	api::class-decision.class-decision	{}	[]	2026-02-26 09:59:24.718	2026-02-26 09:59:24.718	2026-02-26 09:59:24.718	\N	\N	en
369	odujuurfvcc3pqiw7i546q46	plugin::content-manager.explorer.create	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-26 09:59:24.735	2026-02-26 09:59:24.735	2026-02-26 09:59:24.735	\N	\N	en
370	o73ty5qcwsrexdhtxlff76j2	plugin::content-manager.explorer.read	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-26 09:59:24.738	2026-02-26 09:59:24.738	2026-02-26 09:59:24.738	\N	\N	en
371	quxq086c4tv1d93v38glpajn	plugin::content-manager.explorer.update	{}	api::classroom.classroom	{"fields": ["code", "name", "capacity", "building", "status"]}	[]	2026-02-26 09:59:24.741	2026-02-26 09:59:24.741	2026-02-26 09:59:24.741	\N	\N	en
372	guntmxlpdu8ihbkqkjjm0whk	plugin::content-manager.explorer.delete	{}	api::classroom.classroom	{}	[]	2026-02-26 09:59:24.743	2026-02-26 09:59:24.743	2026-02-26 09:59:24.744	\N	\N	en
373	wjiwnk3svq7c11ara1wapzal	plugin::content-manager.explorer.publish	{}	api::classroom.classroom	{}	[]	2026-02-26 09:59:24.746	2026-02-26 09:59:24.746	2026-02-26 09:59:24.746	\N	\N	en
374	prf3szr1zo7777fccszejmjl	plugin::content-manager.explorer.create	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-26 09:59:24.749	2026-02-26 09:59:24.749	2026-02-26 09:59:24.749	\N	\N	en
375	o3b9iq20ouzlxkc98zanrifw	plugin::content-manager.explorer.read	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-26 09:59:24.752	2026-02-26 09:59:24.752	2026-02-26 09:59:24.752	\N	\N	en
376	kwvpfvo987075geuo8ncnw3p	plugin::content-manager.explorer.update	{}	api::exam-approval.exam-approval	{"fields": ["decision", "approvals"]}	[]	2026-02-26 09:59:24.754	2026-02-26 09:59:24.754	2026-02-26 09:59:24.754	\N	\N	en
377	yx6c4mqimnk3qqg5apqy06ej	plugin::content-manager.explorer.delete	{}	api::exam-approval.exam-approval	{}	[]	2026-02-26 09:59:24.757	2026-02-26 09:59:24.757	2026-02-26 09:59:24.757	\N	\N	en
378	ycyvhf5s12uk47muwhwcj8z7	plugin::content-manager.explorer.publish	{}	api::exam-approval.exam-approval	{}	[]	2026-02-26 09:59:24.76	2026-02-26 09:59:24.76	2026-02-26 09:59:24.76	\N	\N	en
379	es8amgebo6zynh3lh7v89dbb	plugin::content-manager.explorer.create	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-26 09:59:24.763	2026-02-26 09:59:24.763	2026-02-26 09:59:24.763	\N	\N	en
380	zvjbz6hur0ddgvxaxjvwy9y4	plugin::content-manager.explorer.read	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-26 09:59:24.765	2026-02-26 09:59:24.765	2026-02-26 09:59:24.765	\N	\N	en
381	tfn0ewizzsnx9njeqajtlpqv	plugin::content-manager.explorer.update	{}	api::exam-grade.exam-grade	{"fields": ["decision", "grades"]}	[]	2026-02-26 09:59:24.768	2026-02-26 09:59:24.768	2026-02-26 09:59:24.768	\N	\N	en
382	qhug721u0cfod6nplwog0d36	plugin::content-manager.explorer.delete	{}	api::exam-grade.exam-grade	{}	[]	2026-02-26 09:59:24.771	2026-02-26 09:59:24.771	2026-02-26 09:59:24.771	\N	\N	en
383	x4ij029zc521o4cinm58skql	plugin::content-manager.explorer.publish	{}	api::exam-grade.exam-grade	{}	[]	2026-02-26 09:59:24.775	2026-02-26 09:59:24.775	2026-02-26 09:59:24.775	\N	\N	en
384	ch16i49k3hmveit1bzxnyayd	plugin::content-manager.explorer.create	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-26 09:59:24.778	2026-02-26 09:59:24.778	2026-02-26 09:59:24.779	\N	\N	en
385	kz77eswei9exaely67weelac	plugin::content-manager.explorer.read	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-26 09:59:24.781	2026-02-26 09:59:24.781	2026-02-26 09:59:24.782	\N	\N	en
386	fzipwobmtjm4jh106jdbi7wu	plugin::content-manager.explorer.update	{}	api::nation.nation	{"fields": ["code", "name", "abbr", "status"]}	[]	2026-02-26 09:59:24.784	2026-02-26 09:59:24.784	2026-02-26 09:59:24.785	\N	\N	en
387	f8o2virvzqmocyzd6ulsrejb	plugin::content-manager.explorer.delete	{}	api::nation.nation	{}	[]	2026-02-26 09:59:24.787	2026-02-26 09:59:24.787	2026-02-26 09:59:24.787	\N	\N	en
388	m6chovs863tvqsv80a4u5pxf	plugin::content-manager.explorer.publish	{}	api::nation.nation	{}	[]	2026-02-26 09:59:24.79	2026-02-26 09:59:24.79	2026-02-26 09:59:24.79	\N	\N	en
389	go8yssp55czzvr3q41q1pkun	plugin::content-manager.explorer.create	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 09:59:24.793	2026-02-26 09:59:24.793	2026-02-26 09:59:24.793	\N	\N	en
390	vmj3pfecazwrh73gjl4r6g64	plugin::content-manager.explorer.read	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 09:59:24.796	2026-02-26 09:59:24.796	2026-02-26 09:59:24.796	\N	\N	en
391	es7it84gzkh6gycj9cs4g5qu	plugin::content-manager.explorer.update	{}	api::print-template.print-template	{"fields": ["type", "name", "content"]}	[]	2026-02-26 09:59:24.798	2026-02-26 09:59:24.798	2026-02-26 09:59:24.798	\N	\N	en
392	a3x871rjl0z7gm8v6tx50ode	plugin::content-manager.explorer.delete	{}	api::print-template.print-template	{}	[]	2026-02-26 09:59:24.801	2026-02-26 09:59:24.801	2026-02-26 09:59:24.801	\N	\N	en
393	b4l798dvp300gltvsp73dm0k	plugin::content-manager.explorer.publish	{}	api::print-template.print-template	{}	[]	2026-02-26 09:59:24.803	2026-02-26 09:59:24.803	2026-02-26 09:59:24.803	\N	\N	en
394	wwzjdj9wq1wc7akdctbbivas	plugin::content-manager.explorer.create	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-26 09:59:24.806	2026-02-26 09:59:24.806	2026-02-26 09:59:24.806	\N	\N	en
395	nzg7xmffm48fyyv7hgodusye	plugin::content-manager.explorer.read	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-26 09:59:24.808	2026-02-26 09:59:24.808	2026-02-26 09:59:24.808	\N	\N	en
396	y8l91rnnwcykvf8s8desdfol	plugin::content-manager.explorer.update	{}	api::school-class.school-class	{"fields": ["code", "name", "notes", "status", "start_date", "end_date", "student_count", "subjects"]}	[]	2026-02-26 09:59:24.811	2026-02-26 09:59:24.811	2026-02-26 09:59:24.811	\N	\N	en
397	pbreny20vbz0sllgd6vjq6c6	plugin::content-manager.explorer.delete	{}	api::school-class.school-class	{}	[]	2026-02-26 09:59:24.813	2026-02-26 09:59:24.813	2026-02-26 09:59:24.813	\N	\N	en
398	bonhsoz09mw0pcf1nymtkelw	plugin::content-manager.explorer.publish	{}	api::school-class.school-class	{}	[]	2026-02-26 09:59:24.816	2026-02-26 09:59:24.816	2026-02-26 09:59:24.816	\N	\N	en
399	r2nu7g1u22wh183m7q0wnds5	plugin::content-manager.explorer.create	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-26 09:59:24.819	2026-02-26 09:59:24.819	2026-02-26 09:59:24.819	\N	\N	en
400	jjwa31g2bh5qe573ipcwtlh7	plugin::content-manager.explorer.read	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-26 09:59:24.822	2026-02-26 09:59:24.822	2026-02-26 09:59:24.822	\N	\N	en
401	wy403kgrtpnxul2qaogo94ee	plugin::content-manager.explorer.update	{}	api::student.student	{"fields": ["stt", "group", "class_code", "class_name", "card_number", "student_code", "id_number", "first_name", "last_name", "full_name", "gender", "dob", "pob", "ethnicity", "nationality", "company", "address", "score", "photo", "phone", "school_class", "documents", "is_approved"]}	[]	2026-02-26 09:59:24.825	2026-02-26 09:59:24.825	2026-02-26 09:59:24.825	\N	\N	en
402	gl3hh8yhdf3wxrvvr0hexauh	plugin::content-manager.explorer.delete	{}	api::student.student	{}	[]	2026-02-26 09:59:24.828	2026-02-26 09:59:24.828	2026-02-26 09:59:24.828	\N	\N	en
403	l2udl5iemg6hfmcwzoyaofsi	plugin::content-manager.explorer.publish	{}	api::student.student	{}	[]	2026-02-26 09:59:24.831	2026-02-26 09:59:24.831	2026-02-26 09:59:24.831	\N	\N	en
404	g95igdu678vsqieyi6i6yb3z	plugin::content-manager.explorer.create	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-26 09:59:24.834	2026-02-26 09:59:24.834	2026-02-26 09:59:24.834	\N	\N	en
405	jizp6pperpvm2tr5lyf5drki	plugin::content-manager.explorer.read	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-26 09:59:24.836	2026-02-26 09:59:24.836	2026-02-26 09:59:24.836	\N	\N	en
406	qx1wufceuj8dgx6a8ukbl6vk	plugin::content-manager.explorer.update	{}	api::student-document.student-document	{"fields": ["name", "url", "date", "type", "student"]}	[]	2026-02-26 09:59:24.84	2026-02-26 09:59:24.84	2026-02-26 09:59:24.84	\N	\N	en
407	l4y9c4kipo51mpodvwrr71xy	plugin::content-manager.explorer.delete	{}	api::student-document.student-document	{}	[]	2026-02-26 09:59:24.842	2026-02-26 09:59:24.842	2026-02-26 09:59:24.842	\N	\N	en
408	fo58xz874v3irgya87rzi41v	plugin::content-manager.explorer.publish	{}	api::student-document.student-document	{}	[]	2026-02-26 09:59:24.845	2026-02-26 09:59:24.845	2026-02-26 09:59:24.845	\N	\N	en
409	prm0zjf7d2w4rtwhvuoyeoa5	plugin::content-manager.explorer.create	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-26 09:59:24.847	2026-02-26 09:59:24.847	2026-02-26 09:59:24.847	\N	\N	en
410	rrlez50ed29nyt0taifbks5v	plugin::content-manager.explorer.read	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-26 09:59:24.85	2026-02-26 09:59:24.85	2026-02-26 09:59:24.85	\N	\N	en
411	d0ix8f502hnpq6tgxw5fr5vt	plugin::content-manager.explorer.update	{}	api::subject.subject	{"fields": ["code", "name", "sessions", "total_hours", "theory_hours", "practice_hours", "exercise_hours", "exam_hours", "notes", "has_theory", "has_practice"]}	[]	2026-02-26 09:59:24.854	2026-02-26 09:59:24.854	2026-02-26 09:59:24.854	\N	\N	en
413	c3isalgelhx6mwv5t0c46vbd	plugin::content-manager.explorer.publish	{}	api::subject.subject	{}	[]	2026-02-26 09:59:24.859	2026-02-26 09:59:24.859	2026-02-26 09:59:24.859	\N	\N	en
414	mmn4j479puutypjjvbubrfu3	plugin::content-manager.explorer.create	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-26 09:59:24.862	2026-02-26 09:59:24.862	2026-02-26 09:59:24.862	\N	\N	en
415	w3avnql7o3fcs5e8pvr0kwe0	plugin::content-manager.explorer.read	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-26 09:59:24.864	2026-02-26 09:59:24.864	2026-02-26 09:59:24.864	\N	\N	en
416	zby9r38dxawm8t2p5qc8kis0	plugin::content-manager.explorer.update	{}	api::supplier.supplier	{"fields": ["code", "name", "tax_id", "phone", "email", "address", "status"]}	[]	2026-02-26 09:59:24.867	2026-02-26 09:59:24.867	2026-02-26 09:59:24.867	\N	\N	en
417	hvzt7kn62c41ku41b7wh9o5p	plugin::content-manager.explorer.delete	{}	api::supplier.supplier	{}	[]	2026-02-26 09:59:24.869	2026-02-26 09:59:24.869	2026-02-26 09:59:24.87	\N	\N	en
418	ks1ehvfod24mldetbhiag9fe	plugin::content-manager.explorer.publish	{}	api::supplier.supplier	{}	[]	2026-02-26 09:59:24.872	2026-02-26 09:59:24.872	2026-02-26 09:59:24.872	\N	\N	en
419	x5leopxeygubgqw8on6k24aq	plugin::content-manager.explorer.create	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-26 09:59:24.875	2026-02-26 09:59:24.875	2026-02-26 09:59:24.875	\N	\N	en
420	u594onm6m80s3qajtfz8w4dn	plugin::content-manager.explorer.read	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-26 09:59:24.877	2026-02-26 09:59:24.877	2026-02-26 09:59:24.877	\N	\N	en
421	ual8gtqkcwngie6r72xusckp	plugin::content-manager.explorer.update	{}	api::teacher.teacher	{"fields": ["code", "name", "specialization", "phone", "email", "subjects"]}	[]	2026-02-26 09:59:24.88	2026-02-26 09:59:24.88	2026-02-26 09:59:24.88	\N	\N	en
422	kiluo51p3pxz71u02wc1sbhw	plugin::content-manager.explorer.delete	{}	api::teacher.teacher	{}	[]	2026-02-26 09:59:24.882	2026-02-26 09:59:24.882	2026-02-26 09:59:24.882	\N	\N	en
423	dwgdni4ugpys1rk1lkf98w4i	plugin::content-manager.explorer.publish	{}	api::teacher.teacher	{}	[]	2026-02-26 09:59:24.885	2026-02-26 09:59:24.885	2026-02-26 09:59:24.885	\N	\N	en
429	qa4ywuf5rgr8uf7a5c37y284	plugin::content-manager.explorer.create	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-26 09:59:24.902	2026-02-26 09:59:24.902	2026-02-26 09:59:24.902	\N	\N	en
430	u6cf1uw9z964ldtur3visag6	plugin::content-manager.explorer.read	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-26 09:59:24.905	2026-02-26 09:59:24.905	2026-02-26 09:59:24.905	\N	\N	en
431	v6hq2l8akobm4d9vd81yr87x	plugin::content-manager.explorer.update	{}	api::training-assignment.training-assignment	{"fields": ["decision", "schedule"]}	[]	2026-02-26 09:59:24.909	2026-02-26 09:59:24.909	2026-02-26 09:59:24.909	\N	\N	en
432	mpfyvtu9pfvpsuadgo5fnr3y	plugin::content-manager.explorer.delete	{}	api::training-assignment.training-assignment	{}	[]	2026-02-26 09:59:24.912	2026-02-26 09:59:24.912	2026-02-26 09:59:24.912	\N	\N	en
433	hepv7kc46v9reyooyl0fk9mi	plugin::content-manager.explorer.publish	{}	api::training-assignment.training-assignment	{}	[]	2026-02-26 09:59:24.915	2026-02-26 09:59:24.915	2026-02-26 09:59:24.916	\N	\N	en
440	uoued5u2p8mjm9yqkn0imhmb	plugin::content-manager.explorer.create	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision", "start_date", "end_date", "class_type"]}	[]	2026-02-27 16:42:15.037	2026-02-27 16:42:15.037	2026-02-27 16:42:15.038	\N	\N	en
441	ynpy4bgrs0e80tn1wxer5s9z	plugin::content-manager.explorer.read	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision", "start_date", "end_date", "class_type"]}	[]	2026-02-27 16:42:15.043	2026-02-27 16:42:15.043	2026-02-27 16:42:15.044	\N	\N	en
442	v5vs3vds0mq2i0v4a14vtpmr	plugin::content-manager.explorer.update	{}	api::class-decision.class-decision	{"fields": ["decision_number", "type", "training_course", "signed_date", "signer_name", "school_class", "students", "notes", "related_decision", "start_date", "end_date", "class_type"]}	[]	2026-02-27 16:42:15.047	2026-02-27 16:42:15.047	2026-02-27 16:42:15.047	\N	\N	en
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	3	1
8	8	3	2
9	9	3	3
10	10	3	4
11	11	3	5
12	12	3	6
16	16	1	4
17	17	1	5
18	18	1	6
19	19	1	7
20	20	1	8
21	21	1	9
22	22	1	10
23	23	1	11
24	24	1	12
25	25	1	13
26	26	1	14
27	27	1	15
28	28	1	16
29	29	1	17
30	30	1	18
31	31	1	19
32	32	1	20
33	33	1	21
34	34	1	22
35	35	1	23
36	36	1	24
37	37	1	25
38	38	1	26
39	39	1	27
40	40	1	28
41	41	1	29
42	42	1	30
43	43	1	31
44	44	1	32
45	45	1	33
46	46	1	34
47	47	1	35
48	48	1	36
49	49	1	37
50	50	1	38
51	51	1	39
52	52	1	40
53	53	1	41
54	54	1	42
55	55	1	43
56	56	1	44
57	57	1	45
58	58	1	46
59	59	1	47
60	60	1	48
61	61	1	49
62	62	1	50
63	63	1	51
64	64	1	52
65	65	1	53
66	66	1	54
67	67	1	55
68	68	1	56
69	69	1	57
70	70	1	58
151	151	1	59
152	152	1	60
153	153	1	61
155	155	1	63
157	157	1	65
158	158	1	66
159	159	1	67
160	160	1	68
161	161	1	69
163	163	1	71
165	165	1	73
166	166	1	74
167	167	1	75
168	168	1	76
169	169	1	77
171	171	1	79
173	173	1	81
174	174	1	82
175	175	1	83
176	176	1	84
177	177	1	85
178	178	1	86
179	179	1	87
180	180	1	88
181	181	1	89
182	182	1	90
183	183	1	91
184	184	1	92
185	185	1	93
186	186	1	94
187	187	1	95
188	188	1	96
189	189	1	97
190	190	1	98
194	194	3	10
195	195	3	11
196	196	3	12
197	197	3	13
198	198	3	14
199	199	3	15
200	200	3	16
201	201	3	17
202	202	3	18
203	203	3	19
204	204	3	20
205	205	3	21
206	206	3	22
207	207	3	23
208	208	3	24
209	209	3	25
210	210	3	26
214	214	3	30
215	215	3	31
216	216	3	32
217	217	3	33
218	218	3	34
219	219	3	35
220	220	3	36
224	224	3	40
225	225	3	41
226	226	3	42
227	227	3	43
228	228	3	44
229	229	3	45
230	230	3	46
231	231	3	47
232	232	3	48
233	233	3	49
234	234	3	50
235	235	3	51
239	239	1	99
240	240	1	100
241	241	1	101
245	245	1	105
246	246	1	106
247	247	1	107
248	248	1	108
249	249	1	109
250	250	1	110
251	251	1	111
252	252	1	112
253	253	1	113
254	254	1	114
255	255	1	115
256	256	1	116
257	257	1	117
258	258	1	118
259	259	1	119
260	260	1	120
261	261	1	121
268	268	1	125
269	269	1	126
270	270	1	127
271	271	1	128
272	272	1	129
289	289	1	140
290	290	1	141
291	291	1	142
292	292	1	143
293	293	1	144
294	294	1	145
295	295	1	146
296	296	1	147
297	297	1	148
298	298	1	149
299	299	1	150
300	300	3	52
301	301	3	53
302	302	3	54
303	303	3	55
304	304	3	56
305	305	3	57
306	306	3	58
307	307	3	59
308	308	3	60
309	309	3	61
310	310	3	62
311	311	3	63
312	312	3	64
318	318	3	70
319	319	3	71
320	320	3	72
321	321	3	73
322	322	3	74
323	323	3	75
324	324	3	76
325	325	3	77
326	326	3	78
327	327	3	79
328	328	3	80
329	329	3	81
330	330	3	82
331	331	3	83
332	332	3	84
333	333	3	85
334	334	3	86
335	335	3	87
336	336	3	88
337	337	3	89
338	338	3	90
344	344	3	96
345	345	3	97
346	346	3	98
347	347	3	99
348	348	3	100
349	349	2	7
350	350	2	8
351	351	2	9
352	352	2	10
353	353	2	11
354	354	2	12
355	355	2	13
356	356	2	14
357	357	2	15
358	358	2	16
359	359	2	17
360	360	2	18
361	361	2	19
362	362	2	20
363	363	2	21
369	369	2	27
370	370	2	28
371	371	2	29
372	372	2	30
373	373	2	31
374	374	2	32
375	375	2	33
376	376	2	34
377	377	2	35
378	378	2	36
379	379	2	37
380	380	2	38
381	381	2	39
382	382	2	40
383	383	2	41
384	384	2	42
385	385	2	43
386	386	2	44
387	387	2	45
388	388	2	46
389	389	2	47
390	390	2	48
391	391	2	49
392	392	2	50
393	393	2	51
394	394	2	52
395	395	2	53
396	396	2	54
397	397	2	55
398	398	2	56
399	399	2	57
400	400	2	58
401	401	2	59
402	402	2	60
403	403	2	61
404	404	2	62
405	405	2	63
406	406	2	64
407	407	2	65
408	408	2	66
409	409	2	67
410	410	2	68
411	411	2	69
412	412	2	70
413	413	2	71
414	414	2	72
415	415	2	73
416	416	2	74
417	417	2	75
418	418	2	76
419	419	2	77
420	420	2	78
421	421	2	79
422	422	2	80
423	423	2	81
429	429	2	87
430	430	2	88
431	431	2	89
432	432	2	90
433	433	2	91
440	440	1	151
441	441	1	152
442	442	1	153
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	ne6sqpvb1eqmqkgqsmikegp1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2026-02-09 15:13:37.127	2026-02-09 15:13:37.127	2026-02-09 15:13:37.127	\N	\N	en
2	uc74ty0dgzorh5lf5hadf12a	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2026-02-09 15:13:37.139	2026-02-26 09:59:24.519	2026-02-09 15:13:37.139	\N	\N	en
3	cb8j1j65lzk6pq14j3a80vtg	Author	strapi-author	Authors can manage the content they have created.	2026-02-09 15:13:37.143	2026-02-26 09:59:34.753	2026-02-09 15:13:37.143	\N	\N	en
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	hsrlz29skxhw13pjp59rd979	Dương	Nguyễn	Duong	adsxaluan@gmail.com	$2a$10$QeAIGMOp2VG/vrN6fPm6HeywgO8JKuMoGTRRV3jRZqKNJffWE/c26	939419718a62b3f96e1a6370a293a2ebb60041cc	\N	t	f	\N	2026-02-09 15:14:07.651	2026-03-23 09:28:56.12	2026-02-09 15:14:07.652	\N	\N	en
2	j6uo02845bvkl8q0jgpl1qn2	Thai	Nguyen	thainguyen	adsxaluan09@gmail.com	$2a$10$9xvRgfNgrdxosJdHy29THuI7fhI2y4MOiyU0PJ0jOTZP97tuMQlSq	\N	c5d8271d16d0acea69622dabbb55135c70e592a2	t	f	\N	2026-03-23 08:16:37.16	2026-03-23 09:31:56.888	2026-03-23 08:16:37.16	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
3	1	2	2	1
4	1	3	3	1
8	2	2	1	2
9	2	3	2	2
17	2	1	3	2
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audit_logs (id, document_id, action, actor, details, entity_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
63	z6gkumzgvlii58ub1zw1glvq	CREATE_DECISION	Nguyễn Thành Dương	Tạo mới Quyết định OPENING số 231313	etoaqq3xck8sl4hkbxz5hgz0	2026-03-23 04:37:50.282	2026-03-23 04:37:50.282	2026-03-23 04:37:50.281	\N	\N	\N
\.


--
-- Data for Name: class_decisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.class_decisions (id, document_id, decision_number, training_course, signed_date, signer_name, notes, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, type, start_date, end_date, class_type) FROM stdin;
160	etoaqq3xck8sl4hkbxz5hgz0	231313	231321	2026-03-23	HIỆU TRƯỞNG		2026-03-23 04:37:50.23	2026-03-23 04:37:50.23	2026-03-23 04:37:50.225	\N	\N	\N	OPENING	\N	\N	\N
\.


--
-- Data for Name: class_decisions_related_decision_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.class_decisions_related_decision_lnk (id, class_decision_id, inv_class_decision_id) FROM stdin;
\.


--
-- Data for Name: class_decisions_school_class_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.class_decisions_school_class_lnk (id, class_decision_id, school_class_id) FROM stdin;
171	160	235
\.


--
-- Data for Name: class_decisions_students_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.class_decisions_students_lnk (id, class_decision_id, student_id, student_ord) FROM stdin;
216	160	190	1
\.


--
-- Data for Name: class_subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.class_subjects (class_id, subject_id, id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
cls1	sub2	1	\N	\N	\N	\N	\N	\N	en
cls1	sub3	2	\N	\N	\N	\N	\N	\N	en
cls1	sub6	3	\N	\N	\N	\N	\N	\N	en
cls2	sub1	4	\N	\N	\N	\N	\N	\N	en
cls2	sub4	5	\N	\N	\N	\N	\N	\N	en
cls2	sub5	6	\N	\N	\N	\N	\N	\N	en
cls3	sub1	7	\N	\N	\N	\N	\N	\N	en
cls3	sub5	8	\N	\N	\N	\N	\N	\N	en
cls4	sub2	9	\N	\N	\N	\N	\N	\N	en
cls4	sub3	10	\N	\N	\N	\N	\N	\N	en
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.classes (id, document_id, code, name, notes, status, start_date, end_date, student_count, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
103	jjkrmxrzekxbilchhmn9qne8	MH004	Huấn luyện an toàn cho nhân viên phục vụ trực tiếp trong khoang hành khách và tàu khách Ro - Ro.		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.155	2026-02-26 10:31:34.299	2026-02-26 10:31:34.283	\N	\N	en
243	ow4pzccbn1j6d6x8dy6gatqu	MH002	Bếp trưởng, cấp dưỡng		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.06	2026-02-26 10:31:43.508	2026-02-26 10:31:43.504	\N	\N	en
119	j221297t7f1iqwj8i5gg1dcv	MH012	Huấn luyện nâng cao thuyền viên làm việc trên tàu hoạt động tại các vùng nước cực		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.419	2026-02-16 19:15:53.094	2026-02-26 01:48:57.502	\N	\N	en
172	qdo05k12v5lnyx27zhabqg9f	RAM	Sử dụng Radar và Arpa hàng hải mức quản lý		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:22.423	2026-02-24 08:28:22.423	2026-02-26 01:48:57.502	\N	\N	en
176	pzcbgg8gbqbykojxl3f4q235	AOT	Nâng cao tàu dầu		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:41.57	2026-02-24 08:28:41.57	2026-02-26 01:48:57.502	\N	\N	en
178	eujbcpwp0cz0wpujdlsfv7pr	ECDIS	Khai thác hệ thống thông tin và chỉ báo hải đồ điện tử		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:52.546	2026-02-24 08:28:52.546	2026-02-26 01:48:57.502	\N	\N	en
180	pf22jn34h2p3ud4yc4phbr4u	SSD	Thuyền viên có nhiệm vụ an ninh tàu biển cụ thể		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:56.525	2026-02-24 08:28:56.525	2026-02-26 01:48:57.502	\N	\N	en
190	puzrweo06o3qpdj31s7pojc8	MH011	Huấn luyện cơ bản thuyền viên làm việc trên tàu hoạt động tại các vùng nước cực		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:18.069	2026-02-24 08:29:18.069	2026-02-26 01:48:57.502	\N	\N	en
194	mdaiw3kihkdmj7sd7cd470x4	ALG	Nâng cao tàu khí hóa lỏng 		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:24.254	2026-02-24 08:29:24.254	2026-02-26 01:48:57.502	\N	\N	en
235	0c7297d308851058ef9dc6f9	ACT	Nâng cao tàu hóa chất		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:58.814	2026-02-26 10:40:16.349	2026-02-26 10:40:16.342	\N	1	en
233	izdtvrn4ts518j2nrins8ppa	MFC	Sơ cứu Y tế và chăm sóc Y tế		active	2026-02-16	2026-02-16	0	2026-02-24 08:27:36.975	2026-02-26 10:54:22.617	2026-02-26 10:54:22.608	\N	\N	en
182	nl1sdx8pu1ksi6khano0nbp7	AFF	Phòng cháy chữa cháy nâng cao		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:00.553	2026-02-24 08:29:00.553	2026-02-26 01:48:57.502	\N	\N	en
186	pz3ubjcoulmh5w3c319pzqpi	MH009	Huấn luyện cơ bản thuyền viên làm việc trên tàu cao tốc		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:11.072	2026-02-24 08:29:11.072	2026-02-26 01:48:57.502	\N	\N	en
188	p2zx8jquo71c8mdeg3j3uku2	MH010	Huấn luyện nâng cao thuyền viên làm việc trên tàu cao tốc		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:14.65	2026-02-24 08:29:14.65	2026-02-26 01:48:57.502	\N	\N	en
234	g0xzk6n6uvfiq53r12itc78o	SCR	Nghiệp vụ trên bè cứu sinh và xuồng cứu nạn, xuồng cứu nạn cao tốc		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:58.231	2026-02-26 10:56:53.589	2026-02-26 10:56:53.58	\N	\N	en
184	kx6g603tnm3fvzk89b02zvwp	MH013	Huấn luyện viên chính		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:04.992	2026-02-24 08:29:04.992	2026-02-26 01:48:57.502	\N	\N	en
192	hlhytb396hgvc20zhruk1wmu	BLG	Cơ bản tàu khí hóa lỏng		active	2026-02-16	2026-02-16	0	2026-02-24 08:29:20.934	2026-02-24 08:29:20.934	2026-02-26 01:48:57.502	\N	\N	en
238	zpl0006djsba76n4cko2oj1q	ERM	Quản lý đội ngũ hoặc nguồn lực buồng máy		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:09.258	2026-02-26 10:37:30.117	2026-02-26 10:37:30.108	\N	\N	en
242	z9rzvpzoyasfxgm71xyn8f9n	BRM	Quản lý đội ngũ hoặc nguồn lực buồng lái		active	2026-02-16	2026-02-16	0	2026-02-24 08:27:47.618	2026-02-26 10:38:36.524	2026-02-26 10:38:36.52	\N	\N	en
239	s1esjmadfgkxdc8eobp3e1i5	BOC	Cơ bản tàu dầu và hóa chất		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:29.597	2026-02-26 10:38:11.422	2026-02-26 10:38:11.417	\N	\N	en
107	ibqgviogwdcvpnabm447o8tv	MH006	Quản lý khủng hoảng và phản ứng của con người trên tàu khách và tàu khách Ro-Ro		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.222	2026-02-16 19:13:03.8	2026-02-26 01:48:57.502	\N	\N	en
106	tbi5m7m8u4ii93rdoayyfsb1	MH005	An toàn hành khách, an toàn hàng hóa và tính nguyên vẹn của vỏ tàu đối với tàu khách và tàu khách Ro-Ro		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.212	2026-02-16 19:11:56.902	2026-02-26 01:48:57.502	\N	\N	en
110	gstt1i6g8ecwm9hqi4rrgerw	MH007	Huấn luyện cơ bản thuyền viên làm việc trên tàu sử dụng nhiên liệu có điểm cháy thấp theo Bộ luật IGF		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.291	2026-02-16 19:13:39.094	2026-02-26 01:48:57.502	\N	\N	en
102	cpq2t8kqwa4gg9ggqmo3mk8j	MH003	Quản lý đám đông đối với tàu khách và tàu khách Ro-Ro.		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.124	2026-02-16 19:11:16.93	2026-02-26 01:48:57.502	\N	\N	en
240	oq3p75hykgwli8pftz1av3u0	RAO	Sử dụng Radar và Arpa hàng hải mức vận hành		active	2026-02-16	2026-02-16	0	2026-02-24 08:28:14.769	2026-02-26 10:37:52.189	2026-02-26 10:37:52.183	\N	\N	en
111	c20fcf633945518227f6cf0e	MH008	Huấn luyện nâng cao thuyền viên làm việc trên tàu sử dụng nhiên liệu có điểm cháy thấp theo Bộ luật IGF		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.293	2026-02-16 19:14:27.583	2026-02-26 01:48:57.502	\N	\N	en
83	70315ea831175646bbcd5db1	SSO	Sỹ quan an ninh tàu biển		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:58.576	2026-02-17 09:29:07.781	2026-02-26 01:48:57.502	\N	\N	en
98	7114e261d3656498f98d9460	MH001	Sỹ quan an toàn tàu biển		active	2026-02-16	2026-02-16	0	2026-02-16 13:13:59.049	2026-02-17 09:29:23.801	2026-02-26 01:48:57.502	\N	\N	en
244	gchx5mvlrcxynx7hmkafb5dz	U.BTC	Cập nhật Huấn luyện An toàn sinh mạng và trách nhiệm xã hội theo  Nghị quyết MSC.560 (108) của IMO)		active	\N	\N	0	2026-03-12 09:33:29.757	2026-03-12 09:33:29.757	2026-03-12 09:33:29.753	\N	\N	en
232	o8y8mp1v9xcmaonwm48moj6i	BTC	Huấn luyện nghiệp vụ cơ bản		active	2026-02-16	2026-02-16	1	2026-02-26 09:48:39.816	2026-03-12 09:20:36.632	2026-03-12 09:20:36.626	\N	\N	en
\.


--
-- Data for Name: classes_subjects_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.classes_subjects_lnk (id, school_class_id, subject_id, subject_ord) FROM stdin;
51	103	292	1
183	243	284	1
184	238	259	1
185	240	260	1
186	239	272	1
187	242	258	1
188	235	279	1
190	233	257	1
196	233	256	2
197	234	321	1
198	234	255	2
49	102	291	1
53	106	293	1
57	107	294	1
61	110	295	1
105	188	304	1
67	111	296	1
69	119	306	1
33	83	270	1
107	190	305	1
45	98	283	1
97	180	269	1
99	182	271	1
101	184	307	1
103	186	303	1
95	178	268	1
93	176	280	1
111	194	281	1
109	192	282	1
89	172	267	1
191	232	317	1
192	232	339	2
193	232	245	3
194	232	246	4
203	232	323	5
204	244	376	1
\.


--
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.classrooms (id, document_id, code, name, capacity, building, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	xc3tes0y0nz66pnq4i5a38zc	P101	Phòng 101	40	B2	active	2026-02-16 18:58:21.82	2026-02-16 18:58:21.82	2026-02-16 18:58:21.849	\N	\N	en
3	59b64f046ae700bc2e94373c	P102	Phòng Lý thuyết 102	40	Nhà A	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
4	c111b0c458ab491623da5157	P201	Phòng Máy tính 01	30	Nhà B	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
5	16dd94437bb8a6a7e945f44d	P202	Phòng Máy tính 02	30	Nhà B	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
6	b1de8d90a66b841f496f07d7	X1	Xưởng Thực hành Điện	20	Nhà D	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
7	2de97775b3e992bb572dfa79	X2	Xưởng Thực hành Cơ khí	20	Nhà D	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
8	dd1d7589460f4e5f35bdd266	H1	Hội trường lớn	200	Nhà C	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
\.


--
-- Data for Name: exam_approvals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.exam_approvals (id, document_id, approvals, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
39	j58cbrjwipkl7j6bvff1qd3k	{"279": {"564564649846": {"practicePass": true, "theoryApproved": true}}}	2026-03-23 07:10:02.035	2026-03-23 07:10:02.035	2026-03-23 07:10:02.029	\N	\N	\N
\.


--
-- Data for Name: exam_approvals_decision_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.exam_approvals_decision_lnk (id, exam_approval_id, class_decision_id) FROM stdin;
113	39	160
\.


--
-- Data for Name: exam_grades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.exam_grades (id, document_id, grades, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
37	fivfet3z03k9j2x0c0uoiv1d	{"279": {"564564649846": {"theory": "8", "practice": ""}}}	2026-03-23 07:11:11.509	2026-03-23 07:11:11.509	2026-03-23 07:11:11.505	\N	\N	\N
\.


--
-- Data for Name: exam_grades_decision_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.exam_grades_decision_lnk (id, exam_grade_id, class_decision_id) FROM stdin;
91	37	160
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, focal_point) FROM stdin;
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	txl2xgd9mzqt2isxowo4yaoy	English (en)	en	2026-02-09 15:13:37.031	2026-02-09 15:13:37.031	2026-02-09 15:13:37.032	\N	\N	en
\.


--
-- Data for Name: nations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nations (id, document_id, code, name, abbr, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
8	rr3r68zqgxd64zx0mlfox0k7	VN	Việt Nam	VN	active	2026-02-24 08:08:50.702	2026-02-24 08:08:50.702	2026-02-24 08:08:50.706	\N	\N	en
11	d1aa7ccc058119653aa1a1a5	LAO	Lào	LAO	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
12	eb0f198133bd3ef8e9ac3517	KH	Campuchia	KH	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
13	a17a7a37a903a4fe435bcbbc	JP	Nhật Bản	JP	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
6	pdhwutsrriftcrqv0rnpa4s5	SG	Singapo	SG	active	2026-02-24 08:07:34.107	2026-02-26 10:50:09.568	2026-02-26 10:50:09.561	\N	\N	en
25	g35wey1rm4j8ufme0d8vn701	US	USA	USA	active	2026-02-26 10:51:26.636	2026-02-26 10:51:26.636	2026-02-26 10:51:26.628	\N	\N	en
26	\N	CN	Trung Quốc	CN	active	2026-03-21 03:46:38.857	2026-03-21 03:46:38.857	2026-03-21 03:46:38.857	\N	\N	en
\.


--
-- Data for Name: print_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.print_templates (id, document_id, type, name, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
3	d7d1706e50aec867a3506f30	certificate_list	Danh sách cấp GCN	{"motto": "Độc lập - Tự do - Hạnh phúc", "title": "DANH SÁCH ĐỀ NGHỊ CẤP GIẤY CHỨNG NHẬN", "nation": "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM", "article1": "", "article2": "", "article3": "", "preamble": "Từ ngày    tháng   năm 2026 đến ngày   tháng   năm 2026", "subtitle": "{{CLASS_NAME}}; {{TRAINING_COURSE}} ", "authority": "", "recipients": "", "signerName": "NGUYỄN TẤT QUYỀN", "headerLine1": "TRƯỜNG CAO ĐẲNG HÀNG HẢI VÀ ĐƯỜNG THỦY I", "headerLine2": "TT ĐÀO TẠO PHÁT TRIỂN NGUỒN LỰC", "headerLine3": "", "signerName2": "ĐỖ HỒNG HẢI", "signerTitle": "GIÁM ĐỐC", "signerTitle2": "KT.HIỆU TRƯỞNG\\nPHÓ HIỆU TRƯỞNG"}	2026-02-26 01:35:37.917	2026-02-27 14:16:39.866	2026-02-27 14:16:39.864	\N	\N	en
2	164cef5d8cf487982283e59e	recognition	Quyết định công nhận	{"motto": "Độc lập - Tự do - Hạnh phúc", "title": "QUYẾT ĐỊNH", "nation": "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM", "article1": "Công nhận học viên lớp {{CLASS_NAME}} {{TRAINING_COURSE}} đã hoàn thành khóa học...", "article2": "Các học viên có tên trong danh sách được cấp chứng chỉ theo quy định...", "article3": "Các Phòng, Ban, Khoa, Trung tâm và các học viên có tên tại Điều 1 chịu trách nhiệm thi hành Quyết định này.", "preamble": "Căn cứ Quyết định số 1275/QĐ-BGDĐT ngày 12/5/2025...;\\nCăn cứ Quy chế đào tạo...;\\nTheo đề nghị của Hội đồng xét tốt nghiệp.", "subtitle": "Về việc Công nhận tốt nghiệp {{CLASS_NAME}} {{TRAINING_COURSE}}", "authority": "HIỆU TRƯỞNG TRƯỜNG CAO ĐẲNG HÀNG HẢI VÀ ĐƯỜNG THỦY I", "recipients": "- Như Điều 3;\\n- Lưu: VT, ĐT.", "signerName": "đỗ hồng hải", "headerLine1": "CỤC HÀNG HẢI VÀ ĐƯỜNG THỦY VIỆT NAM", "headerLine2": "TRƯỜNG CAO ĐẲNG", "headerLine3": "HÀNG HẢI VÀ ĐƯỜNG THỦY I", "signerTitle": "Kt hiệu trưởng\\nPhó hiệu TRƯỞNG"}	2026-02-26 01:35:37.916	2026-02-27 09:48:01.229	2026-02-27 09:48:01.227	\N	\N	en
1	ddf1c2e31438e0e72e3c5ac3	decision	Quyết định mở lớp	{"motto": "Độc lập - Tự do - Hạnh phúc", "title": "QUYẾT ĐỊNH", "nation": "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM", "article1": "Mở lớp {{CLASS_NAME}}: {{TRAINING_COURSE}} (có danh sách kèm theo) Theo Nghị quyết MSC.560(108) của IMO (U.BTC-K18/2026, có danh sách kèm theo) tại Trung tâm Đào tạo Phát triển nguồn lực, Trường Cao đẳng Hàng hải và Đường thủy I.\\nThời gian mở lớp: ngày 02 tháng 02 năm 2026.\\n\\n", "article2": "Giao cho Trung tâm Đào tạo Phát triển nguồn lực chịu trách nhiệm tổ chức lớp huấn luyện; bố trí giảng viên, huấn luyện viên giảng dạy theo nội dung chương trình huấn luyện, đào tạo đã được phê duyệt.\\n", "article3": "Giám đốc Trung tâm Đào tạo Phát triển nguồn lực, Trưởng các đơn vị có liên quan trong trường chịu trách nhiệm thi hành quyết định này.\\n", "preamble": "Căn cứ Quyết định số 1275/QĐ-BGDĐT ngày 12/5/2025 của Bộ trưởng Bộ Giáo dục và Đào tạo về việc sáp nhập Trường Cao đẳng Giao thông vận tải Đường thủy I vào Trường Cao đẳng Hàng hải I và đổi tên thành Trường Cao đẳng Hàng hải và Đường thủy I;\\nCăn cứ Quyết định số 1878/QĐ-CĐHHĐTI ngày 31/12/2025 của Hiệu trưởng trường Cao đẳng Hàng hải và Đường thuỷ I về việc ban hành Quy chế Tổ chức, hoạt động của Trường Cao đẳng Hàng hải và Đường thuỷ I;\\nCăn cứ Thông tư số 20/2023/TT-BGTVT ngày 30/06/2023 của Bộ trưởng Bộ GTVT về tiêu chuẩn chuyên môn, chứng chỉ chuyên môn của thuyền viên và định biên an toàn tối thiểu của tàu biển Việt Nam;\\nCăn cứ Thông tư số 57/2023/TT-BGTVT ngày 31/12/2023 của Bộ trưởng Bộ GTVT về Chương trình đào tạo, huấn luyện thuyền viên, hoa tiêu hàng hải;\\nCăn cứ Giấy chứng nhận số 03/GCN-CHHĐTVN ngày 12/09/2025 của Cục Hàng hải và Đường thủy Việt Nam về việc chứng nhận Trường Cao đẳng Hàng hải và Đường thủy I  đủ điều kiện tổ chức các khóa đào tạo, huấn luyện thuyền viên hàng hải và cấp chứng chỉ huấn luyện;\\nCăn cứ Quyết định số 1092/QĐ-CĐHHĐTI ngày 14/10/2025 của Hiệu trưởng trường Cao đẳng Hàng hải và Đường thủy I về việc ban hành tài liệu cập nhật khóa huấn luyện An toàn sinh mạng và trách nhiệm xã hội theo Nghị quyết MSC.560 (108) của tổ chức Hàng hải quốc tế;\\nTheo đề nghị của Giám đốc Trung tâm Đào tạo Phát triển nguồn lực.", "subtitle": "Về việc Mở lớp {{CLASS_NAME}} (Cập nhật Huấn luyện An toàn sinh mạng và trách nhiệm xã hội theo Nghị quyết MSC.560 (108) của IMO) {{TRAINING_COURSE}}", "authority": "HIỆU TRƯỞNG TRƯỜNG CAO ĐẲNG HÀNG HẢI VÀ ĐƯỜNG THỦY I", "recipients": "- Như Điều 3;\\n- Lưu: VT, ĐT.", "signerName": "ĐỖ HỒNG HẢI", "headerLine1": "CỤC HÀNG HẢI VÀ ĐƯỜNG THỦY VIỆT NAM", "headerLine2": "TRƯỜNG CAO ĐẲNG", "headerLine3": "HÀNG HẢI VÀ ĐƯỜNG THỦY I", "signerTitle": "KT.HIỆU TRƯỞNG\\nPHÓ HIỆU TRƯỞNG"}	2026-02-26 01:35:37.911	2026-03-11 01:44:31.309	2026-03-11 01:44:31.299	\N	\N	en
\.


--
-- Data for Name: strapi_ai_localization_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_ai_localization_jobs (id, content_type, related_document_id, source_locale, target_locales, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: strapi_ai_metadata_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_ai_metadata_jobs (id, status, created_at, completed_at) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	kfh76izsrikwi9yvujzp1qxi	Read Only	A default API token with read-only permissions, only used for accessing resources	read-only	9682039e5d2e99a236ed947c26b76c2a1bf7dcc834942f75698a62888b5ccd7ff1b67029997dff46cf5da30131af8dce262a82f2724ba6cab07158236e8966a1	\N	\N	\N	\N	2026-02-09 15:13:37.426	2026-02-09 15:13:37.426	2026-02-09 15:13:37.426	\N	\N	en
2	jy3ftpx8xr08rc2biec76wqh	Full Access	A default API token with full access permissions, used for accessing or modifying resources	full-access	ee4ad6fe662275fe523cd4d07d6bda65a9e5eff6f004e7ab0eb98915617a4ad878023618ce848567318ad6932278f4471dcf4249968f1411322a38ec096e4997	\N	\N	\N	\N	2026-02-09 15:13:37.434	2026-02-09 15:13:37.434	2026-02-09 15:13:37.434	\N	\N	en
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
1	strapi_unidirectional-join-table-repair-ran	true	boolean	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
51	plugin_content_manager_configuration_content_types::api::teacher.teacher	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"specialization":{"edit":{"label":"specialization","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"specialization","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"subjects":{"edit":{"label":"subjects","description":"","placeholder":"","visible":true,"editable":true,"mainField":"code"},"list":{"label":"subjects","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","name","specialization"],"edit":[[{"name":"code","size":6},{"name":"name","size":6}],[{"name":"specialization","size":6},{"name":"phone","size":6}],[{"name":"email","size":6},{"name":"subjects","size":6}]]},"uid":"api::teacher.teacher"}	object	\N	\N
45	plugin_content_manager_configuration_content_types::api::classroom.classroom	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"capacity":{"edit":{"label":"capacity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"capacity","searchable":true,"sortable":true}},"building":{"edit":{"label":"building","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"building","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","name","capacity"],"edit":[[{"name":"code","size":6},{"name":"name","size":6}],[{"name":"capacity","size":4},{"name":"building","size":6}],[{"name":"status","size":6}]]},"uid":"api::classroom.classroom"}	object	\N	\N
2	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}},"permissions":{"type":"json","configurable":false}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::audit-log.audit-log":{"kind":"collectionType","collectionName":"audit_logs","info":{"singularName":"audit-log","pluralName":"audit-logs","displayName":"Lịch sử hệ thống","description":"System activity logs"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"action":{"type":"string","required":true},"actor":{"type":"string"},"details":{"type":"text"},"entity_id":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::audit-log.audit-log","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"audit_logs"}}},"apiName":"audit-log","globalId":"AuditLog","uid":"api::audit-log.audit-log","modelType":"contentType","__schema__":{"collectionName":"audit_logs","info":{"singularName":"audit-log","pluralName":"audit-logs","displayName":"Lịch sử hệ thống","description":"System activity logs"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"action":{"type":"string","required":true},"actor":{"type":"string"},"details":{"type":"text"},"entity_id":{"type":"string"}},"kind":"collectionType"},"modelName":"audit-log","actions":{},"lifecycles":{}},"api::class-decision.class-decision":{"kind":"collectionType","collectionName":"class_decisions","info":{"singularName":"class-decision","pluralName":"class-decisions","displayName":"Quyết định","description":"Decision to open a class or recognize completion"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision_number":{"type":"string","required":true},"type":{"type":"enumeration","enum":["OPENING","RECOGNITION"],"default":"OPENING"},"training_course":{"type":"string"},"signed_date":{"type":"date"},"signer_name":{"type":"string"},"school_class":{"type":"relation","relation":"manyToOne","target":"api::school-class.school-class"},"students":{"type":"relation","relation":"manyToMany","target":"api::student.student","onDelete":"CASCADE"},"notes":{"type":"text"},"related_decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"start_date":{"type":"date"},"end_date":{"type":"date"},"class_type":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::class-decision.class-decision","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"class_decisions"}}},"apiName":"class-decision","globalId":"ClassDecision","uid":"api::class-decision.class-decision","modelType":"contentType","__schema__":{"collectionName":"class_decisions","info":{"singularName":"class-decision","pluralName":"class-decisions","displayName":"Quyết định","description":"Decision to open a class or recognize completion"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision_number":{"type":"string","required":true},"type":{"type":"enumeration","enum":["OPENING","RECOGNITION"],"default":"OPENING"},"training_course":{"type":"string"},"signed_date":{"type":"date"},"signer_name":{"type":"string"},"school_class":{"type":"relation","relation":"manyToOne","target":"api::school-class.school-class"},"students":{"type":"relation","relation":"manyToMany","target":"api::student.student","onDelete":"CASCADE"},"notes":{"type":"text"},"related_decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"start_date":{"type":"date"},"end_date":{"type":"date"},"class_type":{"type":"string"}},"kind":"collectionType"},"modelName":"class-decision","actions":{},"lifecycles":{}},"api::class-subject.class-subject":{"kind":"collectionType","collectionName":"class_subjects","info":{"singularName":"class-subject","pluralName":"class-subjects","displayName":"Lớp học - Môn học (Legacy)","description":"Mapping từ bảng class_subjects"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"class_id":{"type":"string"},"subject_id":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::class-subject.class-subject","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"class_subjects"}}},"apiName":"class-subject","globalId":"ClassSubject","uid":"api::class-subject.class-subject","modelType":"contentType","__schema__":{"collectionName":"class_subjects","info":{"singularName":"class-subject","pluralName":"class-subjects","displayName":"Lớp học - Môn học (Legacy)","description":"Mapping từ bảng class_subjects"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"class_id":{"type":"string"},"subject_id":{"type":"string"}},"kind":"collectionType"},"modelName":"class-subject","actions":{},"lifecycles":{}},"api::classroom.classroom":{"kind":"collectionType","collectionName":"classrooms","info":{"singularName":"classroom","pluralName":"classrooms","displayName":"Phòng học","description":"Classrooms table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"capacity":{"type":"integer"},"building":{"type":"string"},"status":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::classroom.classroom","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"classrooms"}}},"apiName":"classroom","globalId":"Classroom","uid":"api::classroom.classroom","modelType":"contentType","__schema__":{"collectionName":"classrooms","info":{"singularName":"classroom","pluralName":"classrooms","displayName":"Phòng học","description":"Classrooms table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"capacity":{"type":"integer"},"building":{"type":"string"},"status":{"type":"string"}},"kind":"collectionType"},"modelName":"classroom","actions":{},"lifecycles":{}},"api::exam-approval.exam-approval":{"kind":"collectionType","collectionName":"exam_approvals","info":{"singularName":"exam-approval","pluralName":"exam-approvals","displayName":"Duyệt thi","description":"Stores exam approval status for students in a class decision"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"approvals":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::exam-approval.exam-approval","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"exam_approvals"}}},"apiName":"exam-approval","globalId":"ExamApproval","uid":"api::exam-approval.exam-approval","modelType":"contentType","__schema__":{"collectionName":"exam_approvals","info":{"singularName":"exam-approval","pluralName":"exam-approvals","displayName":"Duyệt thi","description":"Stores exam approval status for students in a class decision"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"approvals":{"type":"json"}},"kind":"collectionType"},"modelName":"exam-approval","actions":{},"lifecycles":{}},"api::exam-grade.exam-grade":{"kind":"collectionType","collectionName":"exam_grades","info":{"singularName":"exam-grade","pluralName":"exam-grades","displayName":"Điểm thi","description":"Stores exam grades for a class decision"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"grades":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::exam-grade.exam-grade","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"exam_grades"}}},"apiName":"exam-grade","globalId":"ExamGrade","uid":"api::exam-grade.exam-grade","modelType":"contentType","__schema__":{"collectionName":"exam_grades","info":{"singularName":"exam-grade","pluralName":"exam-grades","displayName":"Điểm thi","description":"Stores exam grades for a class decision"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"grades":{"type":"json"}},"kind":"collectionType"},"modelName":"exam-grade","actions":{},"lifecycles":{}},"api::nation.nation":{"kind":"collectionType","collectionName":"nations","info":{"singularName":"nation","pluralName":"nations","displayName":"Quốc tịch","description":"Nations table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"abbr":{"type":"string"},"status":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::nation.nation","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"nations"}}},"apiName":"nation","globalId":"Nation","uid":"api::nation.nation","modelType":"contentType","__schema__":{"collectionName":"nations","info":{"singularName":"nation","pluralName":"nations","displayName":"Quốc tịch","description":"Nations table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"abbr":{"type":"string"},"status":{"type":"string"}},"kind":"collectionType"},"modelName":"nation","actions":{},"lifecycles":{}},"api::print-template.print-template":{"kind":"collectionType","collectionName":"print_templates","info":{"singularName":"print-template","pluralName":"print-templates","displayName":"Mẫu in ấn","description":"Stores print templates for decisions and certificates"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"type":{"type":"string","unique":true,"required":true},"name":{"type":"string"},"content":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::print-template.print-template","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"print_templates"}}},"apiName":"print-template","globalId":"PrintTemplate","uid":"api::print-template.print-template","modelType":"contentType","__schema__":{"collectionName":"print_templates","info":{"singularName":"print-template","pluralName":"print-templates","displayName":"Mẫu in ấn","description":"Stores print templates for decisions and certificates"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"type":{"type":"string","unique":true,"required":true},"name":{"type":"string"},"content":{"type":"json"}},"kind":"collectionType"},"modelName":"print-template","actions":{},"lifecycles":{}},"api::school-class.school-class":{"kind":"collectionType","collectionName":"classes","info":{"singularName":"school-class","pluralName":"school-classes","displayName":"Lớp học","description":"Classes table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"notes":{"type":"text"},"status":{"type":"string"},"start_date":{"type":"string"},"end_date":{"type":"string"},"student_count":{"type":"integer","default":0},"subjects":{"type":"relation","relation":"manyToMany","target":"api::subject.subject"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::school-class.school-class","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"classes"}}},"apiName":"school-class","globalId":"SchoolClass","uid":"api::school-class.school-class","modelType":"contentType","__schema__":{"collectionName":"classes","info":{"singularName":"school-class","pluralName":"school-classes","displayName":"Lớp học","description":"Classes table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"notes":{"type":"text"},"status":{"type":"string"},"start_date":{"type":"string"},"end_date":{"type":"string"},"student_count":{"type":"integer","default":0},"subjects":{"type":"relation","relation":"manyToMany","target":"api::subject.subject"}},"kind":"collectionType"},"modelName":"school-class","actions":{},"lifecycles":{}},"api::student.student":{"kind":"collectionType","collectionName":"students","info":{"singularName":"student","pluralName":"students","displayName":"Học viên","description":"Students table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"stt":{"type":"integer"},"group":{"type":"string"},"class_code":{"type":"string"},"class_name":{"type":"string"},"card_number":{"type":"string"},"student_code":{"type":"string"},"id_number":{"type":"string"},"first_name":{"type":"string"},"last_name":{"type":"string"},"full_name":{"type":"string"},"gender":{"type":"string"},"dob":{"type":"string"},"pob":{"type":"string"},"ethnicity":{"type":"string"},"nationality":{"type":"string"},"company":{"type":"string"},"address":{"type":"text"},"score":{"type":"string"},"photo":{"type":"text"},"phone":{"type":"string"},"school_class":{"type":"relation","relation":"manyToOne","target":"api::school-class.school-class"},"documents":{"type":"relation","relation":"oneToMany","target":"api::student-document.student-document","mappedBy":"student"},"is_approved":{"type":"boolean","default":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::student.student","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"students"}}},"apiName":"student","globalId":"Student","uid":"api::student.student","modelType":"contentType","__schema__":{"collectionName":"students","info":{"singularName":"student","pluralName":"students","displayName":"Học viên","description":"Students table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"stt":{"type":"integer"},"group":{"type":"string"},"class_code":{"type":"string"},"class_name":{"type":"string"},"card_number":{"type":"string"},"student_code":{"type":"string"},"id_number":{"type":"string"},"first_name":{"type":"string"},"last_name":{"type":"string"},"full_name":{"type":"string"},"gender":{"type":"string"},"dob":{"type":"string"},"pob":{"type":"string"},"ethnicity":{"type":"string"},"nationality":{"type":"string"},"company":{"type":"string"},"address":{"type":"text"},"score":{"type":"string"},"photo":{"type":"text"},"phone":{"type":"string"},"school_class":{"type":"relation","relation":"manyToOne","target":"api::school-class.school-class"},"documents":{"type":"relation","relation":"oneToMany","target":"api::student-document.student-document","mappedBy":"student"},"is_approved":{"type":"boolean","default":false}},"kind":"collectionType"},"modelName":"student","actions":{},"lifecycles":{}},"api::student-document.student-document":{"kind":"collectionType","collectionName":"student_documents","info":{"singularName":"student-document","pluralName":"student-documents","displayName":"Hồ sơ học viên","description":"Student Documents table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"url":{"type":"text"},"date":{"type":"string"},"type":{"type":"string"},"student":{"type":"relation","relation":"manyToOne","target":"api::student.student","inversedBy":"documents","onDelete":"CASCADE"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::student-document.student-document","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"student_documents"}}},"apiName":"student-document","globalId":"StudentDocument","uid":"api::student-document.student-document","modelType":"contentType","__schema__":{"collectionName":"student_documents","info":{"singularName":"student-document","pluralName":"student-documents","displayName":"Hồ sơ học viên","description":"Student Documents table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"url":{"type":"text"},"date":{"type":"string"},"type":{"type":"string"},"student":{"type":"relation","relation":"manyToOne","target":"api::student.student","inversedBy":"documents","onDelete":"CASCADE"}},"kind":"collectionType"},"modelName":"student-document","actions":{},"lifecycles":{}},"api::subject.subject":{"kind":"collectionType","collectionName":"subjects","info":{"singularName":"subject","pluralName":"subjects","displayName":"Môn học","description":"Subjects table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"sessions":{"type":"integer"},"total_hours":{"type":"decimal"},"theory_hours":{"type":"decimal"},"practice_hours":{"type":"decimal"},"exercise_hours":{"type":"decimal"},"exam_hours":{"type":"decimal"},"notes":{"type":"text"},"has_theory":{"type":"boolean","default":true},"has_practice":{"type":"boolean","default":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::subject.subject","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"subjects"}}},"apiName":"subject","globalId":"Subject","uid":"api::subject.subject","modelType":"contentType","__schema__":{"collectionName":"subjects","info":{"singularName":"subject","pluralName":"subjects","displayName":"Môn học","description":"Subjects table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"sessions":{"type":"integer"},"total_hours":{"type":"decimal"},"theory_hours":{"type":"decimal"},"practice_hours":{"type":"decimal"},"exercise_hours":{"type":"decimal"},"exam_hours":{"type":"decimal"},"notes":{"type":"text"},"has_theory":{"type":"boolean","default":true},"has_practice":{"type":"boolean","default":false}},"kind":"collectionType"},"modelName":"subject","actions":{},"lifecycles":{}},"api::supplier.supplier":{"kind":"collectionType","collectionName":"suppliers","info":{"singularName":"supplier","pluralName":"suppliers","displayName":"Dãy nhà","description":"Suppliers table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"tax_id":{"type":"string"},"phone":{"type":"string"},"email":{"type":"string"},"address":{"type":"text"},"status":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::supplier.supplier","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"suppliers"}}},"apiName":"supplier","globalId":"Supplier","uid":"api::supplier.supplier","modelType":"contentType","__schema__":{"collectionName":"suppliers","info":{"singularName":"supplier","pluralName":"suppliers","displayName":"Dãy nhà","description":"Suppliers table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"tax_id":{"type":"string"},"phone":{"type":"string"},"email":{"type":"string"},"address":{"type":"text"},"status":{"type":"string"}},"kind":"collectionType"},"modelName":"supplier","actions":{},"lifecycles":{}},"api::teacher.teacher":{"kind":"collectionType","collectionName":"teachers","info":{"singularName":"teacher","pluralName":"teachers","displayName":"Giảng viên","description":"Teachers table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"specialization":{"type":"string"},"phone":{"type":"string"},"email":{"type":"string"},"subjects":{"type":"relation","relation":"manyToMany","target":"api::subject.subject"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::teacher.teacher","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"teachers"}}},"apiName":"teacher","globalId":"Teacher","uid":"api::teacher.teacher","modelType":"contentType","__schema__":{"collectionName":"teachers","info":{"singularName":"teacher","pluralName":"teachers","displayName":"Giảng viên","description":"Teachers table"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string","unique":true},"name":{"type":"string"},"specialization":{"type":"string"},"phone":{"type":"string"},"email":{"type":"string"},"subjects":{"type":"relation","relation":"manyToMany","target":"api::subject.subject"}},"kind":"collectionType"},"modelName":"teacher","actions":{},"lifecycles":{}},"api::teacher-subject.teacher-subject":{"kind":"collectionType","collectionName":"teacher_subjects","info":{"singularName":"teacher-subject","pluralName":"teacher-subjects","displayName":"Giảng viên - Môn học (Legacy)","description":"Mapping từ bảng teacher_subjects"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"teacher_id":{"type":"string"},"subject_id":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::teacher-subject.teacher-subject","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"teacher_subjects"}}},"apiName":"teacher-subject","globalId":"TeacherSubject","uid":"api::teacher-subject.teacher-subject","modelType":"contentType","__schema__":{"collectionName":"teacher_subjects","info":{"singularName":"teacher-subject","pluralName":"teacher-subjects","displayName":"Giảng viên - Môn học (Legacy)","description":"Mapping từ bảng teacher_subjects"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"teacher_id":{"type":"string"},"subject_id":{"type":"string"}},"kind":"collectionType"},"modelName":"teacher-subject","actions":{},"lifecycles":{}},"api::training-assignment.training-assignment":{"kind":"collectionType","collectionName":"training_assignments","info":{"singularName":"training-assignment","pluralName":"training-assignments","displayName":"Phân công giảng dạy","description":"Stores the training schedule for a class decision"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"schedule":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::training-assignment.training-assignment","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"training_assignments"}}},"apiName":"training-assignment","globalId":"TrainingAssignment","uid":"api::training-assignment.training-assignment","modelType":"contentType","__schema__":{"collectionName":"training_assignments","info":{"singularName":"training-assignment","pluralName":"training-assignments","displayName":"Phân công giảng dạy","description":"Stores the training schedule for a class decision"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"decision":{"type":"relation","relation":"oneToOne","target":"api::class-decision.class-decision"},"schedule":{"type":"json"}},"kind":"collectionType"},"modelName":"training-assignment","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"},"admin::session":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::session","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_sessions"}}},"plugin":"admin","globalId":"AdminSession","uid":"admin::session","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"session"}}	object	\N	\N
48	plugin_content_manager_configuration_content_types::api::student.student	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"group","defaultSortBy":"group","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"stt":{"edit":{"label":"stt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stt","searchable":true,"sortable":true}},"group":{"edit":{"label":"group","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"group","searchable":true,"sortable":true}},"class_code":{"edit":{"label":"class_code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"class_code","searchable":true,"sortable":true}},"class_name":{"edit":{"label":"class_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"class_name","searchable":true,"sortable":true}},"card_number":{"edit":{"label":"card_number","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"card_number","searchable":true,"sortable":true}},"student_code":{"edit":{"label":"student_code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"student_code","searchable":true,"sortable":true}},"id_number":{"edit":{"label":"id_number","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"id_number","searchable":true,"sortable":true}},"first_name":{"edit":{"label":"first_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"first_name","searchable":true,"sortable":true}},"last_name":{"edit":{"label":"last_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"last_name","searchable":true,"sortable":true}},"full_name":{"edit":{"label":"full_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"full_name","searchable":true,"sortable":true}},"gender":{"edit":{"label":"gender","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gender","searchable":true,"sortable":true}},"dob":{"edit":{"label":"dob","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"dob","searchable":true,"sortable":true}},"pob":{"edit":{"label":"pob","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pob","searchable":true,"sortable":true}},"ethnicity":{"edit":{"label":"ethnicity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ethnicity","searchable":true,"sortable":true}},"nationality":{"edit":{"label":"nationality","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nationality","searchable":true,"sortable":true}},"company":{"edit":{"label":"company","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"company","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"score":{"edit":{"label":"score","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"score","searchable":true,"sortable":true}},"photo":{"edit":{"label":"photo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"photo","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"school_class":{"edit":{"label":"school_class","description":"","placeholder":"","visible":true,"editable":true,"mainField":"code"},"list":{"label":"school_class","searchable":true,"sortable":true}},"documents":{"edit":{"label":"documents","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"documents","searchable":false,"sortable":false}},"is_approved":{"edit":{"label":"is_approved","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"is_approved","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","stt","group","class_code"],"edit":[[{"name":"stt","size":4},{"name":"group","size":6}],[{"name":"class_code","size":6},{"name":"class_name","size":6}],[{"name":"card_number","size":6},{"name":"student_code","size":6}],[{"name":"id_number","size":6},{"name":"first_name","size":6}],[{"name":"last_name","size":6},{"name":"full_name","size":6}],[{"name":"gender","size":6},{"name":"dob","size":6}],[{"name":"pob","size":6},{"name":"ethnicity","size":6}],[{"name":"nationality","size":6},{"name":"company","size":6}],[{"name":"address","size":6},{"name":"score","size":6}],[{"name":"photo","size":6},{"name":"documents","size":6}],[{"name":"phone","size":6},{"name":"school_class","size":6}],[{"name":"is_approved","size":4}]]},"uid":"api::student.student"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"documentId"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
47	plugin_content_manager_configuration_content_types::api::student-document.student-document	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"student":{"edit":{"label":"student","description":"","placeholder":"","visible":true,"editable":true,"mainField":"group"},"list":{"label":"student","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","url","date"],"edit":[[{"name":"name","size":6},{"name":"url","size":6}],[{"name":"date","size":6},{"name":"type","size":6}],[{"name":"student","size":6}]]},"uid":"api::student-document.student-document"}	object	\N	\N
20	plugin_content_manager_configuration_content_types::admin::session	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"userId","defaultSortBy":"userId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"userId":{"edit":{"label":"userId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userId","searchable":true,"sortable":true}},"sessionId":{"edit":{"label":"sessionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessionId","searchable":true,"sortable":true}},"childId":{"edit":{"label":"childId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"childId","searchable":true,"sortable":true}},"deviceId":{"edit":{"label":"deviceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"deviceId","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"absoluteExpiresAt":{"edit":{"label":"absoluteExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"absoluteExpiresAt","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","userId","sessionId","childId"],"edit":[[{"name":"userId","size":6},{"name":"sessionId","size":6}],[{"name":"childId","size":6},{"name":"deviceId","size":6}],[{"name":"origin","size":6},{"name":"expiresAt","size":6}],[{"name":"absoluteExpiresAt","size":6},{"name":"status","size":6}],[{"name":"type","size":6}]]},"uid":"admin::session"}	object	\N	\N
52	plugin_content_manager_configuration_content_types::api::subject.subject	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"sessions":{"edit":{"label":"sessions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessions","searchable":true,"sortable":true}},"total_hours":{"edit":{"label":"total_hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"total_hours","searchable":true,"sortable":true}},"theory_hours":{"edit":{"label":"theory_hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"theory_hours","searchable":true,"sortable":true}},"practice_hours":{"edit":{"label":"practice_hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"practice_hours","searchable":true,"sortable":true}},"exercise_hours":{"edit":{"label":"exercise_hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"exercise_hours","searchable":true,"sortable":true}},"exam_hours":{"edit":{"label":"exam_hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"exam_hours","searchable":true,"sortable":true}},"notes":{"edit":{"label":"notes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"notes","searchable":true,"sortable":true}},"has_theory":{"edit":{"label":"has_theory","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"has_theory","searchable":true,"sortable":true}},"has_practice":{"edit":{"label":"has_practice","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"has_practice","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","name","sessions"],"edit":[[{"name":"code","size":6},{"name":"name","size":6}],[{"name":"sessions","size":4},{"name":"total_hours","size":4},{"name":"theory_hours","size":4}],[{"name":"practice_hours","size":4},{"name":"exercise_hours","size":4},{"name":"exam_hours","size":4}],[{"name":"notes","size":6},{"name":"has_theory","size":4}],[{"name":"has_practice","size":4}]]},"uid":"api::subject.subject"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"encryptedKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
46	plugin_content_manager_configuration_content_types::api::nation.nation	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"abbr":{"edit":{"label":"abbr","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"abbr","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","name","abbr"],"edit":[[{"name":"code","size":6},{"name":"name","size":6}],[{"name":"abbr","size":6},{"name":"status","size":6}]]},"uid":"api::nation.nation"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
49	plugin_content_manager_configuration_content_types::api::supplier.supplier	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"tax_id":{"edit":{"label":"tax_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tax_id","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","name","tax_id"],"edit":[[{"name":"code","size":6},{"name":"name","size":6}],[{"name":"tax_id","size":6},{"name":"phone","size":6}],[{"name":"email","size":6},{"name":"address","size":6}],[{"name":"status","size":6}]]},"uid":"api::supplier.supplier"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
50	plugin_content_manager_configuration_content_types::api::school-class.school-class	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"notes":{"edit":{"label":"notes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"notes","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"start_date":{"edit":{"label":"start_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"start_date","searchable":true,"sortable":true}},"end_date":{"edit":{"label":"end_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"end_date","searchable":true,"sortable":true}},"student_count":{"edit":{"label":"student_count","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"student_count","searchable":true,"sortable":true}},"subjects":{"edit":{"label":"subjects","description":"","placeholder":"","visible":true,"editable":true,"mainField":"code"},"list":{"label":"subjects","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","name","notes"],"edit":[[{"name":"code","size":6},{"name":"name","size":6}],[{"name":"notes","size":6},{"name":"status","size":6}],[{"name":"start_date","size":6},{"name":"end_date","size":6}],[{"name":"student_count","size":4},{"name":"subjects","size":6}]]},"uid":"api::school-class.school-class"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
21	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false,"aiMetadata":true}	object	\N	\N
22	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
24	plugin_i18n_default_locale	"en"	string	\N	\N
26	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
53	plugin_content_manager_configuration_content_types::api::class-decision.class-decision	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"decision_number","defaultSortBy":"decision_number","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"decision_number":{"edit":{"label":"decision_number","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"decision_number","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"training_course":{"edit":{"label":"training_course","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"training_course","searchable":true,"sortable":true}},"signed_date":{"edit":{"label":"signed_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"signed_date","searchable":true,"sortable":true}},"signer_name":{"edit":{"label":"signer_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"signer_name","searchable":true,"sortable":true}},"school_class":{"edit":{"label":"school_class","description":"","placeholder":"","visible":true,"editable":true,"mainField":"code"},"list":{"label":"school_class","searchable":true,"sortable":true}},"students":{"edit":{"label":"students","description":"","placeholder":"","visible":true,"editable":true,"mainField":"group"},"list":{"label":"students","searchable":false,"sortable":false}},"notes":{"edit":{"label":"notes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"notes","searchable":true,"sortable":true}},"related_decision":{"edit":{"label":"related_decision","description":"","placeholder":"","visible":true,"editable":true,"mainField":"decision_number"},"list":{"label":"related_decision","searchable":true,"sortable":true}},"start_date":{"edit":{"label":"start_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"start_date","searchable":true,"sortable":true}},"end_date":{"edit":{"label":"end_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"end_date","searchable":true,"sortable":true}},"class_type":{"edit":{"label":"class_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"class_type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","decision_number","training_course","signed_date"],"edit":[[{"name":"decision_number","size":6},{"name":"training_course","size":6}],[{"name":"signed_date","size":4},{"name":"signer_name","size":6}],[{"name":"school_class","size":6},{"name":"students","size":6}],[{"name":"notes","size":6},{"name":"type","size":6}],[{"name":"related_decision","size":6},{"name":"start_date","size":4}],[{"name":"end_date","size":4},{"name":"class_type","size":6}]]},"uid":"api::class-decision.class-decision"}	object	\N	\N
3	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"focalPoint":{"edit":{"label":"focalPoint","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"focalPoint","searchable":false,"sortable":false}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}],[{"name":"focalPoint","size":12}]]},"uid":"plugin::upload.file"}	object	\N	\N
54	plugin_content_manager_configuration_content_types::api::training-assignment.training-assignment	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"decision":{"edit":{"label":"decision","description":"","placeholder":"","visible":true,"editable":true,"mainField":"decision_number"},"list":{"label":"decision","searchable":true,"sortable":true}},"schedule":{"edit":{"label":"schedule","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"schedule","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","decision","createdAt","updatedAt"],"edit":[[{"name":"decision","size":6}],[{"name":"schedule","size":12}]]},"uid":"api::training-assignment.training-assignment"}	object	\N	\N
58	plugin_content_manager_configuration_content_types::api::class-subject.class-subject	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"class_id","defaultSortBy":"class_id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"class_id":{"edit":{"label":"class_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"class_id","searchable":true,"sortable":true}},"subject_id":{"edit":{"label":"subject_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject_id","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","class_id","subject_id","createdAt"],"edit":[[{"name":"class_id","size":6},{"name":"subject_id","size":6}]]},"uid":"api::class-subject.class-subject"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
27	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated","register_default_role":1}	object	\N	\N
55	plugin_content_manager_configuration_content_types::api::exam-approval.exam-approval	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"decision":{"edit":{"label":"decision","description":"","placeholder":"","visible":true,"editable":true,"mainField":"decision_number"},"list":{"label":"decision","searchable":true,"sortable":true}},"approvals":{"edit":{"label":"approvals","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"approvals","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","decision","createdAt","updatedAt"],"edit":[[{"name":"decision","size":6}],[{"name":"approvals","size":12}]]},"uid":"api::exam-approval.exam-approval"}	object	\N	\N
59	plugin_content_manager_configuration_content_types::api::teacher-subject.teacher-subject	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"teacher_id","defaultSortBy":"teacher_id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"teacher_id":{"edit":{"label":"teacher_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"teacher_id","searchable":true,"sortable":true}},"subject_id":{"edit":{"label":"subject_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject_id","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","teacher_id","subject_id","createdAt"],"edit":[[{"name":"teacher_id","size":6},{"name":"subject_id","size":6}]]},"uid":"api::teacher-subject.teacher-subject"}	object	\N	\N
56	plugin_content_manager_configuration_content_types::api::exam-grade.exam-grade	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"decision":{"edit":{"label":"decision","description":"","placeholder":"","visible":true,"editable":true,"mainField":"decision_number"},"list":{"label":"decision","searchable":true,"sortable":true}},"grades":{"edit":{"label":"grades","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"grades","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","decision","createdAt","updatedAt"],"edit":[[{"name":"decision","size":6}],[{"name":"grades","size":12}]]},"uid":"api::exam-grade.exam-grade"}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}],[{"name":"permissions","size":12}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
57	plugin_content_manager_configuration_content_types::api::audit-log.audit-log	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actor":{"edit":{"label":"actor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actor","searchable":true,"sortable":true}},"details":{"edit":{"label":"details","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"details","searchable":true,"sortable":true}},"entity_id":{"edit":{"label":"entity_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entity_id","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","actor","details"],"edit":[[{"name":"action","size":6},{"name":"actor","size":6}],[{"name":"details","size":6},{"name":"entity_id","size":6}]]},"uid":"api::audit-log.audit-log"}	object	\N	\N
60	plugin_content_manager_configuration_content_types::api::print-template.print-template	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","name","createdAt"],"edit":[[{"name":"type","size":6},{"name":"name","size":6}],[{"name":"content","size":12}]]},"uid":"api::print-template.print-template"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
28	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
23	plugin_upload_metrics	{"weeklySchedule":"30 37 8 * * 1","lastWeeklyUpdate":1774255050817}	object	\N	\N
61	core_admin_project-settings	{"menuLogo":{"name":"logo.jpg","hash":"logo_e2d7f4605f","url":"/uploads/logo_e2d7f4605f.jpg","width":319,"height":340,"ext":".jpg","size":30.9,"provider":"local"},"authLogo":{"name":"logo.jpg","hash":"logo_9b04b58b80","url":"/uploads/logo_9b04b58b80.jpg","width":319,"height":340,"ext":".jpg","size":30.9,"provider":"local"}}	object	\N	\N
25	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"],"redirectUri":"http://localhost:1337/api/connect/discord/callback"},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"],"redirectUri":"http://localhost:1337/api/connect/facebook/callback"},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"],"redirectUri":"http://localhost:1337/api/connect/google/callback"},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"],"redirectUri":"http://localhost:1337/api/connect/github/callback"},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"],"redirectUri":"http://localhost:1337/api/connect/microsoft/callback"},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback","redirectUri":"http://localhost:1337/api/connect/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"],"redirectUri":"http://localhost:1337/api/connect/instagram/callback"},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"],"redirectUri":"http://localhost:1337/api/connect/vk/callback"},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"],"redirectUri":"http://localhost:1337/api/connect/twitch/callback"},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"],"redirectUri":"http://localhost:1337/api/connect/linkedin/callback"},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"],"redirectUri":"http://localhost:1337/api/connect/cognito/callback"},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"],"redirectUri":"http://localhost:1337/api/connect/reddit/callback"},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"],"redirectUri":"http://localhost:1337/api/connect/auth0/callback"},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas","redirectUri":"http://localhost:1337/api/connect/cas/callback"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"],"redirectUri":"http://localhost:1337/api/connect/patreon/callback"},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"],"redirectUri":"http://localhost:1337/api/connect/keycloak/callback"}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
27	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"focal_point","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"permissions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"audit_logs","indexes":[{"name":"audit_logs_documents_idx","columns":["document_id","locale","published_at"]},{"name":"audit_logs_created_by_id_fk","columns":["created_by_id"]},{"name":"audit_logs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"audit_logs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"audit_logs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"actor","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"details","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entity_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"class_decisions","indexes":[{"name":"class_decisions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"class_decisions_created_by_id_fk","columns":["created_by_id"]},{"name":"class_decisions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"class_decisions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"class_decisions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"decision_number","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"training_course","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"signed_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"signer_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"notes","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"class_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"class_subjects","indexes":[{"name":"class_subjects_documents_idx","columns":["document_id","locale","published_at"]},{"name":"class_subjects_created_by_id_fk","columns":["created_by_id"]},{"name":"class_subjects_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"class_subjects_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"class_subjects_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"class_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"classrooms","indexes":[{"name":"classrooms_documents_idx","columns":["document_id","locale","published_at"]},{"name":"classrooms_created_by_id_fk","columns":["created_by_id"]},{"name":"classrooms_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"classrooms_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"classrooms_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"capacity","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"building","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"exam_approvals","indexes":[{"name":"exam_approvals_documents_idx","columns":["document_id","locale","published_at"]},{"name":"exam_approvals_created_by_id_fk","columns":["created_by_id"]},{"name":"exam_approvals_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"exam_approvals_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"exam_approvals_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"approvals","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"exam_grades","indexes":[{"name":"exam_grades_documents_idx","columns":["document_id","locale","published_at"]},{"name":"exam_grades_created_by_id_fk","columns":["created_by_id"]},{"name":"exam_grades_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"exam_grades_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"exam_grades_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grades","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"nations","indexes":[{"name":"nations_documents_idx","columns":["document_id","locale","published_at"]},{"name":"nations_created_by_id_fk","columns":["created_by_id"]},{"name":"nations_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"nations_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"nations_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"abbr","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"print_templates","indexes":[{"name":"print_templates_documents_idx","columns":["document_id","locale","published_at"]},{"name":"print_templates_created_by_id_fk","columns":["created_by_id"]},{"name":"print_templates_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"print_templates_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"print_templates_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"classes","indexes":[{"name":"classes_documents_idx","columns":["document_id","locale","published_at"]},{"name":"classes_created_by_id_fk","columns":["created_by_id"]},{"name":"classes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"classes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"classes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"notes","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start_date","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end_date","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"student_count","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"students","indexes":[{"name":"students_documents_idx","columns":["document_id","locale","published_at"]},{"name":"students_created_by_id_fk","columns":["created_by_id"]},{"name":"students_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"students_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"students_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stt","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"group","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"class_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"class_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"card_number","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"student_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"id_number","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"first_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"gender","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"dob","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"pob","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ethnicity","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"nationality","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"score","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"photo","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_approved","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"student_documents","indexes":[{"name":"student_documents_documents_idx","columns":["document_id","locale","published_at"]},{"name":"student_documents_created_by_id_fk","columns":["created_by_id"]},{"name":"student_documents_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"student_documents_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"student_documents_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"subjects","indexes":[{"name":"subjects_documents_idx","columns":["document_id","locale","published_at"]},{"name":"subjects_created_by_id_fk","columns":["created_by_id"]},{"name":"subjects_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"subjects_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"subjects_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sessions","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"total_hours","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"theory_hours","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"practice_hours","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"exercise_hours","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"exam_hours","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"notes","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"has_theory","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"has_practice","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"suppliers","indexes":[{"name":"suppliers_documents_idx","columns":["document_id","locale","published_at"]},{"name":"suppliers_created_by_id_fk","columns":["created_by_id"]},{"name":"suppliers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"suppliers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"suppliers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tax_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"teachers","indexes":[{"name":"teachers_documents_idx","columns":["document_id","locale","published_at"]},{"name":"teachers_created_by_id_fk","columns":["created_by_id"]},{"name":"teachers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"teachers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"teachers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"specialization","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"teacher_subjects","indexes":[{"name":"teacher_subjects_documents_idx","columns":["document_id","locale","published_at"]},{"name":"teacher_subjects_created_by_id_fk","columns":["created_by_id"]},{"name":"teacher_subjects_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"teacher_subjects_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"teacher_subjects_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"teacher_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"training_assignments","indexes":[{"name":"training_assignments_documents_idx","columns":["document_id","locale","published_at"]},{"name":"training_assignments_created_by_id_fk","columns":["created_by_id"]},{"name":"training_assignments_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"training_assignments_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"training_assignments_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schedule","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_sessions","indexes":[{"name":"strapi_sessions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"session_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"child_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"device_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"absolute_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_ai_metadata_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"completed_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_ai_localization_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"source_locale","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"target_locales","type":"jsonb","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"class_decisions_school_class_lnk","indexes":[{"name":"class_decisions_school_class_lnk_fk","columns":["class_decision_id"]},{"name":"class_decisions_school_class_lnk_ifk","columns":["school_class_id"]},{"name":"class_decisions_school_class_lnk_uq","columns":["class_decision_id","school_class_id"],"type":"unique"}],"foreignKeys":[{"name":"class_decisions_school_class_lnk_fk","columns":["class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"},{"name":"class_decisions_school_class_lnk_ifk","columns":["school_class_id"],"referencedColumns":["id"],"referencedTable":"classes","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"school_class_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"class_decisions_students_lnk","indexes":[{"name":"class_decisions_students_lnk_fk","columns":["class_decision_id"]},{"name":"class_decisions_students_lnk_ifk","columns":["student_id"]},{"name":"class_decisions_students_lnk_uq","columns":["class_decision_id","student_id"],"type":"unique"},{"name":"class_decisions_students_lnk_ofk","columns":["student_ord"]}],"foreignKeys":[{"name":"class_decisions_students_lnk_fk","columns":["class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"},{"name":"class_decisions_students_lnk_ifk","columns":["student_id"],"referencedColumns":["id"],"referencedTable":"students","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"student_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"student_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"class_decisions_related_decision_lnk","indexes":[{"name":"class_decisions_related_decision_lnk_fk","columns":["class_decision_id"]},{"name":"class_decisions_related_decision_lnk_ifk","columns":["inv_class_decision_id"]},{"name":"class_decisions_related_decision_lnk_uq","columns":["class_decision_id","inv_class_decision_id"],"type":"unique"}],"foreignKeys":[{"name":"class_decisions_related_decision_lnk_fk","columns":["class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"},{"name":"class_decisions_related_decision_lnk_ifk","columns":["inv_class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"exam_approvals_decision_lnk","indexes":[{"name":"exam_approvals_decision_lnk_fk","columns":["exam_approval_id"]},{"name":"exam_approvals_decision_lnk_ifk","columns":["class_decision_id"]},{"name":"exam_approvals_decision_lnk_uq","columns":["exam_approval_id","class_decision_id"],"type":"unique"}],"foreignKeys":[{"name":"exam_approvals_decision_lnk_fk","columns":["exam_approval_id"],"referencedColumns":["id"],"referencedTable":"exam_approvals","onDelete":"CASCADE"},{"name":"exam_approvals_decision_lnk_ifk","columns":["class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"exam_approval_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"exam_grades_decision_lnk","indexes":[{"name":"exam_grades_decision_lnk_fk","columns":["exam_grade_id"]},{"name":"exam_grades_decision_lnk_ifk","columns":["class_decision_id"]},{"name":"exam_grades_decision_lnk_uq","columns":["exam_grade_id","class_decision_id"],"type":"unique"}],"foreignKeys":[{"name":"exam_grades_decision_lnk_fk","columns":["exam_grade_id"],"referencedColumns":["id"],"referencedTable":"exam_grades","onDelete":"CASCADE"},{"name":"exam_grades_decision_lnk_ifk","columns":["class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"exam_grade_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"classes_subjects_lnk","indexes":[{"name":"classes_subjects_lnk_fk","columns":["school_class_id"]},{"name":"classes_subjects_lnk_ifk","columns":["subject_id"]},{"name":"classes_subjects_lnk_uq","columns":["school_class_id","subject_id"],"type":"unique"},{"name":"classes_subjects_lnk_ofk","columns":["subject_ord"]}],"foreignKeys":[{"name":"classes_subjects_lnk_fk","columns":["school_class_id"],"referencedColumns":["id"],"referencedTable":"classes","onDelete":"CASCADE"},{"name":"classes_subjects_lnk_ifk","columns":["subject_id"],"referencedColumns":["id"],"referencedTable":"subjects","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_class_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"subject_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"subject_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"students_school_class_lnk","indexes":[{"name":"students_school_class_lnk_fk","columns":["student_id"]},{"name":"students_school_class_lnk_ifk","columns":["school_class_id"]},{"name":"students_school_class_lnk_uq","columns":["student_id","school_class_id"],"type":"unique"}],"foreignKeys":[{"name":"students_school_class_lnk_fk","columns":["student_id"],"referencedColumns":["id"],"referencedTable":"students","onDelete":"CASCADE"},{"name":"students_school_class_lnk_ifk","columns":["school_class_id"],"referencedColumns":["id"],"referencedTable":"classes","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"student_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"school_class_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"student_documents_student_lnk","indexes":[{"name":"student_documents_student_lnk_fk","columns":["student_document_id"]},{"name":"student_documents_student_lnk_ifk","columns":["student_id"]},{"name":"student_documents_student_lnk_uq","columns":["student_document_id","student_id"],"type":"unique"},{"name":"student_documents_student_lnk_oifk","columns":["student_document_ord"]}],"foreignKeys":[{"name":"student_documents_student_lnk_fk","columns":["student_document_id"],"referencedColumns":["id"],"referencedTable":"student_documents","onDelete":"CASCADE"},{"name":"student_documents_student_lnk_ifk","columns":["student_id"],"referencedColumns":["id"],"referencedTable":"students","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"student_document_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"student_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"student_document_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"teachers_subjects_lnk","indexes":[{"name":"teachers_subjects_lnk_fk","columns":["teacher_id"]},{"name":"teachers_subjects_lnk_ifk","columns":["subject_id"]},{"name":"teachers_subjects_lnk_uq","columns":["teacher_id","subject_id"],"type":"unique"},{"name":"teachers_subjects_lnk_ofk","columns":["subject_ord"]}],"foreignKeys":[{"name":"teachers_subjects_lnk_fk","columns":["teacher_id"],"referencedColumns":["id"],"referencedTable":"teachers","onDelete":"CASCADE"},{"name":"teachers_subjects_lnk_ifk","columns":["subject_id"],"referencedColumns":["id"],"referencedTable":"subjects","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"teacher_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"subject_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"subject_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"training_assignments_decision_lnk","indexes":[{"name":"training_assignments_decision_lnk_fk","columns":["training_assignment_id"]},{"name":"training_assignments_decision_lnk_ifk","columns":["class_decision_id"]},{"name":"training_assignments_decision_lnk_uq","columns":["training_assignment_id","class_decision_id"],"type":"unique"}],"foreignKeys":[{"name":"training_assignments_decision_lnk_fk","columns":["training_assignment_id"],"referencedColumns":["id"],"referencedTable":"training_assignments","onDelete":"CASCADE"},{"name":"training_assignments_decision_lnk_ifk","columns":["class_decision_id"],"referencedColumns":["id"],"referencedTable":"class_decisions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"training_assignment_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"class_decision_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2026-02-27 16:42:13.675	02cfe77eec28aff4017674a705976cee454970352fff482254ad01364798b80a
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2026-02-09 15:13:35.927
2	5.0.0-02-created-document-id	2026-02-09 15:13:35.966
3	5.0.0-03-created-locale	2026-02-09 15:13:36.003
4	5.0.0-04-created-published-at	2026-02-09 15:13:36.043
5	5.0.0-05-drop-slug-fields-index	2026-02-09 15:13:36.079
6	core::5.0.0-discard-drafts	2026-02-09 15:13:36.113
7	5.0.0-06-add-document-id-indexes	2026-02-09 16:24:56.459
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_sessions (id, document_id, user_id, session_id, child_id, device_id, origin, expires_at, absolute_expires_at, status, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
83	zf57jgnkhnvpib3k1cegu4qi	1	6c7dd7646688ee4695322a47817c8c5b	\N	66632e56-6e80-46e3-9597-d14ca5382f58	admin	2026-03-23 11:42:10.16	2026-04-22 09:42:10.16	active	session	2026-03-23 09:42:10.16	2026-03-23 09:42:10.16	2026-03-23 09:42:10.161	\N	\N	\N
85	mfuxw0vr6qyjt76mkug54ld7	1	8885013c25e7762b1834492b666269a7	\N	66632e56-6e80-46e3-9597-d14ca5382f58	admin	2026-03-24 03:11:04.724	2026-04-23 00:28:44.195	active	session	2026-03-24 01:11:04.724	2026-03-24 01:11:04.724	2026-03-24 01:11:04.726	\N	\N	\N
84	w8inpvsmpufafwpnc4stwsu5	1	c8591adceb6b9defa265eef85eb34369	8885013c25e7762b1834492b666269a7	66632e56-6e80-46e3-9597-d14ca5382f58	admin	2026-03-24 02:28:44.195	2026-04-23 00:28:44.195	rotated	session	2026-03-24 00:28:44.195	2026-03-24 01:11:04.739	2026-03-24 00:28:44.196	\N	\N	\N
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: student_documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.student_documents (id, document_id, name, url, date, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: student_documents_student_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.student_documents_student_lnk (id, student_document_id, student_id, student_document_ord) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students (id, document_id, stt, "group", class_code, class_name, card_number, student_code, id_number, first_name, last_name, full_name, gender, dob, pob, ethnicity, nationality, company, address, score, photo, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, phone, is_approved) FROM stdin;
190	fylhikge53alitdvccoxv6im	\N	Nâng cao tàu hóa chất	ACT	Nâng cao tàu hóa chất	564564649846	564564649846	564564649846	THO	THO	THO	Nam	02,05,1995	Thành phố Huế	Kinh	Việt Nam	\N	PBC	\N	data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAYYAAAGBCAYAAABihRZdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAADz/SURBVHhe7d0PXFRloj7wB/+7qYmWedUkqVBcRdQtWnYtdfVCkm55CRXD8BrVdl13uxrarubPtFuYbnfNLct1dSVRidsWpkl2BXOXG1sqYitKhmHqmkm4aqsSOr/3PecdmDMOIzDnzBzG59tncs57hnk5M8z7vH/OzIQ4BBAR0TXt1IVz6hrQQv1LRESkYTAQEZEBg4GIiAwYDEREZMBgICIiAwYDEREZMBiIiMiAwUBERAYMBiIiMmAwEBGRAYOBiIgMGAxERGTAYCAiIgMGAxERGTAYiIjIgMFAREQGDAYiIjLwMRiOImvaeNw1cjym/+m0KnP6CPNF+ZTMo2q7gc6Jn3tA/NzGRv5cA5z98+8wMXUx8r5WBVdRuEge20soVNsN8mUW/hH/PP6pNomImhvTRgyfvLIceXXfDNd0He7CglXp6PPmS8g6rMpMcvZYOb449hUqz6sCM10qxtmHpuHs9hNAl2pc/t0vcPr/vYcatZuIqLkwJxhu7IWI9ruxZOlHOKuKfNJFhEPOUiT3Udsm6TFhKT7aJu63tyowVX+0WzwTLU7sgePrYlzuMhXtZgxDiNpLRNRcmBMMHe7GU08Mwdkdv8PL/1etCq90dl8O5iRP0Kae7k5ehNzVi7Xr8/+s768++B7m/ywFd4syWT562kp8Ikchh7IwXmyn5bhMV339DtLcy5y+2YVltfczAaOf+QCVovh45gyxPQNZR/SbOaeKcvdlYXqCftvxc97DF5f0/U6naveL3+kX71yxX9OyDVp3+gaXPz6HkOguuLxjP0Ku74CWajcRUXNh2lRS1/jp+NXAb5G7+I/Y56nh/Po9PP2fWShoeRd+tfxVrH0iHAW5H6mdulP79qHjfXOxIecP2DBzCNocfg/T/1vc5rYf4l+7A/sKdmgNvHR86/9iX8shmJzQWZU4nUbugueQdawvZr3+B2x+fTpG4FtcVHuvtBOvrW2D1NeX4jfjeuH4X1diSa5r2OzEkle+RfJv5f4+Itz+6La/TvXunbgU+Si+98LP0bJ6D2q+UjuIiJoR04IB6Ixxc9Pwg3Oi1//7KxcHjm//AJ9c6obU+U9iXP+bcMuPk/HCY0PUXl2PxHTMSuiLHl0645aEVEyWU0mHj+I4+uDB8X2B/R8hX1s4PoqCgqPoGP9TDG8vt+vTGh1vG4Zfzf8peqiSK/XF1PRE/KBnH8T+/EHEiZJP/nZA36XphcefTkPsbWL/Y/diuCgx7q/T5u6n0XnhvWjdMhod//Airqu/UiIi2zIxGIQb78WvHumD4xtfwhq3bPiiXBb0RdRt+rbUpsN16pqu+thOrFjwNCZO+HeMjp+BZS730TVhDIa3PIi8HaK3fuQjbD18HeKGD1R7XYmAejodiTfuw389moK7E8T9/NVzD1/XDT1uVFc9zvv0wS3ONYn2HdBWXSUiClbmBoPQI/FJPN7nKFY8/yZcs6FH917i/4fxhZrflypPnFTXhPM78UzqS/if83fh2d/8BhtylmKG6+Jz+2FIjL8O+3b+Hwrf/wBl3e/FuKFqn7vud2HWqo34cOMCpPY8iqxnlqPAijORiIiCkOnBgJa9kJo+Dj0OHUaZKpJuGXYXeuAoli1aiYL9Yt/2lZjz+4Nqr/DNNziurU20QZv2F1G5dR3WuY06fvCTu9FxXxae23wSA8ePQYQqNzqKnMUrUXjoNM627IAeXYyjEiIi8s78YJD6puKFCd3UhnJbMlbO/wkijr2HOdPnYM77oZjx82HarrZyCqfnKMx4QIwqdq3ExAkzsOz0XYhzP101ehT+rfu3qPxHX8Td477o7NQBN1Tvwvyf/TsSEmfi5WN9MeM3T15lLYKIiJxCHIK67nf7Xv53pP1JBETmUiT3VIXeXDqMFSkzsabPk/jwuWFibEFERGY4daHuHcrWjBg82oUVT2Uhb9dhVB47iILfz8cc+TEad96LsVcNhWqcFT+TuzgDa05ch8QHGQpERFbx44jhMNb8bCHWybl/uZbQvjMG3jMVC345DD2u1sofycGU1CyUte+FxPRfY9Y9N6kdRERkBtcRQ0CnkoiIyB4CNJVERETNAYOBiIgMGAxERGTAYCAiIgMGAxERGTAYiIjIgMFAREQGlr6P4ePySyj87DI+PXoJx6qAs+cd4JsmiOhaI7/it2P7EPQMBQb0aonY21vgjnB7fb+j5W9wy9t3CVmF36FNK+Cefq0wqHcL9L4hBJ3ahSCEX4JMRNcY2cqeueDAkVMO7D1yGTsO1KC6BkiObY24gfYICMuC4cx5YPHmalSecyB1WGvE3MqZKiIiT4o+v4w1O79D1w4hSE9og04B/gRoS4Lhy8rLeDq7GneLEcKjI8RQgYiIrur1/Bp8KEYQzye1wc1dA9eZNj0Y5EjhiTUXMG5IKyTFMBSIiBoju6gGubtr8Epqu4CNHEz/rCQ5fSRHCgwFIqLGk22nbENlW2oHPgeDXGiWawqcPiIiajrZhsq2VLapgeZzMMizj+RCMxER+Ua2pbJNDTSfgkG+T0Geksqzj4iIfCfbUtmmyrY1kHxq0eWb1+T7FIiIyByyTZVtayD5FAzyHc3yzWtERGQO2abKtjWQfGrV5cdcyHc0ExGROWSbKtvWQPIpGORnH8mPuSAiInPINlW2rYHkUzDIX52ffUREZB7ZpgY2FnwMBiIiCj4MBiIiL9asWYMvvvhCbdWRZXJfMPLps5J+vPA8/jwvwB8JSERkEdn4jxgxAqmpqQgLC1Oluh07dmj7H374YW2/mQLRtrp+VhJkMDTVj579p7pmgYp1jp9Exjh+suqYKrjS9tkxjrDIZxzb1bbRRcfbvxT7f5nvuKBK/K70VcePIx9wvFiqtomo2Vi9erXsNDfokp+fr37KHJa2rfX4+vzZ2kvwTiWdyMUf84D4+Fi0VUX+Vpj9P/iy97/i/n6qgIiCkqeppuYsaIPh0JtZ2N0xEVNGtVElfvbPAqx98yyGpD6I21QRETUvw4cPhxg5eL3I2wQb+wTDiQLMThqNW/rfhVtipuC5wlNqh9NZ7P7DHNwxWOzvfzfumJGLv9X75sAyvJ17HDc/NA6xzm/NO5KFUeK+R71egI0zxuv1jPhPbCyvFiGi7nfgaCRkfIIz2g8U4hfyNnNyUZgxBX0HiuuDJ+K5orM4U7QMCTF1v8chD7/Hxfyt2IrheHhcV307b464/Wg8U6Rt6oqWoK8se3MFhom6xm+oVDuEEzkYL8t++1L9+zZ8jCXx4vd4KAdfq11AJdY+5F5GRE1xyy23aOsH3i7yNsHGHsFwaR+eSZqDjScGYvprG7BzVSLOvJGFQ2q39PWbT2P8kgK0G/crbN62FotvL8Drm9VOd0W5WHlsINIejFAFdQ69ug5/e/A3+OC1ZHz/VCFmpz6Axwt/gDXZyzHrB8Df/vhfeP2AurG0+TWsDZuLzetnIb7jF1g5YyJ+8jIw640NWDHuBnz9wX9hyQfun6FeiY3rC9D2wUT89Ht6Sdth8YhveRYb8z7RC4T8P+XgYu9/w5QHR+KnvYHd7+bXNuZfbsnF7pYiWNIS6t837g7cn9BD7MzDeyfUziN5WLsbiE8ZhxtVERFRY9gjGAo3Ya0YIMT/+gXMGnYLbh4wDhkvpLo0bMfx9puiQe2ditULxuH7PW/BiJ+/gIWj1G6DaryzQTS4Q+Jwb3dV5KLtA4/hWVHHbcMex6MjRMGpgfj5c4n4/u0/wPR/lwXH8eXftZvqBk3FwokRuG1AIn4+XjTCZ9tiwpwZGHH7LYj/ufg5cZNDx9xGNwfexMrdHTEhTiSN0/eGiwDoiIubC1AoRxiXCvG2CDZ9qikCD6cOdGngj2Pru2UqWLztA257MBlDsA9vF+gjii8/2IpDgZxCI6JmzxbB8GW57KJHYGikS2PWqROuV1eBL3CoVPwTHeUyX98GnVRv3ODUVtErr7/HfHMv0bhrnD/ftu5+wkRgqKu1xO2d99OpUwfx/w64vpO+DRFQntYPdv+PXHQWI4EYVaDEJv0bbj6bh61y0PBhHt65NBD3D9enmm4cN1mMKFQDf6QAGw/UBYu3feg+Dg/HOUcUKjQShtdNoRERNZItguHmnn3E/8vw6ef6tubvoueurgI9cHO4+KfsC5eySnx5VF118fUHm1AYyB7zpU/wdm49i879HkTakLPY+EEh3skV6RU3GROcoxo1otid9xfkv5ODQ67B4m2fCLifTkxE290F2L4zF2sP9EBakstIhYiokewxlRQ7QvSIgXfmz8HKIjE6KMrC4wtFw1nrFsSPEj39A8vweEYB/vZZGbZmPIcln6ndtcrwxzX7jIvOfnbxgxys/WfdorNRV9z70x/gYu5zmPdBR0yZONxwKm3sfXFoW/QafvHm8SuCxds+xMRhQsdP8NyvN+HLIcl4mKfHEpEP7BEMoke8+I0ZiP9eIZ6bOhEJS4/j/l9Nxs1qt3TbEyuxYmIEDr0xBwlJc/D2jVPxa7kk4EouOh/pgZ+OvnLR2T8qsTGzABgVL45FFbm5MSER8f+sxJnvxSHevWM/ZBzSeot9p+qmmGp524eBmPJQD7GvEkPuG8FFZyITyLONCgoKMHXqVK8XeZtgE1QfiVH47Ggklz2Gj99IDEzjKE8jHfkaBqzehmfd1hdqnc3D1Nj5OPToWuz8uVuAXSrDkoQpWB75Ag6+ZBxNeN0n/O2/xyNhVQR+W/RC7ZlQRNR08k1rstGvqKhQJfWbP3++umYOfiSGWb7Ndzw2IMbx2NaLqsD/Plv2gCMs7lXHZ2rboOai4x9lf3G8+OgYR9iA/3Bs+Lsq14h9Rw86NjwzwREWOcYxb5cq1njb53BcOHPM8elbzzl+LI594KISVUpEzVmgPxIjeILB7rY/Ixr2GBEcsx2vF59RhYr6XKiwO1Mc6dtOqULF2z7HMcfrD4h9A0Y5xizId5ysUcVE1KwFOhj46apERDYT6Kkknxaf5Ze3NT1WiIjInWxTA/3FmD4FQ8f2IThzgclARGQW2abKtjWQfAqGnqHAkVMMBiIis8g2VbatgeRTMAzo1RJ7j1xWW0RE5CvZpsq2NZB8CobY21tgx4EatUVERL6SbapsWwPJp9rvCG+JapELRZ9z1EBE5CvZlso2VbatgeRzLCXHtsaand+pLSIiairZlso2NdB8Doa4gS3RtUMIXs/nlBIRUVPJNlS2pbJNDTRTJrLSE9rgwwM1yC5iOBARNZZsO2UbKttSOzAlGDq1B55PaoPc3TUcORARNYJsM2XbKdtQ2ZbagU8fieHuzHlg8eZqVJ5zIHVYa8TcakruEBEFHbnQLNcU5PSRHCkEOhRcPxLD1GBwytt3CVmF36FNK+Cefq0wqHcL9L4hBJ3ahSAk0O/1JiLyM9nKync0yzevyfcpyFNS5dlHcqHZDmsKkuXB4PRx+SUUfnYZnx69hGNVwNnzDvB90kR0rZH9YfkxF/IdzfLNa/J9CoE+JdWdacFw5MgR7UssLl26pEqIyCwtW7ZEWFgYevfurUqIrGNaMOzcuRPR0dHo2LGjKiEis5w9exbFxcUYNmyYKiGyjmkfuy1HCgwFImvI1xZH4xQIPG2IiIgMGAxERGTAYCAiIgMGAxERGTAYiIjIgMFAREQGDAYiIjJgMBARkQGDgYiIDBgMRERkwGAgIiIDBgMRERkwGIiIyIDBQM1WVlYWMjIy1Jb/yboDWT+RVZpdMGyZIr8edDK2qG26NslQ+I//+A+88MILbJyJTOanYDiMpQNlg+7pIht5tX/gUnHNmy1YlxmJJZ+twxhVYhY9cK68TN6kbtAIh1/s73If/bH0kNohGPZNcYm3Q0vRv/ZnQtD/RddHYgsm1+4z3t+1yDlSmDNnDpKTkwM+ciAKNn4Khj6Yuc8B+WVxjtxkrSRycbm+7WhMIz8G6xz7MfM2tWm6ZGzWfif9sjlFNELjGjk6EQ18Qnpp7fFtTinFrAdU4Kl9ybni/j9bgsjMBBUAIhgfmIXSAUtQLusWj1FpeoIKABkKCdij3V85lgxwub9rkDME9u7dq23Lr73ctGkTw4HIRDabStqNubUjC2ODbOzRO/fVjTSW1u6v7+f6Y/IU2VtveI87cmCk+P8elKrbexsJ1LptJvaLxn3/U320Te0+Pl2Ft8RtD/9pFURkYIi829vGY9oAoHTtW+IoVHDumymuyR8aIm5VilV/Es3/pnXIElvTHpB73G53jXEPBSeGA5G57BUMn+7BkD+p3rRoDmc5p1M2TUbCHtWbVvsSXKdhRMOLZ+r5uUzn6GQzhuwp1csb5DDeWitvPxiRcoSi9fYHqxHFZjG2aEjPfQvmihGC8z5K97ncn2jaIweLfz7dLe7JaMuzYvQg/h3crw8OH9gjr2H3s85Aqn8E89RTT7kEV91Fljd39YWCE8OByDw2GzGoRvO2SHHN2ZAKY9dpveRS2fu/XW80jTz/3JY3s8T/63rb46fIrro3InBqG9RwzPoUSM5VU13aSGAdIrVRQ4K45dXI0Yy6XcrkBk+XyVGJDDM5rTV5rFYkZGHPQOdUkvgd61mLefHFF/HQQw+pLZ3cluXN2dVCwYnhQGQOewXDADmFciXnFE4CNqveupt6fk7n7KE3hHGNoXyxGH+MUwvBYvQhf4fwtdPEyEU20OpH6rFlih4s2n2ubWAsiDrCtRGGSyBp6sJNH2XoU1OeZGZmYtSoUdp1+a/cbs6OHDnSoFBwcg0H+bNE1Hg2GzF4oqZ05MJsQxtYg7o1gsbq88C02sDRRx+ikW/A/H5dr994BpVxzeIwSuUskTPU5FlJ4/RxiJz6WqdGC336ySSoo9+Hd+vXr8eAAQO0f5s72dA3NBScnD8j//WVDJdBgwY1KmTkbeWptAwmaq6aQTAY5+IPvzirAdM4ujEPyrGFWsStne9vOH2xWJ/rNzTqm+aq0YAH6swjKTnXeAaVHjSl2K3tFv+K+4icMl4coTorSRanbK5duNaMnSziqBSznpUrC86QnIbxXkZBN9xwAz766CPtX/KNDBd5SuzYsWMb1NA7Q+FHP/qRKcFEFAjNIBhEA/+MWnCWUznpojGV0zh7Sj3OsxuMXaedclqaHo6QkFmi0b1ab9t1jUHWpZ92KnvvfZ5aojfQt4t94/bov4OHhWNnmEhyGkq/L3UGk1ynyE1W5QnIcobAobewyhk0mQm19eunso7BOnVqq77u0bBRy3XXXaeuka9mz57doHBwhsKkSZO02xM1Ww4f5Ofnq2s2lZvskIeYnKtvipAQ28mOzfomNXMvvPCCdvEXWVdUVJSjoqKidttZvyy77777HOvWrdO2zWL71xgFja/Pn629NIsRQ5ONXaQtEjt77nLe37ioS9Rw9Y0cOFKgYBPcwQCXd1yri3NRl6gp3MOBoUDBKMiDgch8znCQp8TKC0OBgg2DgagJZDjID/H73e9+x1CgoBMiFx3U9UYrKCjA8OHD1RYRmY2vMfKXUxfOqWscMRARkRsGAxERGTAYiIjIgMFAREQGDAYiIjJgMBARkQGDgYiIDBgMRERkwGAgIiIDvvOZyMbka2zuzhi1Rc1ViLh0bB+CnqHAgF4tEXt7C9wR3lLfaROu73xmMBDZGF9jwUG2smcuOHDklAN7j1zGjgM1qK4BkmNbI26gPQKCH4lBRORHIWLIcL0YMQy8uQUe+lErrJzWDk+MaoO3d9Vgbk41zpxXN7QJBgMRUQDE3NoCr6a2Re+uLfDEmgv4svKy2hN4DAYiogB6dEQrjBvSCk9n22fkwGAgIgqwpJhWuLtfKyzeXK1KAovBQERkA3LkUHnOgbx9l1RJ4DAYiIhsInVYa2QVfqe2AofBQERkE3JBuk0r4OPywI4aGAxERDZyT79WKPwssGcoMRiIiGxkUO8W+PQoRwxERKT0viEEx6rURoAwGIiIbKRTuxCcPd/kTyoyhf2C4dBS9A/pj6WH1LayZUoI+r94WG2ZaQsmh4QgxHC5sn7TbJrsVlfdZfImdRszaY/nlY+ddY+n5P6YThYlVvHz86ccfrG/oU5Lnju6Jok/JwQ2FjhiqJWc64D8PEF5KV8MzHpgKSxpNseuq61nc4rYTtlcu71urH4TK5Smz7WwcXYlG+oE7FlcXntc5Yv3IMHScPDj8yfIUAhPH4zNqj6HYzMwjuFAwYPB4EGfB6Yh8tPdKFXbzV8yklOykDDFD9FwqBR7EIlpD/RRBeLxfGqJ+A2ysM5PDae1z98WzE0vFUG0DmNUCcS1dbniCH9lXRgR+RODwYPDf1qF0pTJLi/85m/y2s1Izpxl+RQLbhuPaQNKMet21x60aDhFz9rKEZErS5+/TetExCVjsvuxyJHgvpmoi0Oi5sumwaA3LK5zuAmZapdFssbV1aVNE6wNpliQxmCRxVMsuj6Yuc8Bh+xBuzymVk+z+PX5GzBEjImIgpdNgyESSz6rmzOWF20+3kKuc9SOz4Zglh8WMP2tz1ObsQSzMNcfUzouaymOz5ZgzzhrH0+/Pn9BNc1IdCVOJXmipkN2B92rX/Tm/0v25CdjnSoxnTzryn0tw9+Pp5X1jZ3seb1Env01kGsMFBwYDJ4cegurPo3EkGCcLxA9+c0pWciyampONpyZCcapo01zMcufj6elz5+ckovUwrUu/rZg8u2zgCnjucZAQYHBoLjOUYeIF/ng3P2YeZvaGWTGyIVodd18cqFZP32z9vEctwdLPrP28fTn89fnqf3qFFxnnfrpufufYixQcAhxyEnZJuIXlRNZi6+xa9OPF57Hn+e1V1v+cerCOXWNIwYiInLDYCAiIgMGAxERGTAYiIjIgMFAREQGDAYiIjJgMBAR2Yh8A0GIuh4oDAYiIhs5c8GBju0DGw0MBiIiGzlyyoGeoWojQBgMREQ2svfIZQzo1VJtBQaDgYjIRnYcqEHs7YFtmhkMREQ2UfT5ZVTXAHeEc8RARETCmp3fITm2tdoKHAYDEZENvJ5fg64dQhA3MLCjBYnBQEQUYNlFNfjwQA3SE9qoksBiMBARBZAcKeTursHzSW3Qyb9fwVAvBgMRUQDIheafrbmII5WX8UpqO9zc1T7NMYOBiMhi8mMu/nHegX1fXsYbf6lB2qoLeOWDatw/tBUWJdpnpODEr/YksjH5Gpu7M0ZtUXMlP+BCfsyFfEezfPOafJ9CoE9Jdef61Z72CYbi1Zi9/oDaAPpNysDUaP36ya0ZWJr/jb4ROQkZqWqHL7zUV6cYq2evBzzua6SGHp9kxjF6PT79uPS9XTDyydmI665tNF099V1xbBoT6vR2fCfykPHSdmi1dh2Jmelx6KbtMN+2x0Mxt38ximaEqRJzsfNF/uIaDGKI03T5+fnqmq/2OP6Q/gfxf2XPHxzpzu2/b3W8kLHV8ZW24yvH1ox0xwvv6VtN56U+F3tWp4vydMcf3Hc0mvf6ZD2+H5Mrb/W5PYZyX+3j21QNezwl7TFd7WlPY3irT+6re87Mqc+z9x/r7OjcubPjzt9+oUrMZ95rjMi7r8+frb3YZI0hGlMzpor/K9GD0U/0Z/cUi+vd4zC7tsfXDYOjuuCbE8e1rabzUp+T6JGuF6X91KZvvNV3El+dFEfW3cw+rZf6TuwR44WRmBqv6oueigyfe9QNeDwl0ZPPK+2HST6P+Lwd31fiEe2CHmo00qN7F/EQyzIzVWB5bCiSkI3sCaqIKIjYc/HZ7cVd5yT2lHyDLt17qG2TXFFfMVavP4mR8YPVtskM9R3H8UrgwPrZmD1bXlaL2k3mWp8I1W9ECuxZ7KwvA3kn9JuZpp7nr3jrdmBEQl2DbhbX+roPRnTXb1BcrEfB8RPfiNS9yeSppDBML6xC1YrRapsouNgwGE4ib61sQKYa56DlnPLspdhe2Q9xzt6uKa6s7+TWPJx0r980bvWpRm3kkxnIyMjApMgDWL9Y1K/f2AQeHs/S7Tj+r3p9M0cA29daXJ+kRgvmPneSe33dEJc+E9ElS7Xgy+s+05w1KaJriM2CQbzIF4vGv9skzHZvQOSUh2jIMiYB603rVXuoTzRgq0ui66ZaTOWhPjlVllG3EBsdPxJdKouxx5RefD2PZ9eRSFBtZbfoaOvrE04WF+ObSNGbV9vm8Pz8ZYi/D0zRg28qRIfC1KAlCn42CgZ5psxSFEddpYfXvYfoX5/EVz43ZJ7r0xqwyu1Yqk2z6GfuyGme1T4nUQOPT9MNN7n2tpuknvrk41d5HL6u0lzJ2/HpU4D9RAiZx8vz1zUag9XjZ27wEV0bbBIMsue3HidHzLyip6lNIbn0+Nxf+E1Tf33d4mfrIxPtMklbfPZ8KmtjNPz45Dy87z1rL/Vpc/B1C8NafRY+njq5jnLlmkPTeXn+3IJA+3sxJWiJrh32eB+D63nnLjyfC98Pk1zPSGmKq9RXR/ZKTXgfQ2OOz4zz7q96fPpx6e8C8MPjqe0/jjhf63G6Wn2G9ziY9D6NevB9DBQs7PkGNyK6Al9j5C+uwWDP01WJiChgGAxERGTAYCAiIgMGAxERGTAYiIjIgMFAREQGDAYiIjJgMBARkQGDgYiIDBgMRERkwGAgIiIDBgMRERkwGIiIyIDBQEREBgwGIiIyYDAQEZEBg4GIiAwYDEREZGDTYKjA8thQhIaqS+xyUWIt+d29zvpillldm4vy5YgJjcHycrVtEdfj88sxasflrC8N21SxFdyPzR91YmtaXV2PW1oTkd/ZMhgqliUhc2IxqqqqxKUYCzEPSVY2ZOJFnoRsVV82ouZHI22r2mcpEYAPzUOZ2rJOBQ6WAInr5fHpF6u+vF63DWlD5yFK1Ve8oARJFjaeo1fUHZf29xIJRCyYi9Fqv+lk6E0qwcJdqr6SJP92JogsZstgCJtR5NJwhWHsxAiUbdhk3aghfiWqVjibkdFImgCUlFn/QtcCMCoREWrbOmXYWxqBQdZXpNuajZwJ2VgZr2/K57Pu8bXY1kWiG7EQ2VYGX9le8YhGoW+43AhD3yhRtN/6eCfyl2axxqC96KL6ipegP2xD9kZRXYTFtYleZ9L8KCxKH6QKLFR+ECWiKZs3VE19WDw1V1FWgoj+B5Hmr2mdWmIE9mwOEp+Zbu3fSnwSEpGDbG1UqY/GIvr7K3WJrGf/YJDTPBsTke2HHmfFshjRiCUhJ3Ih5qrerlW2LZZTLSutm+5wpfVwxWPonGoRfepoi+fFy+ZnYpA21VKF7Ak5lk4l1VKjBaufOzmqXFmVDUySoReNvc9YPTVH5F/2Dga5wKfN5fqnAdWmPOSc+MRMRFvZq1ZrGs6pFsvJqbIq52MYhunPJAIbs63txU9YhOnaVItoRu/3Q33CtrdzEDFxrPUjS23hORtJal0j6W0REFyApiBi22DQeu+TIHq5RbUNjL+ERUQBpbKXbQ3ZgGFjkj7NMlQuPstpHuvPTDKIHGTZ2ob2+JUctHS66kpyCjACKfdZ33PXnr8JSbWdFX8FH5G/2DMYRI8sen6UCAX/jBS0EHLp8bm/8M1mOItm10LRQEeIUZF1AWg8Pn0e3tKetZyDL83EJi3o9PqsfDw12jqKc0HYWu5BoP29WBi0RP5my2DQXmjIQVLt4qW4WDi1I6eQsqF68OKSVLIQxf46i8YPjMcXjXlR2RbPiY/Gyl0pyNQWu0V98MPjKddR/NU4x6/UT8F1/r3INbBCixe8ifwoxCGo641WUFCA4cOHqy0iMhtfY+Qvpy6cU9eaw1lJRETkVwwGIiIyYDAQEZEBg4GIiAy4+ExkY/I1NndnjNqi5ipEXDq2D0HPUGBAr5aIvb0F7ghvqe+0CdfFZwYDkY3xNRYcZCt75oIDR045sPfIZew4UIPqGiA5tjXiBtojIHhWEhGRH4WIIcP1YsQw8OYWeOhHrbByWjs8MaoN3t5Vg7k51ThzXt3QJhgMREQBEHNrC7ya2ha9u7bAE2su4MvKy2pP4DEYiIgC6NERrTBuSCs8nW2fkQODgYgowJJiWuHufq2weHO1KgksBgMRkQ3IkUPlOQfy9l1SJYHDYCAisonUYa2RVfid2gocBgMRkU3IBek2rYCPywM7amAwEBHZyD39WqHws8CeocRgICKykUG9W+DToxwxEBGR0vuGEByrUhsBwmAgIrKRTu1CcPZ8kz+pyBQMBiIiG5EfnxHYWLBxMGhfYK++U9f1i/pNV74cMaFptV/srtuGNGfdFnzX9LbHQxGzzP1eZZ0xWK59gb6JPByfrL/2sb3i2H3koT5Ln0uPz5+T/jymbVWbZrja8VlxjER+Zs9g2JqG6PnAwl1VqKoqxsKSJA8NqQnki3zoPJSpTV0FlscmoWRBsai7CtlR8xBt4gtdNspJG9VGLdmAJSFHbZnG0/GJxzYJ2dqxacc3IQdJZh2fp/pEWdKGFBRr9Zn8XHp8/upse9zkx7Se+sr2lyFC/b1olxWj1R6i5smWwVBRVgJMWITp4XIrDNOfSUTZhk3m9txFAxk6NBMp6xciQhXpyrC3NAIp94VpW6PvTwQ2ZtfTI20MGTgiFESjnD1BFUmysRGhgPXZEDWZp77ji19paLhMO7766gufjqLC6eJZlMIwdmKE1pD6rN7nT9ECMNG8x7Te+ipwUPy5RkXoR0gUDJrPGkPp3np7hk0iG8iqIkx3b1XKD6IEUeirhZIQMUg0BCU46PMUjwi4Qg+9Sdlwil7myni1bZb6js+NFsKR8hh91KD6KrBpg+hd9/e5tqvUJ0Zgk0qwMF0ErlnqrU92JICcSc6pJJOn5ogCwJbBEBYRJXqxc2vn27e9bfokS/3KTA4gO5PTPHLK7g1nj95CsscdGo15pYlYNMPa2iqWzUXJgmw14rSY1pGIUNOeamrOgnUpIn+y54hB9M6yJ5Rh3lC9F6ZNspjRq20IbYRwDVDz5VHrRS/YHw2o1uMWjed6IMnKXrUMuw0pyLY4fGppI766x3B0+kJElGZik9knERD5kW2nkkavUAt54jK3v5zE7Wt9r1YK74so16kjbQThMrUUDJzz5aKXa/oU1tWYNjXnWcW7mSgrnYdobVpHX3yW0zymnpl0VUH290LXHHsGg2y4aofj27BofhkS7/fXmR4RGBRZhsx3Ve1yGmtCEoLmPBM5UpDz77v8NFIwPJeq4Y5MwViL6g6bUVTboaiq0hf0E9dbGIBux7dt8TyUBdPfC12T7DuVJE8TVb0+eeqo/3q2cpE4G1Hzo7VprKSShSgOotMPtYZZ/OecprN8wVQ8l8UTM9VzGYro+VHIrj1LKQi4HV+w/b3QtSnEIajrjVZQUIDhw4erLSIyG19j16YfLzyPP89rr7b849SFc+qajdcYiIgoMBgMRERkwGAgIiIDBgMRERkwGIiIyIDBQERkI/I80RB1PVAYDERENnLmggMd2wc2GhgMREQ2cuSUAz1D1UaABO0b3PZvnY+25UvRvsW3qsQa5y9fh4vhM9E/foEqITIP3+B27XnjLzWoPOfAL+JaqxL/uCbe4OaPUJBkHbIuIiIz7DhQg9jbA9s0B+2I4fgKfY6uZ7m1X6t9LFyvp8fj1tZD1yaOGK4tRZ9fxisfVOOPj7VTJf7Dj8QgIrKhNTu/Q3Ksf6eQPGEwEBHZwOv5NejaIQRxA1uqksBhMBARBVh2UQ0+PFCD9IQ2qiSwGAxERAEkRwq5u2vwfFIbdPLvJ23Xi8FARBQAcqH5Z2su4kjlZbyS2g43d7VPc8xgICKymDz38x/nHdj35WXtfQppqy5oZx/dP7QVFiXaZ6TgxNNVfcTTVclK8jU2d2eM2qLmSrYS8mMu5DuaB/Rqqb1P4Y7wwC8yu3I9XVUkWdPl5+erayb6/GXHnZ0fcbyvNnXvOx7p3NnRWbvc6Xj5c1XsxbFXoV3wlAg+L5eZh/Tb/2+ucdudc7/7xVlPg3k6Pq1MHd8PX3Z8oYpN4am+9x5Rj6WJ9bnep7g88p4q17g8f36pT/fFb+90dH7M+JfUZF7qe/+xuvLOV/zt+saS1xiRB1+fP1t7sddUUvlyxAydhzK1qavA8tgklCwoRlVVFarWR2HeQ8tFqe9+PwtYcqvaUJa+JtI9XV02Aadl4UngJzu13b7xeHzbkCbKotaLYxPHlx01D9GPm/TV/J7qk2WTcpBoan3iGCYB2fL50Z6jRORMShOlkvH5s74+XcWyGETPNz7STeelvq1pSEK2Xi4u2RNykGTW80cUIPYJBvECCx2aiZT1CxGhijTlm5CJhcieEaZvx69EVeF0qK0mk6EwrZvaqMfvxQi+s/h31RJ92yf1Ht9BlIiSQaowor+4UnLQ9+Crr76yvSiLXIi58frm6HSxf2O2oVFtvNFYWbVS/F+JT4JoOpG9VW6UYW9pBFLu05+x0fcnApbWJ5rxx0MRvSEF2QsMR+4DL/XJv8cVtXtMOj6iwLJPMMgXWFURpru/lmVDFgVsig1FaKi8xGB5udrno+1iRLBKjAY8Ggb8mwiO058Dj6gin9R3fOFjkRJZhsx39Sgo2y96uVF9fQ6+euvzqAQHTXpMNa5hp12PQt9wfRciBok9FtYnjF4heu+i89CgQ28Kt/pcVZSVAJHyGImar+ZxVtLGedj7jD5UL14AU6aSHhGjAG/TQzP766OF3fv1beuEYXphMVI2RGvBN7d/saEHajrZMJfOwyLVu654N9NtastXFVj+0DxgQTamyzCQwa7vsIhbfZbzUl/5ciTNBxa+4fuIliiQmkcwuEx9hN2XIhq2TGwys8fpwZge4n/ngS1mrC14I+f8Q5OAN9QcNZIQGmvOGopH4dO1KZacSfoILGl/lOjduvTofSLXE6IxLyobRc6pP22EYBUP9VnKS31qPSdqvRil+SWgiKxj/2DQerhW9zrdDAOGtAdOHwes/kBtrccemYKxqjHxR/CFzSjSQkheiu4XnXpTpj62IS00GpkT3UY84X1F7LhMHWkjCDOCqJ76LOOlPud6zq4qrFQdGKLmzP7BoM3BuywsLp5naEgt8S/6NNLfq/RNK7kHgT61Y1YP3gNthOJyxtCzOYiYONbHqQ/Zk9bPPLqy5x6BQS5rKNvezgEmJNUt5DaJt/qs4KU+7SyvEizcxZECBY9mMJUk5+CzAefUx8ZEZJtwVpJthE9HkTwFd6h+fNFyjnqXyxkwZtOmkkqQpC3kmzQNI88cKxWDgfn6OonzkqaFuf78Ral9SSULUexrD99rfRbwUp8e5GW1z59+MZ46S9Tc8J3PPuI7n8lK/KIe8hd+UQ8REdWLwUBERAYMBiIiMmAwEBGRAYOBiIgMGAxERGQQtKerfv5KB7Rv8a3astb5y9fh1idcvuSCyCQ8XZX85Zo4XfVi+EytwbaarEPWRUQULIJ2xEAUDPgaI3/hG9yIiKheDAYiIjJgMBARkQGDgYiIDBgMRERkwGAgIiIDBgMRERkwGIiIyIDBQEREBvYJhq1pLt+Za/z+3oplMXX7Hjfp23S91FdnG9Lq3ddIDT0+eTHjGL0en35c+r4YLC9Xxb6op74rjk27mFCnt+OTX9Dv3Be7HBWq2Cfe6nPdZ1Z9RIEkPxKjqfLz89U1X73veKTzI+L/ynuPODo7tz9/2XHnD192fKHt+MLx8g87O+78rb7VdF7qc/H+Y51FeWfHI++pgibzXp+sx/djcuWtPrfHUO6rfXybqmGPp6Q9po952tMY3uqT++qeM8vrk3+fptdXx7zXGJF3X58/W3uxSTC4M764XX3x2ztNfeHpPNQnX/yPPVLv7+Eb1/r0htr8Oly51GcIWqvU8/xpjajnwPCN2/F1vtPx8uf6Hu3vxfTjdanPPVhNPkYGA/mLazDYc42h/CBKEIFBEWq7VgU2bShDRP8rdvjmivq2IW1SCRamJ6ltkxnqK8PeUiBnknOaIk3UbjLX+sr2oiwK2BTrrM+kqSRX9Tx/2xbPAxbMxWi1bRrX+sLHIiWyDJnv6hM6ZfvLgKi+CNO2TFLP8dUpwUGzH1Mif1Jh0STW9GbqmS7Shu9yasfsHueV9clepr5dT8/XJ271ufVwtakIU3u4HqaOXI7J/B51Pc+fZaMFT/XpZfI4r/g9fObp+XN7PF2eT19xxED+4jpisFkwqBe0t6ki1/ldn3moT77QaxtKs4OhAcfnFhS+8VCfx6kPC+tTrJkCrOf5s2wqyfPx6WEgymUQPfaIqQHIYCB/cQ0GG00lyTNlopE5sRhVK7xMNkQMEoN4M4bqnuureDcTZaXzEK1NsyQhR5TJaR7jWT1N0cDj00Shb7i62mT11Ccfv9K9KFOb5vF2fPoUYOL9VzvuxvDy/EWmYKx6/MLuSxHHm4lNFv29SGEzilBVVaVdiu6HqF/+jRI1YyosmsS83ozeE/M47Hfr4ZrTA/RSn4FZI4aGH585Z7V4Oz59n/OYzJm6utrjKR9H86ZXvNbnacTgcw/+avU57/9qj0PjccRA/uI6YrBHMGgvLn0o7noxzts6y00Ypl+lvjomBUNjjs+MaY+rHp9+XHq5Hx5Pbb950ytXrU+to+gXEwKpMc+fydNlDAbyF9dg4Fd7EtkYX2PkL/xqTyIiqheDgYiIDBgMRERkwGAgIiIDLj4T2Zh8jc3dGaO2qLkKEZeO7UPQMxQY0KslYm9vgTvCW+o7bcJ18ZnBQGRjfI0FB9nKnrngwJFTDuw9chk7DtSgugZIjm2NuIH2CAielURE5EchYshwvRgxDLy5BR76USusnNYOT4xqg7d31WBuTjXOnFc3tAkGAxFRAMTc2gKvprZF764t8MSaC/iy8rLaE3gMBiKiAHp0RCuMG9IKT2fbZ+TAYCAiCrCkmFa4u18rLN5crUoCi8FARGQDcuRQec6BvH2XVEngMBiIiGwidVhrZBV+p7YCh8FARGQTckG6TSvg4/LAjhoYDERENnJPv1Yo/CywZygxGIiIbGRQ7xb49ChHDEREpPS+IQTHqtRGgDAYiIhspFO7EJw93+RPKjIFg4GIyEbkx2cENhbsFAzlyxETGopQ7ZKGbapYtw1pzn2xy1GhSn3itT5dxbIYhD7uaY95itfMRsbWk2rLKieRt3g2Zs9Wl8V5osRa8ric9Vl/fC5O5CFjdgbyTqhti7gen9+PkchiNgmGCix/KBMpu6pQVVWF4gUlSKoNALEvNgklC4q1fdlR8xDtc2PtrT6dDIXo+WVqyxqycVlfqjYsdHLrahRHzURGRoa4zMRIbMdqKxuy4tVYj0mqvknolr8Uq4vVPkuJAFy7Hd+oLeucxFfi4es3SR6ffpkd303tI2r+bBIMYZheWITp4WrrvhRElO6F3iyXYW9pBFLuC9O2Rt+fCGzM9tjDbzhv9YnxyeOhiN6QguwFEarEbHoPXjaekyJVkYW6xYtebW3D1Q2Do7rgm5I91o0aoqciIzXauYHB4hhPnrC+R60FYLd+6KK2rXMcxyu7oEd3tUkUZGy5xlDxbibKIgdBa5bLD6IEUeirGnFEyPISHCxX2yYw1CeMXiFGEoXTa7fN1w1x6aKnWdt4+tfxE6JP3e0m8Vv4QzH2iFFRt+4W13YiD6vzxeMa30MVWOjEVyJUv8H2l9RUkh+m5oj8yWbBoK8lyCmcxGemi369UFbXkzefh/qCnZzmKe2HSX4IpZNbM0TDuR4Huo5EgsXVFW/djm6TporxiR+cOC5iQTyGLlNzS9f4Za6MyC9sFgyjsbJKzvtnA5NCkbZVFGkjBKt4qC+YiVCYvf4kRj7pnwZUTmHJ+feZUcVYamWvWq1pTPXXAExOlWU4H0MxSvnXfkDpHjE2IgoOtpxKEmmAQZFASVkFEN4XUa5TR9oIwmVqyRQu9QUprfe+XuRfxmzE+XluXJtGqjyO42rbbMXFB0TDvF6f1nlJLj7LaR7rz0wy6NoDfpjEIvILmwSDnNKJwXJn41++CZm1C86y0S5D5rt6o73t7RxgQpLo6/vCW31BSPSol+Z3E6Hgn5GCFkIuUytawx052LK6o1Przg7KeHIkuoj/Rj5pXQAaj+8k8t4/gC5Rg/20ZkNkPZsEw2is3JWCzKHqfQVD5yFqvfOsIXkGUTai5kdr+5JKFqJ4hW+x4L2+4KM1zDiA9S7n3Vu5YCqnkCZB9eDFZf3JkZgZoIV2KxiPbym2d5vE01UpqIQ4BHW90QoKCjB8+HC1RURm42vs2vTjhefx53nt1ZZ/nLpwTl2z7RoDEREFCoOBiIgMGAxERGTAYCAiIgMGAxERGTAYiIhsRJ4nGqKuBwqDgYjIRs5ccKBj+8BGA4OBiMhGjpxyoGeo2ggQBgMRkY3sPXIZA3q1VFuBwWAgIrKRHQdqEHt7YJtmBgMRkU0UfX4Z1TXAHeEcMRARkbBm53dIjm2ttgKHwUBEZAOv59ega4cQxA0M7GhBYjAQEQVYdlENPjxQg/SENqoksBgMREQBJEcKubtr8HxSG3Ty7ydt14vBQEQUAHKh+WdrLuJI5WW8ktoON3e1T3PMYCAispj8mIt/nHdg35eX8cZfapC26gJe+aAa9w9thUWJ9hkpOPEb3IhsTL7G5u6MUVvUXMkPuJAfcyHf0SzfvCbfpxDoU1LduX6DG4OByMb4GiN/4Vd7EhFRvZp3MHxVgf5PH8DSr9Q2XTv2fo6Qp/+GyXvVNhGZxp7BoL3o3Rp8LQSMDcGWvHMYPLEfZt6kCqiZO4HJHhr7w3kHELL2hNqSxO02fIclEztgz4bPsUWVEpE57BkMg25F+XBgVmYFDmsF/8DSzHPA8F5YN0gr0IyZ8n3DNl0rumPd86JDMCgM+5+/FWNUKRGZw7ZTSX3i/gVLcA4Jef8QPca/YxY6YHPc9WqvoEYQcjoh5Gljr1HrYdbu41RT0FHTSNpliUvnYYkYbeTV/V30F387W9Y6/w7qGVnI+1ryOSaLn73y70UfwdTWpUYt8j7lfTvJvzfXbaLmzsZrDNdjZkoHoOAowguAJSlh6KP2aC/Y/9ZHEI7nv4/NkReQ4GwgxAs9vKA1Notyfd8lzMpznYagZk12CDZcQPJE+fz20joP4S7TTFn7oD/3E9uhVPztzLpJ/o2I23W9IP4O6mm8Ky8Ao9X9dXX+vcigqcQe9Tfm+GUHRJae1kJjzCBx3/tO1wbSW6LOadEunRaiZs7ei883dca0ruLfru0x3nUd4auL2IN2WKJGEGPixIu28jzekj29QbeKF3Ld9ELkTfY6V5iuLmuDSy9dXMILLqk9wokalHbtgEXaFKLoPIxuB5R+WzsaiBzYWe9AdG+FyNq/kesR2U0W1qcdJqv7G1/7AWbivmd9H/udo9Sb2mKwfk38jV2H5Erxe8jrX53GKrj9fRI1c7YOBn0KqR2S1ZRSLdk4qKsa1xetmlLw2KhQs6CPBuou5cPrwv3wie/UNUULgDqDuzeh597VeB+1XKesnq5EliqWaxyTxSh13V7x+xSfB5xhRBQk7BsMX1UgQZtCuhXrtCmlv9fN/bo1BvoIQudcjyj30KhQ89enu9tn1bt3Ekwjz3xyTlnJS1fRQakjp5Oy9lZwGomCkk2DwbmG8C/6qag3hWGz61lK2gihbs5YnrZa6j7dpDmBuRwxBBfZKag8h7naKa1idLjtAhB5neVnJh3OO+0yYhDkdFLpOdEJ4TQSBR8bBoO+6JfV1XgWkvMsJX2hsTvW/VJfmJbD/ITSdtg8S1+c7hPXGcmi4QjXhv/fYvLEdsDJi2qhkJo90UnYL55TfR3iqD46nNJd7TRTdywSo03nekcCOmsL07tr17nldJLLmgZREAnhZyURNYU8lfU0hvzS2jdY8jVG/sLPSiLyhfYeGnkqq5rqJAoyDAaixpLTWc+7nMpKFGQYDEREZMBgICIiAwYDEREZMBiIiMiAwUBERAYMBiIiMmAwEBGRAYOBiIgMGAxERGTAYCAiIgMGAxERGTAYiIjIwOdgOHv2rLpGRGbia4sCxafvYyguLsbp06fVFhGZrXPnzoiOjlZbRNZx/T4Gn4IBOIqsaTOw7NxdmPXYD3GDKDn1ty1YnXsQldcPw2/WPInYDsDxjTMx/rWTGP7LZ/HU0Grkv7IIS/7vW0RMXYa1Kb1QuGg8/nO7uP12cXvtfj/C/JGLkTcyHR/NvUsrMTj2Dqak/BF/v/Nh/O7Bm3Cq+13o+9enkfDyQdwy+mHMevAudDqSi0XPv4ey/mnY/Nt70fXr9zA9eSU+uX4gUp9IxrjeVch9/xzGPTEKPdTdEhFdq8z/op6vP8KSRS9hjri8tqMaP3hsAbZt1ENB6pGQiuQ+1Sj475lIeHQNTsXejQh9V9P0HIUZD/TCxb/+EVN+/Q6Oi6KuDyzAW3N/go5/zcL0R3+GKYs/RNvRT+KtF0UoyJ+58V785tUnEHdjObIWPY3xP3sJBd+0RVu5j4iIavk4YiAiomAQ5F/teRq5vxivTSsREVHj8XRVIiIy4FQSEREF+1QSERH5gsFAREQGDAYiIjJgMBARkQGDgYiIDBgMRERkwGAgIiIDS9/H8HH5JRR+dhmfHr2EY1XA2fMO8E0TRHStCRGXju1D0DMUGNCrJWJvb4E7wlvqO23CxE9X9Sxv3yVkFX6HNq2Ae/q1wqDeLdD7hhB0aheCEPkIERFdQ2Qre+aCA0dOObD3yGXsOFCD6hogObY14gbaIyAsC4Yz54HFm6tRec6B1GGtEXMrZ6qIiDwp+vwy1uz8Dl07hCA9oQ06tVc7AsSSYPiy8jKezq7G3WKE8OgIMVQgIqKrej2/Bh+KEcTzSW1wc9fAdaZNDwY5UnhizQWMG9IKSTEMBSKixsguqkHu7hq8ktouYCMH0z8rSU4fyZECQ4GIqPFk2ynbUNmW2oHPwSAXmuWaAqePiIiaTrahsi2VbWqg+RwM8uwjudBMRES+kW2pbFMDC/j/DowdxYiTIQgAAAAASUVORK5CYII=	2026-03-23 04:35:39.414	2026-03-23 04:36:46.23	2026-03-23 04:36:46.226	\N	\N	\N	0918883118	t
191	od34cpqhvbuvzo94nsktkcki	0	\N	MH004	Huấn luyện an toàn cho nhân viên phục vụ trực tiếp trong khoang hành khách và tàu khách Ro - Ro.		321313132123	321313132123	DUONG	DUONG	DUONG	Nam	03,04,2009	Lạng Sơn	Kinh	Việt Nam	\N	BBBB	\N	\N	2026-03-24 00:57:19.68	2026-03-24 00:57:19.68	2026-03-24 00:57:19.672	\N	\N	\N	5113213	f
\.


--
-- Data for Name: students_school_class_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students_school_class_lnk (id, student_id, school_class_id) FROM stdin;
153	190	235
154	191	103
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subjects (id, document_id, code, name, sessions, total_hours, theory_hours, practice_hours, exercise_hours, exam_hours, notes, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, has_theory, has_practice) FROM stdin;
317	k1nobqpiuw7a4v19hgzp5u3n	MH002	An toàn sinh mạng và trách nhiệm xã hội	0	29.00	20.00	8.00	1.00	7.25		2026-02-24 08:10:17.96	2026-02-26 15:00:50.396	2026-02-26 15:00:50.387	\N	\N	en	t	t
246	ogujy01yyrqqziahg7gc2s6f	MH004	Nhận thức an ninh tàu biển (SSA)	0	8.00	7.50	0.00	0.50	2.00		2026-02-16 13:22:52	2026-02-26 15:01:16.718	2026-02-26 15:01:16.713	\N	\N	en	t	t
255	isrtks1ujw51nmg64x4qelhk	MH007	Bè cứu sinh và xuồng cứu nạn	0	32.00	15.00	16.00	1.00	8.00		2026-02-16 13:22:52.176	2026-02-26 15:01:45.214	2026-02-26 15:01:45.208	\N	\N	en	t	t
284	e7bdee3b7df591a268f81235	MH024	Bếp trưởng, cấp dưỡng	0	60.00	30.00	30.00	0.00	0.00		2026-02-16 13:22:52.661	2026-02-26 15:05:43.017	2026-02-26 15:05:43.012	\N	\N	en	t	t
269	ec44d32c43642e9b40986204	MH015	Thuyền viên có nhiệm vụ an ninh tàu biển cụ thể (SSD)	0	12.00	11.00	0.00	1.00	3.00		2026-02-16 13:22:52.451	2026-02-16 13:22:52.451	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
258	cb59a2b2a39a6d69636e9b8d	MH010	Quản lý đội ngũ hoặc nguồn lực buồng lái (BRM)	0	40.00	19.00	20.00	1.00	10.00		2026-02-16 13:22:52.232	2026-02-16 13:22:52.232	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
303	b30f42066c51b6e4ead205d8	MH031	Huấn luyện cơ bản thuyền viên làm việc trên tàu cao tốc	0	56.00	28.00	27.00	1.00	14.00		2026-02-16 13:22:53.091	2026-02-16 13:22:53.091	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
323	hbuutq0a1w8czh57bu7wt2a4	MH005	Sơ cứu cơ bản	0	20.00	8.50	11.00	0.50	5.00		2026-02-24 08:26:24.709	2026-02-26 15:01:26.886	2026-02-26 15:01:26.879	\N	\N	en	t	t
321	csxhel0sw2a8nvs2or70lcqd	MH006	Xuồng cứu nạn cao tốc	0	24.00	9.00	15.00	\N	6.00		2026-02-24 08:26:11.659	2026-02-26 15:01:38.199	2026-02-26 15:01:38.195	\N	\N	en	t	t
306	f1468ff0d32f56095c201b30	MH034	Huấn luyện nâng cao thuyền viên làm việc trên tàu hoạt động tại các vùng nước cực	0	32.00	18.00	12.00	2.00	8.00		2026-02-16 13:22:53.174	2026-02-16 13:22:53.174	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
291	e4177dfa06e682962d3fa3fa	MH025	Quản lý đám đông đối với tàu khách và tàu khách Ro-Ro.	0	12.00	4.00	7.50	0.50	3.00		2026-02-16 13:22:52.797	2026-02-16 13:22:52.797	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
292	96ace9521373b4bace867eee	MH026	Huấn luyện an toàn cho nhân viên phục vụ trực tiếp trong khoang hành khách và tàu khách Ro - Ro.	0	6.00	3.00	2.50	0.50	2.00		2026-02-16 13:22:52.816	2026-02-16 13:22:52.816	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
305	08708e9a8497c6ceb7128c9c	MH033	Huấn luyện cơ bản thuyền viên làm việc trên tàu hoạt động tại các vùng nước cực	0	34.00	26.00	7.00	1.00	8.50		2026-02-16 13:22:53.166	2026-02-16 13:22:53.166	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
337	34dcc015207a493a2005df58	SQAN01	Sỹ quan an ninh tàu biển	5	15.00	5.00	10.00	\N	1.00	\N	2026-02-26 01:37:49.342	2026-02-26 01:37:49.342	2026-02-26 01:37:49.342	\N	\N	en	\N	\N
293	c3a7927cb6487eb273165fd1	MH027	An toàn hành khách, an toàn hàng hóa và tính nguyên vẹn của vỏ tàu đối với tàu khách và tàu khách Ro-Ro	0	20.00	9.50	10.00	0.50	5.00		2026-02-16 13:22:52.821	2026-02-16 13:22:52.821	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
307	ym9yybt51uecd9k25g27xf1z	MH035	Huấn luyện viên chính	0	60.00	24.00	1.00	35.00	15.00		2026-02-16 13:22:53.178	2026-02-16 13:22:53.178	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
294	d65f4661e64e2fb6a2593e9d	MH028	Quản lý khủng hoảng và phản ứng của con người trên tàu khách và tàu khách Ro-Ro	0	12.00	5.50	6.00	0.50	3.00		2026-02-16 13:22:52.832	2026-02-16 13:22:52.832	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
339	hz8v1theqanbq744b25it3me	MH001	Kỹ thuật cứu sinh	0	20.00	9.00	10.00	1.00	5.00		2026-02-16 13:22:51.988	2026-02-26 15:00:33.27	2026-02-26 15:00:33.253	\N	1	en	t	t
295	viqx81ej91dgtdhdov95toob	MH029	Huấn luyện cơ bản thuyền viên làm việc trên tàu sử dụng nhiên liệu có điểm cháy thấp theo Bộ luật IGF	0	32.00	26.00	2.00	4.00	8.00		2026-02-16 13:22:52.842	2026-02-16 13:22:52.842	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
296	dqvfqs4bngx1en1i0bq8atvh	MH030	Huấn luyện nâng cao thuyền viên làm việc trên tàu sử dụng nhiên liệu có điểm cháy thấp theo Bộ luật IGF	0	40.00	27.00	11.00	2.00	10.00		2026-02-16 13:22:52.848	2026-02-16 13:22:52.848	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
245	fae20faaa325be081892b9ec	MH003	Phòng cháy chữa cháy	0	20.00	9.50	9.50	1.00	5.00		2026-02-16 13:22:51.996	2026-02-26 15:01:05.015	2026-02-26 15:01:05.011	\N	\N	en	t	t
256	a91227958af8dd37291d0c62	MH008	Sơ cứu y tế	0	30.00	14.50	15.00	0.50	7.50		2026-02-16 13:22:52.218	2026-02-26 15:02:19.063	2026-02-26 15:02:19.059	\N	\N	en	t	f
260	0e3829211f8664047923bc72	MH012	Sử dụng Radar và Arpa hàng hải mức vận hành (RAO)	0	78.00	45.00	32.00	1.00	19.00		2026-02-16 13:22:52.256	2026-02-26 15:03:01.669	2026-02-26 15:03:01.663	\N	\N	en	t	t
282	42d97536bae67a8399a8dac6	MH021	Cơ bản tàu khí hóa lỏng (BLG)	0	34.00	29.00	4.00	1.00	9.00		2026-02-16 13:22:52.621	2026-02-16 13:22:52.621	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
257	da08d8d98d1fb0d186c62969	MH009	Chăm sóc y tế	0	46.00	26.00	19.50	0.50	11.50		2026-02-16 13:22:52.221	2026-02-16 13:22:52.221	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
267	caea118c57939bf1ea47e3a2	MH013	Sử dụng Radar và Arpa hàng hải mức quản lý (RAM)	0	36.00	10.00	25.00	1.00	8.00		2026-02-16 13:22:52.389	2026-02-26 15:03:10.747	2026-02-26 15:03:10.74	\N	\N	en	t	t
268	383298d14cacece836fe8446	MH014	Khai thác hệ thống thông tin và chỉ báo hải đồ điện tử (ECDIS)	0	40.00	29.00	8.00	3.00	10.00		2026-02-16 13:22:52.428	2026-02-26 15:03:25.907	2026-02-26 15:03:25.898	\N	\N	en	t	t
259	ea73eecb56527ee8bea70818	MH011	Quản lý đội ngũ hoặc nguồn lực buồng máy (ERM)	0	40.00	21.50	18.00	0.50	10.00		2026-02-16 13:22:52.235	2026-02-16 13:22:52.235	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
279	d5dcadd2e700022032c7e3f9	MH020	Nâng cao tàu hóa chất (ACT)	0	60.00	38.50	20.00	1.50	15.00		2026-02-16 13:22:52.6	2026-02-16 13:22:52.6	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
272	0657f85b441ee4c24abe1635	MH018	Cơ bản tàu dầu và hóa chất (BOC)	0	47.00	39.00	7.00	1.00	12.00		2026-02-16 13:22:52.462	2026-02-16 13:22:52.462	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
270	5ee3b83b47d5894a91374c7f	MH016	Sỹ quan an ninh tàu biển (SSO)	0	20.00	19.50	0.00	0.50	5.00		2026-02-16 13:22:52.454	2026-02-16 13:22:52.454	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
283	0acf6e0a6ce300c1be7c2c12	MH023	Sỹ quan an toàn tàu biển	0	24.00	0.00	0.00	0.00	0.00		2026-02-16 13:22:52.651	2026-02-16 13:22:52.651	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
281	cb7b006a16439a0b85a8ad13	MH022	(Nâng cao tàu khí hóa lỏng) ALG	0	60.00	43.50	15.50	1.00	15.00		2026-02-16 13:22:52.618	2026-02-16 13:22:52.618	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
304	9438641f087a5059a2da71d9	MH032	Huấn luyện nâng cao thuyền viên làm việc trên tàu cao tốc	0	96.00	60.00	35.00	1.00	24.00		2026-02-16 13:22:53.143	2026-02-16 13:22:53.143	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
280	54fe0d223ac89f899ffa0d8d	MH019	Nâng cao tàu dầu (AOT)	0	60.00	45.00	14.00	1.00	15.00		2026-02-16 13:22:52.615	2026-02-16 13:22:52.615	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
271	6946e7f324c3b34b32785a3a	MH017	Phòng cháy chữa cháy nâng cao (AFF)	0	32.00	15.00	16.00	1.00	8.00		2026-02-16 13:22:52.457	2026-02-16 13:22:52.457	2026-02-26 01:48:57.502	\N	\N	en	\N	\N
376	qpdq7ig4roce20sc12rfgxou	U.BTC	Cập nhật Huấn luyện An toàn sinh mạng và trách nhiệm xã hội theo Nghị quyết MSC.560 (108) của IMO	0	8.00	3.00	2.00	2.00	1.00		2026-03-12 09:28:22.101	2026-03-12 09:31:04.394	2026-03-12 09:31:04.39	\N	\N	en	t	t
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.suppliers (id, document_id, code, name, tax_id, phone, email, address, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
5	twlabbwxpz2m89pwdwksvczf	KhuB	KhuB				Giữa trường CĐHH	active	2026-02-24 08:09:23.65	2026-02-24 08:09:32.171	2026-02-24 08:09:32.178	\N	\N	en
6	a47ad93e8d70800044d4fb7f	DA	Nhà A	\N	\N	\N	Khu vực Trung tâm	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
7	b5b5705ac5d29ae1cec0cc8e	DB	Nhà B	\N	\N	\N	Khu vực Phía Tây	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
8	bd9052a7f6ce95927493e381	DC	Nhà C	\N	\N	\N	Khu vực Phía Đông	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
9	613e5653180fdf4ba37634e0	DD	Nhà D	\N	\N	\N	Khu xưởng thực hành	active	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	2026-02-26 01:37:16.208	\N	\N	en
\.


--
-- Data for Name: teacher_subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teacher_subjects (teacher_id, subject_id, id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
t1	sub1	1	\N	\N	\N	\N	\N	\N	en
t1	sub4	2	\N	\N	\N	\N	\N	\N	en
t2	sub2	3	\N	\N	\N	\N	\N	\N	en
t3	sub3	4	\N	\N	\N	\N	\N	\N	en
t4	sub5	5	\N	\N	\N	\N	\N	\N	en
t5	sub6	6	\N	\N	\N	\N	\N	\N	en
t5	sub7	7	\N	\N	\N	\N	\N	\N	en
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teachers (id, document_id, code, name, specialization, phone, email, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
106	ltq2tdmr9pdfz12rwk8focdl	GV015	Trần Đức Hòa				2026-02-24 08:18:53.442	2026-02-26 10:31:07.236	2026-02-26 10:31:07.228	\N	\N	en
134	m7ujpnx5zttshwgj9h4ai4l7	GV012	Đoàn Tân Thành				2026-02-26 09:48:58.17	2026-02-26 11:00:10.249	2026-02-26 11:00:10.23	\N	1	en
71	fut1wdoihainpy8n5daw3xba	GV017	Lê Ngọc Thông				2026-02-16 13:28:30.624	2026-02-16 18:34:27.403	2026-02-26 01:48:57.502	\N	\N	en
69	ek92felyhmc7n7gxgnamrxx9	GV016	Đỗ Hồng Hải				2026-02-16 13:28:30.545	2026-02-16 18:56:20.349	2026-02-26 01:48:57.502	\N	\N	en
80	xbh0d5cul28p0t6picw4ddu1	GV020	Trần Văn Ca				2026-02-16 13:28:30.802	2026-02-16 18:33:04.127	2026-02-26 01:48:57.502	\N	\N	en
43	rassn763vfqqy6dtxsdcpysm	GV001	Hoàng Đình Đại				2026-02-16 13:28:29.785	2026-02-16 18:32:32.735	2026-02-26 01:48:57.502	\N	\N	en
72	scjozjr99bjrdz94dk77gx16	GV018	Trần Thành Bình				2026-02-16 13:28:30.625	2026-02-16 18:34:03.324	2026-02-26 01:48:57.502	\N	\N	en
44	dtz36w9to5djf5un3rlqmhdo	GV003	Trịnh Ngọc Nam				2026-02-16 13:28:29.788	2026-02-16 18:31:53.817	2026-02-26 01:48:57.502	\N	\N	en
79	v1c6ulvt68m5l659lpurlo5n	GV019	Bùi Quang Thụ				2026-02-16 13:28:30.794	2026-02-16 18:33:33.521	2026-02-26 01:48:57.502	\N	\N	en
48	bb94fec5355afcd2f6feaf66	GV005	Cao Đức Bản				2026-02-16 13:28:29.917	2026-02-16 18:39:45.556	2026-02-26 01:48:57.502	\N	\N	en
55	2279b4679262897ef1012f05	GV007	Hoàng Đình Huy				2026-02-16 13:28:30.171	2026-02-16 18:45:36.901	2026-02-26 01:48:57.502	\N	\N	en
57	00fdd0fbc8dfce3ff9cc207e	GV009	Đào Ngọc Tiệp				2026-02-16 13:28:30.197	2026-02-16 18:47:18.143	2026-02-26 01:48:57.502	\N	\N	en
68	907fc2fbd0719f285db4e4ed	GV014	Phạm Ngọc Anh				2026-02-16 13:28:30.543	2026-02-16 18:57:18.622	2026-02-26 01:48:57.502	\N	\N	en
58	5c5dd60164313be005379862	GV010	Nguyễn Đức Thiện				2026-02-16 13:28:30.204	2026-02-16 18:50:35.777	2026-02-26 01:48:57.502	\N	\N	en
59	94ce5447d5c2bda49b5140e7	GV011	Trần Xuân Tá				2026-02-16 13:28:30.247	2026-02-16 18:52:00.875	2026-02-26 01:48:57.502	\N	\N	en
47	3371558250b459ea05be7bfb	GV004	Mai Thế Hải				2026-02-16 13:28:29.908	2026-02-16 18:38:08.693	2026-02-26 01:48:57.502	\N	\N	en
56	16dbb72a28c23b0e66d2033c	GV008	Bùi Văn Hà				2026-02-16 13:28:30.181	2026-02-16 18:49:04.496	2026-02-26 01:48:57.502	\N	\N	en
52	9b133d1349c320ff549a8196	GV002	Nguyễn Tất Quyền				2026-02-16 13:28:30.034	2026-02-16 18:44:01.471	2026-02-26 01:48:57.502	\N	\N	en
67	4f6366948270f457d3d56950	GV013	Phan Mộng Tùng				2026-02-16 13:28:30.431	2026-02-16 18:55:32.697	2026-02-26 01:48:57.502	\N	\N	en
51	d25731a76c0f0971dfb23f90	GV006	Hoàng Văn Chiến				2026-02-16 13:28:30.025	2026-02-16 18:41:48.731	2026-02-26 01:48:57.502	\N	\N	en
\.


--
-- Data for Name: teachers_subjects_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teachers_subjects_lnk (id, teacher_id, subject_id, subject_ord) FROM stdin;
1039	134	339	1
1040	134	317	2
1041	134	245	3
1042	134	246	4
1043	134	321	5
1044	134	255	6
1045	134	258	7
1046	134	267	8
1047	134	260	9
1048	134	268	10
1049	134	269	11
1050	134	270	12
1051	134	271	13
1052	134	283	14
1053	134	291	15
1054	134	292	16
1055	134	293	17
1056	134	294	18
62	44	245	2
65	44	255	5
66	44	246	6
67	44	258	7
68	44	260	8
69	44	267	9
70	44	268	10
71	44	269	11
72	44	270	12
73	44	283	13
74	44	271	14
75	44	291	15
76	44	306	16
77	44	292	17
78	44	294	18
79	44	293	19
80	44	307	20
4	43	245	4
5	43	246	5
6	43	255	6
7	43	258	7
8	43	260	8
9	43	267	9
10	43	268	10
11	43	270	11
12	43	269	12
13	43	272	13
14	43	271	14
15	43	283	15
16	43	279	16
17	43	281	17
18	43	282	18
19	43	280	19
20	43	303	20
21	43	291	21
22	43	306	22
23	43	292	23
24	43	305	24
25	43	293	25
26	43	294	26
27	43	307	27
28	43	295	28
29	43	296	29
30	43	304	30
3	43	321	3
64	44	321	4
194	47	321	4
230	48	321	4
271	51	321	5
308	52	321	4
368	55	321	4
404	57	321	4
440	56	321	4
483	58	321	3
529	59	321	5
596	67	321	4
162	80	256	2
163	80	257	3
167	79	271	1
169	72	259	1
170	72	271	2
173	71	259	1
174	71	271	2
193	47	245	3
195	47	255	5
196	47	258	6
197	47	260	7
198	47	267	8
199	47	268	9
200	47	270	10
201	47	269	11
202	47	271	12
203	47	283	13
204	47	291	14
205	47	292	15
206	47	293	16
207	47	307	17
208	47	294	18
228	48	245	2
231	48	246	5
232	48	255	6
233	48	258	7
234	48	260	8
235	48	267	9
236	48	268	10
237	48	270	11
238	48	269	12
239	48	271	13
240	48	283	14
241	48	303	15
242	48	291	16
243	48	292	17
244	48	293	18
245	48	294	19
246	48	307	20
268	51	245	2
270	51	246	4
272	51	255	6
273	51	258	7
274	51	260	8
275	51	267	9
276	51	268	10
277	51	270	11
278	51	269	12
279	51	283	13
280	51	271	14
281	51	291	15
282	51	292	16
283	51	293	17
284	51	294	18
383	55	339	1
612	67	339	2
131	43	339	1
335	52	339	1
503	58	339	1
541	59	339	1
247	48	339	1
81	44	339	1
459	56	339	1
286	51	339	1
210	47	339	2
419	57	339	1
285	51	307	19
710	47	323	\N
306	52	245	2
309	52	246	5
310	52	255	6
311	52	258	7
312	52	260	8
313	52	267	9
314	52	268	10
315	52	269	11
316	52	270	12
317	52	272	13
318	52	271	14
319	52	283	15
320	52	279	16
321	52	281	17
322	52	282	18
323	52	280	19
324	52	291	20
325	52	292	21
326	52	306	22
327	52	293	23
328	52	305	24
329	52	294	25
330	52	307	26
331	52	295	27
332	52	296	28
333	52	304	29
334	52	303	30
366	55	245	2
369	55	246	5
370	55	255	6
371	55	258	7
372	55	260	8
373	55	267	9
374	55	268	10
375	55	270	11
376	55	269	12
377	55	271	13
378	55	283	14
379	55	291	15
380	55	292	16
381	55	293	17
382	55	294	18
402	57	245	2
405	57	246	5
406	57	255	6
407	57	258	7
408	57	260	8
409	57	267	9
410	57	268	10
411	57	270	11
412	57	269	12
413	57	271	13
414	57	283	14
415	57	291	15
416	57	292	16
417	57	293	17
418	57	294	18
438	56	245	2
441	56	246	5
442	56	258	6
443	56	260	7
444	56	267	8
445	56	270	9
446	56	268	10
447	56	269	11
448	56	272	12
449	56	271	13
450	56	283	14
451	56	279	15
452	56	281	16
453	56	282	17
454	56	280	18
455	56	291	19
456	56	292	20
457	56	293	21
458	56	294	22
482	58	245	2
485	58	246	5
486	58	258	6
487	58	260	7
488	58	267	8
489	58	268	9
490	58	270	10
491	58	269	11
492	58	272	12
493	58	271	13
494	58	283	14
495	58	279	15
496	58	281	16
497	58	282	17
498	58	280	18
499	58	291	19
500	58	292	20
501	58	293	21
502	58	294	22
526	59	245	2
528	59	246	4
530	59	258	6
531	59	255	7
532	59	260	8
533	59	267	9
534	59	270	10
535	59	268	11
536	59	269	12
537	59	271	13
538	59	291	14
539	59	292	15
540	59	293	16
595	67	245	3
597	67	246	5
598	67	255	6
599	67	258	7
600	67	260	8
601	67	270	9
602	67	267	10
603	67	268	11
604	67	271	12
605	67	269	13
606	67	279	14
607	67	281	15
608	67	282	16
609	67	280	17
610	67	272	18
2	43	317	2
63	44	317	3
191	47	317	1
229	48	317	3
269	51	317	3
307	52	317	3
367	55	317	3
403	57	317	3
439	56	317	3
484	58	317	4
527	59	317	3
161	80	323	1
629	69	259	1
630	69	271	2
631	69	272	3
632	69	280	4
633	69	282	5
634	69	281	6
635	69	279	7
657	106	259	1
658	106	271	2
659	106	272	3
660	106	280	4
643	68	259	1
644	68	271	2
645	68	279	3
646	68	281	4
647	68	282	5
648	68	280	6
649	68	272	7
661	106	279	5
662	106	281	6
663	106	282	7
664	106	323	8
593	67	317	1
\.


--
-- Data for Name: training_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_assignments (id, document_id, schedule, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
35	pfm76br6mpj6zwckupvf956j	[{"date": "2026-03-21", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-21", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-22", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-22", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-23", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-23", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-24", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-24", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-25", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-25", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-26", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-26", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-27", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}, {"date": "2026-03-27", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ek92felyhmc7n7gxgnamrxx9", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Đỗ Hồng Hải"}, {"date": "2026-03-28", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "ltq2tdmr9pdfz12rwk8focdl", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Trần Đức Hòa"}]	2026-03-21 05:36:43.364	2026-03-21 05:36:43.364	2026-03-21 05:36:43.359	\N	\N	\N
36	t8rvk29p2ozbm37mwyrvdl5d	[{"date": "2026-03-23", "notes": "", "shift": "Sáng", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "rassn763vfqqy6dtxsdcpysm", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Hoàng Đình Đại"}, {"date": "2026-03-23", "notes": "", "shift": "Chiều", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "907fc2fbd0719f285db4e4ed", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Phạm Ngọc Anh"}, {"date": "2026-03-24", "notes": "", "shift": "Sáng", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "rassn763vfqqy6dtxsdcpysm", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Hoàng Đình Đại"}, {"date": "2026-03-24", "notes": "", "shift": "Chiều", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "907fc2fbd0719f285db4e4ed", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Phạm Ngọc Anh"}, {"date": "2026-03-25", "notes": "", "shift": "Sáng", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "rassn763vfqqy6dtxsdcpysm", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Hoàng Đình Đại"}, {"date": "2026-03-25", "notes": "", "shift": "Chiều", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "907fc2fbd0719f285db4e4ed", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Phạm Ngọc Anh"}, {"date": "2026-03-26", "notes": "", "shift": "Sáng", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "rassn763vfqqy6dtxsdcpysm", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Hoàng Đình Đại"}, {"date": "2026-03-26", "notes": "", "shift": "Chiều", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "907fc2fbd0719f285db4e4ed", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Phạm Ngọc Anh"}, {"date": "2026-03-27", "notes": "", "shift": "Sáng", "subjectId": "42d97536bae67a8399a8dac6", "teacherId": "rassn763vfqqy6dtxsdcpysm", "subjectName": "Cơ bản tàu khí hóa lỏng (BLG)", "teacherName": "Hoàng Đình Đại"}]	2026-03-23 03:40:59.626	2026-03-23 03:40:59.626	2026-03-23 03:40:59.621	\N	\N	\N
37	c3bsxbmnqewssgw73p6nnf3u	[{"date": "2026-03-23", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-23", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-24", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-24", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-25", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-25", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-26", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-26", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-27", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-27", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-28", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-28", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-29", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}, {"date": "2026-03-29", "notes": "", "shift": "Chiều", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "16dbb72a28c23b0e66d2033c", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Bùi Văn Hà"}, {"date": "2026-03-30", "notes": "", "shift": "Sáng", "subjectId": "d5dcadd2e700022032c7e3f9", "teacherId": "5c5dd60164313be005379862", "subjectName": "Nâng cao tàu hóa chất (ACT)", "teacherName": "Nguyễn Đức Thiện"}]	2026-03-23 04:38:07.894	2026-03-23 04:38:07.894	2026-03-23 04:38:07.887	\N	\N	\N
\.


--
-- Data for Name: training_assignments_decision_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_assignments_decision_lnk (id, training_assignment_id, class_decision_id) FROM stdin;
79	37	160
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
266	f238blcesnf4afduehmarrau	api::audit-log.audit-log.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.227	\N	\N	en
268	hwwlwo73dc8b8jntwc1t3zrj	api::audit-log.audit-log.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.229	\N	\N	en
270	twff5r9gl8pcn006ankml6rr	api::audit-log.audit-log.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.23	\N	\N	en
272	jd29mo5se2wksbtu6egtve56	api::class-decision.class-decision.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.231	\N	\N	en
274	crv7comjd4wix1f6ld0k66rp	api::class-decision.class-decision.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.232	\N	\N	en
276	gvh167u9byy6vocr9vvbfmaq	api::class-subject.class-subject.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.233	\N	\N	en
278	bmwrlfkgt80qhxv2k9ipzv97	api::class-subject.class-subject.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.233	\N	\N	en
280	o60k8kudoonrgt3q28pvwtnm	api::class-subject.class-subject.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.235	\N	\N	en
66	cnap84zh1h184js7cz1p00wi	api::student.student.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.089	\N	\N	en
67	bsn8ys62k8e9usrr82nshgdz	api::student.student.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.09	\N	\N	en
69	lcsmm15ppkw3na8yztg94g2h	api::student-document.student-document.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.092	\N	\N	en
71	we833102fjn2enlqpco275se	api::student-document.student-document.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.094	\N	\N	en
73	cqmi4z7c2ajljav4wtopxd74	api::subject.subject.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.095	\N	\N	en
75	o1lngfnx292ornop69v65esu	api::subject.subject.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.095	\N	\N	en
77	o5z99r2x4l0n8y9w7zn9pqwy	api::subject.subject.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
79	dwuac9crdixlhgyyea567lfi	api::supplier.supplier.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
81	opj2bi4y98h8xkde0ruizdo9	api::supplier.supplier.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
83	bcjje8d4eirlgwjj574g2311	api::teacher.teacher.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
85	in027o8lsfed4e5rx7re9zyg	api::teacher.teacher.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.097	\N	\N	en
87	z7bweibcx14nx5xwarxhmzex	api::teacher.teacher.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.097	\N	\N	en
89	z600njl3yj9dr4sipdgc789w	plugin::content-type-builder.components.getComponent	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.098	\N	\N	en
91	tmh53wy62ewcuy4lui03k1go	plugin::content-type-builder.content-types.getContentType	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.099	\N	\N	en
363	dc5fbapavqldljtkkeex9hmc	plugin::users-permissions.user.find	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
365	quz769ntj7lqc1dba30uu09r	plugin::users-permissions.user.count	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
367	oy5osntwz2pc1dbh4384rm7o	plugin::users-permissions.user.me	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
369	ljuw2vswsaq1zhopfm3luht3	plugin::users-permissions.role.findOne	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
371	m0v0r09j5m5w9xqw69zxohwy	plugin::users-permissions.role.updateRole	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.251	\N	\N	en
373	zxkdt9nf5wo4r99oi3f5u5cs	plugin::users-permissions.permissions.getPermissions	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.251	\N	\N	en
65	b93qyby1ofaen1jnj780i3ug	api::student.student.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.089	\N	\N	en
68	n60v97l82az47cmccl68t2mb	api::student-document.student-document.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.092	\N	\N	en
70	d3awaruftzw133oc09ssk2yn	api::student-document.student-document.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.093	\N	\N	en
72	wl9b7x8qxzjanjkk9yblscd1	api::student-document.student-document.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.095	\N	\N	en
74	usu9y32o1cmyihxwde97a8n3	api::subject.subject.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.095	\N	\N	en
76	u284osek9izzrdiqfp3ffq28	api::subject.subject.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.095	\N	\N	en
78	m2abd5s1sgnv4ti8ao1fwhlb	api::supplier.supplier.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
80	zvgr8mws3cqnd9qylvuqmpjh	api::supplier.supplier.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
82	yd2nutxbs1mwg3s3xkvp6qdl	api::supplier.supplier.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.096	\N	\N	en
84	sbw9f3csn6lck7757trggawo	api::teacher.teacher.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.097	\N	\N	en
86	o80ukbdqnbg9umr1w0y98pws	api::teacher.teacher.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.097	\N	\N	en
88	c3eut4413jqvm39mj6kdum4n	plugin::content-type-builder.components.getComponents	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.098	\N	\N	en
90	wynrx8xy0hpd3mhlagfn3bpe	plugin::content-type-builder.content-types.getContentTypes	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.098	\N	\N	en
282	e5qzbxikfwrwv5x7fbr06jk7	api::classroom.classroom.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.235	\N	\N	en
284	xbhkt5tjycrbmedncto696sl	api::classroom.classroom.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.236	\N	\N	en
286	jdirgqdzk0dk6w419dse5f0o	api::exam-approval.exam-approval.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.237	\N	\N	en
288	kcejb3v85md3m2yqlkozcame	api::exam-approval.exam-approval.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.237	\N	\N	en
290	xme6oo3bvdalvnj861yl480a	api::exam-approval.exam-approval.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.237	\N	\N	en
292	jbapy34n95qbak6qkvv3u3iu	api::exam-grade.exam-grade.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.238	\N	\N	en
294	hn5234lgaqk08s16iewdhak5	api::exam-grade.exam-grade.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.238	\N	\N	en
296	yzf4qtb1f5tbzxiroduq9seh	api::nation.nation.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
298	uncu3qg0l400pdif95oqiqct	api::nation.nation.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
300	nkqk1cf8vk3es7ystu3q2aw8	api::nation.nation.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
302	vbs36onwms0akrrp15kkieyj	api::print-template.print-template.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
304	kgipkzouzep7miie364hgx05	api::print-template.print-template.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.24	\N	\N	en
306	qt1s2i3kylu9cu9lb3jao71s	api::school-class.school-class.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.24	\N	\N	en
308	ieir2noyr7jxxiwdk8nrf07i	api::school-class.school-class.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.24	\N	\N	en
310	qaqtjn3aoj0qgghci5ekf6a1	api::school-class.school-class.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.241	\N	\N	en
312	ttzfr3enfq3bcq8id5l9rhxz	api::student.student.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.241	\N	\N	en
314	pkvsp4pxt1wfihxxdzb7kuea	api::student.student.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.241	\N	\N	en
316	ngqhvanj66rtczlzox5hy10b	api::student-document.student-document.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.242	\N	\N	en
318	vwjen0g0fpo4qnabftakacsl	api::student-document.student-document.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.242	\N	\N	en
320	kntbucbqjfwrohy15czq79b8	api::student-document.student-document.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.242	\N	\N	en
322	pjcifttu5gs72jivqmu0976t	api::subject.subject.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.243	\N	\N	en
324	euik8fmtf2cbww86nwws408u	api::subject.subject.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.244	\N	\N	en
326	huz0uqifo8tuanamfvbrj3jt	api::supplier.supplier.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.244	\N	\N	en
328	fy6415hrel5oa32kyzauw0bn	api::supplier.supplier.create	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.244	\N	\N	en
330	sgdnt8dg106033qloyi48azy	api::supplier.supplier.delete	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.245	\N	\N	en
332	g7sj2x4ecpba2ydkpb1fl1yq	api::teacher.teacher.findOne	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.245	\N	\N	en
334	r4akb2xziskugukcp9cz8qaw	api::teacher.teacher.update	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.245	\N	\N	en
336	gv4c12eh4j9vuhm0wqqwspse	api::teacher-subject.teacher-subject.find	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.246	\N	\N	en
338	f0ri4cmuu4nr0at05bj0ztkv	api::teacher-subject.teacher-subject.create	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.246	\N	\N	en
340	hmkjqpd9td9q8jik5zuq5lf6	api::teacher-subject.teacher-subject.delete	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.246	\N	\N	en
342	bwdk3gmwu9elro5wp637ku5m	api::training-assignment.training-assignment.findOne	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.247	\N	\N	en
344	mmk1w0pg04i2t7vha228tdhb	api::training-assignment.training-assignment.update	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.247	\N	\N	en
346	mydzpupswwgb4hjtxzd6zk7m	plugin::content-type-builder.components.getComponents	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.248	\N	\N	en
348	u6k112spareqgblq962h3qsa	plugin::content-type-builder.content-types.getContentTypes	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
350	fafuo62sjl22cnirm6sizsvb	plugin::email.email.send	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
352	o7dcgko64kmow2ec7bbboxgw	plugin::users-permissions.auth.changePassword	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
354	ioispq9ubp19yet9i1dbsv74	plugin::users-permissions.auth.refresh	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
356	ztb2ci4f94ir1eanzoiyhklp	plugin::users-permissions.auth.connect	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
358	ztdik9yuvjgavnrium5tbhvv	plugin::users-permissions.auth.register	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
360	yrnre5mdibvc1wtfw8qlt8ol	plugin::users-permissions.auth.sendEmailConfirmation	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
362	dhy81b00yppwwyk8l31w4pfq	plugin::users-permissions.user.update	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
364	u1bd2wrz4hk6hef5uiv0qrzp	plugin::users-permissions.user.findOne	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
366	f71irq9v8lmghjpom90o7zyq	plugin::users-permissions.user.destroy	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
368	l0mw9ay20o7jzs7qqa3u9s6g	plugin::users-permissions.role.createRole	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
370	yezw6zpadeja4ltao99ajctw	plugin::users-permissions.role.find	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.251	\N	\N	en
372	ncm58b95n86w3ox7tn2ktewd	plugin::users-permissions.role.deleteRole	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.251	\N	\N	en
267	v4nzp1zpzmjtc914hu2fxq46	api::audit-log.audit-log.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.228	\N	\N	en
269	jlh58ybr7qn823c7k0pv4uuz	api::audit-log.audit-log.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.229	\N	\N	en
271	uco89jkzpkaemkag03mu9t4g	api::class-decision.class-decision.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.231	\N	\N	en
273	jmczlztzimbi9d7wmg3w4dd6	api::class-decision.class-decision.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.231	\N	\N	en
275	f47dacmpi8dnhj0wpand7biq	api::class-decision.class-decision.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.232	\N	\N	en
277	uh6vy0bgqculk5hvo3j6w090	api::class-subject.class-subject.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.233	\N	\N	en
279	l86i38qn5su3a58ibaf9aqzy	api::class-subject.class-subject.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.234	\N	\N	en
281	dvievyodl1pbflo4e0432z8s	api::classroom.classroom.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.235	\N	\N	en
283	k599cenc7ld0p5mwy5okzba9	api::classroom.classroom.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.236	\N	\N	en
285	ot0wl9ety6egzv13kvjsg2oo	api::classroom.classroom.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.236	\N	\N	en
287	eitk57ml5i6sn2njfoukjogx	api::exam-approval.exam-approval.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.237	\N	\N	en
289	oqdxmfk4l1oqp9vwn6y8atbf	api::exam-approval.exam-approval.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.237	\N	\N	en
291	h6cufbj5ekse82k1wl2acnvm	api::exam-grade.exam-grade.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.237	\N	\N	en
293	mlzq2gdr8v2gzbwqwbsvs28p	api::exam-grade.exam-grade.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.238	\N	\N	en
295	imoijuk43fqi4d18zcfrw2hm	api::exam-grade.exam-grade.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.238	\N	\N	en
297	hoqggivjfeyt0m3vcouweusy	api::nation.nation.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
299	o1bf2zivu6uk4gxduisj4vap	api::nation.nation.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
301	b71xm6jfk3fkycr0yudr3naz	api::print-template.print-template.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
303	nyv61a0a6ld8nzoqd0jq1lcx	api::print-template.print-template.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.239	\N	\N	en
305	h629u2b3n6nl6x9yi0k00yfo	api::print-template.print-template.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.24	\N	\N	en
307	w6n7tt7wnbg8h4yajxhoucao	api::school-class.school-class.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.24	\N	\N	en
309	cq5nlfopb1c3tbgro3w3tnyo	api::school-class.school-class.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.241	\N	\N	en
311	c6ebzzlwt49c1brkeqg4he59	api::student.student.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.241	\N	\N	en
313	awniv47nk7158xb1hqcizp46	api::student.student.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.241	\N	\N	en
315	bzvf865ulup2yj9jf34ykp6e	api::student.student.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.242	\N	\N	en
317	w1jkhw68t66fs8dkorj468lw	api::student-document.student-document.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.242	\N	\N	en
319	qrwplkc6khmwwuou6k0sxkxm	api::student-document.student-document.update	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.242	\N	\N	en
321	jsonmw6dk174z32mm6k4m29u	api::subject.subject.find	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.243	\N	\N	en
323	zj5avgccarwneigunhvv0mlm	api::subject.subject.create	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.244	\N	\N	en
325	xgarezqxyaxydh52h0oxf7x6	api::subject.subject.delete	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.244	\N	\N	en
327	yh3kmvh9hytp6lrlwac4eogg	api::supplier.supplier.findOne	2026-02-26 09:58:36.225	2026-02-26 09:58:36.225	2026-02-26 09:58:36.244	\N	\N	en
329	ayc6prf8q6m8b370qry798i4	api::supplier.supplier.update	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.245	\N	\N	en
331	bwey9vjim0w5qbp2bxu8rq1m	api::teacher.teacher.find	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.245	\N	\N	en
333	ykni663z6b1bd4x0j2rpzd48	api::teacher.teacher.create	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.245	\N	\N	en
335	lu13rwv7yris4wc75knwbzhg	api::teacher.teacher.delete	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.246	\N	\N	en
337	ytkrg59diolkcvn5zjo6a4uv	api::teacher-subject.teacher-subject.findOne	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.246	\N	\N	en
339	jw8b0z698p4sh1no7nsv2yk3	api::teacher-subject.teacher-subject.update	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.246	\N	\N	en
341	yy5282pzt8xpf1vtn07vpkiu	api::training-assignment.training-assignment.find	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.247	\N	\N	en
154	t5e3na0eplf9pr1j5d2v9ubs	api::nation.nation.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
156	u3g9n01remet1ovtl017yuzt	api::nation.nation.delete	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
158	zfy2uue3zahq48mbs80lvkxt	api::school-class.school-class.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.747	\N	\N	en
160	lm380e7inh7zc712kqc1fpxl	api::school-class.school-class.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.747	\N	\N	en
162	xi0udtvuyq4ceky96e3rmw08	api::student.student.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.748	\N	\N	en
164	rv0na0sr6zsrqs4bmfssdhcv	api::student.student.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.748	\N	\N	en
166	xrrc4fkb2xsikeqdopjx6m0a	api::student.student.delete	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
168	nx27j91o1zfzrbxwzhs630sx	api::student-document.student-document.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
170	ff1ybomd79ox15ctzz08rz6l	api::student-document.student-document.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
172	c9b2inkhqid5q6uhj7wz68j1	api::subject.subject.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
174	hzg37533vl4un1rhn8n80xwi	api::subject.subject.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
176	y50bc1zv60s9b0gzo3uk36px	api::subject.subject.delete	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
178	hhwf9desfuk5l12il93hfp6m	plugin::upload.content-api.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.75	\N	\N	en
180	iae2j7ks0xujuu634nr1tp07	plugin::upload.content-api.destroy	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.75	\N	\N	en
182	vjo016g5lpx8kzkhr08mxmzg	plugin::i18n.locales.listLocales	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.751	\N	\N	en
184	h59ycnfwupbgzdpcwmor05wq	plugin::users-permissions.auth.changePassword	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.751	\N	\N	en
186	u99o4qewpplrlbj1mt6n9vm1	plugin::users-permissions.auth.refresh	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
188	lxfqqt12o3asmeyho016yalo	plugin::users-permissions.auth.connect	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
190	g6fiva3u0hozaz93ikq6wwkz	plugin::users-permissions.auth.register	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
192	gfnkjq9mfzzl6aojmujiwlrd	plugin::users-permissions.auth.sendEmailConfirmation	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
194	g35gv1gfcirecdvyxptipylq	plugin::users-permissions.user.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
196	m6yog8sxowr8wb1jr5ieakxy	plugin::users-permissions.user.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
198	cj8hgg9yeqifvg702x0hcr3v	plugin::users-permissions.user.destroy	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
200	w8l0vwudjtpy8uu61r6hggdd	plugin::users-permissions.role.createRole	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
202	aul4kj99zpn6d2x0msa3rzvi	plugin::users-permissions.role.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
204	bsyr4b2k0xj6j8x0htyrf3c4	plugin::users-permissions.role.deleteRole	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
343	d6c3i3nnfdx67heedo3si2z0	api::training-assignment.training-assignment.create	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.247	\N	\N	en
345	kawna317w6n5mwdy6knduq0h	api::training-assignment.training-assignment.delete	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.247	\N	\N	en
347	aj7ya33ulpf93q1pfz1bssls	plugin::content-type-builder.components.getComponent	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.248	\N	\N	en
349	l8ktqt4xa3hwera9yw2hjn55	plugin::content-type-builder.content-types.getContentType	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
351	ccg8h81lc89uw5mwsfc3rx2r	plugin::users-permissions.auth.callback	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
353	w3uw9jwanm8nyaiz644m15k5	plugin::users-permissions.auth.resetPassword	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
355	lz3jc8rg3wdwcd9c3jx7xuje	plugin::users-permissions.auth.logout	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
357	iomv3duc9yvl64g4mbqo0rkb	plugin::users-permissions.auth.forgotPassword	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.249	\N	\N	en
359	pk8p0jqqo1c19o7bmhv6lfvs	plugin::users-permissions.auth.emailConfirmation	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
361	q19r7zyp37e9wyzl1fkz0pj7	plugin::users-permissions.user.create	2026-02-26 09:58:36.226	2026-02-26 09:58:36.226	2026-02-26 09:58:36.25	\N	\N	en
155	gip056wzrb3i3854s3822oqi	api::nation.nation.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
157	wqbdaxh1tq5fl3o2lii8o8qy	api::school-class.school-class.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.747	\N	\N	en
159	dhbfnbsll7y6lnauafvmz4hj	api::school-class.school-class.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.747	\N	\N	en
161	qrd0tz3vbi1dy3hytqvxxhl8	api::school-class.school-class.delete	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.747	\N	\N	en
163	a21xsls80rkkqpf2sr5x1o7w	api::student.student.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.748	\N	\N	en
165	aa8upvudn2jl4fbw57hm2vq2	api::student.student.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.748	\N	\N	en
167	zrnee55oj24lcyligzfiddkv	api::student-document.student-document.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
169	ioxcqa5xzadn2q41joqzxpq7	api::student-document.student-document.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
171	isllumiik1tw2suwzv9pzvaf	api::student-document.student-document.delete	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
173	q5l9r475065v6lge5cqe768m	api::subject.subject.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
175	e3vi6bmpccyt9gib4va8wkqw	api::subject.subject.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.749	\N	\N	en
177	j2o7tr6qhkfvtk3fgdrgcjs2	plugin::email.email.send	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.75	\N	\N	en
179	lgl98nf4t5fy8rb4tn254wtg	plugin::upload.content-api.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.75	\N	\N	en
181	vmzrjz98r3lbj1scpmajzlgx	plugin::upload.content-api.upload	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.75	\N	\N	en
183	r522urkwyeb4i37edtxpmc16	plugin::users-permissions.auth.callback	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.751	\N	\N	en
185	ncajqozpn4wn2cv70kmzo5p6	plugin::users-permissions.auth.resetPassword	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.751	\N	\N	en
187	mii1rmw920o7bay4nnsgt2du	plugin::users-permissions.auth.logout	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
189	gzsc7ll2xmx8m1taasz69l4h	plugin::users-permissions.auth.forgotPassword	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
191	lyrc44yferpfkty7mxqle7ya	plugin::users-permissions.auth.emailConfirmation	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
193	uk7fti8xssfyhy07dxpx7a2s	plugin::users-permissions.user.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.752	\N	\N	en
195	rp1ziix58ltfewq010q36wu6	plugin::users-permissions.user.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
197	x0hdx9d8x6bbym24sea09u25	plugin::users-permissions.user.count	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
199	ibcydu6asjprpyg7ijbh1ifv	plugin::users-permissions.user.me	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
201	hon4dkbgr23swryudn80mytn	plugin::users-permissions.role.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
203	fsi4ojrfdr2frbke5z44n71g	plugin::users-permissions.role.updateRole	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
205	qdqqcfcym1dokdwaeazp4spl	plugin::users-permissions.permissions.getPermissions	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.753	\N	\N	en
374	h7c7cywusyesmibcnk1tzw0w	api::print-template.print-template.find	2026-02-26 11:14:45.8	2026-02-26 11:14:45.8	2026-02-26 11:14:45.801	\N	\N	en
375	vpp6u4wc2zlsnp0qj5lkrl65	api::print-template.print-template.findOne	2026-02-26 11:14:45.828	2026-02-26 11:14:45.828	2026-02-26 11:14:45.828	\N	\N	en
376	z39ikm36giulufa1ttg5b5ci	api::print-template.print-template.create	2026-02-26 11:14:45.832	2026-02-26 11:14:45.832	2026-02-26 11:14:45.832	\N	\N	en
377	gz4841ighslloxal9n42m95a	api::print-template.print-template.update	2026-02-26 11:14:45.837	2026-02-26 11:14:45.837	2026-02-26 11:14:45.837	\N	\N	en
378	w5nxofkvsnmxv4kcw4rdpn0u	api::print-template.print-template.delete	2026-02-26 11:14:45.843	2026-02-26 11:14:45.843	2026-02-26 11:14:45.843	\N	\N	en
1	ibzvzt7yduvqk238c5n5et04	plugin::users-permissions.user.me	2026-02-09 15:13:37.074	2026-02-09 15:13:37.074	2026-02-09 15:13:37.074	\N	\N	en
2	vv8bhub809uvclt5rh6egl96	plugin::users-permissions.auth.changePassword	2026-02-09 15:13:37.074	2026-02-09 15:13:37.074	2026-02-09 15:13:37.075	\N	\N	en
3	xlplfu1fx17kfyij40uuvf28	plugin::users-permissions.auth.callback	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	\N	\N	en
4	f3g7chke769pet82vnbd6ior	plugin::users-permissions.auth.connect	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	\N	\N	en
5	t33dc1ojjv6shs5dc8yiy65q	plugin::users-permissions.auth.forgotPassword	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.095	\N	\N	en
6	nad4ivd9p6vv97zq2793wi0f	plugin::users-permissions.auth.resetPassword	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.095	\N	\N	en
9	vum03r5pc8kvlqjwhj351fgo	plugin::users-permissions.auth.sendEmailConfirmation	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.095	\N	\N	en
8	dcqo2tme3rfvrs7qwidkdvwj	plugin::users-permissions.auth.emailConfirmation	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.095	\N	\N	en
7	owbkle16jmhmkfb43lyirpgc	plugin::users-permissions.auth.register	2026-02-09 15:13:37.094	2026-02-09 15:13:37.094	2026-02-09 15:13:37.095	\N	\N	en
10	abunhjc18gzcpe6yi8b4fq7x	api::classroom.classroom.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.916	\N	\N	en
11	mbjvupohac0zdctkbhadoo3k	api::classroom.classroom.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
12	s5ngci6kg3on8ta1tg1dxdat	api::classroom.classroom.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
13	ie6f3noc2fy1zenerl7ahs31	api::classroom.classroom.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
14	j6alf9v19u0xzfmpg2dm65fa	api::classroom.classroom.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
15	vxv2aql2fux52yz3jwxaiwdf	api::nation.nation.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
16	woejgetjxz1r59pipf2oc0ia	api::nation.nation.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
17	t6epx4il8h9pxm83y2bri3c9	api::nation.nation.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
18	fxavj7jc6xemg4n26o4pd04i	api::nation.nation.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
19	xbk8gejdsguyv3ntak8v1aqs	api::nation.nation.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
20	wmnty4k5y5znct5vkquvwro2	api::school-class.school-class.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.917	\N	\N	en
21	hgmd1ia1eu2sepgr2dkn5vxv	api::school-class.school-class.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
22	r44i94mou9ylfe4edo02f79l	api::school-class.school-class.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
23	bok23pmbmmzn3nprucu2fny8	api::school-class.school-class.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
24	gbyg5nhr7lzsflf6iawoxj7w	api::school-class.school-class.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
25	psklxi8eiecfqnzyilcqx11r	api::student.student.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
26	on0jaq334l29boe2tocjkj2z	api::student.student.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
27	l264u6uttycy7t3w3bitp91x	api::student.student.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
28	brs1s5tm50ojxd7zvqj7oxsw	api::student.student.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
29	xsunx0tiezfir9ktsy70oe0p	api::student.student.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
30	o489ag1n3nqm27vl5rzztxb4	api::student-document.student-document.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
31	eqho8a09touxi44eg1wig9wn	api::student-document.student-document.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.918	\N	\N	en
32	gx8ol1st4b5zilnyb6grlc0t	api::student-document.student-document.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.919	\N	\N	en
33	z2lldyx3wqp5500v9zpsn2rh	api::student-document.student-document.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.919	\N	\N	en
34	o1pj9tu6s8pf1mowwwxomq92	api::student-document.student-document.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.919	\N	\N	en
35	w36m1nnzyzefio49qkq03cu6	api::supplier.supplier.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.919	\N	\N	en
36	lv6gz3hfteegfvep7mst50q6	api::supplier.supplier.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.919	\N	\N	en
37	rhjlajo5fyq73llsbq9v566h	api::supplier.supplier.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.921	\N	\N	en
38	qf1977un4h2p5nvg37cbnixu	api::supplier.supplier.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.921	\N	\N	en
39	obouvmsyv3drr662ij4yapf3	api::supplier.supplier.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.921	\N	\N	en
40	f7rmosa3n72kpclf9c02tc5s	api::teacher.teacher.find	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.921	\N	\N	en
41	kf19qdlfecpnrhgsuodt7iez	api::teacher.teacher.findOne	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.921	\N	\N	en
42	pxpks6atkvgucteady1m2r7w	api::teacher.teacher.create	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.922	\N	\N	en
43	fqk1jtwuspbg2mwn9snmmdlf	api::teacher.teacher.update	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.922	\N	\N	en
44	nmfqz461c7sutibh5v0i5bs0	api::teacher.teacher.delete	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.922	\N	\N	en
45	au6eetrnxvhetc7ih888fid1	plugin::content-type-builder.components.getComponents	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.922	\N	\N	en
46	oqwqtwd0arj2afqt4gmow2f7	plugin::content-type-builder.components.getComponent	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.922	\N	\N	en
47	gic3tak3wkm2txlz63njoirh	plugin::email.email.send	2026-02-15 21:13:40.915	2026-02-15 21:13:40.915	2026-02-15 21:13:40.923	\N	\N	en
48	m3tg1z4mqkj06p2qu94n02j9	api::classroom.classroom.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.079	\N	\N	en
49	okgqfpzqyykzff27wo9d78ec	api::classroom.classroom.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.08	\N	\N	en
50	feghi5df0tsw11j5f1fnuli9	api::classroom.classroom.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.081	\N	\N	en
51	zwby4hwl553azt04g54yvyuh	api::classroom.classroom.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.082	\N	\N	en
52	r6spas4db27brd5kzfd3gov2	api::classroom.classroom.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.082	\N	\N	en
53	wiysya7f2yprptxa0t7qk5p9	api::nation.nation.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.082	\N	\N	en
54	t2lr1vx9g2nt3tbfxqqq7kef	api::nation.nation.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.083	\N	\N	en
55	q7y0hhttjiw3tvu63n5ylh93	api::nation.nation.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.083	\N	\N	en
56	emkyv44aohx44rjhr4tczqgn	api::nation.nation.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.084	\N	\N	en
57	nkxl4a9hwo6rurf7iy1x7mzc	api::nation.nation.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.084	\N	\N	en
58	v5a40kc7swh8dfxg6lbw5wb8	api::school-class.school-class.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.084	\N	\N	en
59	utrwaiu9rcxrdtt6rx1g8epl	api::school-class.school-class.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.085	\N	\N	en
60	nyah7xewbhar3p5efcb75n29	api::school-class.school-class.create	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.086	\N	\N	en
61	j6060p608hvxs3i9awhn1gc5	api::school-class.school-class.update	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.087	\N	\N	en
62	h3t68yu9w6a8gy2g3cx71mlu	api::school-class.school-class.delete	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.087	\N	\N	en
63	fmoh3z1bpfb85i0peq0g8u2b	api::student.student.find	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.088	\N	\N	en
64	cdprwgj9h7btouu0hpk66p5a	api::student.student.findOne	2026-02-15 21:16:02.078	2026-02-15 21:16:02.078	2026-02-15 21:16:02.089	\N	\N	en
97	srtwomjijahw41zzhfxi333t	plugin::upload.content-api.upload	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
92	ravh6pxjuhvkhw1pb9qp188u	plugin::content-type-builder.content-types.getContentTypes	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.677	\N	\N	en
94	qt5aujftle1xdlqf5k7w91qi	plugin::upload.content-api.find	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
96	i765cvxe7mb57ib47b1jm5fz	plugin::upload.content-api.destroy	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
95	i6aljby4e476na5xsw5mysot	plugin::upload.content-api.findOne	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
93	e4c4h1ubcx1po225pibsvnma	plugin::content-type-builder.content-types.getContentType	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.677	\N	\N	en
98	bjvdytav5i1r19lwqrskvvnp	plugin::i18n.locales.listLocales	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
99	vimye115d9exxzub6ikcwq4e	plugin::users-permissions.auth.callback	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
100	n0ja3gbip4w6rp42c0ivebio	plugin::users-permissions.auth.resetPassword	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
101	hcbitsfhwt3920ww1neapu3r	plugin::users-permissions.auth.refresh	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
102	xdqcavubrs2tlrbot2vi65t3	plugin::users-permissions.auth.logout	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
103	jn054xaslcoy0filure3jps2	plugin::users-permissions.auth.connect	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
104	mperm59kjoinqjcm828eu5c2	plugin::users-permissions.auth.forgotPassword	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.678	\N	\N	en
105	ds0658h5yiihkvbv147lfs4d	plugin::users-permissions.auth.register	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
106	j2t69v7kfzfhq0pvz5y57e7a	plugin::users-permissions.auth.emailConfirmation	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
107	alyrkkroywsvfpmzz45mca9n	plugin::users-permissions.auth.sendEmailConfirmation	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
108	rsx0mtof6ih58aojs5lmf3n5	plugin::users-permissions.user.create	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
109	bj5dyhk72aaoekjf51ei2euz	plugin::users-permissions.user.update	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
110	kko00uin68qh7ew920tidqz2	plugin::users-permissions.user.find	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
111	a2m06ox8n37gtkczotzjrluo	plugin::users-permissions.user.findOne	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
112	p3jgzhw7dtum14n7hf9fwtkg	plugin::users-permissions.user.count	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
113	dtynfk37g8bcytb0zsq5bemn	plugin::users-permissions.user.destroy	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
114	ppch7vu8ocis5rf5kn6m2dbf	plugin::users-permissions.role.createRole	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
115	nbps9dnu5sxr9no8yv1jhirj	plugin::users-permissions.role.findOne	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
116	s1qj281j25xfe2txhme0nns4	plugin::users-permissions.role.find	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.679	\N	\N	en
117	i7b8tj1dpdsajprlmlq6hy1w	plugin::users-permissions.role.updateRole	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.68	\N	\N	en
118	cjhj12nw2i13p3ec3r61097f	plugin::users-permissions.role.deleteRole	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.68	\N	\N	en
119	h0nok02m5nz9y0hhudijnbt3	plugin::users-permissions.permissions.getPermissions	2026-02-15 22:34:36.676	2026-02-15 22:34:36.676	2026-02-15 22:34:36.68	\N	\N	en
120	m6rww8292bek8thuvf98vdei	api::subject.subject.find	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	\N	\N	en
121	uzri5mynfljnqdbr7ekwubzp	api::subject.subject.findOne	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	\N	\N	en
122	a2y3uldg1kolgpdkzqne7wux	api::subject.subject.create	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	\N	\N	en
123	bhk8mhvg9g6gj4ylcopt6ry2	api::subject.subject.update	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	\N	\N	en
124	d9e5ecwvkhij2q1wihtwn8c5	api::subject.subject.delete	2026-02-15 22:34:44.467	2026-02-15 22:34:44.467	2026-02-15 22:34:44.468	\N	\N	en
125	wxbxa3fhlc7cu1iqc8wko05z	plugin::email.email.send	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.317	\N	\N	en
126	tsy8cdv5c4r3543ynr2ognuc	plugin::upload.content-api.find	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.317	\N	\N	en
127	gw54272sbvq1ko3ouxe69du2	plugin::upload.content-api.findOne	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.317	\N	\N	en
128	jpxtr1pum4bn0zn8zelhcz51	plugin::upload.content-api.destroy	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.317	\N	\N	en
129	woco33kmvdc32zfl5zu4o2h5	plugin::upload.content-api.upload	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.318	\N	\N	en
130	ja2jzz58xkqf7jjwcrhodsp9	plugin::i18n.locales.listLocales	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.318	\N	\N	en
131	mq352t9riaxy4i5vneivjd8a	plugin::users-permissions.auth.changePassword	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.318	\N	\N	en
132	h6hf37lff2dqpfk71d9ja01d	plugin::users-permissions.auth.refresh	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.318	\N	\N	en
133	im9dr6zzssyeldvplj1am1xx	plugin::users-permissions.auth.logout	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.321	\N	\N	en
134	agrt4kifbqys8d70eaqpnll2	plugin::users-permissions.user.create	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.321	\N	\N	en
135	oq89lo623eh631o8ritbj0ow	plugin::users-permissions.user.update	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.321	\N	\N	en
136	s2kxm8sw9wqdq0m37najva23	plugin::users-permissions.user.find	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.322	\N	\N	en
137	tla8y061l5s827hi5ofe88tc	plugin::users-permissions.user.findOne	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.322	\N	\N	en
138	susjo6e6v0rf7lf238nfus8w	plugin::users-permissions.user.count	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.322	\N	\N	en
139	h77mugpz8461hxunjk0odexg	plugin::users-permissions.user.destroy	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.322	\N	\N	en
140	iew59mjrhs21v90evzlt5xxc	plugin::users-permissions.user.me	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.322	\N	\N	en
141	xoe16od9st2plkr2s4ljggl3	plugin::users-permissions.role.createRole	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.323	\N	\N	en
142	e1x7cdmv8a0hhy3l63ml7h7q	plugin::users-permissions.role.findOne	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.323	\N	\N	en
143	tlr28aef37hynhjl6d6kuzmz	plugin::users-permissions.role.find	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.323	\N	\N	en
144	yod8os9lziyupspqiwyt9k5a	plugin::users-permissions.role.updateRole	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.323	\N	\N	en
145	nmx7yda7bv15hdstmsn8ya3l	plugin::users-permissions.role.deleteRole	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.324	\N	\N	en
146	zc7y3lkgsnl4kzz97nezxjb8	plugin::users-permissions.permissions.getPermissions	2026-02-15 22:35:35.316	2026-02-15 22:35:35.316	2026-02-15 22:35:35.324	\N	\N	en
148	d2hmu9o3eamhuakielmunrqc	api::classroom.classroom.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
147	sr5hei48886i2rhdta8m9q9v	api::classroom.classroom.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	\N	\N	en
149	nl5rxmj1y796kqui3yo77ovl	api::classroom.classroom.create	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
150	xo563ix5dlexabc7q34v5mni	api::classroom.classroom.update	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
151	dkbk1d88ccjbojnzfvqz87ap	api::classroom.classroom.delete	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
152	nb6pf5oa0nu59cs909csaqzh	api::nation.nation.find	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
153	roik2k1efjrcf0uic3mi91kl	api::nation.nation.findOne	2026-02-16 12:38:11.745	2026-02-16 12:38:11.745	2026-02-16 12:38:11.746	\N	\N	en
206	exbkd2unbq8fe2s8zud8ztx6	api::class-decision.class-decision.find	2026-02-17 13:49:03.067	2026-02-17 13:49:03.067	2026-02-17 13:49:03.068	\N	\N	en
209	gl93ujy5rj7pkrw3a7yxji52	api::class-decision.class-decision.update	2026-02-17 13:49:03.067	2026-02-17 13:49:03.067	2026-02-17 13:49:03.07	\N	\N	en
207	ckjenhabgbawp95rwg5c1h9g	api::class-decision.class-decision.findOne	2026-02-17 13:49:03.067	2026-02-17 13:49:03.067	2026-02-17 13:49:03.068	\N	\N	en
208	svbirg6xth4wmylgplcs01i5	api::class-decision.class-decision.create	2026-02-17 13:49:03.067	2026-02-17 13:49:03.067	2026-02-17 13:49:03.069	\N	\N	en
210	acq8c7bcdj6vh68vpbe53ywh	api::class-decision.class-decision.delete	2026-02-17 13:49:03.067	2026-02-17 13:49:03.067	2026-02-17 13:49:03.07	\N	\N	en
211	f12yomjnh9bc26es8fey6ivg	api::class-decision.class-decision.find	2026-02-17 13:51:33.585	2026-02-17 13:51:33.585	2026-02-17 13:51:33.585	\N	\N	en
212	ylankmq1apm8q5vkull15sa5	api::class-decision.class-decision.findOne	2026-02-17 13:51:33.594	2026-02-17 13:51:33.594	2026-02-17 13:51:33.594	\N	\N	en
213	j4wfeykbztrwdnsn2114lkyr	api::class-decision.class-decision.create	2026-02-17 13:51:33.607	2026-02-17 13:51:33.607	2026-02-17 13:51:33.607	\N	\N	en
214	ctwqtd8s2ztyncu9i20s9ffn	api::class-decision.class-decision.update	2026-02-17 13:51:33.62	2026-02-17 13:51:33.62	2026-02-17 13:51:33.62	\N	\N	en
215	dv1yfiuubqcss2umjnn9tvg0	api::class-decision.class-decision.delete	2026-02-17 13:51:33.628	2026-02-17 13:51:33.628	2026-02-17 13:51:33.629	\N	\N	en
216	thl1537ilealdns9ti5stvbc	api::class-decision.class-decision.find	2026-02-17 13:58:04.474	2026-02-17 13:58:04.474	2026-02-17 13:58:04.475	\N	\N	en
217	yefab3tiuahmma6spzl1qgoz	api::class-decision.class-decision.findOne	2026-02-17 13:58:04.474	2026-02-17 13:58:04.474	2026-02-17 13:58:04.475	\N	\N	en
218	ypm7fy66iu6yh2pq2jge7gmn	api::class-decision.class-decision.create	2026-02-17 13:58:04.474	2026-02-17 13:58:04.474	2026-02-17 13:58:04.476	\N	\N	en
219	sa313lo3z4vhvk08zu7kv6re	api::class-decision.class-decision.update	2026-02-17 13:58:04.474	2026-02-17 13:58:04.474	2026-02-17 13:58:04.476	\N	\N	en
220	uzpqr9v936xugiyh8tbw0q77	api::class-decision.class-decision.delete	2026-02-17 13:58:04.474	2026-02-17 13:58:04.474	2026-02-17 13:58:04.477	\N	\N	en
221	ncz19uef08v47jdwyz6uts3c	api::training-assignment.training-assignment.find	2026-02-17 14:58:12.974	2026-02-17 14:58:12.974	2026-02-17 14:58:12.974	\N	\N	en
222	q9e0ea18ewebzjbiii3hwbje	api::training-assignment.training-assignment.findOne	2026-02-17 14:58:13.053	2026-02-17 14:58:13.053	2026-02-17 14:58:13.054	\N	\N	en
223	r275v8otn2hgnide02bju847	api::training-assignment.training-assignment.create	2026-02-17 14:58:13.065	2026-02-17 14:58:13.065	2026-02-17 14:58:13.066	\N	\N	en
224	uxobbrjbvmw5zusmd70vwzta	api::training-assignment.training-assignment.update	2026-02-17 14:58:13.072	2026-02-17 14:58:13.072	2026-02-17 14:58:13.072	\N	\N	en
225	ym67sirippvduietk7v1wplz	api::training-assignment.training-assignment.delete	2026-02-17 14:58:13.078	2026-02-17 14:58:13.078	2026-02-17 14:58:13.079	\N	\N	en
226	kjqyj1uk9ksghhu4gkgys8gs	api::exam-approval.exam-approval.find	2026-02-17 15:16:18.649	2026-02-17 15:16:18.649	2026-02-17 15:16:18.649	\N	\N	en
227	wrhbr9jw15gqydj1pubg57pp	api::exam-approval.exam-approval.findOne	2026-02-17 15:16:18.655	2026-02-17 15:16:18.655	2026-02-17 15:16:18.655	\N	\N	en
228	blov77pbnu4ug7lsq81sllix	api::exam-approval.exam-approval.create	2026-02-17 15:16:18.66	2026-02-17 15:16:18.66	2026-02-17 15:16:18.661	\N	\N	en
229	cz6sfk7i170rpejgvvstxn28	api::exam-approval.exam-approval.update	2026-02-17 15:16:18.664	2026-02-17 15:16:18.664	2026-02-17 15:16:18.664	\N	\N	en
230	n7zxjqqcwf3a8jcsqovltl8v	api::exam-approval.exam-approval.delete	2026-02-17 15:16:18.668	2026-02-17 15:16:18.668	2026-02-17 15:16:18.668	\N	\N	en
231	drzgn6kijnbk055ra41osm5j	api::exam-grade.exam-grade.find	2026-02-17 15:27:20.255	2026-02-17 15:27:20.255	2026-02-17 15:27:20.255	\N	\N	en
232	ebrv6i8sstjid4vg39wxec7l	api::exam-grade.exam-grade.findOne	2026-02-17 15:27:20.265	2026-02-17 15:27:20.265	2026-02-17 15:27:20.265	\N	\N	en
233	ot022x9rs2o8ekhfzlmqzw23	api::exam-grade.exam-grade.create	2026-02-17 15:27:20.272	2026-02-17 15:27:20.272	2026-02-17 15:27:20.272	\N	\N	en
234	nqs2cim3tw5vzyj9zq38i0vs	api::exam-grade.exam-grade.update	2026-02-17 15:27:20.277	2026-02-17 15:27:20.277	2026-02-17 15:27:20.278	\N	\N	en
235	hmlvbtiafkcv0k5gciqyfgii	api::exam-grade.exam-grade.delete	2026-02-17 15:27:20.284	2026-02-17 15:27:20.284	2026-02-17 15:27:20.284	\N	\N	en
237	mj7pohbr0w04w0xgo7gq9xrx	api::audit-log.audit-log.findOne	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.92	\N	\N	en
236	a5en6uazcdqfayx7099xwztr	api::audit-log.audit-log.find	2026-02-23 22:58:49.917	2026-02-23 22:58:49.917	2026-02-23 22:58:49.918	\N	\N	en
238	jpf629gb2uioquxunmotwmzv	api::audit-log.audit-log.create	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.92	\N	\N	en
239	n6qabd0baf4ba0jnxbkuo8l3	api::audit-log.audit-log.update	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.921	\N	\N	en
240	bzop3vf6x50opy1cdjv0ty3s	api::audit-log.audit-log.delete	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.922	\N	\N	en
241	axldry3c5dvzpj7tpf7pikf5	api::class-subject.class-subject.find	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.922	\N	\N	en
242	lkpz9662hrglrpdx8jrxttoz	api::class-subject.class-subject.findOne	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.923	\N	\N	en
243	sg5bjrc0ln8uknk4otkxlool	api::class-subject.class-subject.create	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.924	\N	\N	en
244	f78y5uwibcqv4f8acv7gmb81	api::class-subject.class-subject.update	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.925	\N	\N	en
245	jrsqpjhtx0rim7eqvrh08qps	api::class-subject.class-subject.delete	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.925	\N	\N	en
246	v31vq5qbjzsutyfb0v4ex6lu	api::exam-approval.exam-approval.find	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.927	\N	\N	en
247	g7cbfnjs2011tznwh0t8vstu	api::exam-approval.exam-approval.findOne	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.927	\N	\N	en
248	qex9ggrip8v1ygld0fee9j1y	api::exam-approval.exam-approval.create	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.928	\N	\N	en
249	gpy31idgtxctxn85ymdc6lws	api::exam-approval.exam-approval.update	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.928	\N	\N	en
250	levvcl20r8bbs2jwn7mdw8s6	api::exam-approval.exam-approval.delete	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.929	\N	\N	en
251	fin2rf4qu1navfrvvk08yzs0	api::exam-grade.exam-grade.find	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.929	\N	\N	en
252	mrmk5bhpingp37qtbbnmp2rk	api::exam-grade.exam-grade.findOne	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.93	\N	\N	en
253	kjpvb8c4rlfcuchq713akb2d	api::exam-grade.exam-grade.create	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.93	\N	\N	en
254	paq7qsz56v885aqyhcsdb1ot	api::exam-grade.exam-grade.update	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.93	\N	\N	en
255	tjo2f8x0ex39elymyy2yfv68	api::exam-grade.exam-grade.delete	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
256	uvba58i5d5gq29lr46lau6pf	api::teacher-subject.teacher-subject.find	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
257	cw8s3bl8yx0kzwnq02y5on0l	api::teacher-subject.teacher-subject.findOne	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
258	az4ttalgi0fggjvzif4t3n0m	api::teacher-subject.teacher-subject.create	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
259	uljwkqqxjvfo6vtpauk9xvt0	api::teacher-subject.teacher-subject.update	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
260	una6kvh5x60b79tb3mpnxdfg	api::teacher-subject.teacher-subject.delete	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
261	gahs5zp33spchui59r4o9r76	api::training-assignment.training-assignment.find	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
262	irw0ywhu1e1pmswvp7lmvais	api::training-assignment.training-assignment.findOne	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.932	\N	\N	en
263	ve1trdt4keupz7bncdmff5uf	api::training-assignment.training-assignment.create	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.933	\N	\N	en
264	royinydiyywhcxvvu74fp1mw	api::training-assignment.training-assignment.update	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.933	\N	\N	en
265	wob0h82l6y6zjbiunblc094r	api::training-assignment.training-assignment.delete	2026-02-23 22:58:49.918	2026-02-23 22:58:49.918	2026-02-23 22:58:49.933	\N	\N	en
379	m7jkalzd14ozqkef0wa0d0b1	api::audit-log.audit-log.find	2026-02-26 11:44:43.337	2026-02-26 11:44:43.337	2026-02-26 11:44:43.338	\N	\N	en
380	t2gnktnhg8gc7sn8v6fne2c7	api::audit-log.audit-log.findOne	2026-02-26 11:44:43.346	2026-02-26 11:44:43.346	2026-02-26 11:44:43.347	\N	\N	en
381	j22309t5htl918f0cu2pxd5l	api::audit-log.audit-log.create	2026-02-26 11:44:43.351	2026-02-26 11:44:43.351	2026-02-26 11:44:43.351	\N	\N	en
382	x7lzsndnc6flyxi2n34loay1	api::audit-log.audit-log.update	2026-02-26 11:44:43.356	2026-02-26 11:44:43.356	2026-02-26 11:44:43.356	\N	\N	en
383	e9mif19z5bqlt34exwvk5gpv	api::audit-log.audit-log.delete	2026-02-26 11:44:43.36	2026-02-26 11:44:43.36	2026-02-26 11:44:43.36	\N	\N	en
384	lnieiv78wp10kdr2pjlkrkqd	api::audit-log.audit-log.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	\N	\N	\N
385	d457zbwed6d77mawrk10pio0	api::audit-log.audit-log.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.663	\N	\N	\N
386	qgbysd0vrqloc7z7qg8w4rkp	api::audit-log.audit-log.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.663	\N	\N	\N
387	oat68jl2zldbnmu0hhmww6sf	api::audit-log.audit-log.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.664	\N	\N	\N
388	qm76z56jxmhh2tgx69asa2by	api::audit-log.audit-log.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.664	\N	\N	\N
389	f7vbtyhshl80pepfbzr13usa	api::class-decision.class-decision.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.664	\N	\N	\N
390	zsazgcsskhwnp6ynqcciw698	api::class-decision.class-decision.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.665	\N	\N	\N
391	plq05wjnvqhcm1wdw0qn1iun	api::class-decision.class-decision.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.665	\N	\N	\N
392	h42p0hca6omze95ss3iau0we	api::class-decision.class-decision.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.666	\N	\N	\N
393	jvxnyclc8ooeoxxvhrh33cd8	api::class-decision.class-decision.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.666	\N	\N	\N
394	c1w4t9yjbfo7laxilwmrnl3p	api::class-subject.class-subject.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.667	\N	\N	\N
395	hp1fuxlkv1to0s0mczb0skek	api::class-subject.class-subject.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.667	\N	\N	\N
396	xro3j3gxzn7peht01flayoie	api::class-subject.class-subject.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.667	\N	\N	\N
397	ocr1g5w3t0mfpvjaeuc47v0u	api::class-subject.class-subject.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.668	\N	\N	\N
398	lqdoq32d33x8102i50jopn4a	api::class-subject.class-subject.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.668	\N	\N	\N
399	w1i1se08s5c8maes30855tnz	api::classroom.classroom.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.668	\N	\N	\N
401	mn6yzdju9mokhk2lmbaw6pti	api::classroom.classroom.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.67	\N	\N	\N
400	fn6yn61zrsppvb96ep5a886a	api::classroom.classroom.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.668	\N	\N	\N
402	srqd7rlmvs750enog72fgeqq	api::classroom.classroom.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.669	\N	\N	\N
403	pjedvx66554hbbkl55q48wrv	api::classroom.classroom.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.669	\N	\N	\N
404	qh8l71fyw4966ufomk8mv8fm	api::exam-approval.exam-approval.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.67	\N	\N	\N
405	vdgf0mgh3s2p77nbypewliyg	api::exam-approval.exam-approval.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.671	\N	\N	\N
406	a66n7pbwttjpqw75zohioras	api::exam-approval.exam-approval.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.671	\N	\N	\N
408	b29wxsxmxcfacirnz5eede96	api::exam-grade.exam-grade.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
407	xiis2cbig5cysal5sa17lhol	api::exam-approval.exam-approval.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.671	\N	\N	\N
422	apx2jktdosy6fufq94a7v3vp	api::print-template.print-template.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
428	mzmvckhfyo4mq8hwba2xv1tp	api::school-class.school-class.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
439	wuo257tjz83t0zf5o0yr3aeu	api::subject.subject.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
450	grufzb8ciygdx65umo3kxf2v	api::teacher.teacher.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
457	yrb15zr18seveajcc5ips63k	api::teacher-subject.teacher-subject.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
465	oidvje1h7xuz82vfrfha5zfm	plugin::content-type-builder.components.getComponent	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.677	\N	\N	\N
476	cm6szmuf73hpwz9fncjzed1k	plugin::users-permissions.auth.emailConfirmation	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.679	\N	\N	\N
487	y8akx84l8llno8ekbbgjnlkk	plugin::users-permissions.role.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
413	p57qx340fpp0nsucju3o3w7u	api::exam-grade.exam-grade.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
426	hjuymblajrnpizon111y7rk0	api::school-class.school-class.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
434	umaayhyxa390oit0ufx5w3kj	api::student-document.student-document.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
442	agi4w33af6pbcyh0qkcdswsa	api::subject.subject.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
453	q8deqzidqxrq93omeqo4fvtp	api::teacher.teacher.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
462	eewixe6xeh72znbhdv7t4das	api::training-assignment.training-assignment.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
473	ap8gywjka47bd3b3emq9mv4n	plugin::users-permissions.auth.connect	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.678	\N	\N	\N
484	r6l1elhf1k7fd6kiajal5ldu	plugin::users-permissions.user.me	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
414	sw5sigiic07xud40ct4rrzzb	api::nation.nation.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
423	p78v7x4hmdlmeggu671y7900	api::print-template.print-template.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
432	t37uv9exoh2y900r50v8qp4v	api::student.student.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
441	xu2n0dmgmmozc8yevedpsufn	api::subject.subject.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
451	m87dxhn3lllx5z5iytd4m2zo	api::teacher.teacher.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
464	ih7935zgxikdkeqiaht0uey5	plugin::content-type-builder.components.getComponents	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.677	\N	\N	\N
472	tjxvp8y4o2mbw296dpeb5v8e	plugin::users-permissions.auth.logout	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.678	\N	\N	\N
481	qqcmlnykd15ig461aaf6bnhb	plugin::users-permissions.user.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
415	cv28byibtzvucnhy7j5vwytv	api::nation.nation.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
421	ze1lvg9qj2x81hpnph5kblrs	api::print-template.print-template.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
429	oicm2t8kjz6mb1a95uy80gr0	api::student.student.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
440	ale58auhburp9p6if8y5xb34	api::subject.subject.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
448	m19wahejolm4x06epqs5yghw	api::supplier.supplier.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
459	k0ij9sqyiq8fvrr6bmnk9vzj	api::training-assignment.training-assignment.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
467	yyd2n46ykv5eixojodsqpvto	plugin::content-type-builder.content-types.getContentType	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.677	\N	\N	\N
477	ir0q2m5llord42oziyqr1jfk	plugin::users-permissions.auth.sendEmailConfirmation	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
489	bogmhhxad3mtkiwiu0encqfu	plugin::users-permissions.role.deleteRole	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
410	oihye152eanwkea0i7cl0dor	api::exam-grade.exam-grade.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
418	xs343nh53v1m9rvlvqttfimy	api::nation.nation.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
430	j736gjd6miakhvh8k8onzfj8	api::student.student.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
438	a8m1x6tay22kj399bsq36dgu	api::student-document.student-document.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
447	o0jjlwcht8wpqgflhhajob8z	api::supplier.supplier.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
460	leottv4nmure71m7ua9nlhdm	api::training-assignment.training-assignment.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
470	cnx11uievvegvvbbo33m1br6	plugin::users-permissions.auth.resetPassword	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.678	\N	\N	\N
480	unfx29uyfbxp6r5149paap0w	plugin::users-permissions.user.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
416	chen2khvravy2tfpgo1bell4	api::nation.nation.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
424	vdu8byh55ct3xfynsy9t9oqp	api::school-class.school-class.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
436	vrworcf4scbpb50dko3e4fc1	api::student-document.student-document.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
449	ar6eflwkqvayykt9gr1skp64	api::teacher.teacher.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
458	mykfjpwxvrrjxtwsy4tlbb86	api::teacher-subject.teacher-subject.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
469	yrd57hr105oz0ka43cps6sb2	plugin::users-permissions.auth.changePassword	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.677	\N	\N	\N
478	fh9toghjnf12fgq2t4swevb5	plugin::users-permissions.user.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
486	wq7k4cntt9desvksfvie8u0q	plugin::users-permissions.role.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
417	jckape22havdnl0nxi70x5x9	api::nation.nation.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
427	h30zhk9g9jun95gqyo0cl3v5	api::school-class.school-class.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
435	vuilr951oiraz4ar2wyfjxll	api::student-document.student-document.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
445	vk1n5ks3yb90j1lwxw739i8w	api::supplier.supplier.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
456	bh59ll63rhcjoh8p0ilk7lsd	api::teacher-subject.teacher-subject.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
468	u3wyz854mty6ba0dr9jopum6	plugin::users-permissions.auth.callback	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.677	\N	\N	\N
479	kolat1pqvpblo0i1pr43gic4	plugin::users-permissions.user.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
485	vo7buzpaqrp5c5mbbogd4f7c	plugin::users-permissions.role.createRole	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
409	icy044if83r7otwgtwccx2p0	api::exam-approval.exam-approval.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
425	dld1syt0i9992dmceuuksqvv	api::school-class.school-class.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
437	npe14oaurdi8cerdd0wgz478	api::student-document.student-document.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
446	cmlidj9wo9gz331f99alllno	api::supplier.supplier.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
455	d2vou3k2p6najw2grxux7r6j	api::teacher-subject.teacher-subject.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
466	qhq0xsz18np9s6joyst99fq8	plugin::content-type-builder.content-types.getContentTypes	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.677	\N	\N	\N
475	z9vqc61o13c5jglmyx3moldy	plugin::users-permissions.auth.register	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.679	\N	\N	\N
488	h6y25bwh4w45qaxva5xfbep8	plugin::users-permissions.role.updateRole	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
491	hbf87x96276ligbjvzvwkzni	api::print-template.print-template.find	2026-03-23 09:35:57.464	2026-03-23 09:35:57.464	2026-03-23 09:35:57.464	\N	\N	\N
492	dcex5a1w7wwpnoylvuldfymr	api::print-template.print-template.findOne	2026-03-23 09:35:57.493	2026-03-23 09:35:57.493	2026-03-23 09:35:57.493	\N	\N	\N
411	g9j2kvu6busu9yoz8b0mroal	api::exam-grade.exam-grade.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
419	vhv4zvbxv4on670ew9lj9053	api::print-template.print-template.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
431	c3b0tikvp4hd1izx8c3f3yp9	api::student.student.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
444	cg3xgjy99zm8sm1kqwumm5o9	api::supplier.supplier.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
452	qp2me2z05omtau82ygw4fepp	api::teacher.teacher.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
463	h8j9x9csrvaj2zpxszhz5uat	api::training-assignment.training-assignment.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
474	ifcgx1kcddlh25ic4aso4itr	plugin::users-permissions.auth.forgotPassword	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.678	\N	\N	\N
483	xirg87mxlggk3kwe0wr26e7n	plugin::users-permissions.user.destroy	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
412	j4z6quwm8mdtc5q140abf2lp	api::exam-grade.exam-grade.update	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.672	\N	\N	\N
420	rqfv5pob0pzyqng3qdgaycv4	api::print-template.print-template.findOne	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.673	\N	\N	\N
433	nr01188ink9hzdjl8y2e49kg	api::student.student.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.674	\N	\N	\N
443	q5vr5vf7icz87s3nlcmprcv6	api::subject.subject.delete	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.675	\N	\N	\N
454	uzfsbtbs346558a3cxb24plb	api::teacher-subject.teacher-subject.find	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
461	ft0fxau4ifjxhs3oxwt24paq	api::training-assignment.training-assignment.create	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.676	\N	\N	\N
471	u4yzlb9kznvwkrvu8ya8221h	plugin::users-permissions.auth.refresh	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.678	\N	\N	\N
482	q556st8kj8zne1ikf9p9ivt6	plugin::users-permissions.user.count	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.68	\N	\N	\N
490	eaygqdqknottju4xamb8ygrn	plugin::users-permissions.permissions.getPermissions	2026-03-21 04:49:50.662	2026-03-21 04:49:50.662	2026-03-21 04:49:50.681	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
2	1	1	1
3	3	2	1
4	4	2	1
5	5	2	2
6	6	2	2
7	9	2	2
8	8	2	2
9	7	2	2
10	10	1	2
11	11	1	2
12	12	1	3
13	13	1	3
14	14	1	4
15	15	1	4
16	16	1	5
17	17	1	5
18	18	1	6
19	19	1	6
20	20	1	7
21	21	1	7
22	22	1	8
23	23	1	8
24	24	1	9
25	25	1	9
26	26	1	10
27	27	1	10
28	28	1	11
29	29	1	11
30	31	1	12
31	30	1	12
32	32	1	13
33	33	1	13
34	34	1	14
35	35	1	14
36	36	1	15
37	37	1	15
38	38	1	16
39	39	1	16
40	40	1	17
41	41	1	18
42	42	1	18
43	43	1	19
44	44	1	19
45	45	1	20
46	46	1	20
47	47	1	21
48	48	2	3
49	49	2	3
50	50	2	4
51	51	2	4
52	52	2	5
53	53	2	5
54	54	2	6
55	55	2	6
56	56	2	7
57	57	2	7
58	58	2	8
59	59	2	8
60	60	2	9
61	61	2	9
62	62	2	10
63	63	2	10
64	64	2	11
65	66	2	11
66	65	2	12
67	67	2	12
68	68	2	13
69	69	2	13
70	70	2	14
71	71	2	14
72	72	2	15
73	73	2	15
74	74	2	16
75	75	2	16
76	77	2	17
77	76	2	17
78	78	2	17
79	81	2	18
80	79	2	18
81	82	2	18
82	80	2	18
83	83	2	19
84	86	2	19
85	87	2	19
86	84	2	19
87	88	2	19
88	85	2	19
89	89	2	20
90	90	2	20
91	91	2	20
92	97	1	22
93	96	1	22
94	98	1	22
95	92	1	22
96	94	1	22
97	95	1	22
98	93	1	23
99	99	1	23
100	100	1	23
101	101	1	24
102	102	1	24
103	103	1	24
104	104	1	24
105	105	1	24
106	106	1	24
107	109	1	25
108	107	1	25
109	108	1	25
110	110	1	25
111	111	1	25
112	112	1	26
113	113	1	26
114	114	1	26
115	115	1	27
116	116	1	27
117	117	1	27
118	118	1	27
119	119	1	28
120	120	1	29
121	121	1	30
122	123	1	30
123	124	1	30
124	122	1	30
125	125	2	21
126	126	2	21
127	127	2	22
128	128	2	23
129	129	2	23
130	130	2	24
131	131	2	24
132	132	2	25
133	133	2	25
134	134	2	26
135	135	2	26
136	136	2	27
137	137	2	27
138	138	2	28
139	139	2	28
140	140	2	29
141	141	2	29
142	142	2	30
143	143	2	30
144	144	2	31
145	145	2	31
146	146	2	32
147	147	3	1
148	148	3	2
149	149	3	2
150	150	3	3
151	151	3	4
152	152	3	4
153	153	3	5
154	154	3	5
155	155	3	6
156	156	3	6
157	157	3	7
158	158	3	7
160	160	3	8
161	161	3	9
162	162	3	10
163	163	3	11
164	164	3	12
166	165	3	13
168	168	3	14
170	170	3	15
172	173	3	16
175	175	3	17
177	178	3	18
181	182	3	19
187	188	3	20
194	194	3	21
201	201	3	23
159	159	3	8
165	166	3	13
167	167	3	14
169	169	3	15
171	172	3	16
173	171	3	16
174	174	3	17
176	177	3	18
178	176	3	18
179	179	3	19
180	181	3	19
182	180	3	19
183	183	3	20
184	185	3	20
185	186	3	20
186	187	3	20
188	184	3	20
189	190	3	21
190	189	3	21
191	191	3	21
192	192	3	21
193	193	3	21
195	196	3	22
196	195	3	22
197	197	3	22
198	198	3	22
199	199	3	22
200	200	3	23
202	202	3	23
203	203	3	24
204	204	3	24
205	205	3	24
210	208	1	31
209	210	1	31
208	207	1	31
207	209	1	31
206	206	1	31
211	211	3	25
212	212	3	26
213	213	3	27
214	214	3	28
215	215	3	29
216	216	2	33
217	217	2	33
218	218	2	34
219	219	2	34
220	220	2	35
221	221	3	30
222	222	3	31
223	223	3	32
224	224	3	33
225	225	3	34
226	226	3	35
227	227	3	36
228	228	3	37
229	229	3	38
230	230	3	39
231	231	3	40
232	232	3	41
233	233	3	42
234	234	3	43
235	235	3	44
236	237	1	32
237	236	1	32
238	238	1	33
239	239	1	33
240	240	1	34
241	241	1	34
242	242	1	35
243	243	1	35
244	244	1	36
245	245	1	36
246	246	1	37
247	247	1	37
248	248	1	38
249	249	1	38
250	250	1	39
251	251	1	39
252	252	1	40
253	253	1	40
254	254	1	41
255	255	1	41
256	256	1	42
257	257	1	42
258	258	1	43
259	259	1	43
260	260	1	44
261	261	1	44
262	262	1	45
263	263	1	45
264	264	1	46
265	265	1	46
267	267	4	1
266	266	4	1
268	268	4	2
269	269	4	3
270	270	4	3
271	271	4	4
272	272	4	4
273	273	4	5
274	275	4	5
275	276	4	6
276	274	4	6
277	277	4	6
278	278	4	7
279	280	4	7
280	279	4	8
281	282	4	8
282	283	4	8
283	281	4	8
284	285	4	8
285	284	4	9
286	287	4	9
287	288	4	9
288	286	4	9
289	289	4	9
290	290	4	9
291	292	4	10
292	293	4	10
293	294	4	10
294	291	4	10
295	295	4	10
296	296	4	10
297	297	4	10
298	298	4	11
299	299	4	11
300	300	4	11
301	301	4	11
302	302	4	11
303	303	4	11
304	304	4	12
305	307	4	12
306	305	4	12
307	306	4	12
308	308	4	13
309	309	4	13
310	310	4	13
311	311	4	13
312	312	4	13
313	313	4	14
314	316	4	14
315	314	4	14
316	315	4	14
317	317	4	14
318	318	4	14
319	319	4	15
320	320	4	15
321	322	4	15
322	321	4	15
323	323	4	15
324	324	4	16
325	325	4	16
326	326	4	16
327	327	4	16
328	328	4	17
329	329	4	17
330	330	4	17
331	331	4	17
339	339	4	19
347	347	4	20
356	357	4	22
365	365	4	23
332	332	4	17
340	340	4	19
348	348	4	20
357	358	4	22
367	367	4	23
333	333	4	18
341	341	4	19
349	350	4	21
359	359	4	22
368	368	4	24
334	334	4	18
342	342	4	19
351	351	4	21
360	360	4	22
369	369	4	24
335	335	4	18
344	343	4	20
353	353	4	21
362	362	4	23
371	371	4	24
336	336	4	18
343	344	4	19
352	352	4	21
361	361	4	22
370	370	4	24
337	337	4	18
345	345	4	20
354	354	4	21
363	363	4	23
372	372	4	24
338	338	4	19
346	346	4	20
350	349	4	21
355	356	4	22
358	355	4	22
364	364	4	23
366	366	4	23
373	373	4	25
374	374	3	45
375	375	3	46
376	376	3	47
377	377	3	48
378	378	3	49
379	379	3	50
380	380	3	51
381	381	3	52
382	382	3	53
383	383	3	54
384	384	6	1
385	385	6	1
386	386	6	1
387	387	6	1
388	388	6	1
389	389	6	1
390	391	6	1
391	390	6	1
392	392	6	1
393	393	6	1
394	394	6	2
395	395	6	2
396	396	6	2
397	397	6	2
398	399	6	2
399	398	6	2
400	400	6	3
401	401	6	3
402	406	6	3
403	402	6	3
404	405	6	3
405	403	6	3
406	408	6	3
407	404	6	4
408	410	6	4
409	412	6	4
410	415	6	4
411	407	6	5
412	411	6	4
413	416	6	5
414	409	6	5
415	413	6	5
416	417	6	5
417	414	6	5
418	421	6	6
419	422	6	6
420	419	6	6
421	423	6	6
422	418	6	6
423	420	6	6
424	426	6	7
425	424	6	7
426	425	6	7
427	427	6	7
428	430	6	7
429	429	6	7
430	428	6	7
431	432	6	7
432	434	6	8
433	433	6	8
434	431	6	8
435	435	6	8
436	437	6	8
437	438	6	8
438	440	6	8
439	439	6	9
440	444	6	9
441	441	6	9
442	436	6	9
443	442	6	9
444	443	6	9
445	450	6	10
446	449	6	10
447	445	6	10
448	446	6	10
449	448	6	10
450	447	6	10
451	454	6	10
452	453	6	10
453	452	6	10
454	451	6	10
455	457	6	11
456	455	6	11
457	459	6	11
458	456	6	11
459	458	6	11
460	460	6	11
461	461	6	11
462	462	6	12
463	464	6	12
464	466	6	12
465	465	6	12
466	467	6	12
467	469	6	12
468	468	6	12
469	470	6	12
470	463	6	12
471	472	6	13
472	474	6	13
480	480	6	14
473	471	6	13
483	486	6	15
474	473	6	14
484	488	6	15
475	479	6	14
485	484	6	15
476	478	6	14
489	485	6	15
477	476	6	14
486	483	6	15
478	475	6	14
487	487	6	15
479	477	6	14
490	489	6	16
481	481	6	14
488	490	6	15
482	482	6	14
491	491	1	47
492	492	1	48
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
3	lhtidln661l7i0xnn0o0hvyq	Public	Tạo api	public	2026-02-16 12:38:11.729	2026-02-16 12:38:11.729	2026-02-16 12:38:11.73	\N	\N	en
2	tyesxm5mrjapuac9ylvml3e9	Public	Default role given to unauthenticated user.	public	2026-02-09 15:13:37.065	2026-02-17 17:54:47.479	2026-02-09 15:13:37.066	\N	\N	en
1	js7pxqjum1bsccgszy42fi1z	Authenticated	Default role given to authenticated user.	authenticated	2026-02-09 15:13:37.062	2026-02-23 22:58:49.91	2026-02-09 15:13:37.062	\N	\N	en
5	\N	Manager	Manager for training and students	manager	2026-02-24 10:24:06.500708	2026-02-24 10:24:06.500708	\N	\N	\N	en
6	\N	Teacher	Teacher with access to scores and schedules	teacher	2026-02-24 10:24:06.501872	2026-03-21 04:49:50.655	\N	\N	\N	en
4	\N	Admin	Administrator with full access	admin	2026-02-24 10:24:06.495688	2026-03-23 08:27:14.779	\N	\N	\N	en
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_users (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, permissions) FROM stdin;
6	edxu9482ip1487w018zqipzs	2026-02-24 10:29:14.602	2026-03-10 09:11:18.942	2026-02-24 10:29:14.603	\N	\N	en	ducthien	ndthien@cdhh.edu.vn	local	$2a$10$OZv94Rk0aNhenZKrh0.jYeVQBLWGK5r2.EPinb5SAbpMDXmowFEGm	\N	\N	t	f	["manage_students", "manage_classes", "manage_grades", "view_dashboard", "exam_approval", "manage_decisions"]
1	malmgnrwizkbj6p37culuxr1	2026-02-19 03:02:56.717	2026-03-24 01:11:50.07	2026-03-24 01:11:49.976	\N	1	en	Duong	adsxaluan@gmail.com	\N	$2a$10$s8ldgDKSJDMvWtpzLlbPneHBpf9o9AxA8mRK3.0funp7DVqIftwG2	\N	\N	t	f	[]
9	lgotewwer98r01thh5me0ar1	2026-03-24 01:17:34.396	2026-03-24 01:17:34.396	2026-03-24 01:17:34.397	\N	\N	\N	nmthai	nmthai@cdhh.edu.vn	local	$2a$10$detyaMqKznK6qB6nun6AsuqwYuLS1PN61/zrdWhxcjdes9GEFPbBa	\N	\N	t	f	\N
8	gk62zo5oe9stplgj38zkjm1l	2026-03-23 09:45:10.734	2026-03-24 00:53:57.973	2026-03-23 09:45:10.735	\N	\N	\N	admin	support@edumaster.vn	local	$2a$10$Ivxb1JVnLtkIPlFmt0gteuvtfswPYNwYgM/2JKE4RxHPPjeVPSb/u	\N	\N	t	f	\N
7	lip02imu46wcy8rsapwcchcd	2026-03-23 09:35:57.58	2026-03-24 00:53:57.954	2026-03-23 09:35:57.58	\N	\N	\N	duong	admin@edumaster.vn	local	$2a$10$CLCDLMPuHvNw7zExnEsUXu7IQbxsFeHszbBlqOjD2infv4umaHYVG	\N	\N	t	f	\N
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
19	7	1	1
21	8	1	2
27	9	4	1
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 442, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 442, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 17, true);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 63, true);


--
-- Name: class_decisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.class_decisions_id_seq', 160, true);


--
-- Name: class_decisions_related_decision_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.class_decisions_related_decision_lnk_id_seq', 74, true);


--
-- Name: class_decisions_school_class_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.class_decisions_school_class_lnk_id_seq', 171, true);


--
-- Name: class_decisions_students_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.class_decisions_students_lnk_id_seq', 216, true);


--
-- Name: class_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.class_subjects_id_seq', 10, true);


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classes_id_seq', 249, true);


--
-- Name: classes_subjects_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classes_subjects_lnk_id_seq', 216, true);


--
-- Name: classrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classrooms_id_seq', 16, true);


--
-- Name: exam_approvals_decision_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exam_approvals_decision_lnk_id_seq', 113, true);


--
-- Name: exam_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exam_approvals_id_seq', 39, true);


--
-- Name: exam_grades_decision_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exam_grades_decision_lnk_id_seq', 91, true);


--
-- Name: exam_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exam_grades_id_seq', 37, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_id_seq', 1, false);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 1, false);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: nations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nations_id_seq', 26, true);


--
-- Name: print_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.print_templates_id_seq', 3, true);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_ai_localization_jobs_id_seq', 1, false);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_ai_metadata_jobs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 61, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 27, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 7, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_sessions_id_seq', 85, true);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: student_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.student_documents_id_seq', 59, true);


--
-- Name: student_documents_student_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.student_documents_student_lnk_id_seq', 75, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 191, true);


--
-- Name: students_school_class_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_school_class_lnk_id_seq', 154, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 376, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 15, true);


--
-- Name: teacher_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teacher_subjects_id_seq', 7, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_id_seq', 135, true);


--
-- Name: teachers_subjects_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_subjects_lnk_id_seq', 1057, true);


--
-- Name: training_assignments_decision_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_assignments_decision_lnk_id_seq', 79, true);


--
-- Name: training_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_assignments_id_seq', 37, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 492, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 492, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 6, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_users_id_seq', 9, true);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 27, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: class_decisions class_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions
    ADD CONSTRAINT class_decisions_pkey PRIMARY KEY (id);


--
-- Name: class_decisions_related_decision_lnk class_decisions_related_decision_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_related_decision_lnk
    ADD CONSTRAINT class_decisions_related_decision_lnk_pkey PRIMARY KEY (id);


--
-- Name: class_decisions_related_decision_lnk class_decisions_related_decision_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_related_decision_lnk
    ADD CONSTRAINT class_decisions_related_decision_lnk_uq UNIQUE (class_decision_id, inv_class_decision_id);


--
-- Name: class_decisions_school_class_lnk class_decisions_school_class_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_school_class_lnk
    ADD CONSTRAINT class_decisions_school_class_lnk_pkey PRIMARY KEY (id);


--
-- Name: class_decisions_school_class_lnk class_decisions_school_class_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_school_class_lnk
    ADD CONSTRAINT class_decisions_school_class_lnk_uq UNIQUE (class_decision_id, school_class_id);


--
-- Name: class_decisions_students_lnk class_decisions_students_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_students_lnk
    ADD CONSTRAINT class_decisions_students_lnk_pkey PRIMARY KEY (id);


--
-- Name: class_decisions_students_lnk class_decisions_students_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_students_lnk
    ADD CONSTRAINT class_decisions_students_lnk_uq UNIQUE (class_decision_id, student_id);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: classes_subjects_lnk classes_subjects_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes_subjects_lnk
    ADD CONSTRAINT classes_subjects_lnk_pkey PRIMARY KEY (id);


--
-- Name: classes_subjects_lnk classes_subjects_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes_subjects_lnk
    ADD CONSTRAINT classes_subjects_lnk_uq UNIQUE (school_class_id, subject_id);


--
-- Name: classrooms classrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_pkey PRIMARY KEY (id);


--
-- Name: exam_approvals_decision_lnk exam_approvals_decision_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals_decision_lnk
    ADD CONSTRAINT exam_approvals_decision_lnk_pkey PRIMARY KEY (id);


--
-- Name: exam_approvals_decision_lnk exam_approvals_decision_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals_decision_lnk
    ADD CONSTRAINT exam_approvals_decision_lnk_uq UNIQUE (exam_approval_id, class_decision_id);


--
-- Name: exam_approvals exam_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals
    ADD CONSTRAINT exam_approvals_pkey PRIMARY KEY (id);


--
-- Name: exam_grades_decision_lnk exam_grades_decision_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades_decision_lnk
    ADD CONSTRAINT exam_grades_decision_lnk_pkey PRIMARY KEY (id);


--
-- Name: exam_grades_decision_lnk exam_grades_decision_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades_decision_lnk
    ADD CONSTRAINT exam_grades_decision_lnk_uq UNIQUE (exam_grade_id, class_decision_id);


--
-- Name: exam_grades exam_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades
    ADD CONSTRAINT exam_grades_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: nations nations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_pkey PRIMARY KEY (id);


--
-- Name: print_templates print_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_templates
    ADD CONSTRAINT print_templates_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_localization_jobs strapi_ai_localization_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs
    ADD CONSTRAINT strapi_ai_localization_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_metadata_jobs strapi_ai_metadata_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs
    ADD CONSTRAINT strapi_ai_metadata_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_sessions strapi_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: student_documents student_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents
    ADD CONSTRAINT student_documents_pkey PRIMARY KEY (id);


--
-- Name: student_documents_student_lnk student_documents_student_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents_student_lnk
    ADD CONSTRAINT student_documents_student_lnk_pkey PRIMARY KEY (id);


--
-- Name: student_documents_student_lnk student_documents_student_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents_student_lnk
    ADD CONSTRAINT student_documents_student_lnk_uq UNIQUE (student_document_id, student_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students_school_class_lnk students_school_class_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_school_class_lnk
    ADD CONSTRAINT students_school_class_lnk_pkey PRIMARY KEY (id);


--
-- Name: students_school_class_lnk students_school_class_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_school_class_lnk
    ADD CONSTRAINT students_school_class_lnk_uq UNIQUE (student_id, school_class_id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: teachers_subjects_lnk teachers_subjects_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers_subjects_lnk
    ADD CONSTRAINT teachers_subjects_lnk_pkey PRIMARY KEY (id);


--
-- Name: teachers_subjects_lnk teachers_subjects_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers_subjects_lnk
    ADD CONSTRAINT teachers_subjects_lnk_uq UNIQUE (teacher_id, subject_id);


--
-- Name: training_assignments_decision_lnk training_assignments_decision_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments_decision_lnk
    ADD CONSTRAINT training_assignments_decision_lnk_pkey PRIMARY KEY (id);


--
-- Name: training_assignments_decision_lnk training_assignments_decision_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments_decision_lnk
    ADD CONSTRAINT training_assignments_decision_lnk_uq UNIQUE (training_assignment_id, class_decision_id);


--
-- Name: training_assignments training_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments
    ADD CONSTRAINT training_assignments_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_document_id_idx ON public.admin_permissions USING btree (document_id);


--
-- Name: admin_permissions_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_document_id_locale_published_at_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_document_id_idx ON public.admin_roles USING btree (document_id);


--
-- Name: admin_roles_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_document_id_locale_published_at_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_document_id_idx ON public.admin_users USING btree (document_id);


--
-- Name: admin_users_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_document_id_locale_published_at_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: audit_logs_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_created_by_id_fk ON public.audit_logs USING btree (created_by_id);


--
-- Name: audit_logs_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_documents_idx ON public.audit_logs USING btree (document_id, locale, published_at);


--
-- Name: audit_logs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_updated_by_id_fk ON public.audit_logs USING btree (updated_by_id);


--
-- Name: class_decisions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_created_by_id_fk ON public.class_decisions USING btree (created_by_id);


--
-- Name: class_decisions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_documents_idx ON public.class_decisions USING btree (document_id, locale, published_at);


--
-- Name: class_decisions_related_decision_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_related_decision_lnk_fk ON public.class_decisions_related_decision_lnk USING btree (class_decision_id);


--
-- Name: class_decisions_related_decision_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_related_decision_lnk_ifk ON public.class_decisions_related_decision_lnk USING btree (inv_class_decision_id);


--
-- Name: class_decisions_school_class_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_school_class_lnk_fk ON public.class_decisions_school_class_lnk USING btree (class_decision_id);


--
-- Name: class_decisions_school_class_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_school_class_lnk_ifk ON public.class_decisions_school_class_lnk USING btree (school_class_id);


--
-- Name: class_decisions_students_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_students_lnk_fk ON public.class_decisions_students_lnk USING btree (class_decision_id);


--
-- Name: class_decisions_students_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_students_lnk_ifk ON public.class_decisions_students_lnk USING btree (student_id);


--
-- Name: class_decisions_students_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_students_lnk_ofk ON public.class_decisions_students_lnk USING btree (student_ord);


--
-- Name: class_decisions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_decisions_updated_by_id_fk ON public.class_decisions USING btree (updated_by_id);


--
-- Name: class_subjects_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_subjects_created_by_id_fk ON public.class_subjects USING btree (created_by_id);


--
-- Name: class_subjects_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_subjects_documents_idx ON public.class_subjects USING btree (document_id, locale, published_at);


--
-- Name: class_subjects_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX class_subjects_updated_by_id_fk ON public.class_subjects USING btree (updated_by_id);


--
-- Name: classes_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classes_created_by_id_fk ON public.classes USING btree (created_by_id);


--
-- Name: classes_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classes_documents_idx ON public.classes USING btree (document_id, locale, published_at);


--
-- Name: classes_subjects_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classes_subjects_lnk_fk ON public.classes_subjects_lnk USING btree (school_class_id);


--
-- Name: classes_subjects_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classes_subjects_lnk_ifk ON public.classes_subjects_lnk USING btree (subject_id);


--
-- Name: classes_subjects_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classes_subjects_lnk_ofk ON public.classes_subjects_lnk USING btree (subject_ord);


--
-- Name: classes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classes_updated_by_id_fk ON public.classes USING btree (updated_by_id);


--
-- Name: classrooms_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classrooms_created_by_id_fk ON public.classrooms USING btree (created_by_id);


--
-- Name: classrooms_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classrooms_documents_idx ON public.classrooms USING btree (document_id, locale, published_at);


--
-- Name: classrooms_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX classrooms_updated_by_id_fk ON public.classrooms USING btree (updated_by_id);


--
-- Name: exam_approvals_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_approvals_created_by_id_fk ON public.exam_approvals USING btree (created_by_id);


--
-- Name: exam_approvals_decision_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_approvals_decision_lnk_fk ON public.exam_approvals_decision_lnk USING btree (exam_approval_id);


--
-- Name: exam_approvals_decision_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_approvals_decision_lnk_ifk ON public.exam_approvals_decision_lnk USING btree (class_decision_id);


--
-- Name: exam_approvals_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_approvals_documents_idx ON public.exam_approvals USING btree (document_id, locale, published_at);


--
-- Name: exam_approvals_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_approvals_updated_by_id_fk ON public.exam_approvals USING btree (updated_by_id);


--
-- Name: exam_grades_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_grades_created_by_id_fk ON public.exam_grades USING btree (created_by_id);


--
-- Name: exam_grades_decision_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_grades_decision_lnk_fk ON public.exam_grades_decision_lnk USING btree (exam_grade_id);


--
-- Name: exam_grades_decision_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_grades_decision_lnk_ifk ON public.exam_grades_decision_lnk USING btree (class_decision_id);


--
-- Name: exam_grades_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_grades_documents_idx ON public.exam_grades USING btree (document_id, locale, published_at);


--
-- Name: exam_grades_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX exam_grades_updated_by_id_fk ON public.exam_grades USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_document_id_idx ON public.files USING btree (document_id);


--
-- Name: files_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_document_id_locale_published_at_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_document_id_idx ON public.i18n_locale USING btree (document_id);


--
-- Name: i18n_locale_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_document_id_locale_published_at_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: nations_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nations_created_by_id_fk ON public.nations USING btree (created_by_id);


--
-- Name: nations_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nations_documents_idx ON public.nations USING btree (document_id, locale, published_at);


--
-- Name: nations_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nations_updated_by_id_fk ON public.nations USING btree (updated_by_id);


--
-- Name: print_templates_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX print_templates_created_by_id_fk ON public.print_templates USING btree (created_by_id);


--
-- Name: print_templates_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX print_templates_documents_idx ON public.print_templates USING btree (document_id, locale, published_at);


--
-- Name: print_templates_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX print_templates_updated_by_id_fk ON public.print_templates USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_document_id_idx ON public.strapi_api_token_permissions USING btree (document_id);


--
-- Name: strapi_api_token_permissions_document_id_locale_published_at_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_document_id_locale_published_at_id ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_document_id_idx ON public.strapi_api_tokens USING btree (document_id);


--
-- Name: strapi_api_tokens_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_document_id_locale_published_at_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_document_id_idx ON public.strapi_release_actions USING btree (document_id);


--
-- Name: strapi_release_actions_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_document_id_locale_published_at_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_document_id_idx ON public.strapi_releases USING btree (document_id);


--
-- Name: strapi_releases_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_document_id_locale_published_at_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_sessions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_created_by_id_fk ON public.strapi_sessions USING btree (created_by_id);


--
-- Name: strapi_sessions_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_document_id_idx ON public.strapi_sessions USING btree (document_id);


--
-- Name: strapi_sessions_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_document_id_locale_published_at_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- Name: strapi_sessions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_documents_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- Name: strapi_sessions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_updated_by_id_fk ON public.strapi_sessions USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_document_id_idx ON public.strapi_transfer_token_permissions USING btree (document_id);


--
-- Name: strapi_transfer_token_permissions_document_id_locale_published_; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_document_id_locale_published_ ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_document_id_idx ON public.strapi_transfer_tokens USING btree (document_id);


--
-- Name: strapi_transfer_tokens_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_document_id_locale_published_at_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_document_id_idx ON public.strapi_workflows USING btree (document_id);


--
-- Name: strapi_workflows_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_document_id_locale_published_at_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_document_id_idx ON public.strapi_workflows_stages USING btree (document_id);


--
-- Name: strapi_workflows_stages_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_document_id_locale_published_at_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: student_documents_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX student_documents_created_by_id_fk ON public.student_documents USING btree (created_by_id);


--
-- Name: student_documents_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX student_documents_documents_idx ON public.student_documents USING btree (document_id, locale, published_at);


--
-- Name: student_documents_student_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX student_documents_student_lnk_fk ON public.student_documents_student_lnk USING btree (student_document_id);


--
-- Name: student_documents_student_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX student_documents_student_lnk_ifk ON public.student_documents_student_lnk USING btree (student_id);


--
-- Name: student_documents_student_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX student_documents_student_lnk_oifk ON public.student_documents_student_lnk USING btree (student_document_ord);


--
-- Name: student_documents_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX student_documents_updated_by_id_fk ON public.student_documents USING btree (updated_by_id);


--
-- Name: students_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX students_created_by_id_fk ON public.students USING btree (created_by_id);


--
-- Name: students_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX students_documents_idx ON public.students USING btree (document_id, locale, published_at);


--
-- Name: students_school_class_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX students_school_class_lnk_fk ON public.students_school_class_lnk USING btree (student_id);


--
-- Name: students_school_class_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX students_school_class_lnk_ifk ON public.students_school_class_lnk USING btree (school_class_id);


--
-- Name: students_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX students_updated_by_id_fk ON public.students USING btree (updated_by_id);


--
-- Name: subjects_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX subjects_created_by_id_fk ON public.subjects USING btree (created_by_id);


--
-- Name: subjects_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX subjects_documents_idx ON public.subjects USING btree (document_id, locale, published_at);


--
-- Name: subjects_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX subjects_updated_by_id_fk ON public.subjects USING btree (updated_by_id);


--
-- Name: suppliers_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX suppliers_created_by_id_fk ON public.suppliers USING btree (created_by_id);


--
-- Name: suppliers_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX suppliers_documents_idx ON public.suppliers USING btree (document_id, locale, published_at);


--
-- Name: suppliers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX suppliers_updated_by_id_fk ON public.suppliers USING btree (updated_by_id);


--
-- Name: teacher_subjects_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teacher_subjects_created_by_id_fk ON public.teacher_subjects USING btree (created_by_id);


--
-- Name: teacher_subjects_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teacher_subjects_documents_idx ON public.teacher_subjects USING btree (document_id, locale, published_at);


--
-- Name: teacher_subjects_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teacher_subjects_updated_by_id_fk ON public.teacher_subjects USING btree (updated_by_id);


--
-- Name: teachers_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teachers_created_by_id_fk ON public.teachers USING btree (created_by_id);


--
-- Name: teachers_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teachers_documents_idx ON public.teachers USING btree (document_id, locale, published_at);


--
-- Name: teachers_subjects_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teachers_subjects_lnk_fk ON public.teachers_subjects_lnk USING btree (teacher_id);


--
-- Name: teachers_subjects_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teachers_subjects_lnk_ifk ON public.teachers_subjects_lnk USING btree (subject_id);


--
-- Name: teachers_subjects_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teachers_subjects_lnk_ofk ON public.teachers_subjects_lnk USING btree (subject_ord);


--
-- Name: teachers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX teachers_updated_by_id_fk ON public.teachers USING btree (updated_by_id);


--
-- Name: training_assignments_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX training_assignments_created_by_id_fk ON public.training_assignments USING btree (created_by_id);


--
-- Name: training_assignments_decision_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX training_assignments_decision_lnk_fk ON public.training_assignments_decision_lnk USING btree (training_assignment_id);


--
-- Name: training_assignments_decision_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX training_assignments_decision_lnk_ifk ON public.training_assignments_decision_lnk USING btree (class_decision_id);


--
-- Name: training_assignments_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX training_assignments_documents_idx ON public.training_assignments USING btree (document_id, locale, published_at);


--
-- Name: training_assignments_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX training_assignments_updated_by_id_fk ON public.training_assignments USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_document_id_idx ON public.up_permissions USING btree (document_id);


--
-- Name: up_permissions_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_document_id_locale_published_at_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_document_id_idx ON public.up_roles USING btree (document_id);


--
-- Name: up_roles_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_document_id_locale_published_at_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_document_id_idx ON public.up_users USING btree (document_id);


--
-- Name: up_users_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_document_id_locale_published_at_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_document_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_document_id_idx ON public.upload_folders USING btree (document_id);


--
-- Name: upload_folders_document_id_locale_published_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_document_id_locale_published_at_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: audit_logs audit_logs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: audit_logs audit_logs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: class_decisions class_decisions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions
    ADD CONSTRAINT class_decisions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: class_decisions_related_decision_lnk class_decisions_related_decision_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_related_decision_lnk
    ADD CONSTRAINT class_decisions_related_decision_lnk_fk FOREIGN KEY (class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: class_decisions_related_decision_lnk class_decisions_related_decision_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_related_decision_lnk
    ADD CONSTRAINT class_decisions_related_decision_lnk_ifk FOREIGN KEY (inv_class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: class_decisions_school_class_lnk class_decisions_school_class_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_school_class_lnk
    ADD CONSTRAINT class_decisions_school_class_lnk_fk FOREIGN KEY (class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: class_decisions_school_class_lnk class_decisions_school_class_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_school_class_lnk
    ADD CONSTRAINT class_decisions_school_class_lnk_ifk FOREIGN KEY (school_class_id) REFERENCES public.classes(id) ON DELETE CASCADE;


--
-- Name: class_decisions_students_lnk class_decisions_students_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_students_lnk
    ADD CONSTRAINT class_decisions_students_lnk_fk FOREIGN KEY (class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: class_decisions_students_lnk class_decisions_students_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions_students_lnk
    ADD CONSTRAINT class_decisions_students_lnk_ifk FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- Name: class_decisions class_decisions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_decisions
    ADD CONSTRAINT class_decisions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: class_subjects class_subjects_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_subjects
    ADD CONSTRAINT class_subjects_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: class_subjects class_subjects_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class_subjects
    ADD CONSTRAINT class_subjects_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: classes classes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: classes_subjects_lnk classes_subjects_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes_subjects_lnk
    ADD CONSTRAINT classes_subjects_lnk_fk FOREIGN KEY (school_class_id) REFERENCES public.classes(id) ON DELETE CASCADE;


--
-- Name: classes_subjects_lnk classes_subjects_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes_subjects_lnk
    ADD CONSTRAINT classes_subjects_lnk_ifk FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON DELETE CASCADE;


--
-- Name: classes classes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: classrooms classrooms_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: classrooms classrooms_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: exam_approvals exam_approvals_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals
    ADD CONSTRAINT exam_approvals_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: exam_approvals_decision_lnk exam_approvals_decision_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals_decision_lnk
    ADD CONSTRAINT exam_approvals_decision_lnk_fk FOREIGN KEY (exam_approval_id) REFERENCES public.exam_approvals(id) ON DELETE CASCADE;


--
-- Name: exam_approvals_decision_lnk exam_approvals_decision_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals_decision_lnk
    ADD CONSTRAINT exam_approvals_decision_lnk_ifk FOREIGN KEY (class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: exam_approvals exam_approvals_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_approvals
    ADD CONSTRAINT exam_approvals_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: exam_grades exam_grades_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades
    ADD CONSTRAINT exam_grades_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: exam_grades_decision_lnk exam_grades_decision_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades_decision_lnk
    ADD CONSTRAINT exam_grades_decision_lnk_fk FOREIGN KEY (exam_grade_id) REFERENCES public.exam_grades(id) ON DELETE CASCADE;


--
-- Name: exam_grades_decision_lnk exam_grades_decision_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades_decision_lnk
    ADD CONSTRAINT exam_grades_decision_lnk_ifk FOREIGN KEY (class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: exam_grades exam_grades_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exam_grades
    ADD CONSTRAINT exam_grades_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: nations nations_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: nations nations_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: print_templates print_templates_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_templates
    ADD CONSTRAINT print_templates_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: print_templates print_templates_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_templates
    ADD CONSTRAINT print_templates_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: student_documents student_documents_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents
    ADD CONSTRAINT student_documents_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: student_documents_student_lnk student_documents_student_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents_student_lnk
    ADD CONSTRAINT student_documents_student_lnk_fk FOREIGN KEY (student_document_id) REFERENCES public.student_documents(id) ON DELETE CASCADE;


--
-- Name: student_documents_student_lnk student_documents_student_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents_student_lnk
    ADD CONSTRAINT student_documents_student_lnk_ifk FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- Name: student_documents student_documents_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_documents
    ADD CONSTRAINT student_documents_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: students students_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: students_school_class_lnk students_school_class_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_school_class_lnk
    ADD CONSTRAINT students_school_class_lnk_fk FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- Name: students_school_class_lnk students_school_class_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_school_class_lnk
    ADD CONSTRAINT students_school_class_lnk_ifk FOREIGN KEY (school_class_id) REFERENCES public.classes(id) ON DELETE CASCADE;


--
-- Name: students students_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: subjects subjects_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: subjects subjects_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: suppliers suppliers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: suppliers suppliers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teacher_subjects teacher_subjects_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_subjects
    ADD CONSTRAINT teacher_subjects_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teacher_subjects teacher_subjects_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_subjects
    ADD CONSTRAINT teacher_subjects_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teachers teachers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teachers_subjects_lnk teachers_subjects_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers_subjects_lnk
    ADD CONSTRAINT teachers_subjects_lnk_fk FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- Name: teachers_subjects_lnk teachers_subjects_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers_subjects_lnk
    ADD CONSTRAINT teachers_subjects_lnk_ifk FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON DELETE CASCADE;


--
-- Name: teachers teachers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: training_assignments training_assignments_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments
    ADD CONSTRAINT training_assignments_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: training_assignments_decision_lnk training_assignments_decision_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments_decision_lnk
    ADD CONSTRAINT training_assignments_decision_lnk_fk FOREIGN KEY (training_assignment_id) REFERENCES public.training_assignments(id) ON DELETE CASCADE;


--
-- Name: training_assignments_decision_lnk training_assignments_decision_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments_decision_lnk
    ADD CONSTRAINT training_assignments_decision_lnk_ifk FOREIGN KEY (class_decision_id) REFERENCES public.class_decisions(id) ON DELETE CASCADE;


--
-- Name: training_assignments training_assignments_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_assignments
    ADD CONSTRAINT training_assignments_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict HoueZAowmnZyb7xGwxMuhIL4fMHiFLXzlcnan3DFelfun3HHBdgyMig4aL7MhQm

