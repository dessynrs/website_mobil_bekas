PGDMP  2    5            
    {            website_project_final    16.0    16.0 5    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    18220    website_project_final    DATABASE     �   CREATE DATABASE website_project_final WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 %   DROP DATABASE website_project_final;
                postgres    false            �            1255    18326     haversine_distance(point, point)    FUNCTION       CREATE FUNCTION public.haversine_distance(point1 point, point2 point) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
	lon1 float := radians(point1[0]);
	lat1 float := radians(point1[1]);
	lon2 float := radians(point2[0]);
	lat2 float := radians(point2[1]);

	dlon float := lon2 - lon1;
	dlat float := lat2 - lat1;
	a float;
	c float;
	r float := 6371;
	jarak float;

BEGIN
	-- Haversine formula
	a := sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
	c := 2 * asin(sqrt(a));
	jarak := r * c;
	RETURN jarak;
END;

$$;
 E   DROP FUNCTION public.haversine_distance(point1 point, point2 point);
       public          postgres    false            �            1259    18285    bid_logs    TABLE     �   CREATE TABLE public.bid_logs (
    bid_id integer NOT NULL,
    buyer_id integer NOT NULL,
    product_id integer NOT NULL,
    date_bid date NOT NULL,
    bid_price integer NOT NULL,
    CONSTRAINT bid_price CHECK ((bid_price > 0))
);
    DROP TABLE public.bid_logs;
       public         heap    postgres    false            �            1259    18284    bid_logs_bid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bid_logs_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.bid_logs_bid_id_seq;
       public          postgres    false    228            ,           0    0    bid_logs_bid_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.bid_logs_bid_id_seq OWNED BY public.bid_logs.bid_id;
          public          postgres    false    227            �            1259    18248 
   body_types    TABLE     l   CREATE TABLE public.body_types (
    body_type_id integer NOT NULL,
    body_type character varying(100)
);
    DROP TABLE public.body_types;
       public         heap    postgres    false            �            1259    18247    body_types_body_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.body_types_body_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.body_types_body_type_id_seq;
       public          postgres    false    225            -           0    0    body_types_body_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.body_types_body_type_id_seq OWNED BY public.body_types.body_type_id;
          public          postgres    false    224            �            1259    18234    buyers    TABLE     �   CREATE TABLE public.buyers (
    user_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    phone character varying(20),
    city_id integer,
    email character varying(100)
);
    DROP TABLE public.buyers;
       public         heap    postgres    false            �            1259    18233    buyers_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buyers_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.buyers_user_id_seq;
       public          postgres    false    221            .           0    0    buyers_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.buyers_user_id_seq OWNED BY public.buyers.user_id;
          public          postgres    false    220            �            1259    18241 	   car_types    TABLE     i   CREATE TABLE public.car_types (
    car_type_id integer NOT NULL,
    car_type character varying(100)
);
    DROP TABLE public.car_types;
       public         heap    postgres    false            �            1259    18240    car_types_car_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.car_types_car_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.car_types_car_type_id_seq;
       public          postgres    false    223            /           0    0    car_types_car_type_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.car_types_car_type_id_seq OWNED BY public.car_types.car_type_id;
          public          postgres    false    222            �            1259    18221    city    TABLE     n   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city character varying(100),
    lonlat point
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    18264    products    TABLE     �  CREATE TABLE public.products (
    product_id integer NOT NULL,
    seller_id integer NOT NULL,
    brand character varying(20) NOT NULL,
    model character varying(20) NOT NULL,
    year integer NOT NULL,
    price integer NOT NULL,
    car_type_id integer NOT NULL,
    body_type_id integer NOT NULL,
    kilometer integer,
    date_post date NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    18227    sellers    TABLE     �   CREATE TABLE public.sellers (
    user_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    phone character varying(20),
    city_id integer,
    email character varying(100)
);
    DROP TABLE public.sellers;
       public         heap    postgres    false            �            1259    18226    sellers_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sellers_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sellers_user_id_seq;
       public          postgres    false    219            0           0    0    sellers_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sellers_user_id_seq OWNED BY public.sellers.user_id;
          public          postgres    false    218            s           2604    18288    bid_logs bid_id    DEFAULT     r   ALTER TABLE ONLY public.bid_logs ALTER COLUMN bid_id SET DEFAULT nextval('public.bid_logs_bid_id_seq'::regclass);
 >   ALTER TABLE public.bid_logs ALTER COLUMN bid_id DROP DEFAULT;
       public          postgres    false    228    227    228            r           2604    18251    body_types body_type_id    DEFAULT     �   ALTER TABLE ONLY public.body_types ALTER COLUMN body_type_id SET DEFAULT nextval('public.body_types_body_type_id_seq'::regclass);
 F   ALTER TABLE public.body_types ALTER COLUMN body_type_id DROP DEFAULT;
       public          postgres    false    224    225    225            p           2604    18237    buyers user_id    DEFAULT     p   ALTER TABLE ONLY public.buyers ALTER COLUMN user_id SET DEFAULT nextval('public.buyers_user_id_seq'::regclass);
 =   ALTER TABLE public.buyers ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    221    220    221            q           2604    18244    car_types car_type_id    DEFAULT     ~   ALTER TABLE ONLY public.car_types ALTER COLUMN car_type_id SET DEFAULT nextval('public.car_types_car_type_id_seq'::regclass);
 D   ALTER TABLE public.car_types ALTER COLUMN car_type_id DROP DEFAULT;
       public          postgres    false    223    222    223            o           2604    18230    sellers user_id    DEFAULT     r   ALTER TABLE ONLY public.sellers ALTER COLUMN user_id SET DEFAULT nextval('public.sellers_user_id_seq'::regclass);
 >   ALTER TABLE public.sellers ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    219    218    219            %          0    18285    bid_logs 
   TABLE DATA           U   COPY public.bid_logs (bid_id, buyer_id, product_id, date_bid, bid_price) FROM stdin;
    public          postgres    false    228   �?       "          0    18248 
   body_types 
   TABLE DATA           =   COPY public.body_types (body_type_id, body_type) FROM stdin;
    public          postgres    false    225   �F                 0    18234    buyers 
   TABLE DATA           W   COPY public.buyers (user_id, first_name, last_name, phone, city_id, email) FROM stdin;
    public          postgres    false    221   1G                  0    18241 	   car_types 
   TABLE DATA           :   COPY public.car_types (car_type_id, car_type) FROM stdin;
    public          postgres    false    223   xW                 0    18221    city 
   TABLE DATA           5   COPY public.city (city_id, city, lonlat) FROM stdin;
    public          postgres    false    217   �W       #          0    18264    products 
   TABLE DATA           �   COPY public.products (product_id, seller_id, brand, model, year, price, car_type_id, body_type_id, kilometer, date_post) FROM stdin;
    public          postgres    false    226   Y                 0    18227    sellers 
   TABLE DATA           X   COPY public.sellers (user_id, first_name, last_name, phone, city_id, email) FROM stdin;
    public          postgres    false    219   �\       1           0    0    bid_logs_bid_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bid_logs_bid_id_seq', 1, true);
          public          postgres    false    227            2           0    0    body_types_body_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.body_types_body_type_id_seq', 1, false);
          public          postgres    false    224            3           0    0    buyers_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.buyers_user_id_seq', 1, false);
          public          postgres    false    220            4           0    0    car_types_car_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.car_types_car_type_id_seq', 1, false);
          public          postgres    false    222            5           0    0    sellers_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sellers_user_id_seq', 1, false);
          public          postgres    false    218            �           2606    18290    bid_logs bid_logs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.bid_logs
    ADD CONSTRAINT bid_logs_pkey PRIMARY KEY (bid_id);
 @   ALTER TABLE ONLY public.bid_logs DROP CONSTRAINT bid_logs_pkey;
       public            postgres    false    228                       2606    18253    body_types body_types_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.body_types
    ADD CONSTRAINT body_types_pkey PRIMARY KEY (body_type_id);
 D   ALTER TABLE ONLY public.body_types DROP CONSTRAINT body_types_pkey;
       public            postgres    false    225            {           2606    18239    buyers buyers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_pkey PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.buyers DROP CONSTRAINT buyers_pkey;
       public            postgres    false    221            }           2606    18246    car_types car_types_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.car_types
    ADD CONSTRAINT car_types_pkey PRIMARY KEY (car_type_id);
 B   ALTER TABLE ONLY public.car_types DROP CONSTRAINT car_types_pkey;
       public            postgres    false    223            w           2606    18225    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    217            �           2606    18268    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    226            y           2606    18232    sellers sellers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.sellers DROP CONSTRAINT sellers_pkey;
       public            postgres    false    219            �           2606    18291    bid_logs bid_logs_buyer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bid_logs
    ADD CONSTRAINT bid_logs_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES public.buyers(user_id);
 I   ALTER TABLE ONLY public.bid_logs DROP CONSTRAINT bid_logs_buyer_id_fkey;
       public          postgres    false    4731    221    228            �           2606    18296 !   bid_logs bid_logs_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bid_logs
    ADD CONSTRAINT bid_logs_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 K   ALTER TABLE ONLY public.bid_logs DROP CONSTRAINT bid_logs_product_id_fkey;
       public          postgres    false    4737    228    226            �           2606    18308    buyers buyer_city    FK CONSTRAINT     t   ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyer_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);
 ;   ALTER TABLE ONLY public.buyers DROP CONSTRAINT buyer_city;
       public          postgres    false    221    217    4727            �           2606    18279 #   products products_body_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_body_type_id_fkey FOREIGN KEY (body_type_id) REFERENCES public.body_types(body_type_id);
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT products_body_type_id_fkey;
       public          postgres    false    4735    226    225            �           2606    18274 "   products products_car_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_car_type_id_fkey FOREIGN KEY (car_type_id) REFERENCES public.car_types(car_type_id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_car_type_id_fkey;
       public          postgres    false    223    226    4733            �           2606    18269     products products_seller_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(user_id);
 J   ALTER TABLE ONLY public.products DROP CONSTRAINT products_seller_id_fkey;
       public          postgres    false    4729    219    226            �           2606    18303    sellers seller_city    FK CONSTRAINT     v   ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT seller_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);
 =   ALTER TABLE ONLY public.sellers DROP CONSTRAINT seller_city;
       public          postgres    false    4727    217    219            %     x�}X[�,)���Rsq/��uL�hv��snWӾ� �QITg.�,_|�9�߇��T�������Cg?�H<�_|��hkj��2k�3�,RƵP���J��j�������dq^\�2�]���/nFYF���ֶ$�bs[/� ��/U�Abb]K����Ҿ��7f_�} P�+(�N�Ƴq�����YE b��:�/�!eۼ�L�z��Dɞ�=(I_�ܛG{� �ϭ�%���m'�zV�@	�4���h�����W��ag���rRl�oU��[q�kIO�p�]}_ ΅<���>�FYa�i�q���H�(��;� ���.+�ا�"r6�H��(@��f�Azc��Jsgd���QB+Z�r�t���a�>�D��~vƭ��-~ί�Q`���썱峎��.ptHu �L|�OZP@/�1#��l6���p!U��I�4僅���x8�Rc�\�q@��.H:$�]l�c�9�+�/�A�t�LW��3j�<�H\Y�'�n��h_�Uе(�Zi��M�ĭU֓L��/2ٰ�����V�U��(�/8�"mm��|���M����]ڀ}h);�=��^*Mg��ҚG��k���%�2
o�KH?BH��"����Ԧ����Ϲh����l}�fd}$_kMgP�+n+�s������|D��ƴ7�m�����#�K�J�;��bP����@�h�k�Nƫ(IY�s矤��ȧ�oՋ��Fs��j�{�(~c���ܭ��v]7Q��g�2�'���z�E��w�@9�KG�ՙ�(��F7[HC��q�Q��1�w)h�*��Q3(�o�u�p�.im	O�7��Qȣ�����ڍ�QgwGR5%�z�a�e��5v��Ν�{!�ցCס���v�<ru<�5����nJF������F]� <
>u>
�ú�y�א�x����z-��4Y�_�� ����Օe�=Mڤ��t�oɲSe��w��c#�([4����e�x���h�Vga�^�GA爴����4�w��D�]*�v���?����chA TzM��\�y�<�BM�PM����*��0Of���������ۀ�^��Y���w�ϲ�[�ߪ�m<�����2����^�M>ڀ],Z����j���MTi���Z}{#�>��7� ��X�\���j�w!�;�T�5{[.aC��ml6@=$GP3�Fe�G���q��� J�t_n4[鈴VY*Iи_'��+�ղ�+�Q�vѶ��UNR��v���$�(V�Y��8�*���o���r���M�e�C�w�q�����5E���#����G����2�}m`b+�/F�z��e�&K}\�nL�&y�M��\�V<�"���P�ȆS'�SpNo���,�{��;<�k��G���C���v��M~��������s�}Ƙ���iˤ��r2�o�pZQ���H��r)^��SRh����i�c�g��l;N���"y�v>%l�/vF����������������2��#�]w� 0{����9|$yv���9��4�qZ���������A�B�Y���ӑ競^�$�2%���'c�>^�l��K���օ�ʽ�f��/~������m'�xE5O�Vs��I���>7�$?{���r��c��|����4��o��/�<P�ܕ����gc�ۆ����%�j�L�-?�3'�7/>����C�g��M�a&7&���>���o���y�Ǘ�Zy�2��l�Q�}�F|�.�L{�a���B�-Z��k�l�H�0b������|���      "   5   x�3��H,I�HJL��2���2�NMI��2��2�OL������� vX            x�mZ]�㶱}������?޼���ƻk_�7�N�Zi$�$J��(�>���N��r��@����n	�a{l�Md���~�E�?V���J�oV«Fř2γS^2���)�ǿ|>�������?�p�m�#�oVڪ�['�>�nVm���=���k���v���;�5�[߸�S[�Ͱj�~oO�������
L>Ip߬�tM*0���5�bA}�=�紃aop����S�4\���`eqK��]{�0�j�~���n��ѮϷs��S���2��Շ�%Luz�l�?�c���ʻ�s��$����p/�o��뼏g�����Cl��ix���6��0�C�τ�Ͱ�,���]��!�q��g���]9cT~�G������zj�X}:m_V�Ggn�̟�4dL�Z���'�<�a�H�$�xå�LIX�#�%��$�0�.#��[|��G
G�8��:;�)C����P(��z��/�sW�[�g��5�qI�(م`CF-@h��%��#>�>���N"�\O���f���\��܏��c����_�����eoc7>!&���~�Jc�%�����I����q���}�8Ew=g�C`�4�֦g4�B�!�g��ͦ=D�����8�(������EB`y��~޶�����Z� h�[Yg}~�C�\2�f$�~��>�Op���Zr�0F��L;���/K�ޏ���`��v�˕��*Lv?`(���~۞� ��o����Q���!H������~;�
y�Q����V�"s��]�K5���d�L��Z{�K[�r��l�]�]2�>�a��>���G� :����q��yJ�8��=,�+^{6[����&x�L��E�Nv[X݁:�) �X���i��%� ]
�� 8\P{{&�U�e���>��ϫ����*���nw�c>�pX�ѓ��;�6S'07�{:��xi��>��Az�M��{�F�C�v3��J�-��]�xO[4��:�x��@Z�.�+%�t�'#nbWl�x#�l�s<|��'PH���^�����������rA��X������*��q��"�4��NzY�g^�q˝�ہ}7R�t��F="Q�~j�A�,	���ϱ����Wpb�c�F�SUn��8�ȶ$�bW6@�}(�r����wvJ�z�P�	���F.�� �$.�U9�ot�0��x?��?DrVJ`�(�*>ANQ� �~����z�
oJAB����-�?��X�P�6�8���*�� �)c��}��aąr�ĭ��!���g3lL�!c�;(��%�~��g����+c�*B�01A���"aωB�+%+��Z4�;�����y�!����1�7��z��@�!Rൄx�k�I`�kLx=��@�AA�V�@s��2hȘ�k��|>$�)?��2I��o�,A'�H`��cK��� �Ѥ^����<�1a.R�#@���Ĉ�I�xK�$�E����KA-N�\�x9"Ri�����-�KJ��W�����U����)BނO�VS �M��WVLI-&X�Q˃H�����NO�ٷ��)58�'�'�ş�;M��.*��=�����xM;H�G��B:x)������ݴ�� �ڥ$��/���J3�V��N���C0�Re)hJe5�6����	ˬ��6iY8�z-�G�#����KVAb��wK�3�RP�[x�us"�1
Le�tQ�=!n�\��A�?��5YJ��.@&qrɸ��3���t���B�t���5��FZQ�����3�������2�~�f��a*)��&"��(&`7��m$��3T
��nS2��L������r*��M�sFup��O�2|�,���Tp�[�ٻ�*�
�R#`-���FH��dז�E��V%���/�k��%�F�#04����4��9O���-���!v�YuiP���C!�A��X.w��~?���~�C͈��$z5�T�2?dȈ�z?�\�6��+h��N	#N�����y�>N�>�^$��+Y�ڰ;!J��l9h��IE/5�� �"(V\�*�F>���r��F9g>�[l��34`�F)]l0j�@u�A��ǔ*h������ͱ�g����
�Ǚ���)a��@,�"��2��9eH�e�,q�P{�3�x'r�$�<��!��`ǂZ� Z�q{�1��!<�;ꆬjn�T/a��gr��f8�=��P��%s�3�Q��c�>�Z>�&��A�J�\3��f|�m��?�6%�3�	���D!Ҿ���`/�'� kk�ɁD}�>��}��E(U�g�����6�{��}��q��$��Z#e􈄝 �Z�~���t�]<��I����	���K���,�"��q�t�	�)�8R)�mz��Y�T�(�邳�����.����R��Ag[�@�^O)�^8g+(+�?�)��afϬ���M9�P�7��Έ�0A���@�	���Q��L~<�w"c�
9�!��M���~
���9u���Y �ykQ���������s�/1��$e�U��,�C���3��v�֩m/����vC:X�O��2��@7�����{Ȉ�k%9��)'Y[�+�c�,׋"�������ÓSG��\���Xe� )��ljK;Ƣ��Z�����=�〈wP����b�u�Kф�R�zĶ2���jXb�!��1��OW�i�x/��U�I6�eP���R�%�&)'�x�R�0ɺs��<�����-�L��۹��Z*6�!g��6i��7p�B�[��3!Q��>9�9Cf*��{�Kח��p�"ްh�H��̶p���A�~ cw�9ǂ=e�At��I6�&ز�4��L��!���p^ڑZ����a턪�\�q�6U���x,�-*yX9aJ�eG���;�"7���.#����4Ǘs�L����g��o �
���͎ͭXZ���5�B�
��j�z��#ؾ��6�>Fd?#�b f��p���r_�F��M�p��i�7(�*-���ח9V�`��J���]�
���<̜R�ݣ��mG��ȹ/�"��y2a�*��|�q/|)L��a���4���#Jp�ejͼ~ʐ�&���BXB�#�]E��A4~��	qJ��Z�P/���cu݁�E8�[�Kq���G���=���k����͹e��{B,�+0�i��,@�5m��ޔ��@�i��0!�%�ә�L7wI�I�H�'�Tx w�`�C�7�ՓU��=��J��@��NB������"��6���閽���=�i�b�=Ҹb3�`iL�D)%6�	���y��_�*9�j`ԕ4T'��O}�zi 'm�=�����;���*>M ڿ��B��~k����|��-���pR�K���}:Q1��'o�4ޘ�M# _z4*$Tז8~�T"�B*��V�*�_q]@�L*Q#�s<Fhј�Y���#͌�Dt�2��O��'�b�y�\��Q�#4Q��.yh��b����a{}�IQAx8g!��˯��`Sa���NM��	4u&��A!Q!�eV���k��Kh�""�3�!�/��Bz�̮�a���I7���Nl�N�i�Zo�q�~<q�����B.P`xE)���,݄2py#ͤ�t=���qP2��P�2ԕ.��z<�إ���1�N��Q��'H�u�/?.K���X 9�*T31^j��4
�	k_�������d�p�\����FoϿN�L���lq������P�%A��gI�5u��*��,�u���mʦf��˝&<����Da�S�����c�!;��i�X�F��IQʔ� _�LE����7_���8er��6�j��R������1P�&��xrFf(�z9������i�$w�z�0��Jm,�����gؐP�m��>����ǥ_���Ȁ�y)z�C|ɠ�yu��S�ϡ�N�C��O��A����e��
B��G��AXB;�(�J���a���C�{��0Џx<"�sWRJ�#g��*䩇6=h�8�/X�OPh"LB��D�
���8�9�|��H|����F!�����)�jF�H��Ć��)��
���>R�/�a����4�rX�j��?�~J]8� ũ 2   v	�5��J�`8AE5����9	�+%)`�t{"�a�-N�|��W���Z�             x�3��M�+M��22J2��b���� E�~         i  x�U�Mk�@�s�+z������~\��A�=z����F�����M"�%��y�n�|^zy���t��7�_��z��˕7��~Q|�߽t2��+�N�|�z�Dv�N��g�;���v��3'k��r��|5硛x��)s��q�<���I�Z�����rL��+.�n7t�'we G)f�1��m����K}3dk�R�V�y*�����㭮��B�S
4���~ju$�e�˕5��^~=��oںn&�s��e>���D]˩9^�Zz-
C���6�Kb*z�杜�k�}y�`@��wf[�H�*<�n���Mr����%���ߢ����~h�2Y6�h��U4�=��_SU�?��~      #   �  x��V�n7}&��?����<n���M�@_�6H�1���Kr�ݍ�B�̙ۙ!9V������4���y�?�t(9�1\�9���2�B�8�{h��Vh9�.S /N�Z�f4�.�R��E�n���7C��FiƦ������:�cT��2�xd���קS��#���$m�|��X��U�E)�X��F>�.Q�ET"/�Z�eNv���0��dl��T<����-�k�s�M��z��������c�p�����|���9R7�����Zc��(��j��YZ5*��<(���%	+Y�7MH�ғ�� �1Xk��=q��~�s����~z~�u&iH��$ܕ��~˛P0�U�8)�����ZiI,iw� �*�-(�g<�
:h7����X�urY�$^��b)�
{{�����gi�^R�-/��x�߶�hˣL8����Kjϼ����{�ҩ�I��}�͑�#t�@�&�<Q�H����E��I����W3��S%g*����.���<,�+-��4���/��y���&U���^p���D���uB�(}0�g�|�JP̺�����@\[C��@R�`<��@�\K��l�e�F���H���Krk���1}�"���^0'��;	�	�PcHM4--��1Q�*߀��ǘ��\&6/�R�+��l`��� `��܎U��1Ӝ��)o���Er���5Y
/������Mw�b�H���3(�u���	�K�@�Pg��	�8=7\�P�P��0�:���4��cAkm��Ϗ��緛w���r%�+4s�h��N�]x�}u?�2lL-����?i��Hj�H�[
�d��_f�48D��P��)���C��^_-�qj]z��".�.������_J��H���Y���[��.8ۊ٬]�c-�_o����
�H         �  x�m��n�F�ϥ��Q���ޗ���q,�����KK3����\"���Ulr�Dt%�.�����{9telJ��f�?U����dZ3o5s�*��	�w�w��cY�y<�W>Ī<F���a��Zs�)���m��RO�s�n��p:M���b3��~���Ǯ�m�Z�A(g�qFڅ�9��K�u�bݕ�5�.���p�.�e�]O��p��#FLis������+��o�j��m��z�G�؛���M�*|���{"/`����;��uu"\s�6�p�	�(J�"�M��lw���&��r۱�:�5��˜V&eQ%����X��ml��%�K7��)z˄V�t
�5�:/8&��-v���4Υ���6���x���f"��C��k�nQiꭼ$�/���@��.����h��S�a�(No
xa��)�p_�<���zW�~�e�v1�� �
BS5�=$j�M��v�El��9�6]�x@�	G��T���i����$ʼ,H΂��)�#��v��gJ�il�xL%`Λ�
��1�'��/`��oT��r����($�N�T��������ƽ�|�'�ǜ���	[��%ඪq���é~@J1��Q`)2�"N`�p�Uq��;l�F'Zd�q��s))���n�2UH��z�e?� pIǝS�� 2��DQ��|q���]4��n����̈́��SW��UIzI����N0!���}�^M^Ç����s��a��q��Vi=k���YMQ��n ��6V�<���<C�e����N����EX���#���e��1����y�	J&�w�>vOq��d�\�ȱ1	G�r5���_P�hD��S�|J	�<U2�����ĭ�Z�~7�#����	F3)3ӝ���!Q�(�1&�V���I-тi쨰�&�=���:��c�ҽ�����J���M�+��_#nY���<i3]��ު�h��tmg�K\�������Gt�n�0��C>A!�:�P@����<����R�[�J��Z��6���\�fע���&FY�)wÜ
2}xOT�@y��7�Յ��ƢQ��/�;k5��dO�9z����q\����L�E���=�����
�F��ƑI�t��<� ƾ�����ŵ���3nmH7��Ľ�ul0>���+ѵd.�#5���_��&��2���������     