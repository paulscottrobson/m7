# ***************************************************************************************
# ***************************************************************************************
#
#		Name : 		makevocab.py
#		Author :	Paul Robson (paul@robsons.org.uk)
#		Date : 		5th January 2019
#		Purpose :	Create source file and dictionary file
#
# ***************************************************************************************
# ***************************************************************************************

import os,re
handlers = {"word":"compileCallToSelf","macro":"compileCopySelf","xmacro":"compileExecutableCopySelf" }
#
#		Find all sources
#
source = []
for root,dirs,files in os.walk("."):
	for f in files:
		if f[-4:] == ".asm":
			source.append(root+os.sep+f)
#
#		Process them all
#
words = {}
hOut = open(".."+os.sep+"kernel"+os.sep+"temp"+os.sep+"__words.asm","w")
current = None
for f in source:
	for src in [x.rstrip() for x in open(f).readlines()]:
		if src.startswith("@"):
			#print(src)
			if src == "@end":
				assert current is not None,"@end without word"
				if wtype != "word":
					hOut.write("end_{0}:\n".format(scrambled))
					hOut.write("    ret\n")
				current = None
			else:
				assert current is None,current.group(1)+" not closed"
				current = re.match("^\@(\w+)\s*(.*)$",src)
				assert current is not None,"Syntax "+src
				wtype = current.group(1).lower()
				wname = current.group(2).lower()
				scrambled = "_".join(["{0:02x}".format(ord(x)) for x in wname])
				assert wtype in ["xmacro","macro","word"]
				hOut.write("; ========= {0} {1} =========\n".format(wname,wtype))
				assert wname not in words,wname+"duplicated"
				words[wname] = "def_"+scrambled
				hOut.write("def_{0}:\n".format(scrambled))
				hOut.write("    call {0}\n".format(handlers[wtype]))
				if wtype != "word":
					hOut.write("start_{0}:\n".format(scrambled))
					hOut.write("    db end_{0}-start_{0}-1\n".format(scrambled))
		else:
			hOut.write(src+"\n")
hOut.close()
#
#		Create dictionary
#
keys = [x for x in words.keys()]
keys.sort()
hOut = open(".."+os.sep+"kernel"+os.sep+"temp"+os.sep+"__dictionary.asm","w")
for k in keys:
	hOut.write("; ----------------------------------------\n")
	hOut.write("    db    {0}\n".format(len(k)+5))
	hOut.write("    db    FirstCodePage\n")
	hOut.write("    dw    {0}\n".format(words[k]))
	hOut.write("    db    {0}\n".format(len(k)))
	hOut.write("    db    {1}{0}{1}\n".format(k,'"'))
hOut.write("\n    db    0\n\n")
hOut.close()
print("Created library of {0} words.\n".format(len(keys)))