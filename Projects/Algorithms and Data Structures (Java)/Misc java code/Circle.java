public class Circle{
	public static void main(String[] args){System.out.println(Circle.perimeter()+" "+Circle.area());}
	static Circle Circle = new Circle (5);
	private double radius;
	public Circle(double initRadius){
		this.radius=initRadius;}
	public double perimeter(){return 2*radius*3.14;}
	public double area(){return 3.14*(radius*radius);}
	public void setRadius(double newRadius){this.radius=newRadius;}
	public double getRadius() {return radius;}}

	