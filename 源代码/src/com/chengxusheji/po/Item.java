package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Item {
    /*图书id*/
    private Integer itemId;
    public Integer getItemId(){
        return itemId;
    }
    public void setItemId(Integer itemId){
        this.itemId = itemId;
    }

    /*图书分类*/
    private ItemClass itemClassObj;
    public ItemClass getItemClassObj() {
        return itemClassObj;
    }
    public void setItemClassObj(ItemClass itemClassObj) {
        this.itemClassObj = itemClassObj;
    }

    /*图书标题*/
    @NotEmpty(message="图书标题不能为空")
    private String pTitle;
    public String getPTitle() {
        return pTitle;
    }
    public void setPTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    /*图书图片*/
    private String itemPhoto;
    public String getItemPhoto() {
        return itemPhoto;
    }
    public void setItemPhoto(String itemPhoto) {
        this.itemPhoto = itemPhoto;
    }

    /*图书描述*/
    @NotEmpty(message="图书描述不能为空")
    private String itemDesc;
    public String getItemDesc() {
        return itemDesc;
    }
    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }

    /*发布人*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    /*起拍价*/
    @NotNull(message="必须输入起拍价")
    private Float startPrice;
    public Float getStartPrice() {
        return startPrice;
    }
    public void setStartPrice(Float startPrice) {
        this.startPrice = startPrice;
    }

    /*起拍时间*/
    private String startTime;
    public String getStartTime() {
        return startTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    /*结束时间*/
    private String endTime;
    public String getEndTime() {
        return endTime;
    }
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonItem=new JSONObject(); 
		jsonItem.accumulate("itemId", this.getItemId());
		jsonItem.accumulate("itemClassObj", this.getItemClassObj().getClassName());
		jsonItem.accumulate("itemClassObjPri", this.getItemClassObj().getClassId());
		jsonItem.accumulate("pTitle", this.getPTitle());
		jsonItem.accumulate("itemPhoto", this.getItemPhoto());
		jsonItem.accumulate("itemDesc", this.getItemDesc());
		jsonItem.accumulate("userObj", this.getUserObj().getName());
		jsonItem.accumulate("userObjPri", this.getUserObj().getUser_name());
		jsonItem.accumulate("startPrice", this.getStartPrice());
		jsonItem.accumulate("startTime", this.getStartTime().length()>19?this.getStartTime().substring(0,19):this.getStartTime());
		jsonItem.accumulate("endTime", this.getEndTime().length()>19?this.getEndTime().substring(0,19):this.getEndTime());
		return jsonItem;
    }}