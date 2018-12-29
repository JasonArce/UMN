public class Matrix{

    static int[][]add(int[][]a,int[][]b){
        int count = 0;
        int x = 0;
        int y = 0;
        int count2 = 0;
        int dim1=a.length;
        int dim2=a[0].length;
        int[][] total = new int[dim1][dim2];
        while(count<a.length){
            while(count2<a[0].length){
            total[x][y]=a[x][y]+b[x][y];
            System.out.print(total[x][y]+" ");
            y++;
            count2++;
        }
        System.out.println("");
        x++;
        y=0;
        count2=0;
        count++;
    }
    return null;}

    static int[][]multiply(int[][]a,int[][]b) {
        if (a.length == b.length && a[0].length == b[0].length) {
            int count = 0;
            int x = 0;
            int y = 0;
            int count2 = 0;
            int dim1 = a.length;
            int dim2 = a[0].length;
            int[][] total = new int[dim1][dim2];
            while (count < a.length) {
                while (count2 < a[0].length) {
                    total[x][y] = a[x][y] * b[x][y];
                    System.out.print(total[x][y] + " ");
                    y++;
                    count2++;
                }
                System.out.println("");
                x++;
                y = 0;
                count2 = 0;
                count++;
            }
            return null;
        } else {
            System.out.println("Dimensions not equal");
            return null;
        }
    }

    static int[][] transpose(int[][]m) {
        int[][] result = new int[m.length][m[0].length];
        int count = 0;
        int x = 0;
        int y = 0;
        int x2 = 0;
        int y2 = 0;
        int count2 = 0;
        while (count < m.length) { //2
            while (count2 <= m.length) { //2
                result[y2][x2] = m[x][y];
                System.out.print(result[y2][x2] + " ");
                if (y == m.length || y==(m.length-1)) {
                    x++;
                    y=y-1;}
                else{
                y++;
                y++;}

                x2++;
                count2++;
            }
            System.out.println("");
            x=0;
            x2=0;
            y = 1;
            y2++;
            count2 = 0;
            count++;
        }            return null;
    }
    public static void main(String[] args){
        Matrix matrix = new Matrix();
        int[][] m = {{1, 2, 3}, {4, 5, 6}};
        int[][] n = {{1, 2, 3}, {4, 5, 6}};
        matrix.add(m,n);
        matrix.multiply(m,n);
      matrix.transpose(m);
    }
}