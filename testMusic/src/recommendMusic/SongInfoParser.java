package recommendMusic;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

/**
 * 
 * @author hyosang
 */
public class SongInfoParser {
//	public static void main(String[] args) throws MalformedURLException, IOException {
//		for (String id : extractSongId()) {
//				infoParser(id);
//		}
//	}

	public static Song infoParser(String songId) throws IOException, MalformedURLException {
		int songid = Integer.parseInt(songId);
		String musicDetailPageUrl = musicDetailPageUrlExtract(songId);
		Song song = new Song();
		List<String> styleList = new ArrayList<String>();
		List<String> genreList = new ArrayList<String>();
		List<String> artistList = new ArrayList<String>();
		Element songDetailSource = extractFromClassName(musicDetailPageUrl, "soBox2", 0);
		
		String songName = extractFromClassName(musicDetailPageUrl, "titT", 0).getContent().getTextExtractor().toString();
		String date = songDetailSource.getAllElements(HTMLElementName.DD).get(0).getContent().getTextExtractor().toString();
		
		String genre = songDetailSource.getAllElements(HTMLElementName.DD).get(1).getContent().getTextExtractor().toString();
		StringTokenizer st1 = new StringTokenizer(genre, "/");
		while (st1.hasMoreElements()) {
			genreList.add(st1.nextToken().trim());
		}
		String style = songDetailSource.getAllElements(HTMLElementName.DD).get(2).getContent().getTextExtractor().toString();
		StringTokenizer st = new StringTokenizer(style, ",");
		while (st.hasMoreElements()) {
			styleList.add(st.nextToken().trim());
		}
		
		String artist = extractFromClassName(musicDetailPageUrl, "soTit", 1).getContent().getTextExtractor().toString();
		StringTokenizer st2 = new StringTokenizer(artist, ",");
		while (st2.hasMoreElements()) {
			artistList.add(st2.nextToken().trim());
		}

		song.setDate(date);
		song.setSongid(songid);
		song.setSongname(songName);
		song.setArtistList(artistList);
		song.setGenreList(genreList);
		song.setStyleList(styleList);
		
		outTest(songName, artistList, date, genreList, styleList, songId);
		return song;
	}

//	static Source source;
//	
//	static {
//		try {
//			source = new Source(new URL("http://www.melon.com/cds/chart/web/chartrealtime_list.htm"));
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	public static List<String> extractSongId() throws MalformedURLException, IOException {
		Source source = new Source(new URL("http://www.melon.com/cds/chart/web/chartrealtime_list.htm"));
		List<String> songIdList = new ArrayList<String>();
		
		// 급상승 2개 있어서 2번부터
		for(int songIndex=2;songIndex<52;songIndex++){
			String songIdListSource = source.getAllElementsByClass("lineLine1").get(songIndex).getAllElements(HTMLElementName.A).get(0).getAttributeValue("href");
			StringTokenizer testST = new StringTokenizer(songIdListSource, "'");
			testST.nextToken();
			songIdList.add(testST.nextToken().trim());
		}
		return songIdList;			
	}

	private static String musicDetailPageUrlExtract(String songId) {
		String musicDetailPageUrl = "http://www.melon.com/cds/song/web/songdetailmain_list.htm?songId=" + songId;
		return musicDetailPageUrl;
	}

	private static Element extractFromClassName(String pageUrl, String className, int index) throws IOException, MalformedURLException {
		Source source = new Source(new URL(pageUrl));
		Element element = source.getAllElementsByClass(className).get(index);
		return element;
	}

	private static void outTest(String songName, List<String> artistList, String date, List<String> genreList, List<String> styleList, String id) {
		System.out.println(songName);
		System.out.println(artistList);
		System.out.println(date);
		System.out.println(genreList);
		System.out.println(styleList);
		System.out.println(id);
	}

}