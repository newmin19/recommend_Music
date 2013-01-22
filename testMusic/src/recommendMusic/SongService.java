package recommendMusic;
import java.util.List;



public class SongService{
	/**
	 * Song 목록을 받아서 DB에 저장
	 * @param songList
	 */
	public void insertSongList(List<Song> songList){

		DBconnector connector = new DBconnector();
		
		for(Song song : songList){
			for(int i=0; i < 2; i++){
				try{
					song.getArtistList().get(i);
					song.getGenreList().get(i);
					song.getStyleList().get(i);
				}catch(IndexOutOfBoundsException e){
					song.getArtistList().add("none");
					song.getGenreList().add("none");
					song.getStyleList().add("none");
				}
			}			
			
			String sql = String.format(
					" INSERT" +
					"   INTO SONG" +
					"		 (SONGID, SONGNAME, DATE, ARTIST1, ARTIST2, GENRE1, GENRE2, STYLE1, STYLE2)" +
					" VALUES ('%d', '%s', '%s', '%s', '%s', '%s', '%s', \"%s\", \"%s\")"
					, song.getSongid()
					, song.getSongname()
					, song.getDate()
					, song.getArtistList().get(0)
					, song.getArtistList().get(1)
					, song.getGenreList().get(0)
					, song.getGenreList().get(1)
					, song.getStyleList().get(0)
					, song.getStyleList().get(1)
				);
				connector.excute(sql);	
		}
		
		connector.CloseDB();
	}
	
	public void insertData(FacebookData data){
		DBconnector connector = new DBconnector();
		
		String sql = String.format(
				" INSERT" +
						"   INTO FACEBOOKDATA" +
						"		 (EMAIL, SEX, BIRTHDAY, MUSIC)" +
						" VALUES ('%s', '%s', '%s', '%s')"
						, data.getEmail()
						, data.getSex()
						, data.getBirthDay()
						, data.getMusic()
				);
		connector.excute(sql);
		connector.CloseDB();
	}
}
