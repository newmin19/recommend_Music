package recommendMusic;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

public class DBUploader{
	
	public DBUploader(Song song){
	List<Song> songList = new ArrayList<>(); //ȿ���� �ļ����� ����

	songList.add(song);
	SongService service = new SongService();
	service.insertSongList(songList);
	}
}



