<%@page import="recommendMusic.Song"%>
<%@page import="recommendMusic.SongService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=euc-kr" language="java" %>
<%@ page import="java.sql.*" %>

<%
	List<recommendMusic.Song> songList = new ArrayList(); //효상이 파서한테 받음
	Song song = new Song();
	song.setSongid(1);
	song.setSongname("aa");
	songList.add(song);
	SongService service = new SongService();
	service.insertSongList(songList);
%>