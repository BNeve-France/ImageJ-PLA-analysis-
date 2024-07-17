macro "CZItoTIF_BN2024"{
//Open Zeis.czi files and copy  3 channels in analysis/ .tif file
//bernadette.neve@inserm.fr
//OncoLille-Canther
//Bld du Professeur Jules Leclercq, 59000 Lille Cedex, France

waitForUser("Opening CZI with 3 channels\nIs Track 1: RED | Track 2: GREEN | Track 3: DAPI ?\n (If you want to save Track 2 modify macro: remove //)");
setFont("SansSerif", 10);
waitForUser("You will need to select the folders","After you click OK a pop-up window will appear. Please locate\nand select the image- and output-folder and click OK.");
	dir1 = getDirectory("Select the input folder with file.czi");
	dir2 = getDirectory("Now select the output.tif folder");
	listCZI = getFileList(dir1);
	Array.sort(listCZI);
	for (i = 0; i < listCZI.length; i++) { 
	openerFile = dir1 + listCZI[i];
	savingFile = dir2 + listCZI[i];
	run("Bio-Formats", "open=openerFile autoscale color_mode=Default rois_import=[ROI manager] split_channels view=[Standard ImageJ] stack_order=XYCZT");
    selectWindow(listCZI[i]+" - C=0");
    saveAs("Tiff", savingFile+" - C=0.tif");
    //selectWindow(listCZI[i]+" - C=1");
    //saveAs("Tiff", savingFile+" - C=1.tif");
    selectWindow(listCZI[i]+" - C=2");
    saveAs("Tiff", savingFile+" - C=2.tif");
    close("*");
    }
  