<%@page import="play.PlayListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="play.PlayDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <canvas id="example" width="200" height="200">
    This text is displayed if your browser does not support HTML5 Canvas.
</canvas> -->
<script>
    var example = document.getElementById('example');
    var context = example.getContext('2d');
    context.fillStyle = 'red';
    context.fillRect(30, 30, 50, 50);
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
#myChart{
   
   height: 90%;
}
</style>
</head>
<body>
<%
   int result = 0;
   String strResult = "";
   String Result = "";

   
   PlayDAO adao = new PlayDAO();
   ArrayList<PlayListBean> resList = adao.getT();
   
   for(int i = 0; i < resList.size(); i++){
      
      PlayListBean abean = resList.get(i);
      
      if (i < resList.size()){
            strResult += abean.getTotal() + ", ";
       } else{
          strResult += abean.getTotal();
       }
   }
   
   PlayDAO ad = new PlayDAO();
   ArrayList<PlayListBean> rsList = ad.getT();
   
   for(int i = 0; i < rsList.size(); i++){
      
      PlayListBean abean = rsList.get(i);
      
      if (i < rsList.size()){
            Result += "'" + abean.getName() + "', ";
       } else{
          Result += "'" + abean.getName() +"'";;
       }
   }



/*    
   for (int i = 1; i <= 6; i++){
            if (i < 6){
                    strResult += i + ", ";
            }
            else{
                    strResult +=  i;
            }
   
            result += i;
   }
   System.out.println(strResult); */
%>

<%-- <%=strResult%> --%>
<div c >
    <canvas id="myChart"></canvas>
</div>

<script>
// 우선 컨텍스트를 가져옵니다. 
var ctx = document.getElementById("myChart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        /* labels: ["라이어I","인사이드 히말라야","시련","알앤제이","터미널","인디아 블로그","청춘다방","감염 그리고 잃어버린 계절","동치미","허풍선이 남작의 연회장","안티고네","과부들"], */
        labels: ["라이어I","인사이드 히말라야","시련","알앤제이","터미널","인디아 블로그","청춘다방","감염 그리고 잃어버린 계절","동치미","허풍선이 남작의 연회장","안티고네","과부들"],
        datasets: [{
            label: '연극 별 매출',
            /* data: [1,2,3,4,5,6,7,8,9,10,11,12], */
            data: [<%=strResult%>],
            backgroundColor: [
                'rgba(103, 183, 220, 0.7)',
                'rgba(103, 148, 220, 0.7)',
                'rgba(103, 113, 220, 0.7)',
                'rgba(128, 103, 220, 0.7)',
                'rgba(163, 103, 220, 0.7)',
                'rgba(199, 103, 220, 0.7)',
                'rgba(220, 103, 206, 0.7)',
                'rgba(220, 103, 171, 0.7)',
                'rgba(220, 103, 136, 0.7)',
                'rgba(220, 105, 103, 0.7)',
                'rgba(220, 140, 103, 0.7)',
                'rgba(220, 175, 103, 0.7)',
            ],
            borderColor: [
                'rgba(103, 183, 220,1)',
                'rgba(103, 148, 220, 1)',
                'rgba(103, 113, 220, 1)',
                'rgba(128, 103, 220, 1)',
                'rgba(163, 103, 220, 1)',
                'rgba(199, 103, 220, 1)',
                'rgba(220, 103, 206,1)',
                'rgba(220, 103, 171, 1)',
                'rgba(220, 103, 136, 1)',
                'rgba(220, 105, 103, 1)',
                'rgba(220, 140, 103, 1)',
                'rgba(220, 175, 103, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
</body>
</html>