package com.xtk.shop.model;

public class SystemContext {
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageIndex = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();
	//�������ǽ���
	private static ThreadLocal<String> order = new ThreadLocal<String>();
	//�����ĸ��ֶ�������
	private static ThreadLocal<String> sort = new ThreadLocal<String>();
	
	public static int getPageSize() {
		return pageSize.get();
	}
	public static void setPageSize(int _pageSize) {
		pageSize.set(_pageSize);
	}
	public static int getPageIndex() {
		return pageIndex.get();
	}
	public static void setPageIndex(int _pageIndex) {
		pageIndex.set(_pageIndex);
	}
	public static int getPageOffset() {
		return pageOffset.get();
	}
	public static void setPageOffset(int _pageOffset) {
		pageOffset.set(_pageOffset);
	}
	public static String getOrder() {
		return order.get();
	}
	public static void setOrder(String _order) {
		order.set(_order);
	}
	public static String getSort() {
		return sort.get();
	}
	public static void setSort(String _sort) {
		sort.set(_sort);
	}
	public static void removeOrder(){
		order.remove();
	}
	public static void removeSort(){
		sort.remove();
	}
	public static void removePageSize(){
		pageSize.remove();
	}
	public static void removePageIndex(){
		pageIndex.remove();
	}
	public static void removePageOffset(){
		pageOffset.remove();
	}
}
