/************************************************************************************************************************
 * Copyright 2013 Gregorio Perego, Stefania Pezzetti
 * This file is part of it.polimi.mobilecodegenerator.
 * 
 * it.polimi.mobilecodegenerator is free software: 
 * you can redistribute it and/or modify it under the terms of the 
 * GNU General Public License as published by the Free Software Foundation, 
 * either version 3 of the License, or (at your option) any later version.
 * 
 * it.polimi.mobilecodegenerator is distributed in the hope that it will be useful, 
 * but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
 * See the GNU General Public License for more details.You should have received a copy of the GNU General Public License
 * along with it.polimi.mobilecodegenerator. If not, see <http://www.gnu.org/licenses/>
 * ***********************************************************************************************************************/

package ios_extensions;

import java.io.File;
import java.util.HashMap;

import app_extensions.AppJavaUtil;

public class IOSJavaUtil {
	
	private static HashMap<String, String[]> hexadecimalIdsMap = new HashMap<String, String[]>();
	private static int count = 1000000;
	public static String getFirstHexadecimalId(String key){
		if(hexadecimalIdsMap.containsKey(key)){
			return hexadecimalIdsMap.get(key)[0];		
		}
		else{
			return generateNewHexadecimalIds(key)[0];
		}
	}
	public static String getSecondHexadecimalId(String key){
		return hexadecimalIdsMap.get(key)[1];
	}
	private static String[] generateNewHexadecimalIds(String key) {
		String firstId = "7F918D"+(++count)+"EF10055FE15";
		String secondId = "7F918D"+(++count)+"EF10055FE15";
		String[] array = {firstId,secondId};
		hexadecimalIdsMap.put(key,array);
		return array;
	}
	
	//delete application code folder and its content (if already exists)
	public static void deleteApplicationFolder(){
		File iosAppFolder = new File(IOSConstants.destinationFilesFolder);
		AppJavaUtil.deleteFolder(iosAppFolder);
	}
	
	public static void copyUserFiles(){
		File folder = new File("utils/user_files");
		for(File source : folder.listFiles()){
			File destination = new File(IOSConstants.destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/"+source.getName());
			AppJavaUtil.copyFile(source, destination);
		}
	}
	
	public static void copyDefaultIOSFiles(){
		new File(IOSConstants.destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/en.lproj").mkdirs();
		
		for(int i=0; i<IOSConstants.sourceFilesPaths.length; i++){
			File source = new File(IOSConstants.sourceFilesPaths[i]);
			File destination = new File(IOSConstants.destinationFilesPaths[i]);
			AppJavaUtil.copyFile(source, destination);
		}
	}
	
	private static Integer currentY;
	private static final Integer Y_OFFSET = 10;
	
	public static void resetCurrentY(){
		currentY = 20;
	}
	
	public static Integer getYOnStoryboard(Integer height){
		Integer y = currentY;
		currentY = currentY + height + Y_OFFSET;
		return y;
	}
}
