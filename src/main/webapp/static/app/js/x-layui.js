/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function x_admin_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w='55%';
	};
	if (h == null || h == '') {
		h='70%';
	};
	layer.open({
		type: 2,
		area: [w, h],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url
	});
}

/*关闭弹出框口*/
function x_admin_close(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}  

//弹窗
$(".dialog").on('click',function(){
	var me = this;
	 var url = $(this).attr('data-url'),
	 width=$(me).attr('data-width') || '55%',
	 height=$(me).attr('data-height') || '70%',
	 title = $(me).attr('data-title') || '';
	 x_admin_show(title,url,width,height);
});

