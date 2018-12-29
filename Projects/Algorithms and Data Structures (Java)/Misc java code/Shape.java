public class Shape {
	public static void main(String[] args){
		System.out.println(RightTriangle.area() + " " +RightTriangle.perimeter());
}
		static Shape RightTriangle = new Shape(5, 5);
		private double base;
		private double height;
		public Shape(double initBase, double initHeight){
			this.base=initBase;
			this.height=initHeight;}
		public double area(){
			return(base+height);
}
		public double perimeter(){
			return base+base+height+height;
}
		public void setBase(double newBase){
			this.base=newBase;
}
		public void setHeight(double newHeight){
			this.height=newHeight;
}
		public double getBase(){
			return base;
}
		public double getHeight(){
			return height;
}}
