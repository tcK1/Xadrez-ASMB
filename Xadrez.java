import java.util.Random;

class Xadrez {

    public static int count (String[][] board) {
        int count = 0;
        for (int row = 0; row < board.length; row++) {
            for (int col = 0; col < board[row].length; col++) {
                switch (board[row][col]) {
                    case "peão":    count = count + 1; break;
                    case "cavalo":  count = count + 3; break;
                    case "bispo":   count = count + 3; break;
                    case "torre":   count = count + 5; break;
                    case "rainha":  count = count + 10;break;
                    case "rei":     count = count + 50;break;
                    case "":        break;
                    default: return (-1);
                }
            }
        }
	   return (count);
    }

    public static void main (String[] args) {
        String[] pecas = {  "peão",
                            "cavalo",
                            "bispo",
                            "torre",
                            "rainha",
                            "rei",
                            ""
                        };
        String[][] board = new String[8][8];     
    
        for (int row = 0; row < board.length; row++) {
            for (int col = 0; col < board[row].length; col++) {
                Random generator = new Random();
                int randomIndex = generator.nextInt(pecas.length);
                board[row][col] = pecas[randomIndex];
                //System.out.println(board[row][col] + ", ");
            }
        }
        int total = count(board);
        System.out.println(total);
    }
}