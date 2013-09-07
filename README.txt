In order to use the it.polimi.mobilecodegenerator you need to:
- Install the Epsilon Version of Eclipse: http://www.eclipse.org/epsilon/download
- Install the Xpand plugin in Eclipse (Help --> Install new software) using the address: http://download.eclipse.org/modeling/m2t/xpand/updates/nightly/
- Install the MWE plugin in Eclipse (Help --> Install new software) using the address: http://download.eclipse.org/modeling/emft/mwe/updates/nightly/
- Import the it.polimi.mobilegenerator project in Eclipse as an existing project (File --> Import --> Existing Project into Workspace)

In order to create your application you need to:
- Open the metamodel.ecore file into metamodel folder
- Right click on the Application element and select Create Dynamic Instance 
- Save the xmi model in the model folder
- Open the AndroidGenerator.mwe or the iOSGenerator.mwe or the iOSAndAndroidGenerator.mwe file in the workflow folder and change the location of the property named model in the third line with the location of your application model.
- Run the generator
- Your application source code will be generated in the src-gen folder.


Developers contacts:
gregorio.perego@gmail.com
pezzettistefania@gmail.com
