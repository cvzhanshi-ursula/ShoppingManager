package cn.cvzhanshi.shop.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author cVzhanshi
 * @create 2021-05-18 10:24
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        //System.out.println("进入拦截器，url = " + url);
        Object user = request.getSession().getAttribute("user");
        if(user == null){
            //表示未登录
            System.out.println("未登录，url = " + url);
//            if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
//                //ajax请求
//                Map<String, String> ret = new HashMap<String, String>();
//                ret.put("type", "error");
//                ret.put("msg", "登录状态已失效，请重新去登录!");
//                response.getWriter().write(JSONObject.fromObject(ret).toString());
//                return false;
//            }
            response.sendRedirect(request.getContextPath() + "/system/login");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
