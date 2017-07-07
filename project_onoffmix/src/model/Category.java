package model;

public class Category {
	
	private int category_num;
	private String category_name;
	
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	@Override
	public String toString() {
		return "Category [category_num=" + category_num + ", category_name=" + category_name + "]";
	} 
	
	

}
