public class Rectangle {
	public static void main(String[] args){System.out.println(Rectangle.area()+" "+Rectangle.perimeter());}
		static Rectangle Rectangle = new Rectangle(5, 5);
		private double length;
		private double width;
		public Rectangle(double initLength, double initWidth) {
			this.length = initLength;
			this.width = initWidth;}
		public double area() {return length * width;}
		public double perimeter() {return length + length + width + width;}
		public void setLength(double newLength) {this.length = newLength;}
		public void setWidth(double newWidth) {this.width = newWidth;}
		public double getLength() {return length;}
		public double getWidth() {return width;}}
