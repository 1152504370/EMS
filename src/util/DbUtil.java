package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbUtil {

    /**
     * �޷�ҳ��ѯ
     * 
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    public List<Map<String, String>> query(String sql) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        conn = getConnection();
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            // 遍历查询返回结果集
            while (rs.next()) {
                ResultSetMetaData meta = rs.getMetaData();
                Map<String, String> coloum = new HashMap<String, String>();
                // 根据返回的列数将数据放入list中
                for (int i = 1; i <= meta.getColumnCount(); i++) {
                    coloum.put(meta.getColumnName(i), rs.getString(i));// 由列名获取对象
                }
                result.add(coloum);
            }
        }
        finally {
            closeQuietly(conn, ps, rs);
        }
        return result;
    }

    public int queryInt(String sql) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        conn = getConnection();
        int rsInt = 0;

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                rsInt = rs.getInt(1);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return rsInt;
    }


    /**
     * ��ҳ��ѯ
     * 
     * @param key
     * @param sql
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    public Page executeQueryByPage(String sql, int pageNo, int pageSize) throws Exception {
        System.out.println(pageNo);
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        conn = getConnection();
        Page page = new Page(pageNo, pageSize);
        StringBuffer countSql = new StringBuffer();
        countSql.append("select count(*) as recordcount from ( ");
        countSql.append(sql);
        countSql.append(" ) tempTable");
        // 根据pageN和pageSize得到rownum的起始值和结束值
        int rownum_start = (pageNo - 1) * pageSize;
        int rownum_end = pageNo * pageSize;
        System.out.println("rownum_start" + rownum_start + "rownum_end" + rownum_end);
        StringBuffer searchSql = new StringBuffer();
        // 拼接sql语句 实现分页功能
        searchSql.append(sql + " limit " + rownum_start + "," + pageSize);
        System.out.println("sql语句:" + searchSql.toString());

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(countSql.toString());

            if (rs.next()) {
                page.setTotalRecords(rs.getInt("recordcount"));
            }
            if (rs.getInt("recordcount") == 0) {
                List<Map<String, String>> result = new ArrayList<Map<String, String>>();
                page.setResultList(result);
                page.initOtherData();
                return page;
            }
            rs = stmt.executeQuery(searchSql.toString());
            List<Map<String, String>> result = new ArrayList<Map<String, String>>();
            while (rs.next()) {
                ResultSetMetaData meta = rs.getMetaData();
                Map<String, String> coloum = new HashMap<String, String>();
                for (int i = 1; i <= meta.getColumnCount(); i++) {
                    coloum.put(meta.getColumnName(i).toUpperCase(),
                        rs.getString(i) == null ? "" : rs.getString(i));
                }
                result.add(coloum);
            }
            System.out.println("result:" + result);
            page.setResultList(result);
            page.initOtherData();
        }
        finally {
            closeQuietly(conn, stmt, rs);
        }
        return page;
    }

    /**
     * ʹ�����������sql���
     * 
     * @param sql
     * @return
     * @throws SQLException
     */
    public boolean executeUpdate(List<String> sql) throws SQLException {
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
            for (int i = 0; i < sql.size(); i++) {
                stmt.executeUpdate(sql.get(i));
            }
            conn.commit();
            return true;
        }
        catch (SQLException e) {
            if (conn != null)
                conn.rollback();
            throw e;
        }
        finally {
            closeQuietly(conn, stmt, null);
        }

    }

    /**
     * ���ӡ�ɾ��������
     * 
     * @param sql
     * @return
     * @throws SQLException
     */
    public Boolean update(String sql) throws SQLException {
        Connection conn = null;
        Statement stmt = null;
        conn = getConnection();
        try {
            stmt = conn.createStatement();
            return stmt.executeUpdate(sql) > 0;
        }
        finally {
            closeQuietly(conn, stmt, null);
        }
    }

    /**
     * ���ݿ�����
     * 
     * @return
     * @throws SQLException
     */
    private static Connection getConnection() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/ems?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String password = "root";
        Connection conn = null;
        try {
            Class.forName(driver);

            conn = DriverManager.getConnection(url, username, password);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void close(Connection conn) throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    public static void close(ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
    }

    public static void close(Statement stmt) throws SQLException {
        if (stmt != null) {
            stmt.close();
        }
    }

    public static void close(PreparedStatement ps) throws SQLException {
        if (ps != null) {
            ps.close();
        }
    }

    public static void closeQuietly(ResultSet rs) {
        if (rs == null)
            return;

        try {
            close(rs);
        }
        catch (SQLException e) { // NOPMD
            // quiet
        }
    }

    public static void closeQuietly(Statement stmt) {
        if (stmt == null)
            return;

        try {
            close(stmt);
        }
        catch (SQLException e) { // NOPMD
            // quiet
        }
    }

    public static void closeQuietly(PreparedStatement ps) {
        if (ps == null)
            return;

        try {
            close(ps);
        }
        catch (SQLException e) { // NOPMD
            // quiet
        }
    }

    public static void closeQuietly(Connection conn) {
        if (conn == null)
            return;

        try {
            close(conn);
        }
        catch (SQLException e) { // NOPMD
            // quiet
        }
    }

    public static void closeQuietly(Connection conn, Statement stmt, ResultSet rs) {

        try {
            closeQuietly(rs);
        }
        finally {
            try {
                closeQuietly(stmt);
            }
            finally {
                closeQuietly(conn);
            }
        }

    }

    public static void closeQuietly(Connection conn, PreparedStatement ps, ResultSet rs) {

        try {
            closeQuietly(rs);
        }
        finally {
            try {
                closeQuietly(ps);
            }
            finally {
                closeQuietly(conn);
            }
        }

    }

}
