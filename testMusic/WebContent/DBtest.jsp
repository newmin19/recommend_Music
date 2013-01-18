<%@page import="recommendMusic.DBUploader"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="recommendMusic.DBconnector"%>
<%@page import="recommendMusic.Song"%>
<%@page import="recommendMusic.SongService"%>
<%@page import="recommendMusic.SongInfoParser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=euc-kr" language="java"%>
<%@ page import="java.sql.*"%>

<%
	//SongInfoParser parser = new SongInfoParser();
	//List<String> idList = SongInfoParser.extractSongId();
	//for (String id : idList) {
	//	Song oneSong = SongInfoParser.infoParser(id);
	//	DBUploader uploader = new DBUploader(oneSong);
	//}

	//System.out.println("============================================================");
	//System.out.println( idList.size() );

	
	DBconnector a = new DBconnector();
	a.getResult("aaa");
%>