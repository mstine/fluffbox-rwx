<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Reserve Speaker</title>
  <meta name="layout" content="main"/>
</head>
<body>
<div class="span-24 last">
  <div class="reserveLeft span-12">
    <div class="reserveLocation span-24 last">
      <h2>Pickup location:</h2>
      <p>
        <strong>${clone.kiosk.store.name} (${clone.kiosk.inside ? "Inside" : "Outside"})</strong><br/>
        ${clone.kiosk.address}<br/>
        ${clone.kiosk.city}, ${clone.kiosk.state} ${clone.kiosk.zipCode}
      </p>
    </div>
    <div class="reserveSpeaker span-24 last">
      <h2>Selected speaker:</h2>
      <p>
        <img src="${clone.speaker.imageUrl}"/><br/>
        <strong>${clone.speaker.name}</strong><br/>${clone.speaker.title}
      </p>
    </div>
    <div class="reserveCost span-24 last">
      <h2>Your total:</h2>
      <table>
        <tr>
          <td>Sub total</td>
          <td>$1.00</td>
        </tr>
        <tr>
          <td>Tax</td>
          <td>$0.07</td>
        </tr>
        <tr>
          <td><strong>Total</strong></td>
          <td><strong>$1.07</strong></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="reserveRight span-12 last">
    <h1 class="bigLink">Click <g:link controller="rental" action="payment">Continue</g:link> to sign-in or create an account.</h1>
  </div>
</div>
</body>
</html>