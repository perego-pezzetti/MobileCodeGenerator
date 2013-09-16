You have to import the it.polimi.mobilecodegenerator project in Eclipse:

1) Download an Eclipse distribution containing a stable version of Epsilon and EMF: 
    http://www.eclipse.org/epsilon/download
  
2) Install the following 2 plugins in Eclipse (Help --> Install new software):
    > Xpand/Xtend:  http://download.eclipse.org/modeling/m2t/xpand/updates/nightly/
    > EMFT MWE:     http://download.eclipse.org/modeling/emft/mwe/updates/nightly/
  
3) Download and unzip the MobileCodeGenerator-master.zip

4) Import the it.polimi.mobilecodegenerator project in Eclipse:
    File --> Import --> General --> Existing Projects into Workspace


------------------------------------------------------------------------------------

To produce source code of your application you need to:

1) Open the metamodel.ecore file in src/metamodel folder

2) Right click on the Application element and select "Create Dynamic Instance"

3) Enter the application name and save the .xmi file in src/model folder

4) Open the .xmi file and define the application model through the graphical editor

5) Create a folder named "user_files" in utils directory and put in all files referenced by the model

4) Open the iOSAndAndroidGenerator.mwe file in src/workflow folder and change the value of the "model" property by setting the path of your .xmi file

5) Right click on the iOSAndAndroidGenerator.mwe file and select "Run As MWE Workflow"

6) You will find the generated Android and iOS application source code in src-gen folder


//////////////////////////

Developers contacts:
gregorio.perego@gmail.com
pezzettistefania@gmail.com
