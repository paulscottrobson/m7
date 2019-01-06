# ***************************************************************************************
# ***************************************************************************************
#
#		Name : 		m7c.py
#		Author :	Paul Robson (paul@robsons.org.uk)
#		Date :		6th January 2019
#		Purpose :	A very basic M7 compiler.
#
# ***************************************************************************************
# ***************************************************************************************

from imagelib import *
import re

# ***************************************************************************************
#								Exception for Compiler
# ***************************************************************************************

class CompilerException(Exception):
	pass

CompilerException.LINENUMBER = 0
CompilerException.FILENAME = ""

# ***************************************************************************************
#									 Compiler class
# ***************************************************************************************

class Compiler(object):
	#
	#		Set up compiler.
	#
	def __init__(self,source = "boot.img"):
		self.binary = MemoryImage(source)	
		self.dictionary = self.binary.getDictionary()						# load current dictionary
																			# standard routines 
		self.standardHeader = self.dictionary["sys.stdheaderroutine"]["address"]
		self.macroHeader = self.dictionary["sys.stdmacroroutine"]["address"]
		self.macroExecHeader = self.dictionary["sys.stdexecmacroroutine"]["address"]
	#
	#		Compile a string array
	#
	def compileArray(self,source):
		for ln in range(0,len(source)):										# go through all lines
			CompilerException.LINENUMBER = ln + 1							# update current line
			line = source[ln].replace("\t"," ")								# remove TAB
			line = line if line.find("//") < 0 else line[:line.find("//")]	# remove comment
			for cmd in [x for x in line.split(" ") if x != ""]:				# compile all bits
				self.compile(cmd)
	#
	#		Compile a single command
	#
	def compile(self,cmd):
		if self.binary.echo:												# headline
			print("{0} {1} {0}".format("===============",cmd))
		# 
		#		String
		#
		if cmd[0] == '"':
			self.binary.cByte(0x18)											# JR xx
			self.binary.cByte(len(cmd))
			address = self.binary.getCodeAddress()
			for c in cmd[1:]:												# text
				self.binary.cByte(ord(c) if c != "_" else 32)
			self.binary.cByte(0x00)											# ASCIIZ
			self.binary.cByte(0xEB)											# ex de,hl
			self.binary.cByte(0x21)											# ld hl,xxxx
			self.binary.cWord(address)
			return

		cmd = cmd.lower()													# case irrelevant outside string
		#
		#		Constant
		#
		if re.match("^\-?\d+$",cmd) is not None:
			self.binary.cByte(0xEB)											# ex de,hl
			self.binary.cByte(0x21)											# ld hl,xxxx
			self.binary.cWord(int(cmd) & 0xFFFF)
			return
		#
		# TODO: Structures
		# TODO: Modifiers
		# TODO: Other immediates (e.g. >compiles : )
		#
		#		Words in dictionary
		#
		if cmd in self.dictionary:
			page = self.dictionary[cmd]["page"]								# get word position
			address = self.dictionary[cmd]["address"]
			if self.binary.read(page,address) != 0xCD:						# check CALL xxxx
				raise CompilerException("Word {0} cannot be compiled.".format(cmd))
																			# get the call to compile
			compExec = self.binary.read(page,address+1)+self.binary.read(page,address+2)*256-3
			if compExec == self.standardHeader:								# standard (callable routine)
				self.binary.cByte(0xCD)
				self.binary.cWord(address+3)
																			# macro, copy code in.
			elif compExec == self.macroHeader or compExec == self.macroExecHeader:
				count = self.binary.read(page,address+3)					# bytes in macro
				assert count < 8
				for i in range(0,count):									# copy each byte
					self.binary.cByte(self.binary.read(page,address+i+4))
			else:															# some other wierd word.
				raise CompilerException("Unknown compilation code for "+cmd)
			return
		raise CompilerException("Unknown word "+cmd)

if __name__ == "__main__":
	src = """
		pop 	not 	a>c 	-42 // hello
		"hel_lo
""".split("\n")
	cc = Compiler()
	cc.compileArray(src)