

package struts;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 名称：类的中文名称 <br>
 * 功能：对类的功能进行说明 <br/>
 * <br/>
 * 
 * @since JDK 1.7
 * @see
 * @author wang
 */
public class AboutSystemAction extends ActionSupport {
    /** serialVersionUID: 用一句话描述这个变量的作用 */
    private static final long serialVersionUID = 1L;

    public String show() {
        return SUCCESS;
    }
}
