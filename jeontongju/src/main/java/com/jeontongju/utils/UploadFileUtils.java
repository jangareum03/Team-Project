
package com.jeontongju.utils;

import java.io.File;
import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {

	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;

	public static String fileUpload(String uploadPath, String fileName, byte[] fileData)
			throws Exception {

		String newFileName = fileName;
		String imgPath = uploadPath;

		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		String thumbFileName = "s_" + newFileName;
		File image = new File(imgPath + File.separator + newFileName);

		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName;
	}

	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
