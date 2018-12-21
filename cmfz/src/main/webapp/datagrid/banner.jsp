<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        //初始化添加用户对话框
        $("#addPicDialog").dialog({
            title:"添加图片对话框",
            width:300,height:230,
            closed:true,
            href:"${pageContext.request.contextPath }/datagrid/add.jsp",
            modal:true,
            cache:false
        });

        var toolbar = [{
            iconCls: 'icon-add',
            text: "添加",
            handler: function () {
                $("#addPicDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#dg").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#dg").edatagrid("getRowIndex", row);
                    $("#dg").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }


            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
                $.messager.confirm("删除对话框","确定删除？",
                    function(r){
                        if(r){
                            // 获取先中行，并且返回行对应的json对象 -- 调datagrid的getSelected方法
                            var row = $("#dg").edatagrid("getSelected");
                            $.ajax({
                                type:"post",
                                data:"id="+row.id,
                                dataType:"html",
                                url:"${pageContext.request.contextPath}/banner/delete",
                                success:function(){
                                    $("#dg").edatagrid("load");//刷新表格中的数据
                                    $.messager.show({
                                        title:"系统提示",
                                        msg:"删除成功"
                                    });
                                }
                            });
                        }
                    });
            }
        }, '-', {
            text: "保存",
            iconCls: 'icon-save',
            handler: function () {
                $("#dg").edatagrid("saveRow")
                $("#dg").edatagrid("reload");//刷新表格中的数据
                $.messager.show({
                    title:"标题",
                    msg:"保存成功！"
                });
            }
        }]

        $('#dg').edatagrid({
            updateUrl: '${pageContext.request.contextPath}/banner/update',
            url: '${pageContext.request.contextPath}/banner/getAll',
            columns: [[
                {field: 'title', title: '名称', width: 100},
                {field:'status',title:'状态',width:100,editor:{type:"combobox",
                        options:{editable:false,required:true,
                            panelHeight:"auto",
                            valueField: 'label',
                            textField: 'value',
                            data: [{
                                label: 'Y',
                                value: 'Y'
                            },{
                                label: 'N',
                                value: 'N'
                            }
                            ]}}},
                {field: 'pubDate', title: '时间', width: 100, align: 'middle'}
            ]],
            fitColumns: true,
            fit: true,
            pagination: true,
            pageList: [1, 3, 5, 7, 9],
            pageSize: 3,
            toolbar: toolbar,
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + rowData.description + '</p>' +
                    '<p>日期: ' + rowData.pubDate + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });

    })

</script>

<table id="dg"></table>
<div id="addPicDialog"></div>