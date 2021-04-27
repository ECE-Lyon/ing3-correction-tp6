import dao.AlbumDao;
import dao.AlbumDaoImpl;
import dao.TrackDao;
import dao.TrackDaoImpl;
import model.Album;
import model.Track;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class DaoTest {
    public static void main(String[] args) throws SQLException {
        try (Connection connection = DriverManager.getConnection("jdbc:h2:./default")) {
            AlbumDao albumDao = new AlbumDaoImpl(connection);

            Album newAlbum = new Album();
            newAlbum.setTitle("The Evol'");
            newAlbum.setArtistName("Shaka Ponk");
            newAlbum.setReleaseYear(2017);

            // Sauvegarde d'un nouvel album dans la BDD
            albumDao.add(newAlbum);

            // Recherche de cette album
            List<Album> albums = albumDao.search("The Evol'");
            for (Album album : albums) {
                System.out.println(album.getTitle());
                // On peut voir que l'album a maintenant un id
                System.out.println(album.getId());
            }

            // On va maintenant ajouter une chanson à cette album
            TrackDao trackDao = new TrackDaoImpl(connection);

            Track newTrack = new Track();
            // Première chanson de l'album
            newTrack.setId(1);
            // On lui assigne le premier album de notre résultat
            newTrack.setAlbum(albums.get(0));
            newTrack.setTitle("Gung Ho");
            newTrack.setDuration(306);

            // Sauvegarde de la chanson
            trackDao.add(newTrack);

            // On recherche la chanson et on l'affiche
            List<Track> tracks = trackDao.search("Gung");
            for (Track track : tracks) {
                System.out.println(track);
            }
        }
    }
}
