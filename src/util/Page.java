package util;

import java.util.List;
import java.util.Map;

/**
 * @author Redyc @version1.0
 */
public class Page {
    // 默认每页记录数
    public static final int           DEFAULT_PAGESIZE = 2;
    // 当前页码
    private int                       currentPage      = 0;
    // 每页记录数
    private int                       pageSize         = DEFAULT_PAGESIZE;
    // 总页面
    private int                       totalPages;
    // 总记录数
    private int                       totalRecords;
    // 是否有下一页
    private boolean                   hasNext;
    // 是否有上一页
    private boolean                   hasPrevious;
    // 上一页页码
    private int                       prevNum;
    // 下一页页码
    private int                       nextNum;

    // 记录封装
    private List<Map<String, String>> resultList;

    public List<Map<String, String>> getResultList() {
        return resultList;
    }

    public void setResultList(List<Map<String, String>> resultList) {
        this.resultList = resultList;
    }

    public Page() {
    }

    public Page(int pageNo, int pageSize) {
        setCurrentPage(pageNo);
        setPageSize(pageSize);
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public boolean isHasNext() {
        return hasNext;
    }

    public boolean isHasPrevious() {
        return hasPrevious;
    }

    public int getNextNum() {
        return nextNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getPrevNum() {
        return prevNum;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setHasNext(boolean hasNext) {
        this.hasNext = hasNext;
    }

    public void setHasPrevious(boolean hasPrevious) {
        this.hasPrevious = hasPrevious;
    }

    public void setNextNum(int nextNum) {
        this.nextNum = nextNum;
    }

    public void setPrevNum(int prevNum) {
        this.prevNum = prevNum;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public void initOtherData() {
        setTotalPages((totalRecords - 1) / pageSize + 1);
        setHasNext(totalPages > currentPage ? true : false);
        setHasPrevious(currentPage > 1 ? true : false);
        setNextNum(hasNext ? currentPage + 1 : totalPages);
        setPrevNum(hasPrevious ? currentPage - 1 : 1);

    }
}
