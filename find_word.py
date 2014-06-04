def main(word, case_insensitive, root='.'):
	import os
	
	for filenname in os.listdir(root):
		file_path = os.path.join(root, filenname)
		if os.path.isdir(file_path):
			main(word, case_insensitive, file_path)
		else:
			for line in open(file_path, 'rb'):
				if case_insensitive:
					word = word.lower()
					line = line.lower()
				if word in line:
					print file_path
					break

if __name__ == '__main__':
	from sys import argv
	
	if len(argv) == 1:
		print 'find_word expects a word argument to search for'
		exit()

	case_insensitive = False
	if len(argv) == 3:
		if argv[2] == '-c' or argv[2] == 'c':
			case_insensitive = True

	main(argv[1], case_insensitive)