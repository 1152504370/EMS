package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.DbUtil;

public class LoginService {
    DbUtil du = new DbUtil();

    public List<Map<String, String>> getUserInfo(String username) throws Exception {
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        String sql = "select * from user where username='" + username + "'";
        result = du.query(sql);
        System.out.println(result);
        return result;
    }


}
