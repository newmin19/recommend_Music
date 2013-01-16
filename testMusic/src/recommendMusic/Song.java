package recommendMusic;
import java.util.List;

/**
 * 
 * @author MG
 */
public class Song {

	private int songid;
	private String songname;
	private String artist;
	private String genre;
	private String date;
	private List<String> styleList;
	
	public int getSongid() {
		return songid;
	}
	public void setSongid(int songid) {
		this.songid = songid;
	}
	public String getSongname() {
		return songname;
	}
	public void setSongname(String songname) {
		this.songname = songname;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<String> getStyleList() {
		return styleList;
	}
	public void setStyleList(List<String> styleList) {
		this.styleList = styleList;
	}
}
