

package struts.recruit;

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

import service.RecruitService;
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
public class RecruitAction extends ActionSupport {
    private Page                      page           = new Page();
    private int                       pageNo         = 1;
    private String                    recid;
    private String                    appid;
    private String                    comname;
    private String                    stunum;
    private String                    comid;
    private String                    time;
    private String                    title;
    private String                    type;
    private String                    job;
    private String                    salary;
    private String                    email;
    private String                    linkman;
    private String                    detail;
    private String                    userid;
    private String                    status;
    private List<Map<String, String>> resultList     = new ArrayList<Map<String, String>>();
    private RecruitService            recruitService = new RecruitService();
    private String                    oper;
    private String                    result;
    private Map<String, String>       resultMap      = new HashMap<String, String>();

    public String list() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String No = request.getParameter("pageNo");
        if (!StringUtils.isEmptyOrWhitespaceOnly(No)) {
            pageNo = Integer.parseInt(No);
        }
        page = recruitService.list(pageNo);
        return "list";
    }

    public String listapply() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String No = request.getParameter("pageNo");
        if (!StringUtils.isEmptyOrWhitespaceOnly(No)) {
            pageNo = Integer.parseInt(No);
        }
        page = recruitService.listApply(pageNo);
        return "list";
    }

    public String listMy() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        userid = (String) session.get("id");
        HttpServletRequest request = ServletActionContext.getRequest();
        String No = request.getParameter("pageNo");
        if (!StringUtils.isEmptyOrWhitespaceOnly(No)) {
            pageNo = Integer.parseInt(No);
        }
        page = recruitService.queryByUserid(pageNo, userid);
        return "list";
    }

    public String toedit() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        recid = request.getParameter("recid");
        if (org.apache.commons.lang3.StringUtils.isNumeric(recid)) {
            oper = "2";

            resultList = recruitService.queryById(recid);
            if (resultList != null && resultList.size() > 0) {
                resultMap = resultList.get(0);
                comid = resultMap.get("comid");
                comname = resultMap.get("comname");
                title = resultMap.get("title");
                type = resultMap.get("type");
                job = resultMap.get("job");
                salary = resultMap.get("salary");
                email = resultMap.get("email");
                linkman = resultMap.get("linkman");
                detail = resultMap.get("detail");

            }
        }
        else {
            oper = "1";
        }

        return "toedit";

    }


    public String saveedit() throws SQLException {
        boolean rs = false;
        try {
            if ("1".equals(oper)) {
                rs = recruitService.insert(comname, title, type, job, salary, email, linkman,
                    detail.trim());
            }
            else {
                rs = recruitService.update(recid, comname, title, type, job, salary, email, linkman,
                    detail.trim());
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        if (rs) {
            try {
                page = recruitService.list(pageNo);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            return SUCCESS;
        }
        return ERROR;

    }

    public String delete() throws NumberFormatException, Exception {
        if (null != recid && "" != recid) {
            boolean rs = recruitService.deleteById(comid);
            if (rs) {
                result = "删除成功！";
                return SUCCESS;

            }
            else {
                result = "删除失败！";
                return SUCCESS;
            }
        }
        result = "要删除的招聘id为空！";
        return SUCCESS;
    }

    public String seekJob() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        userid = (String) session.get("id");
        if (null != userid && !userid.isEmpty()) {
            if (null != recid && "" != recid) {
                boolean rs = recruitService.seekJob(userid, recid);
                if (rs) {
                    result = "求职成功！";
                    return SUCCESS;
                }
                else {
                    result = "求职失败！";
                    return SUCCESS;
                }
            }
            result = "要应聘的的职位不存在！";
        }
        else {
            result = "您的登录状态异常无法求职，请退出系统重新登录！";
            return SUCCESS;
        }
        return SUCCESS;
    }

    public String dealApply() {
        HttpServletRequest request = ServletActionContext.getRequest();
        appid = request.getParameter("appid");
        status = request.getParameter("status");
        System.out.println("appid=" + appid);
        System.out.println("status=" + status);
        if (null != appid && "" != appid) {
            boolean rs = recruitService.dealApply(appid, status);
            if (rs) {
                result = "操作成功！";
                return SUCCESS;
            }
            else {
                result = "操作失败！";
                return SUCCESS;
            }
        }
        else {
            result = "要处理的求职申请id为空！";
        }
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

    /** @return 返回 recid. */
    public String getRecid() {
        return recid;
    }

    /**
     * @param recid
     *            设置 recid .
     */
    public void setRecid(String recid) {
        this.recid = recid;
    }

    /** @return 返回 comname. */
    public String getComname() {
        return comname;
    }

    /**
     * @param comname
     *            设置 comname .
     */
    public void setComname(String comname) {
        this.comname = comname;
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

    /** @return 返回 comid. */
    public String getComid() {
        return comid;
    }

    /**
     * @param comid
     *            设置 comid .
     */
    public void setComid(String comid) {
        this.comid = comid;
    }

    /** @return 返回 time. */
    public String getTime() {
        return time;
    }

    /**
     * @param time
     *            设置 time .
     */
    public void setTime(String time) {
        this.time = time;
    }

    /** @return 返回 title. */
    public String getTitle() {
        return title;
    }

    /**
     * @param title
     *            设置 title .
     */
    public void setTitle(String title) {
        this.title = title;
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

    /** @return 返回 job. */
    public String getJob() {
        return job;
    }

    /**
     * @param job
     *            设置 job .
     */
    public void setJob(String job) {
        this.job = job;
    }

    /** @return 返回 salary. */
    public String getSalary() {
        return salary;
    }

    /**
     * @param salary
     *            设置 salary .
     */
    public void setSalary(String salary) {
        this.salary = salary;
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

    /** @return 返回 linkman. */
    public String getLinkman() {
        return linkman;
    }

    /**
     * @param linkman
     *            设置 linkman .
     */
    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    /** @return 返回 detail. */
    public String getDetail() {
        return detail;
    }

    /**
     * @param detail
     *            设置 detail .
     */
    public void setDetail(String detail) {
        this.detail = detail;
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


}
