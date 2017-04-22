
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
public class CompanyService {
    private DbUtil du = new DbUtil();

    public Page list(int pageNo) throws Exception {
        String sql = "select * from company order by comid";
        return du.executeQueryByPage(sql, pageNo, 15);
    }


    public List<Map<String, String>> queryById(String comid) throws Exception {

        String sql = "select * from company where comid=" + comid;
        System.out.println(sql);
        return du.query(sql);
    }


    public boolean deleteById(String comid) throws SQLException {
        String sql = "delete from student where userid =" + comid;
        return du.update(sql);
    }

    public boolean update(String comid, String comname, String comtype, String address,
        String telephone, String info) throws SQLException {
        String sql = "update company set  comname='" + comname + "',comtype='" + comtype
            + "',telephone='" + telephone + "',info='" + info + "',address='" + address
            + "' where comid=" + comid;
        System.out.println(sql);
        return du.update(sql);
    }

    public boolean insert(String comname, String comtype, String address, String telephone,
        String info) throws SQLException {
        String sql = "insert into company(comname,comtype,address,telephone,info) values('"
            + comname + "','" + comtype + "','" + address + "','" + telephone + "'','" + info
            + "')";
        System.out.println(sql);
        return du.update(sql);
    }
}
