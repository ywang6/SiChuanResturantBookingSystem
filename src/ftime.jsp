<%@ page contentType="text/html;charset=gbk"%>
<tr>
  	<td align="right">
  	  ��ʼʱ��:
  	</td>
  	<td>
  	  <select name="fyear">
  	   <option selected><%=year%></option>
       <option><%=year+1%></option>
  	  </select>��
  	  
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
       </select>��
       
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
       </select>��
       
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
       </select>ʱ
  	</td>
  </tr>