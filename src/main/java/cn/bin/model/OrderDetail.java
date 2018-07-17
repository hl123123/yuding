package cn.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class OrderDetail {
    private String detailId;
    private String orderId;
    private String productId;
    private String productName;
    private BigDecimal productPrice;
    private Integer productQuantity;
	private String productIcon;
	private Date createTime;
	private Date updateTime;
}
