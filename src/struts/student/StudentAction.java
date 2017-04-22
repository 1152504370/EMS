

package struts.student;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.StudentService;
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
public class StudentAction extends ActionSupport {
    private Page                      page           = new Page();
    private int                       pageNo         = 1;
    private String                    id;
    private String                    stunum;
    private String                    userid;
    private String                    realname;
    private String                    sex;
    private String                    age;
    private String                    major;
    private String                    email;
    private String                    grade;
    private String                    address;
    private String                    status;
    private String                    modifytime;
    private List<Map<String, String>> resultList     = new ArrayList<Map<String, String>>();
    private StudentService            studentService = new StudentService();
    private String                    oper;
    private String                    result;
    private Map<String, String>       resultMap      = new HashMap<String, String>();

    public String list() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String No = request.getParameter("pageNo");
        if (!StringUtils.isEmptyOrWhitespaceOnly(No)) {
            pageNo = Integer.parseInt(No);
            System.out.println(pageNo);
        }
        page = studentService.list(pageNo);
        return "list";
    }

    public String toedit() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        stunum = request.getParameter("stunum");
        if (org.apache.commons.lang3.StringUtils.isNumeric(stunum)) {
            oper = "2";

            resultList = studentService.queryByStuNum(stunum);
            resultMap = resultList.get(0);

            sex = resultMap.get("sex");
            major = resultMap.get("major");
            age = resultMap.get("age");
            grade = resultMap.get("grade");
            email = resultMap.get("email");
            address = resultMap.get("address");
            status = resultMap.get("status");
            userid = resultMap.get("userid");
            realname = resultMap.get("realname");

            System.out.println(resultList);
        }
        else {
            oper = "1";
            System.out.println("开始添加");
        }

        return "toedit";

    }

    public String toeditme() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        id = (String) session.get("id");
        oper = "3";
        resultList = studentService.queryById(id);
        resultMap = resultList.get(0);

        stunum = resultMap.get("stunum");
        sex = resultMap.get("sex");
        major = resultMap.get("major");
        age = resultMap.get("age");
        grade = resultMap.get("grade");
        email = resultMap.get("email");
        address = resultMap.get("address");
        status = resultMap.get("status");
        userid = resultMap.get("userid");
        realname = resultMap.get("realname");

        System.out.println(resultList);

        return "toedit";

    }

    public String saveedit() throws SQLException {
        HttpServletRequest request = ServletActionContext.getRequest();
        // oper = request.getParameter(oper);
        // stunum = request.getParameter(stunum);
        // realname = request.getParameter(realname);
        // sex = request.getParameter(sex);
        // age = request.getParameter(age);
        // grade = request.getParameter(grade);
        // major = request.getParameter(major);
        // email = request.getParameter(email);
        // address = request.getParameter(address);
        boolean rs = false;
        try {
            if ("1".equals(oper)) {
                System.out.println("执行插入");
                rs = studentService.insertStudent(stunum, realname, major, age, email, grade,
                    address);
            }
            else {
                System.out.println("执行更新");
                rs = studentService.updateStudent(stunum, realname, major, age, email, grade,
                    address);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        if (rs) {
            try {
                page = studentService.list(pageNo);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            if (oper == "3") {
                System.out.println("学生操作完成，返回首页");
                return "forback";
            }
            return SUCCESS;
        }
        return ERROR;

    }

    public String delete() throws NumberFormatException, Exception {
        // HttpServletRequest request = ServletActionContext.getRequest();
        // id = request.getParameter("id");
        // System.out.println("id=" + id);
        if (null != stunum && "" != stunum) {
            boolean rs = studentService.deleteByStuNum(stunum);
            if (rs) {
                result = "删除成功！";
                return SUCCESS;

            }
            else {
                result = "删除失败！";
                return SUCCESS;
            }
        }
        result = "要删除的学号为空！";
        return SUCCESS;
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


    /** @return 返回 realname. */
    public String getRealname() {
        return realname;
    }

    /**
     * @param realname
     *            设置 realname .
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }

    /** @return 返回 sex. */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex
     *            设置 sex .
     */
    public void setSex(String sex) {
        this.sex = sex;
    }


    /** @return 返回 major. */
    public String getMajor() {
        return major;
    }

    /**
     * @param major
     *            设置 major .
     */
    public void setMajor(String major) {
        this.major = major;
    }

    /** @return 返回 email. */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     *            设置 email .
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /** @return 返回 grade. */
    public String getGrade() {
        return grade;
    }

    /**
     * @param grade
     *            设置 grade .
     */
    public void setGrade(String grade) {
        this.grade = grade;
    }

    /** @return 返回 address. */
    public String getAddress() {
        return address;
    }

    /**
     * @param address
     *            设置 address .
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /** @return 返回 status. */
    public String getStatus() {
        return status;
    }

    /**
     * @param status
     *            设置 status .
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /** @return 返回 modifytime. */
    public String getModifytime() {
        return modifytime;
    }

    /**
     * @param modifytime
     *            设置 modifytime .
     */
    public void setModifytime(String modifytime) {
        this.modifytime = modifytime;
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


    /** @return 返回 age. */
    public String getAge() {
        return age;
    }

    /**
     * @param age
     *            设置 age .
     */
    public void setAge(String age) {
        this.age = age;
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

    /** @return 返回 stunum. */
    public String getStunum() {
        return stunum;
    }

    /**
     * @param stunum
     *            设置 stunum .
     */
    public void setStunum(String stunum) {
        this.stunum = stunum;
    }

    /** @return 返回 userid. */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid
     *            设置 userid .
     */
    public void setUserid(String userid) {
        this.userid = userid;
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

}
