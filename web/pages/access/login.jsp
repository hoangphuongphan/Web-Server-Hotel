
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="/hotel/assets/icons/favicon.ico"/>
        <!--===============================================================================================-->

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/hotel/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/hotel/assests/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/hotel/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="/hotel/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel='stylesheet' type='text/css' href="/hotel/assets/css/login/main.css">

        <!--===============================================================================================-->

    </head>
    <body>


        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form method="post" class="login100-form validate-form" action="/hotel/login">
                        <span class="login100-form-title p-b-26">
                            Welcome
                        </span>
                        <span class="login100-form-title p-b-48">
                            <i class="zmdi zmdi-font"></i>
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" type="text" name="username"
                                   <c:choose>
                                       <c:when test="${not empty requestScope.usernameBeta}">
                                           value="<c:out value='${requestScope.usernameBeta}'/>"
                                       </c:when>
                                       <c:otherwise>
                                           value=""
                                       </c:otherwise>
                                   </c:choose>
                                   >
                            <span class="focus-input100" data-placeholder="Username"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                                <i class="zmdi zmdi-eye"></i>
                            </span>
                            <input class="input100" type="password" name="password">
                            <span class="focus-input100" data-placeholder="Password"></span>
                        </div>

                        <c:if test="${not empty errorMessage}">
                            <div style="color: red; text-align: center; font-size: 13px">
                                ${errorMessage}
                            </div>
                        </c:if>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">
                                    <input type="submit" value="Sign in" class="submit">
                                </button>
                            </div>
                        </div>

                        <div class="text-center p-t-115">
                            <span class="txt1">
                                Don’t have an account?
                            </span>

                            <a class="txt2" href="register">
                                Sign Up
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

    </body>
</html>
