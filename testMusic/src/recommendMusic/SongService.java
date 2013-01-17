package recommendMusic;
import java.util.List;


public class SongService {
	/**
	 * Song ����� �޾Ƽ� DB�� ����
	 * @param songList
	 */
	public void insertSongList(List<Song> songList){

		DBconnector connector = new DBconnector();
		
		// �뷡 ��Ϻ��� �Է� ����
		for(Song song : songList){
			
			// �뷡 �⺻���� �Է�
			String sql = String.format(
					" INSERT" +
					"   INTO SONG" +
					"		 (SONGID, SONGNAME, DATE)" +
					" VALUES ('%d', '%s', '%s')"
					, song.getSongid()
					, song.getSongname()
					, song.getDate()
				);
				connector.excute(sql);
			
			// �뷡 ��Ÿ�� ���� �Է�(��Ÿ���� �ټ��⶧��)
			List<String> styleList = song.getStyleList();
			if(styleList != null){
				for (String style : styleList) {
					sql = String.format(
							" INSERT" +
							" INTO   SONGSTYLE" +
							"		 (SONGID, STYLE)" +
							" VALUES (\"%d\", \"%s\")"
							, song.getSongid()
							, style
						);
					connector.excute(sql);
				}
			}
			
			List<String> genreList = song.getGenreList();
			if(genreList != null){
				for (String genre : genreList) {
					sql = String.format(
							" INSERT" +
							" INTO   SONGGENRE" +
							"		 (SONGID, GENRE)" +
							" VALUES (\"%d\", \"%s\")"
							, song.getSongid()
							, genre
						);
					connector.excute(sql);
				}
			}
			
			List<String> artistList = song.getArtistList();
			if(artistList != null){
				for (String artist : artistList) {
					sql = String.format(
							" INSERT" +
							" INTO   SONGARTIST" +
							"		 (SONGID, ARTIST)" +
							" VALUES ('%d', '%s')"
							, song.getSongid()
							, artist
						);
					connector.excute(sql);
				}
			}
		}
		
		connector.CloseDB();
	}
}
