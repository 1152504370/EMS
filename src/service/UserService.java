

package service;

import java.util.ArrayList;
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
public class UserService {
    private DbUtil du = new DbUtil();

    public List<Map<String, String>> query(String id) throws Exception {
        String sql = "select * from user where id=" + id;
        List<Map<String, String>> rsList = new ArrayList<Map<String, String>>();
        rsList = du.query(sql);
        return rsList;
    }

    public Page getAllUserInfo(int pageNo) throws Exception {
        String sql = "select * from user order by id";
        return du.executeQueryByPage(sql, pageNo, 15);
    }

    public boolean deltet(int id) throws Exception {
        String sql = "delete from user where id=" + id;
        return du.update(sql);
    }

    public boolean saveOrUpdate(int id, String username, String password, String type)
        throws Exception {
        String sql1 = "select count(*) from user where id=" + id;
        if (du.queryInt(sql1) == 0) {
            System.out.println("开始插入");
            String sql2 = "insert into user(username,password,type) values('" + username + "','"
                + password + "','" + type + "')";
            if (du.update(sql2)) {
                return true;
            }
        }
        else {
            System.out.println("开始更新");
            String sql3 = "update user set username='" + username + "',password='" + password
                + "',type='" + type + "' where id=" + id;
            System.out.println(sql3);
            if (du.update(sql3)) {
                return true;
            }
        }
        return false;
    }
}
