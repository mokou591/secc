package cn.poi591.secc.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

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

}
