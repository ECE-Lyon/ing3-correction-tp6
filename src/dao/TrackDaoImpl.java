package dao;

import model.Track;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TrackDaoImpl implements TrackDao {
    private final Connection connection;

    public TrackDaoImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void add(Track track) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO track (id, id_album, title, duration) VALUES (?, ?, ?, ?)")) {
            // Pour les chansons, l'id n'est pas autogénéré, c'est à nous de le renseigner
            preparedStatement.setInt(1, track.getId());
            preparedStatement.setInt(2, track.getAlbum().getId());
            preparedStatement.setString(3, track.getTitle());
            preparedStatement.setInt(4, track.getDuration());
            preparedStatement.execute();
        }
    }

    @Override
    public List<Track> search(String query) throws SQLException {
        List<Track> results = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM track WHERE title LIKE ?")) {
            // Ajout des wildcards
            statement.setString(1, "%" + query + "%");

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    // Mapping du resultSet vers un objet Album
                    Track track = new Track();

                    track.setId(resultSet.getInt("id"));
                    track.setTitle(resultSet.getString("title"));
                    track.setDuration(resultSet.getInt("duration"));

                    // On récupère l'album en fonction de l'id qu'on a pour l'enregistrement
                    track.setAlbum(new AlbumDaoImpl(connection).get(resultSet.getInt("id_album")));

                    // Ajout à notre liste de résultats
                    results.add(track);
                }
            }
        }

        return results;
    }
}
