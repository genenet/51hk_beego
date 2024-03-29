
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
<title>列表</title>

<link href="/static/css/all.css" rel="stylesheet" type="text/css">
    <link href="/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="div_find">

    <p><label class="find_labela">届次：</label><select class="find_input">
        <option>全部</option>
        <option>十一届</option>
        <option>十二届</option>
        <option>十三届</option>
        <option>十四届</option>
        <option>十五届</option>

    </select><label class="find_labela">提案性质：</label><select class="find_input">
        <option>全部</option>
        <option>立案提案</option>


    </select>
        <label class="find_labela">提案号：</label><input type="text" class="find_input">
    </p>
    <p><label class="find_labela">提案形式：</label><select class="find_input">
        <option>个人提案</option>
        <option>集体提案</option>
        <option>联名提案</option>


    </select>
        <label class="find_labela">提案类别：</label><select class="find_input">
            <option>经济科技</option>
            <option>城管城建</option>
            <option>教文卫体</option>

            <option>社会卫生</option>
            <option>其它类</option>
        </select>
        <label class="find_labela">处理情况：</label><select class="find_input">
            <option>已处理</option>
            <option>未处理</option>
            <option>其它</option>


        </select><input type="button" value="搜索一下" class="find_but" id="but_open"><input type="button" value="重置" class="find_but" id="but_close02">
     </p>
  </div>
    <p class="p_but">
        <i class="add_i" ></i><a href="javascript:openlayer(0)" class="add_a">新增</a>
        <i class="down_i" ></i><a href="#" class="add_a">导出</a>
        <i class="print_i" ></i><a href="#" class="add_a">打印</a>
   </p>
<p>
    <table data-url="/static/json/data_alae_list.json" id="table" class="table_style" style="margin: 0 auto" >
    </table>
</p>

<script src="/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/static/js/bstable/js/bootstrap.min.js"></script>
<script src="/static/js/bstable/js/bootstrap-table.js"></script>
<script src="/static/js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="/static/js/date/js/laydate.js"></script>
<script>
    !function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});
        laydate({elem: '#demo1'});//绑定元素
    }();
</script>

<script type="text/javascript">
    $(function () {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "/static/json/submit.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "提案号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '提案类别',
                    field: 'class',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '案由',
                    field: 'resouce',
                    align: 'center',
                    valign: 'middle'
                },

                {
                    title: '办理单位',
                    field: 'part',
                    align: 'center'
                },
                {
                    title: '签收期限',
                    field: 'date01',
                    align: 'center'
                },
                {
                    title: '签收状态',
                    field: 'getType',
                    align: 'center',
                    formatter: function (cellval, row) {
                        //var cellval=$("#station").val();
                        if (cellval =='未签收'){
                            return '<div  style="color:red">'+cellval+'</div>';
                        } else  if (cellval =='已签收'){
                            return '<div  style="color:green">'+cellval+'</div>';
                        }else {
                            return cellval;
                        }}
                },
                {
                    title: '办理期限',
                    field: 'date02',
                    align: 'center'
                },
                {
                    title: '办理情况',
                    field: 'overType',
                    align: 'center'
                },
                {
                    title: '提案状态',
                    field: 'type',
                    align: 'center'
                },

                {
                    title: '操作',
                    field: 'opear',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" title="提案评价" onclick="openlayer(\'' + row.id + '\')">提案评价</a> ';


                        return e ;
                    }
                }
            ]
        });
    })

</script>
<script src="/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    function openlayer(id){
        layer.open({
            type: 2,
            title: '评价',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            //maxmin: true,
            closeBtn:1,
            area: ['99%', '99%'],
            shadeClose: true,
            closeBtn: 1,
            content: '/standard/form'
        });
    }
</script>
<script>
    $(function () {
        $(".find_span").click(function () {
            $("#open").show();
            $(this).hide();
            $(".find_span1").show();
            $("#but_close02").hide();
            $("#but_open").hide();

        })
        $(".find_span1").click(function () {
            $("#open").hide();
            $(this).hide();
            $(".find_span").show();
            $("#but_open").show();
            $("#but_close02").show();

        })

    })
</script>

</body>
</html>
