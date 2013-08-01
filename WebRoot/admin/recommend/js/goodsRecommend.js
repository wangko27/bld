$(function(){
//            alert($("#isMiaoSha").val());
    var value = $("input[type='radio']:checked").val()
//            alert("value="+value);
    if(value == 0){
        $("#miaoShaDate").hide(10);
        $("#miaoPrice").hide(10)
        $("#recommendAreaId").show(10);
    }else if(value == 1){
        $("#miaoShaDate").show(10);
        $("#miaoPrice").show(10)
        $("#recommendAreaId").hide(10);
    }

//单选框按钮
$("#miaoSha :radio").click(function(){
    var value =   $("input[name=ms]:checked").val()
//                alert("value="+value)
    if(value == 0){
        $("#miaoShaDate").hide(10);
        $("#miaoPrice").hide(10)
        $("#recommendAreaId").show(10);
    }else if(value == 1){
        $("#miaoShaDate").show(10);
        $("#miaoPrice").show(10)
        $("#recommendAreaId").hide(10);
    }
});

//表单提交按钮
    $('#tjBut').click(function(){
        var flag = false;
        var goodsname=$("#goodsname").val();
        var beginDate = $("#beginDate").val();
        var endDate = $("#endDate").val();
        var recommendArea =$("select option:selected").val() ;
        var miaoShaPriceSelect = $("#miaoShaPriceSelect").val();
    //                alert("miaoShaPriceSelect ="+miaoShaPriceSelect +",type="+typeof miaoShaPriceSelect );
    //                alert("beginDate="+beginDate+",type="+typeof beginDate);
        var value =   $("input[name=ms]:checked").val()

        if(value === "1"){
            if(beginDate == '' || beginDate == null || typeof beginDate == 'undefined'){
                flag = false;
                alert("秒杀开始日期不能为空!");
                 return;
            }else{
                flag = true;
            }
            if(endDate == '' || endDate == null || typeof endDate == 'undefined'){
                flag = false;
                alert("秒杀结束日期不能为空!");
                return;
            }else{
                flag = true;
            }
            //                    alert(new Date());
            //                    alert("1beginDate="+beginDate+",type="+typeof beginDate+".....endDate="+endDate+",type="+typeof endDate);
            beginDate = beginDate.replace(/\-/g,"/");
            //                    alert("替换- beginDate="+beginDate+",type="+typeof beginDate);
            beginDate = new Date(Date.parse(beginDate));
            endDate = endDate.replace(/\-/g,"/");
            //                    alert("替换- endDate="+endDate+",type="+typeof endDate);
            endDate = new Date(Date.parse(endDate));
            //                    alert("beginDate="+beginDate+",type="+typeof beginDate+".....endDate="+endDate+",type="+typeof endDate);

            if(beginDate < new Date() ){
                flag = false;
                alert("秒杀开始时间不能小于当前时间!");
                return;
            }else{
                flag = true;
            }
            if(endDate < new Date() ){
                    flag = false;
                    alert("秒杀结束时间不能小于当前时间!");
                    return;
            }else{
                flag = true;
            }
            if(beginDate > endDate){
                flag = false;
                alert("秒杀开始时间不能大于结束时间!");
                return;
            }else{
            flag = true;
            }
            if(miaoShaPriceSelect == 0 || miaoShaPriceSelect == "0" || typeof miaoShaPriceSelect =='undefined' || miaoShaPriceSelect == null){
                flag = false;
                alert("请选择秒杀价格!");
                return;
            }else{
            flag = true;
            }
        }
        if(value === "0"){
            var area = $("#recommendArea").val();
            if(area == null ||   area ==="0"|| area === "undefined"){
                alert("推荐区域不能为空！");
                return false;
            }else{
                $("#form_advLocation").submit();
            }
        }
        if(goodsname==''){
            flag = false;
            alert("商品名称不能为空!");
            return;
            }else{
            flag = true;
            }
        //                alert("开始表单提交，flag="+flag);
         if(flag == true){
    //                    alert("表单提交，flag="+flag);
            //业务需求：每天只能推荐一件商品为秒杀商品
            //发送ajax请求，判断所选开始日期是否有推荐秒杀商品。
            //有，则推荐失败; 没有，则可以推荐
            $.ajax({
                url:$('#path').val()+'admin/miaosha/ajaxCheckBeginDate.action?beginDate='+$("#beginDate").val()+'&endDate='+$("#endDate").val(),
                success:function(data){
                    if(data == null || data == '' || typeof data =='undefined'){
                        flag = false;
                        return;
                    }else{
                         data = JSON.parse(data);
    //                                alert("data.goodsNum="+data.goodsNum+",type="+typeof  data.goodsNum);
                        if(data.goodsNum == '1'){
                            alert("成功推荐该商品为秒杀商品！")
                            $("#form_advLocation").submit();
                        } else{
                        flag = false;
                        alert("此开始时间已有商品在秒杀，请另选择！");
                        return;
                        }
                    }
                 },
                error:function(e){
                    flag = false;
                    return;
                    alert("系统发生错误，稍后重试！");
                    }
             });
         }else{
            return;
         }
    });
 });

