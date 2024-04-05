/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Auth;

/**
 *
 * @author Admin
 */
public class AuthDAO extends SQLServerConnect {

    public AuthDAO() {

    }

    public String getValueCookie(HttpServletRequest request, HttpServletResponse response, String key) {

        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }

        for (Cookie cookie : cookies) {
            // Check if the current cookie is the one you want
            if (key.equals(cookie.getName())) {
                // Get the value of the cookie
                return cookie.getValue();
            }
        }

        return null;
    }

    public Auth getInforAuth(HttpServletRequest request, HttpServletResponse response) {
        Auth auth = new Auth();

        Cookie[] cookies = request.getCookies();

        if (cookies == null) {
            return null;
        }

        for (Cookie cookie : cookies) {

            if ("user_id".equals(cookie.getName())) {
                auth.setUserId(cookie.getValue());

            }
            if ("role".equals(cookie.getName())) {
                auth.setRole(cookie.getValue());

            }
            if ("isLogin".equals(cookie.getName())) {
                auth.setIsLogin(cookie.getValue());

            }
        }

        return auth;

    }

    public boolean authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Auth auth = getInforAuth(request, response);
        System.out.println(auth);
        if (auth.getIsLogin() == null || auth.getIsLogin() == null || "false".equals(auth.getIsLogin()) || auth.getUserId() == null) {
            return false;
        }

        return true;
    }
}
