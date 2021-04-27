package dao;

import model.Album;

import java.sql.SQLException;
import java.util.List;

public interface AlbumDao {
    void add(Album album) throws SQLException;

    List<Album> search(String query) throws SQLException;

    Album get(int id) throws SQLException;
}
