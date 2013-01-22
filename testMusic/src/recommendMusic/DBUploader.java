package recommendMusic;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class DBUploader{
	public DBUploader(){
		
	}
	public DBUploader(Song song){
	List<Song> songList = new ArrayList<>(); //효상이 파서한테 받음

	songList.add(song);
	SongService service = new SongService();
	service.insertSongList(songList);
	}
	
	public void userDataUploader(FacebookData data){
	SongService service = new SongService();
	service.insertData(data);
	}
}

