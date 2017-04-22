

package struts.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.UserService;
import util.Page;

/**
 * 名称：类的中文名称 <br>
 * 功能：对类的功能进行说明 <br/>
 * <br/>
 * 
 * @since JDK 1.7
 * @see
 * @author wang
 */
public class UserAction extends ActionSupport {
    /** serialVersionUID: 用一句话描述这个变量的作用 */
    private static final long         serialVersionUID = 1L;
    private String                    id;
    private String                    username;
    private String                    password;
    private String                    type;
    private List<Map<String, String>> resultList       = new ArrayList<Map<String, String>>();
    private Map<String, String>       resultMap        = new HashMap<String, String>();
    private UserService               userService      = new UserService();
    private int                       pageNo           = 1;
    private Page                      page             = new Page();
    private String                    result           = null;
    private String                    oper;

    public String list() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String No = request.getParameter("pageNo");
        if (!StringUtils.isEmptyOrWhitespaceOnly(No)) {
            pageNo = Integer.parseInt(No);
            System.out.println(pageNo);
        }
        page = userService.getAllUserInfo(pageNo);
        return "list";
    }

    public String toedit() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        id = request.getParameter("id");
        if (org.apache.commons.lang3.StringUtils.isNumeric(id)) {
            resultList = userService.query(id);
            resultMap = resultList.get(0);
            id = resultMap.get("id");
            username = resultMap.get("username");
            password = resultMap.get("password");
            type = resultMap.get("type");
            oper = "2";
        }
        else {
            oper = "1";
        }
        return "toedit";
    }

    public String toeditme() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        id = (String) session.get("id");
        if (org.apache.commons.lang3.StringUtils.isNumeric(id)) {
            resultList = userService.query(id);
            resultMap = resultList.get(0);
            id = resultMap.get("id");
            username = resultMap.get("username");
            password = resultMap.get("password");
            type = resultMap.get("type");
            oper = "3";
        }
        return "toedit";
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

    public String saveedit() throws NumberFormatException, Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        id = request.getParameter("id");
        if (!org.apache.commons.lang3.StringUtils.isNumeric(id)) {// 如果id不为数字或为空，则将其置为-1
            id = "-1";
        }
        username = request.getParameter("username");
        password = request.getParameter("password");
        type = request.getParameter("type");
        System.out.println(
            "id=" + id + "username= " + username + "password=" + password + "type=" + type);
        if (userService.saveOrUpdate(Integer.parseInt(id), username, password, type)) {
            page = userService.getAllUserInfo(pageNo);
            System.out.println("oper=" + oper);
            if ("3".equals(oper)) {
                System.out.println("修改自己信息完成，即将退出！");
                clearCookies();
                return "exit";
            }
            else {
                return SUCCESS;
            }
        }
        return ERROR;
    }

    public String delete() throws NumberFormatException, Exception {
        // HttpServletRequest request = ServletActionContext.getRequest();
        // id = request.getParameter("id");
        // System.out.println("id=" + id);
        if (null != id && "" != id) {
            userService.deltet(Integer.parseInt(id));
            result = "删除成功！";
            return SUCCESS;
        }
        result = "删除失败！";
        return SUCCESS;
    }

    /** @return 返回 id. */
    public String getId() {
        return id;
    }

    /**
     * @param id
     *            设置 id .
     */
    public void setId(String id) {
        this.id = id;
    }

    /** @return 返回 username. */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     *            设置 username .
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /** @return 返回 password. */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     *            设置 password .
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /** @return 返回 resultList. */
    public List<Map<String, String>> getResultList() {
        return resultList;
    }

    /**
     * @param resultList
     *            设置 resultList .
     */
    public void setResultList(List<Map<String, String>> resultList) {
        this.resultList = resultList;
    }

    /** @return 返回 userService. */
    public UserService getUserService() {
        return userService;
    }

    /**
     * @param userService
     *            设置 userService .
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /** @return 返回 pageNo. */
    public int getPageNo() {
        return pageNo;
    }

    /**
     * @param pageNo
     *            设置 pageNo .
     */
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
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

    /** @return 返回 result. */
    public String getResult() {
        return result;
    }

    /**
     * @param result
     *            设置 result .
     */
    public void setResult(String result) {
        this.result = result;
    }

    /** @return 返回 resultMap. */
    public Map<String, String> getResultMap() {
        return resultMap;
    }

    /**
     * @param resultMap
     *            设置 resultMap .
     */
    public void setResultMap(Map<String, String> resultMap) {
        this.resultMap = resultMap;
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

    /** @return 返回 oper. */
    public String getOper() {
        return oper;
    }

    /**
     * @param oper
     *            设置 oper .
     */
    public void setOper(String oper) {
        this.oper = oper;
    }

}
