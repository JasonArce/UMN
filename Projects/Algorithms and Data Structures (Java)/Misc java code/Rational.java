public class Rational {

    private double numerator=0;
    private double denominator=0;

    public Rational(double a, double b){
        numerator = a;
        denominator = b;
    }
    public static void main (String[] args) {

        Rational r1, r2, r3, r4, r5, r6, r7, r8;
        double numerator, denominator;

        r1 = new Rational(0,0);
        r2 = new Rational(0,0);
        r3 = new Rational(0,0);
        r4 = new Rational(0,0);
        r5 = new Rational(0,0);
        r6 = new Rational(0,0);
        r7 = new Rational(0,0);
        r8 = new Rational(0,0);


        r1.setNumerator(1.0);
        r1.setDenominator(2.0);
        r2.setNumerator(1.0);
        r2.setDenominator(2.0);
        r3.setNumerator(1.0);
        r3.setDenominator(2.0);
        r4.setNumerator(1.0);
        r4.setDenominator(2.0);
        r5.setNumerator(1.0);
        r5.setDenominator(2.0);
        r6.setNumerator(1.0);
        r6.setDenominator(2.0);
        r7.setNumerator(1.0);
        r7.setDenominator(2.0);
        r8.setNumerator(1.0);
        r8.setDenominator(2.0);

        r1.mulRational(r2);
        r3.addRational(r4);
        r5.subRational(r6);
        r7.divRational(r8);

        numerator=r1.getNumerator();
        denominator=r1.getDenominator();

        System.out.println("Numerator: "+numerator+"Denominator: "+denominator);

        numerator=r3.getNumerator();
        denominator=r3.getDenominator();

        System.out.println("Numerator: "+numerator+"Denominator: "+denominator);

        numerator=r5.getNumerator();
        denominator=r5.getDenominator();

        System.out.println("Numerator: "+numerator+"Denominator: "+denominator);

        numerator=r7.getNumerator();
        denominator=r7.getDenominator();

        System.out.println("Numerator: "+numerator+"Denominator: "+denominator);



    }
    public void mulRational(Rational c){
        numerator=numerator*c.getNumerator();
        denominator=denominator*c.getDenominator();
    }
    public void addRational(Rational c){
        if(denominator==c.getDenominator()){
            numerator=numerator+c.getNumerator();
            denominator=denominator;
        }
        else{
            numerator=numerator*c.getDenominator()+c.getNumerator();
            denominator=denominator*c.getDenominator();
        }
    }
    public void subRational(Rational c){
        numerator = numerator-c.getNumerator();
        denominator = denominator-c.getDenominator();
    }
    public void divRational(Rational c){
        numerator = numerator/c.getNumerator();
        denominator = denominator/c.getDenominator();
    }
    public void setNumerator(double newNumerator){
        numerator=newNumerator;
    }
    public void setDenominator(double newDenominator) {
        denominator = newDenominator;
    }
    public double getNumerator(){
        return numerator;
    }
    public double getDenominator(){
        return denominator;
    }
}