
package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import util.DbUtil;
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
public class RecruitService {
    private DbUtil du = new DbUtil();

    public Page list(int pageNo) throws Exception {
        String sql = "select * from recruit order by recid";
        return du.executeQueryByPage(sql, pageNo, 15);
    }

    public Page listApply(int pageNo) throws Exception {
        String sql = "select * from jobapply order by id";
        return du.executeQueryByPage(sql, pageNo, 15);
    }


    public List<Map<String, String>> queryById(String recid) throws Exception {

        String sql = "select * from recruit where recid=" + recid;
        System.out.println(sql);
        return du.query(sql);
    }


    public boolean deleteById(String recid) throws SQLException {
        String sql = "delete from recruit where recid =" + recid;
        return du.update(sql);
    }

    public boolean update(String recid, String comname, String title, String type, String job,
        String salary, String email, String linkman, String detail) throws SQLException {
        String sql = "update recruit set  comname='" + comname + "',title='" + title + "',type='"
            + type + "',job='" + job + "',salary=" + salary + ",email='" + email + "',linkman='"
            + linkman + "',detail='" + detail + "' where recid=" + recid;
        System.out.println(sql);
        return du.update(sql);
    }

    public boolean insert(String comname, String title, String type, String job, String salary,
        String email, String linkman, String detail) throws SQLException {
        String sql = "insert into recruit(comname,title,type,job,salary,email,linkman,detail) values('"
            + comname + "','" + title + "','" + type + "','" + job + "'," + salary + ",'" + email
            + "','" + linkman + "','" + detail + "')";
        System.out.println(sql);
        return du.update(sql);
    }

    public boolean seekJob(String stuid, String recid) {
        StudentService studentService = new StudentService();
        boolean rs = false;
        try {
            Map<String, String> stuMap = studentService.queryById(stuid).get(0);
            String stuname = stuMap.get("realname");
            String stunum = stuMap.get("stunum");
            Map<String, String> recMap = queryById(recid).get(0);
            String comname = recMap.get("comname");
            String title = recMap.get("title");

            String sql = "insert into jobapply(stunum,recid,stuname,comname,title,status) values("
                + stunum + "," + recid + ",'" + stuname + "','" + comname + "','" + title
                + "','0')";
            System.out.println(sql);
            rs = du.update(sql);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public boolean dealApply(String appid, String status) {
        String sql = "update jobapply set status='" + status + "' where id=" + appid;
        System.out.println(sql);
        boolean rs = false;
        try {
            rs = du.update(sql);
            if (rs && "1".equals(status)) {
                String sql2 = "update student set status=1 where stunum in(select stunum from jobapply where id="
                    + appid + ")";
                rs = rs && du.update(sql2);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public Page queryByUserid(int pageNo, String userid) {
        String sql = "select * from jobapply where stunum in (select stunum from student where userid="
            + userid + ")";
        try {
            return du.executeQueryByPage(sql, pageNo, 15);
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
