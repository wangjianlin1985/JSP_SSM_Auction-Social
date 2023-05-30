<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_user_logstate.jsp"/>
<!DOCTYPE html>
<html>
<head>
<title>修改页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/itemClass.css" />
</head>
<body style="margin:0px; font-size:14px; background-image:url(../images/bg.jpg); background-position:bottom; background-repeat:repeat;">
<div id="itemClass_editDiv">
	<form id="itemClassEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">图书分类id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="itemClass_classId_edit" name="itemClass.classId" value="<%=request.getParameter("classId") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">图书类别名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="itemClass_className_edit" name="itemClass.className" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">类别描述:</span>
			<span class="inputControl">
				<textarea id="itemClass_classDesc_edit" name="itemClass.classDesc" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div class="operation">
			<a id="itemClassModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js" ></script>
<script src="${pageContext.request.contextPath}/ItemClass/js/itemClass_modify.js"></script> 
</body>
</html>
