﻿$(function () {
	$("#itemClass_className").validatebox({
		required : true, 
		missingMessage : '请输入图书类别名称',
	});

	$("#itemClass_classDesc").validatebox({
		required : true, 
		missingMessage : '请输入类别描述',
	});

	//单击添加按钮
	$("#itemClassAddButton").click(function () {
		//验证表单 
		if(!$("#itemClassAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
		} else {
			$("#itemClassAddForm").form({
			    url:"ItemClass/add",
			    onSubmit: function(){
					if($("#itemClassAddForm").form("validate"))  { 
	                	$.messager.progress({
							text : "正在提交数据中...",
						}); 
	                	return true;
	                } else {
	                    return false;
	                }
			    },
			    success:function(data){
			    	$.messager.progress("close");
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $("#itemClassAddForm").form("clear");
                    }else{
                        $.messager.alert("消息",obj.message);
                    }
			    }
			});
			//提交表单
			$("#itemClassAddForm").submit();
		}
	});

	//单击清空按钮
	$("#itemClassClearButton").click(function () { 
		$("#itemClassAddForm").form("clear"); 
	});
});
