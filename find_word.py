def main(word, case_insensitive, recursive=True, root='.'):
	import os
	
	for filenname in os.listdir(root):
		file_path = os.path.join(root, filenname)
		if os.path.isdir(file_path) and recursive:
			main(word, case_insensitive, recursive, file_path)
		else:
			try:
				for line in open(file_path, 'rb'):
					if case_insensitive:
						word = word.lower()
						line = line.lower()
					if word in line:
						print file_path
						break
			except IOError, ioe:
				pass

if __name__ == '__main__':
	from sys import argv
	import sys
	
	sys.setrecursionlimit(99999)

	if len(argv) == 1:
		print 'find_word expects a word argument to search for'
		exit()

	case_insensitive = False
	recursive = True
	if len(argv) == 3:
		if argv[2] == '-c' or argv[2] == 'c':
			case_insensitive = True
		elif argv[2] == '-r' or argv[2] == 'r':
			recursive = False

	main(argv[1], case_insensitive, recursive)