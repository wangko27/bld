$(function(){
    var flag=1;
    $("#tjBut").click(function(){
        var orderList = $("#orderList").val();
//        alert("orderList="+orderList+",type="+typeof orderList);
        var regex =/^\d+$/
        regex = new RegExp(regex);
        if(!regex.test(orderList)){
            alert("排列序号请填入数字！");
        return;
        }
        var articleTypeSelect=$("#articleTypeSelect").val();
        //                 alert("orderList ="+orderList +",articleTypeSelect="+articleTypeSelect);
        $.ajax({
            url:"/admin/recommend/checkArticleOrder.action",
            data:{"orderList":parseInt(orderList),"type":articleTypeSelect},
            success:function(data){
                data = JSON.parse(data);
                if(data && data != null ){
                flag = parseInt(data.flag);
                }
            },
            error:function(e){
                alert("系统错误!");
                }
            });
             alert("检查排序序号中..")
            //                        alert("flag="+flag+",type= "+flag);
        if(flag && flag === 0 ){
            alert("该序号可以使用!");
            $("#form_gAdd").submit();
        }else{
            alert("该类别的文章已存在该排列序号！请重新选择");
        }
    });
});

