create table customer
(id serial primary key,
name varchar (255),
phone varchar (20),
email varchar (255));

create table product
(id serial primary key,
name varchar (255),
description text,
price integer);

create table product_photo
(id serial primary key,
url varchar (255),
product_id integer references product (id));

create table cart
(id serial primary key,
customer_id integer references customer (id));

create table cart_product 
(cart_id integer references cart (id),
product_id integer references product (id));

insert into customer (name, phone, email)
values
('Александр', '89033333333', 'alex@333.com'),
('Владимир', '89044444444', 'vova@444.com'),
('Федор', '89055555555', 'fedor@555.com'),
('Марина', '89066666666', 'marina@666.com'),
('Ульяна', '89077777777', 'ulyana@777.com'),
('Эдуард', '89088888888', 'eduard@888.com');

insert into product (name, description, price)
values
('Телевизор Samsung UE50BU8000U', 'Экран50"/3840x2160 Пикс, Поддержка Smart TV', 49999),
('Телевизор Samsung UE43AU7002U', 'Экран43"/3840x2160 Пикс, Поддержка Smart TV', 29999),
('Телевизор Samsung QE55Q60BAU', 'Экран55"/3840x2160 Пикс, Поддержка Smart TV', 74999),
('Телевизор Samsung UE32N4010AU', 'Экран32"/1366x768 Пикс', 12999),
('Телевизор Samsung UE32N5000AU', 'Экран50"/3840x2160 Пикс', 18999),
('Телевизор LG 50UQ80006LB', 'Экран50"/3840x2160 Пикс, Поддержка Smart TV', 46999),
('Телевизор LG 55QNED816QA', 'Экран55"/3840x2160 Пикс, Поддержка Smart TV', 74999),
('Телевизор LG 55UQ76003LD', 'Экран55"/3840x2160 Пикс, Поддержка Smart TV', 47999),
('Телевизор LG 32LQ630B6LA', 'Экран43"/3840x2160 Пикс, Поддержка Smart TV', 30999),
('Телевизор Haier 43 Smart TV S3', 'Экран43"/3840x2160 Пикс, Поддержка Smart TV', 29999),
('Телевизор Haier 55 Smart TV S1', 'Экран55"/3840x2160 Пикс, Поддержка Smart TV', 28999),
('Телевизор Haier 55 Smart TV S7', 'Экран55"/3840x2160 Пикс, Поддержка Smart TV', 47999),
('Телевизор Hisense 50A6BG', 'Экран65"/3840x2160 Пикс, Поддержка Smart TV', 19999),
('Телевизор Hisense 65U8HQ', 'Экран43"/3840x2160 Пикс, Поддержка Smart TV', 99999),
('Телевизор Hisense 50A6BG', 'Экран65"/3840x2160 Пикс, Поддержка Smart TV', 19999),
('Телевизор Hisense 50E7HQ', 'Экран50"/3840x2160 Пикс, Поддержка Smart TV', 24999);

insert into product_photo (url, product_id)
values
('https://img.mvideo.ru/Big/10031725bb.jpg', 1),
('https://img.mvideo.ru/Big/10032074bb.jpg', 2),
('https://img.mvideo.ru/Pdb/10031269b.jpg', 3),
('https://img.mvideo.ru/Pdb/10018879b.jpg', 4),
('https://img.mvideo.ru/Pdb/10031543b.jpg', 5),
('https://img.mvideo.ru/Big/10031138bb.jpg', 6),
('https://img.mvideo.ru/Big/10031164bb.jpg', 7),
('https://img.mvideo.ru/Big/10031162bb.jpg', 8),
('https://img.mvideo.ru/Pdb/10031714b.jpg', 9),
('https://img.mvideo.ru/Big/400076825bb.jpg', 10),
('https://img.mvideo.ru/Big/10031388bb.jpg', 11),
('https://img.mvideo.ru/Big/400095987bb.jpg', 12),
('https://img.mvideo.ru/Big/10030411bb.jpg', 13),
('https://img.mvideo.ru/Big/10030429bb.jpg', 14),
('https://img.mvideo.ru/Big/10030422bb.jpg', 15),
('https://img.mvideo.ru/Big/10030423bb.jpg', 16);

insert into cart (customer_id)
values (1), (3), (5);

insert into cart_product (cart_id, product_id)
values (1, 1), (1, 6), (2, 10), (3, 16);

select cart.id, c.name from cart left join customer c on cart.customer_id = c.id
group by name, cart.id
order by name asc;

select c.name, cart.id as cart_id, cp.product_id, p.price from customer c left join cart on cart.customer_id = c.id 
left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id;

select c.name, sum (p.price) from customer c left join cart on cart.customer_id = c.id 
left join cart_product cp on cp.cart_id=cart.id left join product p on p.id=cp.product_id
group by c.name
having sum(p.price)>0
order by sum desc;