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
import app_extensions.AppJavaUtil;

public class IOSConstants {
	private static String sourceFilesFolder = "utils/ios_default_files";
	public static String[] sourceFilesPaths = {
		sourceFilesFolder+"/InfoPlist.strings",
		sourceFilesFolder+"/AppDelegate.h",
		sourceFilesFolder+"/AppDelegate.m",
		sourceFilesFolder+"/Default.png",
		sourceFilesFolder+"/Default@2x.png",
		sourceFilesFolder+"/Default-568h@2x.png",
		sourceFilesFolder+"/main.m"
	};
	public static String destinationFilesFolder = "src-gen/ios/"+AppJavaUtil.APPLICATION_NAME;
	public static String[] destinationFilesPaths = {
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/en.lproj/InfoPlist.strings",
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/AppDelegate.h",
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/AppDelegate.m",
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/Default.png",
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/Default@2x.png",
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/Default-568h@2x.png",
		destinationFilesFolder+"/"+AppJavaUtil.APPLICATION_NAME+"/main.m"
	};
}