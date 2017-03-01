WORD_INDEX_NOT_FOUND = -1 

def find_word_index(text, word):
	return text.index(word) if word in text else WORD_INDEX_NOT_FOUND

def find_word_in_file(word, file_path, case_insensitive):
	try:		
		for line_number, line in enumerate(open(file_path, 'rb')):			
			word_index = WORD_INDEX_NOT_FOUND	
			if case_insensitive:	
				word_index = find_word_index(line.lower(), word.lower())
			else:
				word_index = find_word_index(line, word)

			if word_index != WORD_INDEX_NOT_FOUND:
				print("Found " + word + " in line " + str(line_number) + " in " + file_path)
				cased_word = line[word_index: word_index + len(word)]									
				output = line.replace(cased_word, '\033[44;33m{}\033[m'.format(cased_word))
				print(output)
				print("")
				
	except IOError, ioe:
		pass

def find_word_in_directory(word, case_insensitive, recursive=True, root='.'):
	import os
	
	for filenname in os.listdir(root):
		file_path = os.path.join(root, filenname)
		if os.path.isdir(file_path) and recursive:
			find_word_in_directory(word, case_insensitive, recursive, file_path)
		else:
			find_word_in_file(word, file_path, case_insensitive)

if __name__ == '__main__':
	from sys import argv
	import sys
	
	sys.setrecursionlimit(99999)

	if len(argv) == 1:
		print(__file__ + ' expects a word as first argument to search for')
		exit()

	search_word = argv[1]
	print('Find word: ' + search_word)

	args = argv[2:]
	case_insensitive = '-c' in args
	recursive = '-r' in args

	if '-f' in argv:
		index = int(argv.index('-f'))
		file_path = argv[index + 1]
		find_word_in_file(search_word, file_path, case_insensitive)
	else:
		find_word_in_directory(search_word, case_insensitive, recursive)