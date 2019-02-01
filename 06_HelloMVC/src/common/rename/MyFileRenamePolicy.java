package common.rename;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldfile) {
		
		File newFile = null;
		do {
			long currentTime = System.currentTimeMillis(); // 밀리세컨초의 시간을 가져옴
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS"); // 날짜와 인덱스를 넣어 중복 방지
			int randomNum = (int) (Math.random() * 1000);
			
			// 확장자빼고 파일이름만 가져옴
			
			String oldName = oldfile.getName(); 
			String ext = ""; // 확장자 보관용
			int dot = oldName.lastIndexOf(".");
			if (dot > -1) {
				ext = oldName.substring(dot); // dot가 '.'의 위치를 보유, . 있는 위치부터 뒤의 내용 다 자름
			}
			// 새파일명 생성
			String newName = sdf.format(new Date(currentTime)) + "_" + randomNum + ext;
			
			newFile = new File(oldfile.getParent(), newName);
		} while(! createNewFile(newFile));
		
		return newFile;
	}

	private boolean createNewFile(File newFile) {
		try {
			
			return newFile.createNewFile();
		} catch (IOException e) {
			return false;
		}
	}
}
