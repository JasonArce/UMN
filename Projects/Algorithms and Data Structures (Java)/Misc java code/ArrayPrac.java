public class ArrayPrac {
    public static void main(String[] args) {
        int i = 1111;
        int[] a = new int[1111];
        for (int z = 0; z<a.length; z++){
            a[i] = a.length - z;
        }
      //  int q = 0;
        //while (q < a.length) {
          //  a[q] = a.length - q;
            //q++;
        }
        System.out.println(a[i]);
    }
