package recommendMusic;
import java.util.List;

/**
 * 
 * @author MG
 */
public class Song {

	private int songid;
	private String songname;
	private String date;
	private List<String> styleList;
	private List<String> genreList;
	private List<String> artistList;
	
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
	
	public List<String> getGenreList() {
		return genreList;
	}
	public void setGenreList(List<String> genreList) {
		this.genreList = genreList;
	}
	
	public List<String> getArtistList() {
		return artistList;
	}
	public void setArtistList(List<String> artistList) {
		this.artistList = artistList;
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
