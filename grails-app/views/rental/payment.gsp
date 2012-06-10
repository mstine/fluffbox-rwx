<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Payment</title>
    <meta name='layout' content='main'/>

  </head>
  <body>
    <h1>Enter payment information:</h1>
    
    <g:if test="${denied}">
    <h2><font color="red">Your card was denied. Please try another</font></h2>
    </g:if>
    
    <p>
    <g:form action="authorizeCreditCard">
    
    <p>
    <label for="cardNumber">Card Number</label><br/>
    <g:textField id="cardNumber" name="cardNumber"/>
    </p>
    
    <p>
    <label for="expDate" >Expiration Date</label><br/>
    <g:textField id="expDate" name="expDate"/>
    </p>
    
    <g:submitButton name="go" value="GO!"/>
    
    </g:form>
    </p>
  </body>
</html>