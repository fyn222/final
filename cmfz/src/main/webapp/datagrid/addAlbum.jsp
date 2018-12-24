<%@ page pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {

        $("#addAlbumFormSaveBtn").linkbutton({
            iconCls: "icon-save",
            onClick: function () {
                //提交表单
                alert(row.id)
                $("#addAlbumForm").form("submit", {
                    url: "${pageContext.request.contextPath}/album/add",
                    onSubmit: function () {
                        // 表单验证 -- 调form的validate方法
                        alert(2222222222)
                        return $("#addAlbumForm").form("validate");
                    },
                    success: function () {
                        $("#addAlbumDialog").dialog("close");
                        $("#album").treegrid("load");//刷新表格中的数据
                        $.messager.show({
                            title: "标题",
                            msg: "保存成功！"
                        });
                    },

                });
            }
        });
        $("#addAlbumFormResetBtn").linkbutton({//重置对话框
            iconCls: "icon-no",
            onClick: function () {
                $("#addAlbumForm").form("clear");
            }
        });
        $("#addAlbumTitle").textbox({
            required: true,
            validType: "length[2,6]"
        });
        $("#addAlbumCount").textbox({
            required: true,
        });
        $("#addAlbumScore").textbox({
            required: true,
        });
        $("#addAlbumAuthor").textbox({
            required: true,
        });
        $("#addAlbumBroadcast").textbox({
            required: true,
        });
        $("#addAlbumBrief").textbox({
            required: true,
            validType: "length[10,50]"
        });
        // 初始化 日期框
        $("#addAlbumPubDate").datebox({
            editable: false,
            formatter: function (date) {
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                var d = date.getDate();
                return y + "/" + m + "/" + d;
            },
            parser: function (s) {
                var t = Date.parse(s);
                if (!isNaN(t)) {
                    return new Date(t);
                } else {
                    return new Date();
                }
            }
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

<h3>添加专辑</h3>
<form id="addAlbumForm" method="post" enctype="multipart/form-data">
    标题：<input id="addAlbumTitle" name="title"/><br/>
    数量：<input id="addAlbumCount" name="count"/><br/>
    封面：<input id="addAlbumCoverImg" type="file" name="file"/><br/>
    评分：<input id="addAlbumScore" name="score"/><br/>
    作者：<input id="addAlbumAuthor" name="author"/><br/>
    播音：<input id="addAlbumBroadcast" name="broadcast"/><br/>
    简介：<input id="addAlbumBrief" name="brief"/><br/>
    日期：<input id="addAlbumPubDate" name="pubDate"/><br/>
    <a id="addAlbumFormSaveBtn">保存</a>
    <a id="addAlbumFormResetBtn">重置</a>
</form>
