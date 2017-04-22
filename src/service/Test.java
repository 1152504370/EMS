/**
 * 中国邮政新一代寄递平台 <br/>
 * <br/>
 * 子系统名: <br/>
 * 模 块 名: <br/>
 * 文件名称: Test.java <br/>
 * 创建日期: 2017年4月20日下午1:33:21 <br/>
 * 创 建 人: wang <br/>
 * 版权所有: 2017 中国邮政集团公司 保留所有权利 <br/>
 */

package service;

import org.apache.commons.lang3.StringUtils;

/**
 * 名称：类的中文名称 <br>
 * 功能：对类的功能进行说明 <br/>
 * <br/>
 * 
 * @since JDK 1.7
 * @see
 * @author wang
 */
public class Test {
    /**
     * <b>名称</b>：方法的中文名称 <br/>
     * <br/>
     * <b>说明</b>：说明方法的功能和使用要点 <br/>
     * <br/>
     *
     *
     * @see
     */

    private void mian() {

        while (true) {
            System.out.println("输入：");
            java.util.Scanner input = new java.util.Scanner(System.in);
            String s = input.nextLine();
            System.out.println(StringUtils.isNumeric(s));
        }
    }
}
