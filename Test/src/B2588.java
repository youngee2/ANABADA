import java.util.ArrayList;
import java.util.Scanner;

public class B2588 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int A = sc.nextInt();
		int B = sc.nextInt();
		sc.close();

		int outA = A * (B % 10);
		int outB = A * (B % 100 / 10);
		int outC = A * (B / 100);
		int outD = outA + (outB * 10) + (outC * 100);

		System.out.println(outA);
		System.out.println(outB);
		System.out.println(outC);
		System.out.println(outD);
	}
}