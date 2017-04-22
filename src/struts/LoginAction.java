package struts;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.LoginService;
import util.Page;

public class LoginAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private String            username;
    private String            password;
    private String            user_level;
    private String            errorcontent;                         // ��������
    private String            type;                                 // ��������
    private Page              page             = new Page();
    private int               pageNo           = 1;
    LoginService              loginservice     = new LoginService();

    public String login() throws Exception {

        Map<String, Object> session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        username = request.getParameter("username");
        password = request.getParameter("password");
        System.out.println(username);
        if (username == null) {
            System.out.println("username == null");
            return LOGIN;
        }
        List<Map<String, String>> result = loginservice.getUserInfo(getUsername());

        if (result.size() < 1) {
            setErrorcontent("用户不存在！");
            // System.out.println("�˺Ż������д�111");
            return LOGIN;
        }

        if (!getPassword().equals(result.get(0).get("password"))) {
            clearCookies();
            setErrorcontent("密码错误！");
            // System.out.println(getPassword() + "�˺Ż������д�password"
            // + result.get(0).get("password"));
            return LOGIN;
        }
        type = result.get(0).get("type");
        session.put("id", result.get(0).get("id"));
        session.put("username", result.get(0).get("username"));
        session.put("user_level", result.get(0).get("user_level"));
        session.put("name", result.get(0).get("name"));
        session.put("type", result.get(0).get("type"));
        String ip = org.apache.struts2.ServletActionContext.getRequest().getRemoteAddr();
        System.out.println("ip:" + ip);
        session.put("ip", ip);

        HttpServletResponse response = ServletActionContext.getResponse();

        // 创建cookie

        String username = result.get(0).get("username").toString();
        @SuppressWarnings("deprecation")
        Cookie loginCookie = new Cookie("adminlogin", URLEncoder.encode(username));
        loginCookie.setMaxAge(60 * 60 * 24 * 30);
        response.addCookie(loginCookie);

        // MenuService menuservice = new MenuService(); // 获取菜单
        // List<Map<String, String>> mainMenu = menuservice.getMasterMenu();
        // session.put("mainMenu", mainMenu);

        // System.out.println("mainMenu:" + mainMenu);

        setErrorcontent("");
        return SUCCESS;
    }


    public String exit() throws Exception {
        clearCookies();
        return "exit";
    }

    private void clearCookies() {

        Map<String, Object> session = ActionContext.getContext().getSession();
        session.remove("username");
        session.remove("user_level");
        session.remove("mainMenu");

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", -10);

        clearCookie(ServletActionContext.getRequest(), ServletActionContext.getResponse());

    }

    public void clearCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        try {
            for (int i = 0; i < cookies.length; i++) {
                // System.out.println(cookies[i].getName() + ":" +
                // cookies[i].getValue());
                Cookie cookie = new Cookie(cookies[i].getName(), null);
                cookie.setMaxAge(0);
                // cookie.setPath(path);//�����㴴��cookie��·��������д
                response.addCookie(cookie);
            }
        }
        catch (Exception ex) {
            System.out.println("清除cookie异常");
        }

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        password = password;
    }

    public String getUser_level() {
        return user_level;
    }

    public void setUser_level(String user_level) {
        user_level = user_level;
    }

    public String getErrorcontent() {
        return errorcontent;
    }

    public void setErrorcontent(String errorcontent) {
        errorcontent = errorcontent;
    }

    /** @return 返回 page. */
    public Page getPage() {
        return page;
    }

    /**
     * @param page
     *            设置 page .
     */
    public void setPage(Page page) {
        this.page = page;
    }

    /** @return 返回 loginservice. */
    public LoginService getLoginservice() {
        return loginservice;
    }

    /**
     * @param loginservice
     *            设置 loginservice .
     */
    public void setLoginservice(LoginService loginservice) {
        this.loginservice = loginservice;
    }

    /** @return 返回 type. */
    public String getType() {
        return type;
    }

    /**
     * @param type
     *            设置 type .
     */
    public void setType(String type) {
        this.type = type;
    }

}
