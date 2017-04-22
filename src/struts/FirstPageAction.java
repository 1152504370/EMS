package struts;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class FirstPageAction extends ActionSupport {
    private String info;
    private String needHandle;


    // 显示登录待处理任务
    public String show() throws Exception {
        return SUCCESS;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getNeedHandle() {
        return needHandle;
    }

    public void setNeedHandle(String needHandle) {
        this.needHandle = needHandle;
    }

}
