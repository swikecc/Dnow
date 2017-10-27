/*管理员部分脚本*/
function selectall(){
	var list = document.getElementsByName("checkbox");
	for(var i=0;i<list.length;i++)
		{list.item(i).checked="checked";}	
}

function clearall(){
	var list = document.getElementsByName("checkbox");
	for(var i=0;i<list.length;i++)
		{list.item(i).checked=false;}	 
}