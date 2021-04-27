import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class FixDb {

    public static void main(String[] args) throws SQLException {
        // Corrige la base de données (met à jour l'année de sortie de l'album Toto IV)
        // Supprime la chanson Fake model.Track
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.21/tp6", "root", "root")) {
            try (Statement statement = connection.createStatement()) {
                int nbRowsModified = statement.executeUpdate("UPDATE album SET release_year = 1982 WHERE title = 'Toto IV'");
                System.out.println("Nombre de ligne(s) modifiée(s) " + nbRowsModified);
            }

            try (Statement statement = connection.createStatement()) {
                int nbRowsModified = statement.executeUpdate("DELETE FROM track WHERE title = 'Fake model.Track'");
                System.out.println("Nombre de ligne(s) modifiée(s) " + nbRowsModified);
            }
        }
    }
}
