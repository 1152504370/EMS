

package struts.company;

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

import service.CompanyService;
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
public class CompanyAction extends ActionSupport {
    private Page                      page           = new Page();
    private int                       pageNo         = 1;
    private String                    comid;
    private String                    comname;
    private String                    comtype;
    private String                    telephone;
    private String                    info;
    private String                    address;
    private String                    modifytime;
    private List<Map<String, String>> resultList     = new ArrayList<Map<String, String>>();
    private CompanyService            companyService = new CompanyService();
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
        page = companyService.list(pageNo);
        return "list";
    }

    public String toedit() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        comid = request.getParameter("comid");
        if (org.apache.commons.lang3.StringUtils.isNumeric(comid)) {
            oper = "2";

            resultList = companyService.queryById(comid);
            if (resultList != null && resultList.size() > 0) {
                resultMap = resultList.get(0);
                comid = resultMap.get("comid");
                comname = resultMap.get("comname");
                comtype = resultMap.get("comtype");
                telephone = resultMap.get("telephone");
                info = resultMap.get("info");
                address = resultMap.get("address");

                System.out.println(resultList);
            }
        }
        else {
            oper = "1";
            System.out.println("开始添加");
        }

        return "toedit";

    }

    public String toeditme() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        comid = (String) session.get("comid");
        oper = "3";
        resultList = companyService.queryById(comid);
        if (resultList != null && resultList.size() > 0) {
            resultMap = resultList.get(0);
            comid = resultMap.get("comid");
            comname = resultMap.get("comname");
            comtype = resultMap.get("comtype");
            telephone = resultMap.get("telephone");
            info = resultMap.get("info");
            address = resultMap.get("address");

            System.out.println(resultList);
        }

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
                rs = companyService.insert(comname, comtype, address, telephone, info);
            }
            else {
                System.out.println("执行更新");
                rs = companyService.update(comid, comname, comtype, address, telephone, info);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        if (rs) {
            try {
                page = companyService.list(pageNo);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            return SUCCESS;
        }
        return ERROR;

    }

    public String delete() throws NumberFormatException, Exception {
        // HttpServletRequest request = ServletActionContext.getRequest();
        // id = request.getParameter("id");
        // System.out.println("id=" + id);
        if (null != comid && "" != comid) {
            boolean rs = companyService.deleteById(comid);
            if (rs) {
                result = "删除成功！";
                return SUCCESS;

            }
            else {
                result = "删除失败！";
                return SUCCESS;
            }
        }
        result = "要删除的公司id为空！";
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

    /** @return 返回 comtype. */
    public String getComtype() {
        return comtype;
    }

    /**
     * @param comtype
     *            设置 comtype .
     */
    public void setComtype(String comtype) {
        this.comtype = comtype;
    }

    /** @return 返回 telephone. */
    public String getTelephone() {
        return telephone;
    }

    /**
     * @param telephone
     *            设置 telephone .
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /** @return 返回 info. */
    public String getInfo() {
        return info;
    }

    /**
     * @param info
     *            设置 info .
     */
    public void setInfo(String info) {
        this.info = info;
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
