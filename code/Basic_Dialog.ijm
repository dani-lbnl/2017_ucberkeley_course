 var separator = File.separator; // it will run on Windows
 var inputdir;
 var outputdir;
 var parts;

macro "Iris_macro [F5]" { 
 run("Close All");
 start = getTime;	
 //User interaction
 Dialog.create("Iris Vision Corporation");
 Dialog.addMessage("Select any image from the target folder");
 Dialog.show(); 
 open();//open image win to get attributes of the experiment, including folder location

 //Parse text
 inputdir = getInfo("image.directory"); 
 outputdir = inputdir+"resultsIris"+separator;
 File.makeDirectory(outputdir);
 FileList = getFileList(inputdir); //list of files present in that directory besides the one you created detected automatically
 fname = getInfo("image.filename"); 
 parts=split(fname,".");
 n=lengthOf(parts[0]); //detected the prefix

 processImageUsingIrisAlgorithm();	
 
 printScreen();
 
 print2File();
  	    	  
 
 end=getTime;
 print("Time of processing=" + d2s(end-start,2));
 showMessage("Demorou "+ d2s(end-start,2)+"milisegundos");
 
}

//------------------------------------------------------MY functions downhere-------
function printScreen(){
	print("Your input directory is:"+inputdir);
 	print("Your output directory is:"+outputdir);
 	print("Files start with:"+parts[0]);
}

function print2File(){
	nameOfNewFile = outputdir+separator+"textualResults.txt"
	if (File.exists(nameOfNewFile)) exit("Unable to create file, file exists!!!"); //make sure you are not going to be overwriting files, you can change to create nameOfNewFile
	f = File.open(nameOfNewFile); // Settings from the ui are saved in the new seg folder in the folder where all the data files are contained.  
  	print(f,"Your input directory is:"+inputdir);
 	print(f,"Your output directory is:"+outputdir);
 	print(f,"Files start with:"+parts[0]);
 	File.close(f);
}

function processImageUsingIrisAlgorithm(){
	print("Your code here");
	run("Set... ", "zoom=50"); 
	run("Tile");
}	

