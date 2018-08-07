/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class AuthFilter implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;
    private final List<String> user;
    private final List<String> admin;
    private final List<String> guest;

    public AuthFilter() {
        guest = new ArrayList<>();
        guest.add("cart.jsp");
        guest.add("addToCart");
        guest.add("addToCart.action");
        guest.add("getTourDetail");
        guest.add("getTourDetail.action");
        guest.add("404.jsp");
        guest.add("login.jsp");
        guest.add("login");
        guest.add("login.action");
        guest.add("register.jsp");
        guest.add("register");
        guest.add("register.action");
        guest.add("checkEmail");
        guest.add("searchTour");
        guest.add("searchTour.action");
        guest.add("viewTour.action");
        guest.add("viewTour");
        guest.add("checkout");
        guest.add("checkout.action");
        guest.add("loadImage");
        guest.add("checkPhone");
        guest.add("loadImage.action");
        guest.add("getLocation.action");
        guest.add("getLocation");
        guest.add("getImageList");
        guest.add("getImageList.action");
        guest.add("updateCart");
        guest.add("updateCart.action");
        guest.add("removeItem");
        guest.add("removeItem.action");
        guest.add("home");
        guest.add("home.action");
        guest.add("");
        user = new ArrayList<>();
        user.add("loadImage");
        user.add("loadImage.action");
        user.add("getLocation.action");
        user.add("getLocation");
        user.add("getImageList");
        user.add("getImageList.action");
        user.add("updateCart");
        user.add("updateCart.action");
        user.add("viewTour.action");
        user.add("viewTour");
        user.add("getTourDetail");
        user.add("getTourDetail.action");
        user.add("homepage.jsp");
        user.add("logout");
        user.add("404.jsp");
        user.add("home");
        user.add("home.action");
        user.add("checkout");
        user.add("checkout.action");
        user.add("getLocation.action");
        user.add("getLocation");
        user.add("logout.action");
        user.add("searchTour");
        user.add("searchTour.action");
        user.add("addToCart");
        user.add("addToCart.action");
        user.add("cart.jsp");
        user.add("profile.jsp");
        user.add("updateProfile");
        user.add("checkPassword");
        user.add("updatePassword");
        user.add("removeItem");
        user.add("removeItem.action");
        user.add("");
        admin = new ArrayList<>();
        admin.add("addTour");
        admin.add("addTour.action");
        admin.add("saveTour");
        admin.add("saveTour.action");
        admin.add("upload-image.jsp");
        admin.add("uploadImage.action");
        admin.add("uploadImage");
        admin.add("viewUser");
        admin.add("viewUser.action");
        admin.add("banUser.action");
        admin.add("banUser");
        admin.add("restoreUser");
        admin.add("restoreUser.action");
        admin.add("manageTour");
         admin.add("manageTour.action");
        admin.add("viewLoc.action");
        admin.add("viewLoc");
        admin.add("setDate");
        admin.add("setDate.action");
        admin.add("addDate.action");
        admin.add("addDate");
        admin.add("removeLocation.action");
        admin.add("newLocation");
        admin.add("newLocation.action");
        admin.add("addLocation");
        admin.add("updateLocation");
        admin.add("editTour.action");
        admin.add("editTour");
        admin.add("updateTour");
        admin.add("removeTour.action");
        admin.add("viewDay.action");
        admin.add("viewImage.action");
        admin.add("updateImage");
        admin.add("viewDay.action");
        admin.add("updateDesc");
        admin.add("removeDesc.action");
        admin.add("addDesc");
        admin.add("viewDate.action");
        admin.add("editTourDate.action");
        admin.add("removeTourDate.action");
        admin.add("updateDate");
        admin.add("addImage");
        admin.add("removeImage.action");
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        if (uri.endsWith(".jsp") || !uri.contains(".") || uri.contains("action")) {
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            HttpSession session = req.getSession(false);
         if (session == null || session.getAttribute("user") == null) {
                if (guest.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("404.jsp");
                }
            } else {
                User account = (User) session.getAttribute("user");
                if (account.getRole().equals("user") && user.contains(resource)) {
                    chain.doFilter(request, response);
                } else if (account.getRole().equals("admin")) {
                    if (admin.contains(resource) || user.contains(resource)) {
                        chain.doFilter(request, response);
                    }else{
                       res.sendRedirect("404.jsp");
                    }
                } else {
                    res.sendRedirect("404.jsp");
                }
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
