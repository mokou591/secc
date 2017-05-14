package cn.poi591.secc.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.Base64Utils;

public class MyUtil {

	public static void writeImageStrToFile(String imgStr, File file)
			throws IOException {
		byte[] bs = Base64Utils.decodeFromString(imgStr.substring(imgStr
				.indexOf(",") + 1));
		FileOutputStream os = new FileOutputStream(file);
		os.write(bs);
		os.close();
	}

	public static List<String> getKeywordList(String keywords) {
		// 拆分关键词字符串
		keywords = keywords.trim();
		String[] keywordsArr = keywords.split(" ");
		List<String> keywordList = new ArrayList<String>();
		for (String keyword : keywordsArr) {
			if (keyword.trim().length() != 0) {
				keywordList.add(keyword.trim());
			}
		}
		return keywordList;
	}

}
