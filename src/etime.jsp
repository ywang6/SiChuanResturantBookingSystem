<%@ page contentType="text/html;charset=gbk"%>
<tr>
  	<td align="right">
  	  ����ʱ��:
  	</td>
  	<td>
  	  <select name="eyear">
  	   <option selected><%= year %></option>
       <option><%= year+1 %></option>
  	  </select>��
  	  
      <select name="emonth">
         <% 
          for(int i=1;i<13;i++)
          {
            if(i!=month)
            {
            %>
         <option><%= i %></option>
            <% 
             }
           else
             {
           %>
          <option selected><%= i %></option>
           <%
              }
          }
          %>           
       </select>��
       
       <select name="eday">
         <% 
          for(int i=1;i<32;i++)
          {
            if(i!=day)
            {
            %>
         <option><%= i %></option>
            <% 
             }
           else
             {
           %>
          <option selected><%= i %></option>
           <%
             }
          }
          %>
       </select>��
       
       <select name="ehour">
         <%
           for(int i=0;i<24;i++)
           {
             if(i!=hour)
             {
             %>
          <option><%= i %></option>
             <% 
              }
            else
              {
             %>
           <option selected><%= i %></option>
             <%
               }
           }
           %>
       </select>ʱ
  	</td>
  </tr>