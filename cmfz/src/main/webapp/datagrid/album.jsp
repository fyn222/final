<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">


    $(function () {
        //专辑详情对话框
        $("#albumDialog").dialog({
            title:"专辑详情对话框",
            width:300,height:320,
            closed:true,
            href:"${pageContext.request.contextPath }/datagrid/albumDetail.jsp",
            modal:true,
            cache:false
        });
        //初始化专辑添加对话框
        $("#addAlbumDialog").dialog({
            title:"添加专辑对话框",
            width:300,height:320,
            closed:true,
            href:"${pageContext.request.contextPath }/datagrid/addAlbum.jsp",
            modal:true,
            cache:false
        });
        // 初始化章节添加对话框
        $("#addChapterDialog").dialog({
            title:"添加音频对话框",
            width:300,height:320,
            closed:true,
            href:"${pageContext.request.contextPath }/datagrid/addChapter.jsp",
            modal:true,
            cache:false
        });


        $('#album').treegrid({
            url:'${pageContext.request.contextPath}/album/getAll',
            idField:'id',
            treeField:'title',
            columns:[[
                {field:'title',title:'名字',width:60},
                {field:'duration',title:'时长',width:80},
                {field:'size',title:'大小',width:80}
            ]],
            fit:true,
            fitColumns:true,
            toolbar:[{
                iconCls: 'icon-add',
                text: "专辑详情",
                handler: function () {
                    //获取选中行
                    var row = $("#album").treegrid("getSelected");
                    if (row != null) {
                        if(row.duration==null){
                            $("#albumDialog").dialog("open");
                            $.ajax({
                                type:"post",
                                data:"id="+row.id,
                                dataType:"json",
                                url:"${pageContext.request.contextPath}/album/getOne?id="+row.id,
                                success:function(result){
                                    $("#AlbumForm").form("load",row/*{
                                        id:result.id,
                                        title:result.title,
                                        count:result.count,
                                        coverImg:result.,
                                        score:result.score,
                                        author:result.author,
                                        broadcast:result.broadcast,
                                        brief:result.brief,
                                        pubDate:result.pubDate,
                                    }*/
                                    );
                                    $("#albumCoverImg").prop("src", "${pageContext.request.contextPath}/" + row.coverImg)
                                }});

                        }else{
                            alert("请选中专辑!");
                        }
                    } else {
                        alert("请先选中行")
                    }

                }
            }, '-', {
                text: "添加专辑",
                iconCls: 'icon-edit',
                handler: function () {
                    $("#addAlbumDialog").dialog("open");

                }
            }, '-', {
                text: "添加音频",
                iconCls: 'icon-remove',
                handler: function () {
                    //获取选中行
                    var row = $("#album").treegrid("getSelected");
                    if(row!=null){
                        if(row.duration==null){
                            $("#addChapterDialog").dialog("open");
                            $("#p_id").val(row.id)
                        }else{
                            alert("请选中专辑");
                        }
                    }else{
                        alert("请选中行");
                    }
                }
            }, '-', {
                text: "音频下载",
                iconCls: 'icon-save',
                handler: function () {
                    var row = $("#album").treegrid("getSelected")
                    if (row != null) {
                        if (row.duration != null) {
                            alert(row.url)
                            location.href="${pageContext.request.contextPath}/chapter/down?url="+row.url+"&title="+row.title
                        }
                    }
                }
            }],
        });
    })

</script>

<table id="album"></table>
<div id="albumDialog"></div>
<div id="addAlbumDialog"></div>
<div id="addChapterDialog"></div>