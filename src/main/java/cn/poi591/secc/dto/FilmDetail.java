package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Film;

public class FilmDetail extends Film{
	//extends..
	
	private FilmScore filmScore;

	public FilmScore getFilmScore() {
		return filmScore;
	}

	public void setFilmScore(FilmScore filmScore) {
		this.filmScore = filmScore;
	}
	
}
