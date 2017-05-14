package cn.poi591.secc.dto;

import cn.poi591.secc.entity.Music;

public class MusicDetail extends Music{
	//extends..
	
	private MusicScore musicScore;

	public MusicScore getMusicScore() {
		return musicScore;
	}

	public void setMusicScore(MusicScore musicScore) {
		this.musicScore = musicScore;
	}

	
}
