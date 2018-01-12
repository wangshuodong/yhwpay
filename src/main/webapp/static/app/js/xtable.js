//layui xtable
layui.define(['table', 'element', 'form'], function (exports) {

    var $ = layui.jquery,
        element = layui.element,
        form = layui.form,
        table = layui.table;

    //监听table的工具条
    table.on('tool(table)', function (obj) {
        var me = this;
        var url = $(me).attr('data-url'),
            width = $(me).attr('data-width'),
            height = $(me).attr('data-height'),
            id = $(me).attr('data-id') || 'id',
            title = $(me).attr('data-title') || '';
        var data = obj.data;

        //删除
        if (obj.event === 'del') {
            layer.confirm('确定删除?', {icon: 3, title: '警告'}, function (index) {
                $.ajax({
                    type: 'POST',
                    url: url,
                    dataType: 'json',
                    data: {
                        id: data.id
                    },
                    success: function (data) {
                        if (data.code == 200) {
                            obj.del();
                            layer.close(index);
                            //table.reload('table');
                        } else {
                            layer.alert(data.msg, {
                                icon: 2,
                                title: '失败提示'
                            });
                        }
                    }
                });
            });

            //编辑
        } else if (obj.event === 'edit') {
            x_admin_show(title, url + '?id=' + data.id);
        } else {
            x_admin_show(title, url + '?id=' + data.id);
        }
    });

    //批量删除
    $(".del-all").on('click', function () {
        var url = $(this).attr('data-url');
        var checkStatus = table.checkStatus('table');
        var data = checkStatus.data;
        if (data.length == 0) {
            layer.msg("请选择要删除的记录");
            return;
        }
        var _ids = [];
        $.each(data, function (i, n) {
            _ids.push(n.id);
        });
        layer.confirm('确定删除?', {icon: 3, title: '警告'}, function (index) {
            $.ajax({
                type: 'POST',
                url: url,
                dataType: 'json',
                //传递数组加这个属性
                traditional: true,
                data: {
                    'ids': _ids
                },
                success: function (data) {
                    if (data.code == 200) {
                        layer.close(index);
                        table.reload('table');
                    } else {
                        layer.alert(data.msg, {
                            icon: 2,
                            title: '失败提示'
                        });
                    }
                }
            });
        });
    });

    //条件搜索
    form.on('submit(search)', function (data) {
        var values = data.field;
        table.reload('table', {
            where: values
        });
        return false;
    });

    exports('xtable', {});
});  
 