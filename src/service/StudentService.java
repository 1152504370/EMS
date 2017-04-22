
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
public class StudentService {
    private DbUtil du = new DbUtil();

    public Page list(int pageNo) throws Exception {
        String sql = "select * from student order by stunum";
        return du.executeQueryByPage(sql, pageNo, 15);
    }

    public List<Map<String, String>> queryByStuNum(String stunum) throws Exception {

        String sql = "select * from student where stunum=" + stunum;
        System.out.println(sql);
        return du.query(sql);
    }

    public List<Map<String, String>> queryById(String id) throws Exception {

        String sql = "select * from student where userid=" + id;
        System.out.println(sql);
        return du.query(sql);
    }

    public boolean deleteByStuNum(String stunum) throws SQLException {
        String sql = "delete from student where stunum=" + stunum;

        return du.update(sql);
    }

    public boolean deleteByUserId(String userid) throws SQLException {
        String sql = "delete from student where userid =" + userid;
        return du.update(sql);
    }

    public boolean updateStudent(String stunum, String realname, String major, String age,
        String email, String grade, String address) throws SQLException {
        String sql = "update student set stunum=" + stunum + ",realname='" + realname + "',major='"
            + major + "',age=" + age + ",email='" + email + "',grade='" + grade + "',address='"
            + address + "' where stunum=" + stunum;
        System.out.println(sql);
        return du.update(sql);
    }

    public boolean insertStudent(String stunum, String realname, String major, String age,
        String email, String grade, String address) throws SQLException {
        String sql = "insert into student(stunum,realname,major,age,email,grade,address) values("
            + stunum + ",'" + realname + "','" + major + "'," + age + ",'" + email + "'','" + grade
            + "','" + address + "')";
        System.out.println(sql);
        return du.update(sql);
    }
}
