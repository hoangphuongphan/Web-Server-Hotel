<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="./assets/icons/favicon.ico"/>

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->

        <link rel="stylesheet" type="text/css" href="./assets/css/login/main.css">


    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form method="post" class="login100-form validate-form" action="register">
                        <span class="login100-form-title p-b-26">
                            Welcome
                        </span>
                        <span class="login100-form-title p-b-48">
                            <i class="zmdi zmdi-font"></i>
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" type="text" name="username">
                            <span class="focus-input100" data-placeholder="Username"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                                <i class="zmdi zmdi-eye"></i>
                            </span>
                            <input class="input100" type="password" name="password">
                            <span class="focus-input100" data-placeholder="Password"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" type="text" name="fullName">
                            <span class="focus-input100" data-placeholder="Full Name"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" type="text" name="mail">
                            <span class="focus-input100" data-placeholder="Email"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" type="number" name="phone">
                            <span class="focus-input100" data-placeholder="Phone number"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                            <input class="input100" type="text" name="address">
                            <span class="focus-input100" data-placeholder="Address"></span>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">
                                    <input type="submit" value="Sign up" class="submit">
                                </button>
                            </div>
                        </div>

                        <div class="text-center p-t-115">
                            <span class="txt1">
                                have an account?
                            </span>

                            <a class="txt2" href="login">
                                Sign in
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>



    </body>
</html>
