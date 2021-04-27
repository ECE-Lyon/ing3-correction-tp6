import java.sql.*;
import java.util.Scanner;

public class SearchJDBC {
    public static void main(String[] args) throws SQLException {
        System.out.println("Entrez un terme de recherche");
        Scanner scanner = new Scanner(System.in);
        // On ajout des wildcards (%) pour chercher de manière floue
        String search = "%" + scanner.nextLine() + "%";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:./default")) {
            try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM track WHERE title LIKE ?")) {
                statement.setString(1, search);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        System.out.println(resultSet.getString("title"));
                    }
                }
            }
        }
    }
}
