/*window.addEventListener("load", init, false);
function init() {
    
    var deletea = window.document.getElementById("deletea");
    
    deletea.addEventListener("click", function (e) {
        e.preventDefault();
        
        
        var recid = document.getElementsByClassName('col1');
        var rates = document.getElementsByClassName('rates');
        
        console.log("deleteBtn" + deleteBtn);
        console.log("dasd", recid);
        console.log("dasd22", rates);
        
        for (var i = 0; i <= recid.length; i++){
        		rate = rates[i].innerHTML;
        		id = recid[i].innerHTML;
        		
        		if(rate >= 4){
        			alert('평점이 4점 이하만 삭제가 가능합니다.');
        		}
        		
        		else if(rate <= 4) {
        			confirm("삭제하시겠습니까?");
        			if (confirm){
        			location.href = getContextPath()+"/admin/delete/" + id;
        			}
        			else{
        				alert('취소되었습니다.');
        			}
        		}
        		console.log("ratedsa" + rate);
        }
        
  
        
    }, false);


    	

}*/