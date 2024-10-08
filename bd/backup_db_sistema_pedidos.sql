PGDMP  "    .                |            db_sistema_pedidos    16.2    16.2 <    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24838    db_sistema_pedidos    DATABASE     �   CREATE DATABASE db_sistema_pedidos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 "   DROP DATABASE db_sistema_pedidos;
                postgres    false            �            1259    24839    tb_clientes    TABLE     �  CREATE TABLE public.tb_clientes (
    id bigint NOT NULL,
    id_municipio bigint,
    tx_nome_razao_social character varying(255),
    tx_cnpj character varying(18),
    tx_telefone character varying(20),
    tx_endereco character varying(255),
    tx_bairro character varying(100),
    tx_cep character varying(10),
    tx_email character varying(200),
    bo_ativo boolean,
    tx_informacoes character varying(1000),
    tx_cpf character varying(14)
);
    DROP TABLE public.tb_clientes;
       public         heap    postgres    false            �            1259    24844    tb_clientes_id_seq    SEQUENCE     {   CREATE SEQUENCE public.tb_clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tb_clientes_id_seq;
       public          postgres    false    215            �           0    0    tb_clientes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tb_clientes_id_seq OWNED BY public.tb_clientes.id;
          public          postgres    false    216            �            1259    24845 
   tb_estados    TABLE     _   CREATE TABLE public.tb_estados (
    id bigint NOT NULL,
    tx_nome character varying(250)
);
    DROP TABLE public.tb_estados;
       public         heap    postgres    false            �            1259    24848    tb_estados_id_seq    SEQUENCE     z   CREATE SEQUENCE public.tb_estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tb_estados_id_seq;
       public          postgres    false    217            �           0    0    tb_estados_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tb_estados_id_seq OWNED BY public.tb_estados.id;
          public          postgres    false    218            �            1259    24849    tb_formas_pagamento    TABLE     �   CREATE TABLE public.tb_formas_pagamento (
    id bigint NOT NULL,
    tx_descricao character varying(50),
    bo_ativo boolean
);
 '   DROP TABLE public.tb_formas_pagamento;
       public         heap    postgres    false            �            1259    24852    tb_formas_pagamento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_formas_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tb_formas_pagamento_id_seq;
       public          postgres    false    219            �           0    0    tb_formas_pagamento_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tb_formas_pagamento_id_seq OWNED BY public.tb_formas_pagamento.id;
          public          postgres    false    220            �            1259    24853    tb_itens_pedidos    TABLE       CREATE TABLE public.tb_itens_pedidos (
    id bigint NOT NULL,
    id_pedido bigint,
    id_produto bigint,
    dbl_quantidade_estoque double precision,
    nu_preco_unidade_atual numeric(17,2),
    CONSTRAINT valor CHECK ((nu_preco_unidade_atual >= (0)::numeric))
);
 $   DROP TABLE public.tb_itens_pedidos;
       public         heap    postgres    false            �            1259    24857    tb_itens_pedidos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_itens_pedidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_itens_pedidos_id_seq;
       public          postgres    false    221            �           0    0    tb_itens_pedidos_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_itens_pedidos_id_seq OWNED BY public.tb_itens_pedidos.id;
          public          postgres    false    222            �            1259    24858    tb_municipios    TABLE     �   CREATE TABLE public.tb_municipios (
    id bigint NOT NULL,
    id_estado bigint,
    tx_nome character varying(250),
    bo_entrega boolean
);
 !   DROP TABLE public.tb_municipios;
       public         heap    postgres    false            �            1259    24861    tb_municipios_id_seq    SEQUENCE     }   CREATE SEQUENCE public.tb_municipios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tb_municipios_id_seq;
       public          postgres    false    223            �           0    0    tb_municipios_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tb_municipios_id_seq OWNED BY public.tb_municipios.id;
          public          postgres    false    224            �            1259    24862 
   tb_pedidos    TABLE       CREATE TABLE public.tb_pedidos (
    id bigint NOT NULL,
    id_cliente bigint,
    id_forma_pagamento bigint,
    int_numero bigint NOT NULL,
    dt_compra date,
    dt_entrega date,
    dt_pagamento date,
    CONSTRAINT valor CHECK ((int_numero >= 0))
);
    DROP TABLE public.tb_pedidos;
       public         heap    postgres    false            �            1259    24866    tb_pedidos_id_seq    SEQUENCE     z   CREATE SEQUENCE public.tb_pedidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tb_pedidos_id_seq;
       public          postgres    false    225                        0    0    tb_pedidos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tb_pedidos_id_seq OWNED BY public.tb_pedidos.id;
          public          postgres    false    226            �            1259    24867    tb_produtos    TABLE       CREATE TABLE public.tb_produtos (
    id bigint NOT NULL,
    tx_descricao character varying(255),
    dbl_quantidade_estoque double precision,
    nu_preco_unidade_atual numeric(17,2),
    bo_ativo boolean,
    CONSTRAINT valor CHECK ((nu_preco_unidade_atual >= (0)::numeric))
);
    DROP TABLE public.tb_produtos;
       public         heap    postgres    false            �            1259    24871    tb_produtos_id_seq    SEQUENCE     {   CREATE SEQUENCE public.tb_produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tb_produtos_id_seq;
       public          postgres    false    227                       0    0    tb_produtos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tb_produtos_id_seq OWNED BY public.tb_produtos.id;
          public          postgres    false    228            8           2604    24872    tb_clientes id    DEFAULT     p   ALTER TABLE ONLY public.tb_clientes ALTER COLUMN id SET DEFAULT nextval('public.tb_clientes_id_seq'::regclass);
 =   ALTER TABLE public.tb_clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            9           2604    24873    tb_estados id    DEFAULT     n   ALTER TABLE ONLY public.tb_estados ALTER COLUMN id SET DEFAULT nextval('public.tb_estados_id_seq'::regclass);
 <   ALTER TABLE public.tb_estados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            :           2604    24874    tb_formas_pagamento id    DEFAULT     �   ALTER TABLE ONLY public.tb_formas_pagamento ALTER COLUMN id SET DEFAULT nextval('public.tb_formas_pagamento_id_seq'::regclass);
 E   ALTER TABLE public.tb_formas_pagamento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            ;           2604    24875    tb_itens_pedidos id    DEFAULT     z   ALTER TABLE ONLY public.tb_itens_pedidos ALTER COLUMN id SET DEFAULT nextval('public.tb_itens_pedidos_id_seq'::regclass);
 B   ALTER TABLE public.tb_itens_pedidos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            <           2604    24876    tb_municipios id    DEFAULT     t   ALTER TABLE ONLY public.tb_municipios ALTER COLUMN id SET DEFAULT nextval('public.tb_municipios_id_seq'::regclass);
 ?   ALTER TABLE public.tb_municipios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            =           2604    24877    tb_pedidos id    DEFAULT     n   ALTER TABLE ONLY public.tb_pedidos ALTER COLUMN id SET DEFAULT nextval('public.tb_pedidos_id_seq'::regclass);
 <   ALTER TABLE public.tb_pedidos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            >           2604    24878    tb_produtos id    DEFAULT     p   ALTER TABLE ONLY public.tb_produtos ALTER COLUMN id SET DEFAULT nextval('public.tb_produtos_id_seq'::regclass);
 =   ALTER TABLE public.tb_produtos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            �          0    24839    tb_clientes 
   TABLE DATA           �   COPY public.tb_clientes (id, id_municipio, tx_nome_razao_social, tx_cnpj, tx_telefone, tx_endereco, tx_bairro, tx_cep, tx_email, bo_ativo, tx_informacoes, tx_cpf) FROM stdin;
    public          postgres    false    215   �G       �          0    24845 
   tb_estados 
   TABLE DATA           1   COPY public.tb_estados (id, tx_nome) FROM stdin;
    public          postgres    false    217   �K       �          0    24849    tb_formas_pagamento 
   TABLE DATA           I   COPY public.tb_formas_pagamento (id, tx_descricao, bo_ativo) FROM stdin;
    public          postgres    false    219   M       �          0    24853    tb_itens_pedidos 
   TABLE DATA           u   COPY public.tb_itens_pedidos (id, id_pedido, id_produto, dbl_quantidade_estoque, nu_preco_unidade_atual) FROM stdin;
    public          postgres    false    221   ]M       �          0    24858    tb_municipios 
   TABLE DATA           K   COPY public.tb_municipios (id, id_estado, tx_nome, bo_entrega) FROM stdin;
    public          postgres    false    223   �N       �          0    24862 
   tb_pedidos 
   TABLE DATA           y   COPY public.tb_pedidos (id, id_cliente, id_forma_pagamento, int_numero, dt_compra, dt_entrega, dt_pagamento) FROM stdin;
    public          postgres    false    225   �X       �          0    24867    tb_produtos 
   TABLE DATA           q   COPY public.tb_produtos (id, tx_descricao, dbl_quantidade_estoque, nu_preco_unidade_atual, bo_ativo) FROM stdin;
    public          postgres    false    227   zY                  0    0    tb_clientes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_clientes_id_seq', 17, true);
          public          postgres    false    216                       0    0    tb_estados_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tb_estados_id_seq', 52, true);
          public          postgres    false    218                       0    0    tb_formas_pagamento_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tb_formas_pagamento_id_seq', 7, true);
          public          postgres    false    220                       0    0    tb_itens_pedidos_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tb_itens_pedidos_id_seq', 56, true);
          public          postgres    false    222                       0    0    tb_municipios_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_municipios_id_seq', 285, true);
          public          postgres    false    224                       0    0    tb_pedidos_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tb_pedidos_id_seq', 64, true);
          public          postgres    false    226                       0    0    tb_produtos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_produtos_id_seq', 1, false);
          public          postgres    false    228            C           2606    24880    tb_clientes tb_clientes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_clientes
    ADD CONSTRAINT tb_clientes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tb_clientes DROP CONSTRAINT tb_clientes_pkey;
       public            postgres    false    215            E           2606    24882    tb_estados tb_estados_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tb_estados
    ADD CONSTRAINT tb_estados_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tb_estados DROP CONSTRAINT tb_estados_pkey;
       public            postgres    false    217            G           2606    24884 ,   tb_formas_pagamento tb_formas_pagamento_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tb_formas_pagamento
    ADD CONSTRAINT tb_formas_pagamento_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.tb_formas_pagamento DROP CONSTRAINT tb_formas_pagamento_pkey;
       public            postgres    false    219            I           2606    24886 &   tb_itens_pedidos tb_itens_pedidos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tb_itens_pedidos
    ADD CONSTRAINT tb_itens_pedidos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tb_itens_pedidos DROP CONSTRAINT tb_itens_pedidos_pkey;
       public            postgres    false    221            K           2606    24888     tb_municipios tb_municipios_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_municipios
    ADD CONSTRAINT tb_municipios_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tb_municipios DROP CONSTRAINT tb_municipios_pkey;
       public            postgres    false    223            M           2606    24890 $   tb_pedidos tb_pedidos_int_numero_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.tb_pedidos
    ADD CONSTRAINT tb_pedidos_int_numero_key UNIQUE (int_numero);
 N   ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT tb_pedidos_int_numero_key;
       public            postgres    false    225            O           2606    24892    tb_pedidos tb_pedidos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tb_pedidos
    ADD CONSTRAINT tb_pedidos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT tb_pedidos_pkey;
       public            postgres    false    225            Q           2606    24894    tb_produtos tb_produtos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_produtos
    ADD CONSTRAINT tb_produtos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tb_produtos DROP CONSTRAINT tb_produtos_pkey;
       public            postgres    false    227            U           2606    24895    tb_municipios fk_estado    FK CONSTRAINT     }   ALTER TABLE ONLY public.tb_municipios
    ADD CONSTRAINT fk_estado FOREIGN KEY (id_estado) REFERENCES public.tb_estados(id);
 A   ALTER TABLE ONLY public.tb_municipios DROP CONSTRAINT fk_estado;
       public          postgres    false    223    217    4677            R           2606    24900 )   tb_clientes tb_clientes_id_municipio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_clientes
    ADD CONSTRAINT tb_clientes_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.tb_municipios(id);
 S   ALTER TABLE ONLY public.tb_clientes DROP CONSTRAINT tb_clientes_id_municipio_fkey;
       public          postgres    false    215    223    4683            S           2606    24905 0   tb_itens_pedidos tb_itens_pedidos_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_itens_pedidos
    ADD CONSTRAINT tb_itens_pedidos_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.tb_pedidos(id);
 Z   ALTER TABLE ONLY public.tb_itens_pedidos DROP CONSTRAINT tb_itens_pedidos_id_pedido_fkey;
       public          postgres    false    221    225    4687            T           2606    24910 1   tb_itens_pedidos tb_itens_pedidos_id_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_itens_pedidos
    ADD CONSTRAINT tb_itens_pedidos_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.tb_produtos(id);
 [   ALTER TABLE ONLY public.tb_itens_pedidos DROP CONSTRAINT tb_itens_pedidos_id_produto_fkey;
       public          postgres    false    227    4689    221            V           2606    24920 %   tb_pedidos tb_pedidos_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_pedidos
    ADD CONSTRAINT tb_pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.tb_clientes(id);
 O   ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT tb_pedidos_id_cliente_fkey;
       public          postgres    false    4675    225    215            W           2606    24925 -   tb_pedidos tb_pedidos_id_forma_pagamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_pedidos
    ADD CONSTRAINT tb_pedidos_id_forma_pagamento_fkey FOREIGN KEY (id_forma_pagamento) REFERENCES public.tb_formas_pagamento(id);
 W   ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT tb_pedidos_id_forma_pagamento_fkey;
       public          postgres    false    4679    225    219            �   �  x����n�6��ç��*U�HJ��q�t��q�"h�^�1�U �)e���Yz(r.�~�EY��YT�jF�O�q�����٨V?��+�$J�D��1�f��4IY��1��2X�68�4�����B5��6��6�Ҕ��Q�ϕ��ux�<hS��_�T���Q�����E��(�<�$@E6P�O�뎊R�%�IP�9K��TS��L���y��o�]Y��F�$�V��'-��K��S��,�ώ�"�SI
y1�}{v��Ȓfiz$L�!My?�Sm놶���-%����,�����m�@��'d3ep�FB/TTt�I�p߽_wpi
3�PL�
-!,��C��ʝ*��C��f]��Ҕ5�	��9�%���4�v��nQL<�p{`���
|�123�O;���,�y%k�K{a��ߥ!Oa)��[��t+[�Mx�/ý4ՔI.l�"Fx�HP����-����fBtW��iB�a1����AR>���PCΓB���jm��¥�^Ũ[BN2��+��a��脀Y���,��4<�]�+���������O۪�v/]'��E���C&���_vhY���E��vcT%����l��id���w޷B/�u<�@�| �QW��0ϝ��<�߲�M?<�߷��Q�7��&�]�N�u�6�'�H���|�����!mo�s{a_{�߉j{?Q�+�	�<���&�'����a
 �#A���s��.x����#�Q��ƣ�1A��1���F6$��1,.z�8~�ǱیxX�����3����I�]��GْPBS��O�U�!���L�s�m�����k�E�$�k�y�/iB(�W{���+�e;�9w���K�cJ�z��\�Q���P����ʹ~D��q�<3Xp~����>>E�R�����d�P���x�v
�U`��[c�͹�#L\���8�嶚�-��(['4CU<�(���ЇG�	_;8ޞ��!��,-����$w���\�Q�d��B����      �   
  x�]P�n�0�ɯ���JF7mHa��0����@���M��[�@?V�CQt�;�w<*({�:
�B9Ч�3x��!�a����b�����Aw�S�[x�8�ZCvt��ʙ�(7p"O��JɄg*�B`��R���ԣL�d8YT�m�!�z��(�B���.r�����Բ�jCS�Q��l�U�#Ym�C�Y���X�7�G�J���+����]���]%L���a
KC{��2h���i�9#�F����o��ac���ט����	 �(v�      �   K   x�3�t9�2)�$���ˈӹ���ǘ3�3H�p��� iSNg m�霑ZX�
d�s�d�e�f����qqq ��e      �   H  x�M�K�!D��a*��z���9Rg0�k�/�$�IL�}��k=��l f���g��ox�W�Ad.  ��]���2A��Ѻ�������Vk DΩ"�<�깪�,;d�| ~�e�0y��,�%�Q��wIJζ[3�x��\��{tI�N"�s�Lm�d�lͫ���H{��(]6�S��_�����vh�1Hfۡ��S^Dw������]5�.�u�h�Ls�Ez��R^��47�6ۄ"����)�l�f �:��;�6@��hR����$֪3�E��)%��d�
�NQƣ��]����-�_�k$�j@|=���y�_����      �   �	  x�mX=s�8��_�첫�J��oU֭���K.�HhDI�1�˥�~�ρˁ#o�l_w���*WY�5>��F�èHE�c{�/�9�]4�Р�_Z"!bz4�H�̡�`�Ȗ�ӓm����h��?�h��u�����)�^��q�P�8�̟Pt���j{�vę��.����"U����ɐ�C�5����&*!��7bN�MgĞ^�M����F_��������ŷ�~��U�`�z��J�Q�	U�0���8�q5V2�-���$���a�HH]�n����S"��5GB)е��5�K�[f3���f�3|Z9�+�`<��N�F�I�o��U����%���5�n����k��%��9*�%*J�����'�"�D�f�<��$��ϟ�������+����m�o�9XIA�4�'Y��1�(�J0��8��(����!�r�q�a�AEYtqg毞�i�~�B(!T�G�8M�h����3`ɰk���4�}7Y� ؙ�#Gȹ�d�v��3��葒�f�#��wG�*�ɥVV�4���>fɂ��S����S��9����a'��)����R'�NLEL�L5��w�a���\r�c|Յr�J�����O�˞����Иa��yF�m7LNL(!����k@^��<�X^�B�W���H�)TTF��o�S×�Р�L��j���"�����"��Ȍvv�yZ���[�u�`�s���󛖶xϛ�D�Ck�af�U��V!UTQj4-����?�ҥ^x��V&�����9�ʔpcO�-30�T>_/_m��^,��x>���;�au�b­�U;&�����
e�RJ�n���+�d8�Int�y~N�T�B�HyҚ�DeB5%3��'W�\����g������l@���)"RC�j��6~@�����c����k� �#2\��N�������y{�N���x�d�l�1?��]��+�.昨]���Wa�\���8a+f%Ky:�c-�s�)ji�\��D��a�vp]+�f{�Saf&ef0�q�XK�Esn�dQh�L��/]+M��)i��aFS&m��m�g���s�k��wLS��iŊ�C���b*4j��\DwDBN��Ǡo�ю�
}�	�ʕ���7q5�dJ���y�m�:'�,жW����6<��"M��/���=Z;�N~2�a}o��`�7��'�Y�q� ��I�T�ؐ���W�������OS���
M��vv������ԿY.��3#w�����<��C�M����9|C�L�ǃ�2�ۡ˫Ф!�0�a���O4ʳ��V2(���T�n)�F�gf�H�R]���$��`���T̠�rSS� ���d
��2`l%��D4��۫9@�~�4\%��, ����"�{��(���H�~��(���(>g�2�<�A�a����@B0��ម�����t9�خ���{�7�]&�e؛���AQ��S�a�2���(�JAL��N��^ګ��P�d� �܇����S��`���Y�J���{B_�f��!0Pap+&ֹ
ʂ�޷�F�(�
U>�R�
�� ]ň.V�j�����G�ʡ
�@l�?2��)�/'���NAu���Dڲ�� fأ�v��A��R�������!��o�$� B���O��d3V�4�Ҙo����?��5d�=�$;q�b͆��!F���6 CV^�Gٴb�v�xQ�o�^z�X�ӛ���5��Oe��:D�8�%�D�\�'<�xy���l@y�X�!��d��� A��e�.�����a8*-?���$ �L��	�d�g�Y����&=a�R�5�^��|~nBP�(�S��h��<4DQ���0k�!8�)V��9��K���kHt�}eͬ!!�"c!��E��%O���W�/f�-v��2�a���~V�4����:lV���Q�lxQӣOuDe�D �lz�ƽ?�rMO~f�����O��?��7nh����P
? S4�&~`�@��UtZ���^�RB�/H�!L?y����$�s�N6*��cl/�VD�Nx�9�`���<�g�M�qC|�V<�nТp�P���!���M1�P��?{�o�A���\�r�����`k��HC@�l���s��8�PoC�+�1<��c��A�<	f8~�/T��_(�Cs���9�	cl%������-5����`�-5�X@Y����� ~�w"�5������Ì8Q'D�j����Z�B��vԏ~8�W�A��K_S{j�5/B#X�q��PDQf=NL��uJ��ݾ�5$إ~�eߑ��!4�J�������4$X�N��K�NvB�y�h)a:�M�A`˚p#�4��>�}~ 8zRf!3��K*Ab0�:�L��@�H�BPg\2�>A�� \x�Wl�KʡQ�6����IZ#����ܷ�4>E���O��'�qo��LJjj�ѸT~e�i��j�s��߿�x��/�ovi      �   �   x�M�A1��V�����GiQkk�����]G���a�B�A��+��2�!�r�a2���)�5\��n�`�t��!�5fH��՘�]#aNZ���4�쮱a޴
f�9}��|h�C#�v��U0O�]��i��$K�Z��5p�W�!2�A� S�j4EF0i��,ccd��A�*�	��լ��(0�i.�&I��/���멪oqE�G      �   �  x�}WM�ܸ=ӿ��f �@_�j�^;2��&{�[�V�+�ZRjL|�o�/�݃1��r��+�RK�$��=CV�z��'�tZs����,�"on���/�Z�U*݊�6��F�8,����&±�}{��^�z���A4?�R��Kn��e쵑�\D�6�6�\�n�{�{�#�յ0�����L�F�r��џ�B�
x�K��|���������A���[_��}�
$׵:.z#�Y�J6H5����^�{w��������{-����n�M���	]�c�=ڃ���V�ы,��*N���j܊V��Qb�Z��cU{���Z/��C��𠷇j���g��§�0z�]Գ󏎷��d�*5��U%p��I���Ղg�Yk���[j4�@����f|:(��+�*�	Կ7��u��cE�\j(�[������~F�M� �2z�~(q��������I��Uӹ�P�j�K/��w�����g���*g�ݜAc��{\�F���9&м-Q�A�	�8
��v��y��򓸔wՉR����4���-{%@(0D�x�j��[�Ȯ'�}��ݏ�Q��=/~�W��R\/ɓ q�%�:Kc=A&�)"[E�60�T�$ �d���ʌ�GU��OC��+�����4b�0�Ԁ��˽���E��E#�`��/��m)0�^eV�R���A���	�A6�,	y��5J�QBZ��Zx����g�S�"{1�5ӌ�	�qT�UT���F"�C�X�����z��jA,�sP��׵t��	<͸�W�*HV-(��;@�h��FP�F��4'����`$'z1�/�|�{�0�
1J#E����E�E�D����K`��B��	c<�
�0o�Eƛf�r��r��wb�<r�)Y�~�8�.�)�c|���Y��8���~\�̃,i�<;-i� ��d�ϭ�=^���M�J��B:��A�V%� �4T�����{��<	~�k2�w��0hp�q�U�"a��']��Y���Ӎ����y�/	��&=1�1�c��W7�,��[{�������Y~%��.��9�P�!HH��&ah�@с28�6@��E2eпM���~�g2�Ts���H��)����V,�l���НĎ	�X�ٲ������|m�Ew�ӣ1/!�б^�����-̣��<���h9C1�	,E�#� /\٨��#�M��}&�5FVm����=<���N�
�5w'�9ʻ�7!B�����6>�e01A��{-`�	���X҄^Z��/ѯ�tq��{�EW0ުu��?'i�y�w��~�B��=F�1�^�fs�:�ڀ�����I[�� ��:Ba.H(&]��/z;��|���n&3�e�?1/��n���_��0C�q�kT����S4��%�l�»�1%���W����*��c�g�Ibd)iI�HO1U��@�}�*4�xmO{^�1�[[�2_�əx�������R\g�r�7��̅�O�gp�u�!��
ȣ�ܗ��jKs�s�@��񱔳�u��;iaq��.�>��]y��zY�k����ot;o��H��'��(O�h�$��b�|���h6���ˏ�]�����h� �tk�v+�>|�/�j�o�~���z��]2���DZm���ۥ���C���ujRS,�2�5A���zN��n3��C���x.�ԃ-{�*�{���j��y����@�M#a�|��̻|����j�	�����N��T�{�v��^h��CX�g���'���d`����d��.>�F�V�J��9s7�i�W�`�H�i꽹���q]ā1�r	o~��>p2�s)Hv�%l�0I����m����5��"�ڷځ`:�dLkAxzW눑w2���B/'��g{�#�N����E?���a^���Uϩ���_��s��������#��������GI��R�����/]H��7�2�$�K@~�}����Y?[     