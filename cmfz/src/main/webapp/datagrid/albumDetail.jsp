<%@ page pageEncoding="utf-8"%>
<script  type="text/javascript">
			$(function(){



				$("#albumTitle").textbox({
					required:true,
					validType:"length[2,6]"
				});
				$("#albumCount").textbox({
					required:true,
				});
                $("#albumScore").textbox({
                    required:true,
                });
                $("#albumAuthor").textbox({
                    required:true,
                });
                $("#albumbroadcast").textbox({
                    required:true,
                });
                $("#albumBrief").textbox({
                    required:true,
                });
				// 初始化 日期框
				$("#albumPubDate").datebox({
					editable:false,
					formatter:function(date){
						var y = date.getFullYear();
						var m = date.getMonth()+1;
						var d = date.getDate();
						return y+"-"+m+"-"+d;
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
                $("#albumChildren").textbox({
                    required:true,
                });
			});
		</script>
				
				<h3>专辑详情</h3>
			<form id="AlbumForm" method="post">
				      <input id="updateTestFormTid" name="id" hidden="true"/>
				名称：<input id="albumTitle" name="title"/><br/>
				数量：<input id="albumCount" name="count"/><br/>
				封面：<div><img src="" id="albumCoverImg" width="50" name="coverImg"><br/>
			 	</div>
				评分：<input id="albumScore" name="score"/><br/>
				作者：<input id="albumAuthor" name="author"/><br/>
				播音：<input id="albumbroadcast" name="broadcast"/><br/>
				简介：<input id="albumBrief" name="brief"/><br/>
				日期：<input id="albumPubDate" name="pubDate"/><br/><br/>
			</form>
