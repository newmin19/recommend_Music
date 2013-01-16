package recommendMusic;
import java.util.List;


public class SongService {
	/**
	 * Song 목록을 받아서 DB에 저장
	 * @param songList
	 */
	public void insertSongList(List<Song> songList){

		DBconnector connector = new DBconnector();
		
		// 노래 목록별로 입력 수행
		for(Song song : songList){
			
			// 노래 기본정보 입력
			String sql = String.format(
					" INSERT" +
					"   INTO SONG" +
					"		 (SONGID, SONGNAME)" +
					" VALUES ('%d', '%s')"
					, song.getSongid()
					, song.getSongname()
				);
			connector.excute(sql);
			
			// 노래 스타일 정보 입력(스타일이 다수기때문)
			List<String> styleList = song.getStyleList();
			if(styleList != null){
				for (String style : styleList) {
					sql = String.format(
							" INSERT" +
							" INTO   SONGSTYLE" +
							"		 (SONGID, STYLE)" +
							" VALUES ('%d', '%s')"
							, song.getSongid()
							, style
						);
					connector.excute(sql);
				}
			}
		}
		
		connector.CloseDB();
	}
}
