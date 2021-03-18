package com.techblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class User_Profile_Pic_Helper {



	public static boolean saveFile(InputStream is, String path) {

		boolean flag = false;

		try {

			byte b[] = new byte[is.available()];

			// is se read krke b me rkh do

			is.read(b);

			FileOutputStream fos = new FileOutputStream(path);

			fos.write(b);
			fos.flush();
			fos.close();
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception

		}

		return flag;
	}

}
