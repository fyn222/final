<%@ page pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var row = $("#album").treegrid("getSelected");
        $("#addChapterFormSaveBtn").linkbutton({
            iconCls: "icon-save",
            onClick: function () {
                //提交表单
                $("#addChapterForm").form("submit", {
                    url:"${pageContext.request.contextPath}/chapter/add?p_id="+row.id,
                    onSubmit: function () {
                        // 表单验证 -- 调form的validate方法
                        return $("#addChapterForm").form("validate");
                    },
                    success: function () {
                        $("#addChapterDialog").dialog("close");
                        $("#album").treegrid("load");//刷新表格中的数据
                        $.messager.show({
                            title: "标题",
                            msg: "保存成功！"
                        });
                    },

                });
            }
        });

        $("#addChapterFormResetBtn").linkbutton({//重置对话框
            iconCls: "icon-no",
            onClick: function () {
                $("#addChapterForm").form("clear");
            }
        });
        $("#p_id").textbox({
            required: true,
        });
        $("#addChapterTitle").textbox({
            required: true,
            validType: "length[2,6]"
        });



    });
</script>

<h3>添加音频</h3>
<form id="addChapterForm" method="post" enctype="multipart/form-data">
    标题:<input id="addChapterTitle" name="title"/><br/>
    请选择:<input type="file" name="audio"/>
    <a id="addChapterFormSaveBtn">保存</a>
    <a id="addChapterFormResetBtn">重置</a>
</form>
