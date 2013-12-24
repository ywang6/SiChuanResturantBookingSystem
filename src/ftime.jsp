<%@ page contentType="text/html;charset=gbk"%>
<tr>
  	<td align="right">
  	  开始时间:
  	</td>
  	<td>
  	  <select name="fyear">
  	   <option selected><%=year%></option>
       <option><%=year+1%></option>
  	  </select>年
  	  
      <select name="fmonth">
         <% 
          for(int i=1;i<13;i++)
          {
            if(i!=month)
            {
          %>
         <option><%=i%></option>
           <% 
             }
           else
             {
           %>
          <option selected><%=i%></option>
           <%
             }
           %>
         <% 
          }
          %>           
       </select>月
       
       <select name="fday">            
         <% 
          for(int i=1;i<32;i++)
          {
            if(i!=day)
            {%>
         <option><%=i%></option>
           <% 
             }
           else
             {
           %>
          <option selected><%=i%></option>
           <%
             } 
          }
          %>
       </select>日
       
       <select name="fhour">
         <%
           for(int i=0;i<24;i++)
           {
             if(i!=hour)
             {
             %>
          <option><%=i%></option>
           <%
              }
            else
              {
             %>
           <option selected><%=i%></option>             
             <%
               }
           }
           %>
       </select>时
  	</td>
  </tr>