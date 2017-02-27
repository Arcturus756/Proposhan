<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.BufferedWriter" %>
<%@page import="java.io.FileWriter" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Scanner" %>
<%
/** Log POSTs at / to a file **/
if ("POST".equalsIgnoreCase(request.getMethod())) {
        BufferedWriter writer = new BufferedWriter(new FileWriter("/tmp/sample-app.log", true));
        Scanner scanner = new Scanner(request.getInputStream()).useDelimiter("\\A");
	if(scanner.hasNext()) {
		String reqBody = scanner.next();
		writer.write(String.format("%s Received message: %s.\n", (new Date()).toString(), reqBody));
	}
        writer.flush();
        writer.close();
	
} else {
  final boolean xrayEnabled = Boolean.valueOf(System.getProperty("XRAY_ENABLED"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Welcome</title>

		<link rel="stylesheet" href="css/one.css" />	
		<!link rel="stylesheet" href="css/skel-noscript.css" />
			<!link rel="stylesheet" href="css/style.css" />

</head>
<body id="sample">

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1758304841149545',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();   
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

<div class="oneColumn"><span>
        <h1>Proposhan</h1></span><span>
        Welcome to journey to Healthy Lifestyle!</span>
      </div>
  <div class="wrapper">
      

      <div class="twoColumn">
        <h2>Login</h2>
		<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div>
        <ul>
          
          <li><a href="http://aws.amazon.com/elasticbeanstalk/concepts/">Google</a></li>
          <li><a href="http://aws.amazon.com/elasticbeanstalk/deployment/">Fitbit</a></li>
          <li><a href="http://aws.amazon.com/elasticbeanstalk/environments/">Twitter</a></li>
        </ul>
        <h2>Profile</h2>
        <ul>
          <li><a href="http://aws.amazon.com/elasticbeanstalk/referenceapp/">Edit</a></li>
        </ul>
        <h2>Food Diary</h2>
        <ul>
          <li><a href="http://aws.amazon.com/elasticbeanstalk/eclipse/">Todays Stats</a></li>
          <li><a href="http://aws.amazon.com/elasticbeanstalk/eclipsesc/">This week</a></li>
          <li><a href="http://aws.amazon.com/elasticbeanstalk/docs/">Custom</a></li>
        </ul>
		
		</div>
		 <div class="threeColumn">
        <% if (xrayEnabled) { %>
          <h2>AWS X-Ray</h2>
          <p>AWS X-Ray helps developers analyze and debug distributed applications. With X-Ray, you can understand how your application and its underlying services are performing to identify and troubleshoot the root cause of performance issues and errors.</p>
          <p><a href="https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html">Learn More</a></p>
          <p>Choose <strong>Generate sample traffic</strong> to create data that you can view in the X-Ray console.</p>
          <a id="generateTrace" href="javascript: void(0);" onclick="doTrace();">Generate Sample Traffic</a>
          <br /><br />
          <a href="https://console.aws.amazon.com/xray/home" target="_blank">Open the AWS X-Ray Console</a>
        <% } %>
		<br /><br />
		
      </div>
	  
   <div class="threeColumn">
  
  <% if (xrayEnabled) { %>
    <script>
      function doTrace() {
        document.getElementById("generateTrace").textContent = "Generating Traffic...";
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.onreadystatechange = function() {
          if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
              document.getElementById("generateTrace").textContent = "Done! Click to generate more data";
            } else {
              // Non 200 ready status
              document.getElementById("generateTrace").textContent = "Issue communicating with backend. Click to try again.";
            }
          }
        }
        xmlHttp.open("GET", "/trace", true);
        xmlHttp.send(null);
      }
    </script>
  <% } %>
  </div>
  </div>
  <div style="float:right">
  <a href="http://www.freepik.com/free-vector/pattern-of-healthy-life-concept_812013.htm"><img src="image/freepik.png"/></a></div>
</body>
</html>
<% } %>
