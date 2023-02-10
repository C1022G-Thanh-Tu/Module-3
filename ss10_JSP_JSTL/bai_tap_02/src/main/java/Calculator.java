public class Calculator {
    public static double calculate(double n1, double n2, String operator) {
        switch (operator) {
            case "+":
                return n1 + n2;
            case "-":
                return n1-n2;
            case "*":
                return n1*n2;
            case "/":
                if (n2 == 0) {
                    throw new ArithmeticException();
                } else {
                    return n1 / n2;
                }
            default:
                return 0;
        }
    }
}
