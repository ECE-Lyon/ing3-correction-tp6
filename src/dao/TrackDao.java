package dao;

import model.Track;

import java.sql.SQLException;
import java.util.List;

public interface TrackDao {
    void add(Track track) throws SQLException;

    List<Track> search(String query) throws SQLException;
}
