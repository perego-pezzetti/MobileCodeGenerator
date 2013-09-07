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

package android_extensions;

import java.io.File;

import app_extensions.AppJavaUtil;

public class AndroidJavaUtil {
	
	//deletes application code folder and its content (if already exists)
	public static void deleteApplicationFolder(){
		File androidAppFolder = new File(AndroidConstants.destinationFilesFolder);
		AppJavaUtil.deleteFolder(androidAppFolder);
	}
	
	public static void copyUserFiles(){
		File folder = new File("utils/user_files");
		for(File source : folder.listFiles()){
			String sourceFileName = source.getName();
			String sourceFileExtension = source.getName().split("\\.")[1];
			if(sourceFileExtension.equalsIgnoreCase("html") || sourceFileExtension.equalsIgnoreCase("txt")){
				File destination = new File(AndroidConstants.rawFolder+"/"+sourceFileName);
				AppJavaUtil.copyFile(source, destination);
			}
			else if(sourceFileExtension.equalsIgnoreCase("css")){
				File destination = new File(AndroidConstants.assetsFolder+"/"+sourceFileName);
				AppJavaUtil.copyFile(source, destination);
			}
			else if(sourceFileExtension.equalsIgnoreCase("png") || sourceFileExtension.equalsIgnoreCase("jpg") || sourceFileExtension.equalsIgnoreCase("gif")){
				File destination = new File(AndroidConstants.drawableFolder+"/"+sourceFileName);
				AppJavaUtil.copyFile(source, destination);
			}
			else if(sourceFileExtension.equalsIgnoreCase("mp4") || sourceFileExtension.equalsIgnoreCase("3gp")){
				File destination = new File(AndroidConstants.rawFolder+"/"+sourceFileName);
				AppJavaUtil.copyFile(source, destination);
			}
			else if(sourceFileExtension.equalsIgnoreCase("mp3")){
				File destination = new File(AndroidConstants.assetsFolder+"/"+sourceFileName);
				AppJavaUtil.copyFile(source, destination);
			}
		}
	}
	
	public static void copyDefaultAndroidFiles(){
		new File(AndroidConstants.destinationFilesFolder+"/libs").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/assets").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/drawable").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/drawable-hdpi").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/drawable-mdpi").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/drawable-xhdpi").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/drawable-xxhdpi").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/menu").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/raw").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/values").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/values-v11").mkdirs();
		new File(AndroidConstants.destinationFilesFolder+"/res/values-v14").mkdirs();
		
		for(int i=0; i<AndroidConstants.sourceFilesPaths.length; i++){
			File source = new File(AndroidConstants.sourceFilesPaths[i]);
			File destination = new File(AndroidConstants.destinationFilesPaths[i]);
			AppJavaUtil.copyFile(source, destination);
		}
	}
}
