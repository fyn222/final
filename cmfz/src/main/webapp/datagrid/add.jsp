<%@ page pageEncoding="utf-8"%>
<script  type="text/javascript">
			$(function(){
				
				$("#addPicFormSaveBtn").linkbutton({
					iconCls:"icon-save",
					onClick:function(){
						//提交表单
						$("#addPicForm").form("submit", {
						url:"${pageContext.request.contextPath}/banner/insert",
						onSubmit:function(){
							// 表单验证 -- 调form的validate方法
						return $("#addPicForm").form("validate");
							},
						success:function(){
							$("#addPicDialog").dialog("close");
							$("#dg").edatagrid("load");//刷新表格中的数据
							$.messager.show({
								title:"标题",
								msg:"保存成功！"
							});
							},
						
					});
					}
				});
				$("#addPicFormResetBtn").linkbutton({//重置对话框
					iconCls:"icon-no",
					onClick:function(){
						$("#addPicForm").form("clear");
					}
				});
				$("#addPicTitle").textbox({
					required:true,
					validType:"length[2,6]"
				});
				$("#addPicStatus").textbox({
					required:true,
                    validType:"length[1,1]"
				});
				// 初始化 日期框
				$("#addPicDate").datebox({
					editable:false,
					formatter:function(date){
						var y = date.getFullYear();
						var m = date.getMonth()+1;
						var d = date.getDate();
						return y+"/"+m+"/"+d;
					},
					parser:function(s){
						var t = Date.parse(s);
						if (!isNaN(t)){
							return new Date(t);
						} else {
							return new Date();
						}
					}
		});
                $("#addPicDescription").textbox({
                    required:true,
                    validType:"length[10,50]"
                });
				/* $.extend($.fn.validatebox.defaults.rules,{
						islength:{
							validator:function(value,ps){
								return value.length==ps[0];
							},
							message:"长度必须为{0}位"
						}
						
				}); */
			});
		</script>
				
				<h3>添加图片</h3>
			<form id="addPicForm" method="post" enctype="multipart/form-data">
				标题：<input id="addPicTitle" name="title"/><br/>
				状态：<input id="addPicStatus" name="status"/><br/>
				日期：<input id="addPicDate" name="pubDate"/><br/>
				文件: <input id="addPicpath" type="file" name="file"/><br/>
				描述：<input id="addPicDescription" name="description"/><br/><br/>
				<a id="addPicFormSaveBtn">保存</a>
				<a id="addPicFormResetBtn">重置</a>
			</form>
