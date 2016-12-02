<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="fCountCheckAddForm" class="fCountChecktForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>工序计数质检编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="fCountCheckId" data-options="required:true"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>订单编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="orderId" ></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>检验项目:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="checkItem" ></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>样本总数:</td>
	            <td>
	            	<input class="easyui-numberbox" type="text" name="sample" ></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>抽检数:</td>
	             <td>
	            	<input class="easyui-numberbox" type="text" name="checkNumber" ></input>
    			</td>   
	        </tr>
	        <tr>
	            <td>不合格数:</td>
	            <td>
	            	<input class="easyui-numberbox" type="text" name="unqualify" ></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>合格率:</td>
	             <td><input class="easyui-numberbox" type="text" name="qualify" data-options="min:1,max:99999999,precision:2" />
	            	
	            </td>
	        </tr>
	          <tr>
	            <td>检验时间:</td>
	            <td><input class="easyui-datetimebox" name="cdate"     
        			data-options="required:true,showSeconds:true" value="5/5/2016 00:00:00" style="width:150px"> 
        		</td>   
	        </tr>
	          <tr>
	            <td>实际测量数据:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="measureData" ></input>
    			</td>  
	        </tr>
	          <tr>
	            <td>检验人员编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="empId" ></input>
    			</td>  
	        </tr>
	          <tr>
	            <td>检验结果:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="result" ></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>备注:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="note"></textarea>
	            </td>
	        </tr>
	    </table>
	    <input type="hidden" name="productParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="fCountCheckSubmitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	
	var fCountCheckAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		//加载文件上传插件
		
		//创建富文本编辑器
		//productAddEditor = TAOTAO.createEditor("#fCountCheckAddForm [name=file]");
		fCountCheckAddEditor = KindEditor.create("#fCountCheckAddForm [name=note]", TT.kingEditorParams);
		//初始化类目选择和图片上传器
		TAOTAO.init({fun:function(node){
			//根据产品的分类id取产品 的规格模板，生成规格信息。第四天内容。
			TAOTAO.changeItemParam(node, "fCountCheckAddForm");
		}});
	});
	
	//提交表单
	function fCountCheckSubmitForm(){
		//有效性验证
		if(!$('#fCountCheckAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
console.log("1");
		//同步文本框中的产品要求
		/* fCountCheckAddEditor.sync(); */
		console.log("2");		
		//ajax的post方式提交表单
		//$("#fCountCheckAddForm").serialize()将表单序列号为key-value形式的字符串
		//alert($("#fCountCheckAddForm [name=unquality").val())
		$.post("f_count_check/insert",$("#fCountCheckAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增产品成功!');
				$("#fCountCheckList").datagrid("reload");
				$("#fCountCheckAddWindow").window('close');
				clearForm();
				
			}
		});
		console.log("3");
	}
	
	function clearForm(){
		$('#fCountCheckAddForm').form('reset');
		fCountCheckAddEditor.html('');
	}
	$('#cc').combo({    
	    required:true,    
	    multiple:true   
	});
</script>
