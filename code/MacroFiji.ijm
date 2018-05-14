/*
 * Exercising cell analysis
 * This example illustrates the result of applying different methods to neuron segmentation
 */
run("Show Info...");
run("Properties...");
run("Split Channels");
makeRectangle(1896, 460, 964, 728);
selectWindow("GrinbergAlegroBrain_3598_14_82_Merged_DRN.tif");
run("Images to Stack", "name=Stack title=[] use");
run("Make Montage...", "columns=3 rows=1 scale=0.25");
run("Merge Channels...");
run("Stack to Images");
run("Merge Channels...", "c1=[GrinbergAlegroBrain_3598_14_82_Merged_DRN-1.tif (red)] c2=[GrinbergAlegroBrain_3598_14_82_Merged_DRN-1.tif (green)] c3=[GrinbergAlegroBrain_3598_14_82_Merged_DRN-1.tif (blue)] create");
run("Stack to RGB");
run("Scale... ");
run("Size...", "width=482 height=364 constrain average interpolation=Bilinear");
run("8-bit");
run("Magenta");
run("16_colors");
run("Grays");
run("Median...", "radius=2");
run("Multiband Sobel edges");
run("Tile");
run("8-bit");
setAutoThreshold("Default dark");
//run("Threshold...");
//setThreshold(90, 255);
setOption("BlackBackground", true);
run("Convert to Mask");

makeLine(93, 91, 359, 187);
run("Plot Profile");

run("Statistical Region Merging", "q=4 showaverages");
run("k-means Clustering ...", "number_of_clusters=2 cluster_center_tolerance=0.00010000 enable_randomization_seed randomization_seed=48");

run("Analyze Particles...", "display exclude");
run("Analyze Particles...", "  show=Overlay display exclude");
run("Set Measurements...", "area mean standard modal min centroid center perimeter fit shape integrated median skewness kurtosis area_fraction redirect=blobs.gif decimal=4");
run("Analyze Particles...", "  show=Overlay display exclude");

run("Set Measurements...", "area perimeter shape redirect=blobs.gif decimal=4");
run("Analyze Particles...", "  show=[Bare Outlines] display");
saveAs("Results", "/Users/dani11/Dropbox/prog/Python/DaniPython/2017_ZeissLecture/data/BlobResults.csv");
