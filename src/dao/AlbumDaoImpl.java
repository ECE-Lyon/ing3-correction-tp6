package dao;

import model.Album;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlbumDaoImpl implements AlbumDao {
    private final Connection connection;

    public AlbumDaoImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void add(Album album) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO album (title, artist_name, release_year) VALUES (?, ?, ?)")) {
            // On ne set pas l'id, la base s'en occupe toute seule (autoincrement)
            preparedStatement.setString(1, album.getTitle());
            preparedStatement.setString(2, album.getArtistName());
            preparedStatement.setInt(3, album.getReleaseYear());
            preparedStatement.execute();
        }
    }

    @Override
    public List<Album> search(String query) throws SQLException {
        List<Album> results = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM album WHERE title LIKE ?")) {
            // Ajout des wildcards
            statement.setString(1, "%" + query + "%");

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    // Mapping du resultSet vers un objet Album
                    Album album = new Album();

                    album.setId(resultSet.getInt("id"));
                    album.setTitle(resultSet.getString("title"));
                    album.setArtistName(resultSet.getString("artist_name"));
                    album.setReleaseYear(resultSet.getInt("release_year"));

                    // Ajout à notre liste de résultats
                    results.add(album);
                }
            }
        }

        return results;
    }

    @Override
    public Album get(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM album WHERE id=?")) {
            // Ajout des wildcards
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                // Ici on pourrait vérifier le nombre de lignes récupérées
                // (devraient jamais être > 1 si on cherche par Id)
                if (resultSet.next()) {
                    // Mapping du resultSet vers un objet Album
                    Album album = new Album();

                    album.setId(resultSet.getInt("id"));
                    album.setTitle(resultSet.getString("title"));
                    album.setArtistName(resultSet.getString("artist_name"));
                    album.setReleaseYear(resultSet.getInt("release_year"));

                    return album;
                }
            }
        }

        // Retourne null si l'id n'existe pas en base
        return null;
    }
}
