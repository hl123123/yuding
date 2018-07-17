数据库表结构

create table `product_category`( 
	`category_id` int not null auto_increment, -- 类目不太可能爆多，所以可以自增 
	`category_name` varchar(64) not null comment '类目名字', 
	`category_type` int not null comment '类目编号', 
	`create_time` timestamp not null default current_timestamp comment '创建时间', 
	`update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间', --MYSQL5.7才可以
	default current_timestamp primary key (`category_id`) unique key `uqe_category_type` (`category_type`) --类目是唯一的
) comment '类目表'


create table `product_info`( 
	`product_id` varchar(32) not null, --企业级的用varchar，自己玩的项目可以用自增的但数量大了可能不够用 
	`product_name` varchar(64) not null comment '商品名称', 
	`product_price` decimal(8,2) not null comment '单价', 
	`product_stock` int not null comment '库存', 
	`product_description` varchar(64) comment '描述', 
	`product_icon` varchar(512) comment '小图', 
	`category_type` int not null comment '类目编号', 
	`create_time` timestamp not null default current_timestamp comment '创建时间', 
	`update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间', --MYSQL5.7才可以
	default current_timestamp primary key (`product_id`)
) comment '商品表';


create table `order_master`( 
	`order_id` varchar(32) not null, 
	`buyer_name` varchar(32) not null comment '买家名字', 
	`buyer_phone` varchar(32) not null comment '买家电话', 
	`buyer_address` varchar(128) not null comment '买家地址', 
	`buyer_openid` varchar(64) not null comment '买家微信openid', 
	`order_amount` decimal(8,2) not null comment '订单总金额'， 
	`order_status` tinyint(3) not null default '0' comment '订单状态，默认0新下单', 
	`pay_status` tinyint(3) not null default '0' comment '支付状态，默认0未支付', 
	`create_time` timestamp not null default current_timestamp comment '创建时间', 
	`update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间', --MYSQL5.7才可以
	default current_timestamp primary key (`order_id`), 
	key `idx_buyer_openid` (`buyer_openid`)
) comment '订单表';


create table `order_detail`( 
	`detail_id` varchar(32) not null, `order_id` varchar(32) not null, 
	`product_id` varchar(32) not null, `product_name` varchar(64) not null comment '商品名字', 
	`product_price` decimal(8,2) not null comment '商品价格', `product_quantity` int not null comment '商品数量'， 
	`product_icon` varchar(512) comment '商品小图', 
	`create_time` timestamp not null default current_timestamp comment '创建时间', 
	`update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间', --MYSQL5.7才可以
	default current_timestamp primary key (`detail_id`), 
	key `idx_order_id`(`order_id`)
) comment '订单详情表';



