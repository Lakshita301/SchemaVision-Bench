-- Source: https://github.com/prostrmk/truck/blob/b08961413282fcf1166b5c639f6e5b9ced140c4e/core-module/src/main/resources/sql/18-11-2018.sql?raw=true
-- Tables detected: 13 | FK/REFERENCES mentions: 38
CREATE TABLE public.auto (
    id integer NOT NULL,
    type character varying(15) NOT NULL,
    fuel_consumption integer NOT NULL,
    name character varying(45) NOT NULL,
    car_number character varying(45) NOT NULL,
    company_owner integer NOT NULL,
    active boolean DEFAULT true
);
CREATE TABLE public.cancellation_act (
    id integer NOT NULL,
    date date,
    amount integer NOT NULL,
    price integer NOT NULL,
    consignment_id bigint NOT NULL
);
CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    type character varying(45) NOT NULL,
    client_owner integer NOT NULL
);
CREATE TABLE public.company (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    active smallint DEFAULT '0'::smallint NOT NULL,
    lock_comment character varying(255),
    locker_id integer,
    lock_date date
);
CREATE TABLE public.consignment (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    order_id integer NOT NULL
);
CREATE TABLE public.driver (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    passport_number character varying(45) NOT NULL,
    company_of_driver integer NOT NULL,
    userid integer
);
CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    client_id integer NOT NULL,
    status integer DEFAULT 0,
    sender integer NOT NULL,
    receiver integer NOT NULL,
    date_accepted date,
    date_executed date,
    waybill_id bigint,
    company_id bigint NOT NULL
);
CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(45) DEFAULT NULL::character varying,
    status integer DEFAULT 0,
    description character varying(100) NOT NULL,
    product_consignment integer NOT NULL,
    cancellation_act bigint,
    price integer,
    count integer DEFAULT 0 NOT NULL
);
CREATE TABLE public.route_list (
    id integer NOT NULL,
    point character varying(200),
    point_level integer,
    waybill_id bigint,
    marked boolean DEFAULT false,
    lat DOUBLE PRECISION precision,
    lng DOUBLE PRECISION precision
);
CREATE TABLE public.stock (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    company_id integer NOT NULL,
    address character varying(50) NOT NULL,
    active boolean DEFAULT true
);
CREATE TABLE public.tokens (
    id integer NOT NULL,
    email character varying(50),
    token_value character varying(100)
);
CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(20),
    email character varying(50),
    password character varying(100),
    user_role character varying(20),
    company bigint,
    birth_day date,
    first_name character varying(50),
    second_name character varying(50) NOT NULL,
    third_name character varying(50),
    city character varying(60),
    country character varying(60),
    street character varying(60),
    house_number character varying(60),
    flat_number character varying(60)
);
CREATE TABLE public.waybill (
    id integer NOT NULL,
    status integer DEFAULT 0,
    driver integer NOT NULL,
    auto integer NOT NULL,
    date_departure date,
    date_arrival date,
    check_date date,
    user_id integer
);
ALTER TABLE public.auto ADD CONSTRAINT auto_company_owner_fkey FOREIGN KEY (company_owner) REFERENCES public.company(id) ON DELETE CASCADE;
ALTER TABLE public.cancellation_act ADD CONSTRAINT cancellation_act_consignment_id_fkey FOREIGN KEY (consignment_id) REFERENCES public.consignment(id);
ALTER TABLE public.client ADD CONSTRAINT client_client_owner_fkey FOREIGN KEY (client_owner) REFERENCES public.company(id);
ALTER TABLE public.company ADD CONSTRAINT sysadmin_id_ref FOREIGN KEY (locker_id) REFERENCES public.users(id);
ALTER TABLE public.consignment ADD CONSTRAINT consignment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);
ALTER TABLE public.driver ADD CONSTRAINT driver_company_of_driver_fkey FOREIGN KEY (company_of_driver) REFERENCES public.company(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_receiver_fkey FOREIGN KEY (receiver) REFERENCES public.stock(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_sender_fkey FOREIGN KEY (sender) REFERENCES public.stock(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_waybill_id_fkey FOREIGN KEY (waybill_id) REFERENCES public.waybill(id);
ALTER TABLE public.product ADD CONSTRAINT product_cancellation_act_fkey FOREIGN KEY (cancellation_act) REFERENCES public.cancellation_act(id);
ALTER TABLE public.product ADD CONSTRAINT product_product_consignment_fkey FOREIGN KEY (product_consignment) REFERENCES public.consignment(id);
ALTER TABLE public.route_list ADD CONSTRAINT route_list_waybill_id_fkey FOREIGN KEY (waybill_id) REFERENCES public.waybill(id);
ALTER TABLE public.stock ADD CONSTRAINT stock_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id);
ALTER TABLE public.users ADD CONSTRAINT users_company_fkey FOREIGN KEY (company) REFERENCES public.company(id);
ALTER TABLE public.waybill ADD CONSTRAINT user_checker_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);
ALTER TABLE public.waybill ADD CONSTRAINT waybill_auto_fkey FOREIGN KEY (auto) REFERENCES public.auto(id);
ALTER TABLE public.waybill ADD CONSTRAINT waybill_driver_fkey FOREIGN KEY (driver) REFERENCES public.driver(id);
